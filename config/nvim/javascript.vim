if has_key(g:plugs, 'vim-polyglot')
  let g:javascript_plugin_jsdoc = 1
  let g:jsx_ext_required = 0
endif

if has_key(g:plugs, 'vim-jsx')
  let g:jsx_ext_required = 0
endif

if has_key(g:plugs, 'vim-javascript')
  let g:javascript_plugin_jsdoc = 1
endif

if has_key(g:plugs, 'ultisnips')
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  let g:UltiSnipsExpandTrigger="<C-j>"
  :imap ,us <C-J>
  :imap ,uu <C-J>
endif

if has_key(g:plugs, 'deoplete.nvim')
  let g:deoplete#enable_at_startup = 1
  " Autocomplete from files now works from current buffer
  let g:deoplete#file#enable_buffer_path = 1
  " Close the preview window automatically after completion is done
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
endif

if has_key(g:plugs, 'deoplete-ternjs')
  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif
  let g:deoplete#omni#functions = {}
  let g:deoplete#sources = {}
  let g:deoplete#sources['javascript'] = ['file', 'ultisnips', 'ternjs', 'buffer']
  let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs', 'buffer']
  autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
  autocmd FileType javascript.jsx nnoremap <silent> <buffer> gb :TernDef<CR>
endif

if has_key(g:plugs, 'tern_for_vim')
  let g:tern_request_timeout = 1
  let g:tern_show_signature_in_pum = 1
  let g:tern#command = ["tern"]
  let g:tern#arguments = ["--persistent"]
  let g:tern_show_argument_hints = 'on_hold'
  autocmd FileType javascript set omnifunc=tern#Complete
  autocmd FileType javascript.jsx set omnifunc=tern#Complete
  " Helpful commands from the docs
  nnoremap <Leader>td :TernDoc<CR>
  nnoremap <Leader>tb :TernDocBrowse<CR>
endif

if has_key(g:plugs, 'ale')
  let g:ale_linters = {}
  let g:ale_linters['javascript'] = ['standard']
  let g:ale_linters['jsx'] = ['standard']
  let g:ale_linters['scss'] = ['stylelint']
  let g:ale_linters['html'] = ['htmlhint']

  let g:ale_fixers = {}
  let g:ale_fixers['javascript'] = ['standard']
  let g:ale_fixers['jsx'] = ['standard']
  let g:ale_fixers['scss'] = ['stylelint']
endif

if has_key(g:plugs, 'supertab')
  autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
  autocmd FileType javascript.jsx let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
endif

nnoremap <Leader>js :set filetype=javascript<CR>
