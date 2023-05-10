if $THEME_COLORS == 'gruvbox-dark'
  if HasPlug('gruvbox.nvim')
    let g:gruvbox_italic = 1
    let g:gruvbox_invert_selection = 0
    let g:gruvbox_sign_column = 'bg0'
    colorscheme gruvbox
    set background=dark
  endif

  if HasPlug('ale')
    exe 'highlight ALEErrorSign guifg=' . $VIM_ALE_ERROR_FG 'guibg=' . $VIM_ALE_ERROR_BG
    exe 'highlight ALEWarningSign guifg=' . $VIM_ALE_WARNING_FG 'guibg=' . $VIM_ALE_WARNING_BG
  endif
endif

if $THEME_COLORS == 'gruvbox-light'
  if HasPlug('gruvbox.nvim')
    let g:gruvbox_italic = 1
    colorscheme gruvbox
    set background=light
  endif

  if HasPlug('ale')
    exe 'highlight ALEErrorSign guifg=' . $VIM_ALE_ERROR_FG 'guibg=' . $VIM_ALE_ERROR_BG
    exe 'highlight ALEWarningSign guifg=' . $VIM_ALE_WARNING_FG 'guibg=' . $VIM_ALE_WARNING_BG
  endif
endif

if $THEME_COLORS == 'pencil'
  if HasPlug('vim-colors-pencil')
    colorscheme pencil
    set background=light
  endif
endif

if $THEME_COLORS == 'pencil-dark'
  if HasPlug('vim-colors-pencil')
    colorscheme pencil
    set background=dark
  endif
endif

if HasPlug('vim-colors-pencil')
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
