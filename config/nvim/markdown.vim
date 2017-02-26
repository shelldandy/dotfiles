" Let's get our markdown situation pretty and consistent
" A small script by Miguel Palau - 2017
function WriteModeOn()
  " Setup Pencil mode and colorscheme
  Pencil
  colorscheme pencil
  " Make Airline Pencil as well
  " I don't know why I need the double refresh this way lol
  AirlineTheme pencil
  AirlineRefresh
  AirlineRefresh
endfunction

function WriteModeOff()
  PencilOff
  colorscheme OceanicNext
  AirlineTheme oceanicnext
endfunction

com -nargs=0 WriteModeOn call WriteModeOn()
com -nargs=0 WriteModeOff call WriteModeOff()
