if $THEME_COLORS == 'oceanic-next'
  if has_key(g:plugs, 'oceanic-next')
    let g:oceanic_next_terminal_bold = 1
    let g:oceanic_next_terminal_italic = 1
    colorscheme OceanicNext
    " Airline Hacks
    if has_key(g:plugs, 'vim-airline')
      let g:airline_theme='oceanicnext'
    endif

    function OceanicColorsOverride()
      " Pug Color Override
      autocmd BufNewFile,BufRead *.pug hi htmlTagName guifg=#ec5f67 ctermfg=203
      " Color Overrides for awesome experience
      hi Folded guibg=#1c2b34
      hi LineNr guibg=#1c2b34
      hi GitGutterAdd guibg=#1c2b34
      hi GitGutterChange guibg=#1c2b34
      hi GitGutterDelete guibg=#1c2b34
      hi GitGutterChangeDelete guibg=#1c2b34
      hi CursorLineNr guibg=#1c2b34

      " Force italics because we paid $200 for 'em
      hi Comment gui=italic
      hi javascriptFuncKeyword gui=italic guifg=#c594c5
      hi Type gui=italic
      hi htmlArg gui=italic

      " Let's improve javascript a bit shall we?
      hi javascriptFuncCallArg guifg=#6699cc
      hi javascriptMethod guifg=#6699cc
      hi javascriptBlock guifg=#6699cc
      hi javascriptImport guifg=#c594c5
      hi javascriptExport guifg=#c594c5
      hi javascriptNodeGlobal guifg=#cdd3d3
      hi javascriptIdentifier gui=italic guifg=#ec5f67

      if $THEME == 'oceanic-next'
        hi Normal guibg=#1d313b
        hi Folded guibg=#1d313b
        hi LineNr guibg=#1d313b
        hi GitGutterAdd guibg=#1d313b
        hi GitGutterChange guibg=#1d313b
        hi GitGutterDelete guibg=#1d313b
        hi GitGutterChangeDelete guibg=#1d313b
        hi CursorLineNr guibg=#1d313b
      endif
    endfunction

    call OceanicColorsOverride()
  endif
endif

if $THEME_COLORS == 'gruvbox'
  if has_key(g:plugs, 'gruvbox')
    let g:gruvbox_italic = 1
    colorscheme gruvbox
    set background=dark
  endif

  if has_key(g:plugs, 'vim-airline')
    let g:airline_theme='gruvbox'
  endif

  if has_key(g:plugs, 'ale')
    exe 'highlight ALEErrorSign guifg=' . $VIM_ALE_ERROR_FG 'guibg=' . $VIM_ALE_ERROR_BG
    exe 'highlight ALEWarningSign guifg=' . $VIM_ALE_WARNING_FG 'guibg=' . $VIM_ALE_WARNING_BG
  endif
endif
