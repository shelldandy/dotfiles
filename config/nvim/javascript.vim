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
  autocmd InsertEnter * call deoplete#enable()
endif

if has_key(g:plugs, 'deoplete-ternjs')
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
