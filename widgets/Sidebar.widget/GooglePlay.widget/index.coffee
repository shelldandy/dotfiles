command: "cat ~/Library/'Application Support'/'Google Play Music Desktop Player'/json_store/playback.json"

refreshFrequency: '1s'

# Render the output.
render: (output) -> """
  <div class='google-play'><div>
"""
update: (output, domEl) ->
  data = JSON.parse(output)
  container = $(domEl).find('.google-play')
  content =
    """
    <img src=#{data.song.albumArt} >
    """
  $(container).html content

# CSS Style
style: """
  .google-play
    width: 176px
    height: 176px
    color: white
  img
    width: 100%
    height: 100%
    object-fit: cover
"""
afterRender: (domEl) ->

  $(domEl).parent('div').css('order', '10')
