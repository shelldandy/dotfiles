# Code originally created by Chris Johnson.
# Haphazardly adjusted and mangled by Pe8er (https://github.com/Pe8er)

options =
  # Easily enable or disable the widget.
  widgetEnable:           true

  # Enter locations to set up world clocks. Reference - en.wikipedia.org/wiki/List_of_tz_database_time_zones
  locations   :           "Mexico/General,Europe/Madrid"

  # Optional custom labels for cities. If you leave them empty, make sure to keep the quotes ("").
  cityNames   :           "Puebla,Málaga"

  # 12 or 24 hour time format.
  timeFormat  :           "12"

  # Choose color theme.
  widgetTheme: "dark"                   # dark | light

command: "osascript Sidebar.widget/WorldClock.widget/WorldClock.applescript '#{options.locations}' '#{options.cityNames}' #{options.timeFormat}"

refreshFrequency: '1m'

style: """
  // Let's do theming first.

  if #{options.widgetTheme} == dark
    fColor = white
    bgColor = black
  else
    fColor = black
    bgColor = white

  // Specify color palette.

  fColor1 = rgba(fColor,1.0)
  fColor08 = rgba(fColor,0.8)
  fColor05 = rgba(fColor,0.5)
  fColor02 = rgba(fColor,0.2)
  bgColor1 = rgba(bgColor,1.0)
  bgColor08 = rgba(bgColor,0.7)
  bgColor05 = rgba(bgColor,0.5)
  bgColor02 = rgba(bgColor,0.2)

  background-color bgColor02

  .wrapper
    text-align center
    font-size 8pt
    line-height 11pt
    width 176px
    align-items center
    display flex

  .box
    width auto
    max-width 50%
    margin 0 auto
    padding 8px
    overflow hidden

  .time
    color fColor1
    font-weight 700

  .timezone
    color: fColor05
    white-space nowrap
    overflow hidden
    text-overflow ellipsis

"""

options : options

render: -> """
"""

# Update the rendered output.
update: (output, domEl) ->

  # Get our main DIV.
  div = $(domEl)

  if @options.widgetEnable
    # Get our timezones and times.
    zones=output.split(";")

    # Initialize our HTML.
    timeHTML = ''

    # Loop through each of the time zones.
    for zone, idx in zones

      # If the zone is not empty (e.g. the last newline), let's add it to the HTML.
      if zone != ''

        # Split the timezone from the time.
        values = zone.split("~")

        # Create the DIVs for each timezone/time. The last item is unique in that we don't want to display the border.
        # if idx < zones.length - 2
        timeHTML = timeHTML + "<div class='box'><div class='time'>" + values[1] + "</div><div class='timezone'>" + values[0] + "</div></div>"
        # else
          #timeHTML = timeHTML + "<div class='lastbox'><div class='time'>" + values[1] + "</div><div class='timezone'>" + values[0] + "</div></div>"

    # Set the HTML of our main DIV.
    div.html("<div class='wrapper'>" + timeHTML + "</div>")
    # div.html("<div class='wrapper'>" + output + "</div>")

    # Sort out flex-box positioning.
    div.parent('div').css('order', '6')
    div.parent('div').css('flex', '0 1 auto')
  else
    div.remove()
