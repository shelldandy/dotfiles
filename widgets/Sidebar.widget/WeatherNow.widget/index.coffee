# Code originally created by Felix Hageloh (https://github.com/felixhageloh)
# Automatic location detection and switch to Yahoo api by @nickroberts (https://github.com/nickroberts)
# Original icons by Erik Flowers (http://erikflowers.github.io/weather-icons/)
# Haphazardly adjusted and mangled by Pe8er (https://github.com/Pe8er)

options =
  widgetEnable  : true              # Easily enable or disable the widget.
  city          : "San Francisco"   # default city in case location detection fails
  region        : "US"              # default region in case location detection fails
  units         : 'C'               # c for celcius. f for Fahrenheit
  staticLocation: false             # set to true to disable automatic location lookup

appearance =
  iconSet       : 'original'        # "original" for the original icons

refreshFrequency: '10m'             # Update every 10 minutes

style: """
  white1    = rgba(white,1)
  white05   = rgba(white,0.5)
  icon-size = 28px

  *, *:before, *:after
    box-sizing border-box

  @font-face
    font-family Weather
    src url(Sidebar.widget/WeatherNow.widget/icons.svg) format('svg')

  .wrapper
    color white1
    width 176px
    padding 8px
    position relative
    line-height 11pt
    height 64px

  .icon
    font-family Weather
    font-size icon-size
    max-height icon-size
    width icon-size
    max-width icon-size
    text-align center
    float left
    position relative
    top 50%
    -webkit-transform translateY(-50%)
    margin auto 16px auto 8px

  .text
    text-align left
    width auto
    position relative
    top 50%
    -webkit-transform translateY(-50%)
    height auto
    overflow hidden

  .temperature
    font-size 12pt
    font-weight 700

  .condition, .location
    font-size 8pt
    font-weight 200
    text-overflow ellipsis
    overflow hidden
    white-space nowrap

  .location
    color white05

    img
      width 100%

  .error
    position absolute
    top 0
    left 0
    right 0
    bottom 0
    font-size 10px
"""

command: "#{process.argv[0]} Sidebar.widget/WeatherNow.widget/get-weather \
                            \"#{options.city}\" \
                            \"#{options.region}\" \
                            #{options.units} \
                            #{'static' if options.staticLocation}"

appearance: appearance
options : options

render: -> """
  <div class='wrapper #{@appearance.iconSet}'>
    <div class='icon'></div>
    <div class='text'>
      <div class='temperature'></div>
      <div class='condition'></div>
      <div class='location'></div>
    </div>
  </div>
"""

update: (output, domEl) ->
  @$domEl = $(domEl)

  if @options.widgetEnable
    data    = JSON.parse(output)
    channel = data?.query?.results?.channel
    return @renderError(data) unless channel

    if channel.title == "Yahoo! Weather - Error"
      return @renderError(data, channel.item?.title)

    @renderCurrent channel

    @$domEl.find('.error').remove()
    @$domEl.children().show()

    # Sort out flex-box positioning.
    $(domEl).parent('div').css('order', '3')
    $(domEl).parent('div').css('flex', '0 1 auto')
  else
    @$domEl.remove()

renderCurrent: (channel) ->
  weather  = channel.item
  location = channel.location

  el = @$domEl.find('.wrapper')
  el.find('.temperature').text "#{Math.round(weather.condition.temp)}°"
  el.find('.condition').text weather.condition.text
  el.find('.location').html location.city
  el.find('.icon').html @getIcon(
    weather.condition.code,
    @appearance.iconSet,
    @getDayOrNight channel.astronomy
  )

renderError: (data, message) ->
  console.error 'weather widget:', data.error if data?.error
  @$domEl.children().hide()

  message ?= """
     Could not retreive weather data for #{data.location}.
      <p>Are you connected to the internet?</p>
  """

  @$domEl.append "<div class=\"error\">#{message}<div>"

