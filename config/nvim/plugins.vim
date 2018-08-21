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
    \ 'php': 1,
    \ }
endif

if has_key(g:plugs, 'ale')
  let g:airline#extensions#ale#enabled = 1

  let g:ale_linters = {}
  let g:ale_linters['javascript'] = ['eslint', 'stylelint']
  let g:ale_linters['jsx'] = ['eslint']
  let g:ale_linters['scss'] = ['stylelint']
  let g:ale_linters['html'] = ['htmlhint']

  let g:ale_fixers = {}
  let g:ale_fixers['javascript'] = ['eslint']
  let g:ale_fixers['jsx'] = ['eslint']
  let g:ale_fixers['scss'] = ['stylelint']
  let g:ale_fixers['typescript'] = ['tslint']
endif

if has_key(g:plugs, 'supertab')
  let g:SuperTabDefaultCompletionType = "<c-n>"
endif

if has_key(g:plugs, 'ultisnips')
  let g:UltiSnipsExpandTrigger="<C-j>"
endif

if has_key(g:plugs, 'vim-closetag')
  let g:closetag_filenames = "*.html,*.js,*.jsx,*.liquid,*.php"
  let g:closetag_emptyTags_caseSensitive = 1
endif

if has_key(g:plugs, 'indentLine')
  let g:indentLine_char = '┆'
  let g:indentLine_fileTypeExclude = ['help']
  let g:indentLine_bufNameExclude = ['NERD_tree.*']
endif

if has_key(g:plugs, 'fzf.vim')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'
  " https://github.com/junegunn/fzf/blob/master/man/man1/fzf.1#L211
  let g:fzf_files_options =
    \ '--color "border:#6699cc,info:#fabd2f" --preview "highlight -O ansi --force {} 2> /dev/null"'

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
  let g:fzf_history_dir = '~/.local/share/fzf-history'
  " Custom Ag command with preview window
  command! -bang -nargs=* Ag
    \ call fzf#vim#ag(
    \ <q-args>,
    \ ' --color-path 35 --color-match "1;35" --color-line-number 32',
    \ fzf#vim#with_preview(),
    \ <bang>0)
endif

if has_key(g:plugs, 'goyo.vim')
  let g:goyo_height = '100%'
  function! s:goyo_enter()
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
    set noshowmode
    set noshowcmd
    set scrolloff=999
  endfunction

  function! s:goyo_leave()
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
    set showmode
    set showcmd
    set scrolloff=5
    call OceanicColorsOverride()
    " ...
  endfunction

  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeaver nested call <SID>goyo_leave()
endif

if has_key(g:plugs, 'emmet-vim')
  let g:user_emmet_install_global = 0
  autocmd FileType html,css,liquid,scss,javascript.jsx,javascript,htmldjango,less EmmetInstall
  let g:user_emmet_settings = {}
  let g:user_emmet_settings['javascript'] = { 'extends': 'css' }
  let g:user_emmet_settings['javascript.jsx'] = { 'extends': 'css' }
  let g:user_emmet_settings['liquid'] = {}
  let g:user_emmet_settings['liquid']['default_attributes'] = {}
  let g:user_emmet_settings['liquid']['default_attributes']['a'] = { 'href': '#' }
  let g:user_emmet_settings['liquid']['default_attributes']['img'] = { 'src': '' }
endif

if has_key(g:plugs, 'vim-polyglot')
  let g:polyglot_disabled = ['markdown']
endif

if has_key(g:plugs, 'vim-markdown')
  let g:vim_markdown_folding_disabled = 1
endif

if has_key(g:plugs, 'vim-localvimrc')
  " Don't ask me each time I load a lvimrc file
  let g:localvimrc_ask = 0
endif
