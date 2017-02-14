command: "cat ~/Library/'Application Support'/'Google Play Music Desktop Player'/json_store/playback.json"

refreshFrequency: 1000

# Render the output.
render: (output) -> """
  <div class='google-play'><div>
"""
update: (output, domEl) ->
  data = JSON.parse(output)
  album = data.song.albumArt
  container = $(domEl).find('.google-play')
  if album
    content =
      """
      <img src=#{album} />
      """
  else
    content =
      """
      <p class='shrug'>¯\\_(ツ)_/¯</p>
      """
  $(container).html content

style: """
  .google-play
    width: 176px
    height: 176px
    color: white
    display: flex
    text-align: center
    justify-content: center
    align-items: center
    flex-direction: column
  img
    width: 100%
    height: 100%
    object-fit: cover
  .shrug
    margin-bottom: 0
"""
afterRender: (domEl) ->
  $(domEl).parent('div').css('order', '10')