# Return either 'd' if the sun is still up, or 'n' if it is gone
getDayOrNight: (data) ->
  now     = new Date()
  sunrise = @parseTime data.sunrise
  sunrise = new Date(
    now.getFullYear(),
    now.getMonth(),
    now.getDate(),
    sunrise.hour,
    sunrise.minute
  ).getTime()

  sunset  = @parseTime data.sunset
  sunset  = new Date(
    now.getFullYear(),
    now.getMonth(),
    now.getDate(),
    sunset.hour,
    sunset.minute
  ).getTime()

  now = now.getTime()

  if now > sunrise and now < sunset then 'd' else 'n'

# parses a time string in US format: hh:mm am|pm
parseTime: (usTimeString) ->
  parts = usTimeString.match(/(\d+):(\d+) (\w+)/)

  hour   = Number(parts[1])
  minute = Number(parts[2])
  am_pm  = parts[3].toLowerCase()

  hour += 12 if am_pm == 'pm'

  hour: hour, minute: minute

getIcon: (code, iconSet, dayOrNight) ->
  if iconSet is 'yahoo'
    @getYahooIcon(code, dayOrNight)
  else
    @getOriginalIcon(code)

getOriginalIcon: (code) ->
  return @iconMapping['unknown'] unless code
  @iconMapping[code]

getYahooIcon: (code, dayOrNight) ->
  # Returns the image element from Yahoo with the proper image
  imageURL = "http://l.yimg.com/a/i/us/nws/weather/gr/#{code}#{dayOrNight}.png"
  '<img src="' + imageURL + '">'

dayMapping:
  0: 'Sunday'
  1: 'Monday'
  2: 'Tuesday'
  3: 'Wednesday'
  4: 'Thursday'
  5: 'Friday'
  6: 'Saturday'

iconMapping:
  0    : "&#xf021;" # tornado
  1    : "&#xf021;" # tropical storm
  2    : "&#xf021;" # hurricane
  3    : "&#xf019;" # severe thunderstorms
  4    : "&#xf019;" # thunderstorms
  5    : "&#xf019;" # mixed rain and snow
  6    : "&#xf019;" # mixed rain and sleet
  7    : "&#xf019;" # mixed snow and sleet
  8    : "&#xf019;" # freezing drizzle
  9    : "&#xf019;" # drizzle
  10   : "&#xf019;" # freezing rain
  11   : "&#xf019;" # showers
  12   : "&#xf019;" # showers
  13   : "&#xf01b;" # snow flurries
  14   : "&#xf01b;" # light snow showers
  15   : "&#xf01b;" # blowing snow
  16   : "&#xf01b;" # snow
  17   : "&#xf019;" # hail
  18   : "&#xf019;" # sleet
  19   : "&#xf002;" # dust
  20   : "&#xf014;" # foggy
  21   : "&#xf014;" # haze
  22   : "&#xf014;" # smoky
  23   : "&#xf021;" # blustery
  24   : "&#xf021;" # windy
  25   : "&#xf021;" # cold
  26   : "&#xf013;" # cloudy
  27   : "&#xf031;" # mostly cloudy (night)
  28   : "&#xf002;" # mostly cloudy (day)
  29   : "&#xf031;" # partly cloudy (night)
  30   : "&#xf002;" # partly cloudy (day)
  31   : "&#xf02e;" # clear (night)
  32   : "&#xf00d;" # sunny
  33   : "&#xf031;" # fair (night)
  34   : "&#xf00c;" # fair (day)
  35   : "&#xf019;" # mixed rain and hail
  36   : "&#xf00d;" # hot
  37   : "&#xf019;" # isolated thunderstorms
  38   : "&#xf019;" # scattered thunderstorms
  39   : "&#xf019;" # scattered thunderstorms
  40   : "&#xf019;" # scattered showers
  41   : "&#xf01b;" # heavy snow
  42   : "&#xf01b;" # scattered snow showers
  43   : "&#xf01b;" # heavy snow
  44   : "&#xf00c;" # partly cloudy
  45   : "&#xf019;" # thundershowers
  46   : "&#xf00c;" # snow showers
  47   : "&#xf019;" # isolated thundershowers
  3200 : "&#xf00c;" # not available
