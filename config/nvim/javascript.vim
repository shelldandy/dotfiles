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
  " Enable deoplete when InsertEnter.
  let g:deoplete#enable_at_startup = 0
  autocmd InsertEnter * call deoplete#enable()
  " Close the preview window automatically after completion is done
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
endif

if has_key(g:plugs, 'deoplete-ternjs')
  let g:deoplete#sources#ternjs#depths = 1
  let g:deoplete#sources#ternjs#filetypes = [
  \ 'jsx',
  \ 'javascript.jsx',
  \ 'vue',
  \ ]
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

if has_key(g:plugs, 'supertab')
  autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
  autocmd FileType javascript.jsx let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
endif

nnoremap <Leader>js :set filetype=javascript<CR>
