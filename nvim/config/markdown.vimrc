" Let's get our markdown situation pretty and consistent
" A small script by Miguel Palau - 2017

function WriteMode()
  Pencil
  colorscheme pencil
  set background=light
  AirlineTheme pencil
  AirlineRefresh
  AirlineRefresh
endfunction

autocmd BufEnter *.{md,mdown,mkd,mkdn,markdown,mdwn} call WriteMode()

