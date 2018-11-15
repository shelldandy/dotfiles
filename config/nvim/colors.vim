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

  if has_key(g:plugs, 'ale')
    exe 'hi ALEErrorSign guifg=' . $VIM_ALE_ERROR_FG 'guibg=' . $VIM_ALE_ERROR_BG
    exe 'hi ALEWarningSign guifg=' . $VIM_ALE_WARNING_FG 'guibg=' . $VIM_ALE_WARNING_BG
  endif

  if has_key(g:plugs, 'nerdtree')
    call NERDTreeHighlightFile('pug', 'green', 'none', 'green', '#1c2b34')
    call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#1c2b34')
    call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#1c2b34')
    call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#1c2b34')
    call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#1c2b34')
    call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#1c2b34')
    call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#1c2b34')
    call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#1c2b34')
    call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#1c2b34')
    call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#1c2b34')
    call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#1c2b34')
    call NERDTreeHighlightFile('scss', 'cyan', 'none', 'cyan', '#1c2b34')
    call NERDTreeHighlightFile('sass', 'cyan', 'none', 'cyan', '#1c2b34')
    call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#1c2b34')
    call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#1c2b34')
    call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#1c2b34')
  endif
endif

if $THEME_COLORS == 'gruvbox-dark'
  if has_key(g:plugs, 'gruvbox')
    let g:gruvbox_italic = 1
    colorscheme gruvbox
    set background=dark
    " https://github.com/morhetz/gruvbox/issues/179
    hi! link xmlTagN GruvboxBlue
  endif

  if has_key(g:plugs, 'vim-airline')
    let g:airline_theme='gruvbox'
  endif

  if has_key(g:plugs, 'ale')
    exe 'highlight ALEErrorSign guifg=' . $VIM_ALE_ERROR_FG 'guibg=' . $VIM_ALE_ERROR_BG
    exe 'highlight ALEWarningSign guifg=' . $VIM_ALE_WARNING_FG 'guibg=' . $VIM_ALE_WARNING_BG
  endif
endif

if $THEME_COLORS == 'gruvbox-light'
  if has_key(g:plugs, 'gruvbox')
    let g:gruvbox_italic = 1
    colorscheme gruvbox
    set background=light
  endif

  if has_key(g:plugs, 'vim-airline')
    let g:airline_theme='gruvbox'
  endif

  if has_key(g:plugs, 'ale')
    exe 'highlight ALEErrorSign guifg=' . $VIM_ALE_ERROR_FG 'guibg=' . $VIM_ALE_ERROR_BG
    exe 'highlight ALEWarningSign guifg=' . $VIM_ALE_WARNING_FG 'guibg=' . $VIM_ALE_WARNING_BG
  endif
endif

if $THEME_COLORS == 'gotham'
  if has_key(g:plugs, 'vim-gotham')
    colorscheme gotham
  endif
endif

if $THEME_COLORS == 'onehalf-dark'
  if has_key(g:plugs, 'onehalf')
    colorscheme onehalfdark
  endif

  if has_key(g:plugs, 'vim-airline')
    let g:airline_theme='onehalfdark'
  endif
endif

if $THEME_COLORS == 'vim-one'
  if has_key(g:plugs, 'vim-one')
    colorscheme one
    set background=dark
    let g:one_allow_italics = 1
  endif

  if has_key(g:plugs, 'vim-airline')
    let g:airline_theme='one'
  endif
endif

if $THEME_COLORS == 'pencil'
  if has_key(g:plugs, 'vim-colors-pencil')
    colorscheme pencil
    set background=light
  endif
endif

if $THEME_COLORS == 'pencil-dark'
  if has_key(g:plugs, 'vim-colors-pencil')
    colorscheme pencil
    set background=dark
  endif
endif

if $THEME_COLORS == 'seoul'
  if has_key(g:plugs, 'seoul256.vim')
    colorscheme seoul256-light
    set background=light
  endif
endif

if $THEME_COLORS == 'seoul-dark'
  if has_key(g:plugs, 'seoul256.vim')
    let g:seoul256_background = 235
    colorscheme seoul256
    set background=dark
  endif
endif

if has_key(g:plugs, 'vim-colors-pencil')
  " Neutral code background
  let g:pencil_terminal_italics = 1
  let g:airline_theme = 'pencil'
  let g:pencil#wrapModeDefault = 'soft'
  let g:pencil_spell_undercurl = 0
  " Add underlines to spellcheck errors
  hi SpellBad gui=underline
  hi SpellCap gui=underline
  hi SpellRare gui=underline
  hi SpellLocal gui=underline
endif
