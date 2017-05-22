if has_key(g:plugs, 'oceanic-next')
  colorscheme OceanicNext
  " Airline Hacks
  if has_key(g:plugs, 'vim-airline')
    let g:airline_theme='oceanicnext'
  endif
  " Pug Color Override
  autocmd BufNewFile,BufRead *.pug hi htmlTagName guifg=#ec5f67 ctermfg=203
  " Force italics because we paid $200 for 'em
  hi Comment gui=italic
  " Color Overrides for awesome experience
  hi Folded guibg=#1c2b34
  hi LineNr guibg=#1c2b34
  hi GitGutterAdd guibg=#1c2b34
  hi GitGutterChange guibg=#1c2b34
  hi GitGutterDelete guibg=#1c2b34
  hi GitGutterChangeDelete guibg=#1c2b34
  hi CursorLineNr guibg=#1c2b34
endif

if has_key(g:plugs, 'ctrlp.vim')
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules,*/bower,*/dist,*/public,*/.next,*/theme,*/wp-admin,*/wp-includes
  let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|node_modules|bower|public|next|theme)$'
  let g:ctrlp_show_hidden = 1
endif

if has_key(g:plugs, 'matchtagalways')
  let g:mta_filetypes = {
    \ 'javascript.jsx': 1,
    \ 'html' : 1,
    \ 'xml' : 1,
    \ 'liquid': 1,
    \ }
endif

if has_key(g:plugs, 'ultisnips')
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  let g:UltiSnipsExpandTrigger="<C-j>"
endif

if has_key(g:plugs, 'tern_for_vim')
  let g:tern_request_timeout = 1
  let g:tern_show_signature_in_pum = 1
  let g:tern#command = ["tern"]
  let g:tern#arguments = ["--persistent"]
  let g:tern_show_argument_hints = 'on_hold'
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

if has_key(g:plugs, 'deoplete-ternjs')
  let g:deoplete#enable_at_startup = 1
  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif
  autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
  let g:deoplete#omni#functions = {}
  let g:deoplete#omni#functions.javascript = [
    \ 'tern#Complete',
    \ 'jspc#omni'
  \]
  let g:deoplete#sources = {}
  let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs', 'buffer']
  autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
endif

if has_key(g:plugs, 'ale')
  let g:ale_linters = {
  \   'javascript': ['standard'],
  \}
  set statusline+=%#warningmsg#
  set statusline+=%{ALEGetStatusLine()}
  set statusline+=%*
  let g:ale_open_list = 1
  highlight clear ALEErrorSign
  highlight clear ALEWarningSign
  hi ALEWarningSign guifg=#f7c862
  hi ALEErrorSign guifg=#ec5f67
endif

if has_key(g:plugs, 'vim-jsx')
  let g:jsx_ext_required = 0
endif

if has_key(g:plugs, 'supertab')
  " close the preview window when you're not using it
  let g:SuperTabClosePreviewOnPopupClose = 1
  let g:SuperTabDefaultCompletionType = "<c-n>"
endif

if has_key(g:plugs, 'vim-closetag')
  let g:closetag_filenames = "*.html,*.js,*.jsx,*.liquid"
endif

if has_key(g:plugs, 'indentLine')
  let g:indentLine_char = '┆'
endif

if has_key(g:plugs, 'vim-devicons')
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sass'] = ''
endif

if has_key(g:plugs, 'TwitVim')
  let g:twitvim_enable_python3 = 1
endif

if has_key(g:plugs, 'fzf.vim')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'
  let g:fzf_files_options =
    \ '--preview "rougify {} 2> /dev/null"'

  " Customize fzf colors to match your color scheme
  let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Clear'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

  " Enable per-command history.
  " CTRL-N and CTRL-P will be automatically bound to next-history and
  " previous-history instead of down and up. If you don't like the change,
  " explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
  let g:fzf_history_dir = '~/.local/share/fzf-history'
endif
