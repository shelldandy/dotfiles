if HasPlug('vim-polyglot')
  let g:javascript_plugin_jsdoc = 1
  let g:jsx_ext_required = 0
endif

if HasPlug('vim-jsx')
  let g:jsx_ext_required = 0
endif

if HasPlug('vim-javascript')
  let g:javascript_plugin_jsdoc = 1
endif

if HasPlug('ultisnips')
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  let g:UltiSnipsExpandTrigger="<C-j>"
  :imap ,us <C-J>
  :imap ,uu <C-J>
endif
