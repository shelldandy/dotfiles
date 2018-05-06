if has_key(g:plugs, 'vim-airline')
  let g:airline_powerline_fonts = 1
  let g:airline_left_sep=''
  let g:airline_left_alt_sep='|'
  let g:airline_right_sep=''
  let g:airline_right_alt_sep='|'
  let g:airline#extensions#tabline#enabled = 1      " Show all buffers if only 1 tab open

  " Chrome-like navigation of buffers (like tabs)
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9
  nmap <leader>- <Plug>AirlineSelectPrevTab
  nmap <leader>+ <Plug>AirlineSelectNextTab
endif
