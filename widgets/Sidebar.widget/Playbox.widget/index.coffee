# Code originally created by the awesome members of Ubersicht community.
# I stole from so many I can't remember who you are, thank you so much everyone!
# Haphazardly adjusted and mangled by Pe8er (https://github.com/Pe8er)

options =
  # Easily enable or disable the widget.
  widgetEnable: false

command: "osascript 'Sidebar.widget/Playbox.widget/as/Get Current Track.applescript'"

refreshFrequency: '1s'

style: """

  white05 = rgba(white,0.5)
  white02 = rgba(white,0.2)

  width 176px
  overflow hidden
  white-space nowrap
  opacity 0

  .wrapper
    font-size 8pt
    line-height 11pt
    color white
    padding 8px

  .art
    width 44px
    height @width
    background-image url(Sidebar.widget/Playbox.widget/as/default.png)
    -webkit-transition background-image 0.5s ease-in-out
    background-size cover
    float left
    margin 0 8px 0 0
    border-radius 50%

  .text
    foat left

  .progress
    width: @width
    height: 2px
    background: white
    position: absolute
    bottom: 0
    left: 0

  .wrapper, .album, .artist, .song
    overflow: hidden
    text-overflow: ellipsis

  .song
    font-weight: 700

  .album
    color white05

"""

options : options

render: (output) ->
  # Initialize our HTML.
  medianowHTML = ''

  # Create the DIVs for each piece of data.
  medianowHTML = "
    <div class='wrapper'>
      <div class='art'></div>
      <div class='text'>
        <div class='song'></div>
        <div class='artist'></div>
        <div class='album'></div>
      </div>
      <div class='progress'></div>
    </div>"

  return medianowHTML

# Update the rendered output.
update: (output, domEl) ->

  # Get our main DIV.
  div = $(domEl)

  if @options.widgetEnable
    # Get our pieces.
    values = output.slice(0,-1).split(" ~ ")

    # Initialize our HTML.
    medianowHTML = ''

    # Progress bar things.
    tDuration = values[4]
    tPosition = values[5]
    tArtwork = values[6]
    tWidth = div.width();
    tCurrent = (tPosition / tDuration) * tWidth

    currArt = div.find('.art').css('background-image').split('/').pop().slice(0,-1)

    if values[0] == 'NA'
      div.animate({ opacity: 0 }, 250)
      setTimeout(div.hide(1), 1)
    else
      div.animate({ opacity: 1 }, 250, "swing", setTimeout(div.show(1), 1))
      div.find('.song').html(values[1])
      div.find('.artist').html(values[0])
      div.find('.album').html(values[2])
      div.find('.progress').css width: tCurrent
      if tArtwork isnt currArt
        if tArtwork =='NA'
          div.find('.art').css('background-image', 'url(Sidebar.widget/Playbox.widget/as/default.png)')
        else
          div.find('.art').css('background-image', 'url('+tArtwork+')')

    # Sort out flex-box positioning.
    div.parent('div').css('order', '7')
    div.parent('div').css('flex', '0 1 auto')
  else
    div.remove()
