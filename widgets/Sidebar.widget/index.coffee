# This is the MotherWidget™. It sets up flex positioning and a few general styling rules.
# Code originally created by Jonathan MacQueen (https://github.com/jmacqueen)
# Haphazardly adjusted and mangled by Pe8er (https://github.com/Pe8er)
# https://scotch.io/tutorials/a-visual-guide-to-css3-flexbox-properties was very helpful to understand this beast.

widgetEnable    : true
flexDirection   : 'column-reverse'        # default: 'row'
justifyContent  : 'flex-start' # default: 'flex'-start'
alignContent    : 'stretch'    # default: 'stretch'
flexWrap        : 'nowrap'       # default: 'nowrap'
alignItems      : 'flex-end'    # default: 'stretch'. 'flex-start' for left, 'flex-end' for right.
refreshFrequency: false

render: (output) ->

  if @widgetEnable is false
    $(domEl).find('.widget').remove()

  """
  <style>
    #__uebersicht {
      display: flex;
      align-items: #{@alignItems};
      align-content: #{@alignContent};
      flex-direction: #{@flexDirection};
      flex-wrap: #{@flexWrap};
      justify-content: #{@justifyContent};
      font-family: system, -apple-system;
    }
    #__uebersicht>div {
      width: auto;
    }
    .widget {
      position: relative;
      background-color: rgba(0,0,0,.2);
      -webkit-backdrop-filter: blur(30px) brightness(80%) contrast(100%) saturate(140%);
      margin-top: 1px;
    }

    #__uebersicht {
     // -webkit-backdrop-filter: blur(30px) brightness(80%) contrast(100%) saturate(140%);
    }
  </style>
  """

style: """
  margin-top 0
"""

# update: (output, domEl) ->
#   $(domEl).parent('div').css('position', 'absolute')
