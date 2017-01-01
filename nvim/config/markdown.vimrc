" Let's get our markdown situation pretty and consistent
" A small script by Miguel Palau - 2017

function WriteMode()
  colorscheme pencil
  AirlineTheme pencil
endfunction

autocmd BufEnter *.{md,mdown,mkd,mkdn,markdown,mdwn} call WriteMode()

