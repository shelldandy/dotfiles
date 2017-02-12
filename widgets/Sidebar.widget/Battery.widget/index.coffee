# Code originally created by the awesome members of Ubersicht community.
# I stole from so many I can't remember who you are, thank you so much everyone!
# Haphazardly adjusted and mangled by Pe8er (https://github.com/Pe8er)

options =
  # Easily enable or disable the widget.
  widgetEnable: true

  # Choose color theme.
  widgetTheme: "dark"                   # dark | light

command: "osascript 'Sidebar.widget/Battery.widget/battery.applescript'"

refreshFrequency: '1s'

style: """

  if #{options.widgetTheme} == dark
    fColor = white
    bgColor = black
    bar = f
  else
    fColor = black
    bgColor = white
    bar = bg

  fColor1 = rgba(fColor,1.0)
  fColor08 = rgba(fColor,0.8)
  fColor05 = rgba(fColor,0.5)
  fColor02 = rgba(fColor,0.2)
  bgColor1 = rgba(bgColor,1.0)
  bgColor08 = rgba(bgColor,0.7)
  bgColor05 = rgba(bgColor,0.5)
  bgColor02 = rgba(bgColor,0.2)

  width 176px
  overflow hidden
  white-space nowrap
  opacity 0
  background-color bgColor02
  font-size 8pt
  line-height @font-size

  *, *:before, *:after
    box-sizing border-box

  .wrapper
    margin 2px
    height 20px
    opacity 1
    position relative

  .bar
    background-color bar + Color05
    height 20px
    min-width 1%
    max-width 100%
    z-index 1
    position absolute
    top 0
    left 0

  .box
    width 100%
    height @width
    position relative
    z-index 2
    display flex
    align-items center
    justify-content center

  svg
    fill fColor1

  .icon
    width 6px
    height 12px
    margin 0 4px

  .time
    color fColor1
    font-weight 700

"""

options : options

render: (output) ->
  # Initialize our HTML.
  batteryHTML = ''

  # Create the DIVs for each piece of data.
  batteryHTML = "
    <div class='wrapper'>
      <div class='bar'></div>
      <div class='box'>
        <span class='icon'></span>
        <span class='time'>No Data</span>
      </div>
     </div>"
  return batteryHTML

# Update the rendered output.
update: (output, domEl) ->

  # Get our main DIV.
  div = $(domEl)

  if @options.widgetEnable
    # Get our pieces.
    values = output.slice(0,-1).split(" ")

    # Initialize our HTML.
    batteryHTML = ''
    div.find('.bar').css('width', values[0])
    div.find('.time').html(values[1])

    if values[0] != "NA"
      div.animate({ opacity: 1 }, 250)
      if parseInt(values[0]) < 10
        div.find('.bar').css('background-color', 'rgba(255,0,0,0.5)')
      else
        div.find('.bar').css('background-color', '')

      if values[2] == 'charging'
        div.find('.icon').html('<svg viewBox="0 0 6 12"><g transform="translate(-1332.000000, -610.000000)"><path d="M1338,610 L1332,616 L1335,617 L1332,622 L1338,616 L1335,615 L1338,610 Z"></path></g></svg>').show()
      else
        div.find('.icon').hide()
    else
      div.animate({ opacity: 0 }, 250)
      div.parent('div').css('margin-top', '-1px')

    # Sort out flex-box positioning.
    div.parent('div').css('order', '7')
    div.parent('div').css('flex', '0 1 auto')
  else
    div.remove()
