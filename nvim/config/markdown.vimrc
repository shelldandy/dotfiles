" Let's get our markdown situation pretty and consistent
" A small script by Miguel Palau - 2017

function WriteMode()
  " Setup Pencil mode and colorscheme
  Pencil
  colorscheme pencil
  " Depending on our make background light or dark
  let hour = strftime('%H')
  if hour < 6 + 0
    set background=dark
  elseif hour < 20 + 0
    set background=light
  else
    set background=dark
  endif
  " Make Airline Pencil as well
  " I don't know why I need the double refresh this way lol
  AirlineTheme pencil
  AirlineRefresh
  AirlineRefresh
endfunction

autocmd BufEnter *.{md,mdown,mkd,mkdn,markdown,mdwn} call WriteMode()

