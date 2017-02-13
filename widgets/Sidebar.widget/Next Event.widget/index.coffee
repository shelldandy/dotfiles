# Code originally created by the awesome members of Ubersicht community.
# I stole from so many I can't remember who you are, thank you so much everyone!
# Haphazardly adjusted and mangled by Pe8er (https://github.com/Pe8er)

options =
  # Easily enable or disable the widget.
  widgetEnable: false

command: "osascript 'Sidebar.widget/Next Event.widget/Next Event.applescript'"

refreshFrequency: '1m'

style: """
  white05 = rgba(white,0.5)
  white02 = rgba(white,0.2)

  width 176px

  .wrapper
    position relative
    font-size 8pt
    line-height 11pt
    color white
    height 48px

  .time
    float left
    font-size 10pt
    font-weight 700
    text-align center
    position relative
    top 50%
    -webkit-transform translateY(-50%)
    width auto
    margin auto 8px

  .text
    position relative
    top 50%
    -webkit-transform translateY(-50%)
    width auto
    margin-right 8px
    text-align left
    overflow hidden
    height auto

  .eventName, .meta
    display block
    text-align left
    white-space nowrap
    overflow hidden
    text-overflow ellipsis

  .meta, .noEvents
    color white05
"""

options : options

render: (output) ->

  # Initialize our HTML.
  NextEventHTML = ''

  # Create the DIVs for each piece of data.
  NextEventHTML = "
    <div class='wrapper'>
      <div class='time'></div>
      <div class='text'>
        <span class='eventName'></span>
        <span class='meta'></span>
      </div>
    </div>"
  return NextEventHTML

# Update the rendered output.
update: (output, domEl) ->

  # Get our main DIV.
  div = $(domEl)

  if @options.widgetEnable
    # Get our pieces.
    values = output.slice(0,-1).split("^")

    # Initialize main HTML.
    NextEventHTML = ''
    div.find('.time').html(values[0])
    div.find('.eventName').html(values[1])
    div.find('.meta').html(values[2])

    if values[0] == 'No Events'
      div.find('.wrapper').css('display', 'none')
      div.parent('div').css('margin-top', '-1px')
    else if values[0] == 'icalbuddy'
      div.find('.time').css('display', 'none')
      div.find('.text').html("Please install icalBuddy.<br />'brew install ical-buddy' seems like a good idea.").css('white-space', 'normal').css('text-align', 'center').css('margin-right', '0')
    else
      div.find('.wrapper').css('display', 'block')

    if parseInt(values[2]) != 0
      div.find('.meta').css('display', 'block')
    else
      div.find('.meta').css('display', 'none')

    # Sort out flex-box positioning.
    div.parent('div').css('order', '4')
    div.parent('div').css('flex', '0 1 auto')
  else
    div.remove()
