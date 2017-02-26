if has_key(g:plugs, 'vim-airline')
  let g:airline_powerline_fonts = 1
  let g:airline_theme='powerlineish'
  let g:airline_left_sep=''
  let g:airline_left_alt_sep=''
  let g:airline_right_sep=''
  let g:airline_right_alt_sep=''
  let g:airline#extensions#tabline#enabled = 1      " Show all buffers if only 1 tab open
endif
