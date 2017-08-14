if has_key(g:plugs, 'ultisnips')
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  let g:UltiSnipsExpandTrigger="<C-j>"
endif

if has_key(g:plugs, 'deoplete.nvim')
  let g:deoplete#enable_at_startup = 1
endif

if has_key(g:plugs, 'deoplete-ternjs')
  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif
  let g:deoplete#omni#functions = {}
  let g:deoplete#omni#functions.javascript = [
    \ 'tern#Complete',
    \ 'jspc#omni'
  \]
  let g:deoplete#omni#functions['javascript.jsx'] = [
    \ 'tern#Complete',
    \ 'jspc#omni'
  \]
  let g:deoplete#sources = {}
  let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs', 'buffer']
  let g:deoplete#sources['javascript'] = ['file', 'ultisnips', 'ternjs', 'buffer']
  autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
  autocmd FileType javascript.jsx nnoremap <silent> <buffer> gb :TernDef<CR>
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
endif

if has_key(g:plugs, 'tern_for_vim')
  let g:tern_request_timeout = 1
  let g:tern_show_signature_in_pum = 1
  let g:tern#command = ["tern"]
  let g:tern#arguments = ["--persistent"]
  let g:tern_show_argument_hints = 'on_hold'
  autocmd FileType javascript setlocal omnifunc=tern#Complete
  autocmd FileType javascript.jsx setlocal omnifunc=tern#Complete
endif

if has_key(g:plugs, 'vim-jsx')
  let g:jsx_ext_required = 0
endif

if has_key(g:plugs, 'ale')
  let g:ale_linters = {
  \   'javascript': ['standard'],
  \   'jsx': ['standard'],
  \   'scss': ['stylelint'],
  \   'html': ['htmlhint'],
  \}
  let g:ale_linter_aliases = {'jsx': 'css'}
endif

if has_key(g:plugs, 'supertab')
  autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
  let g:UltiSnipsExpandTrigger="<C-j>"
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
endif

" Styled-Components
augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead *.js set filetype=javascript.jsx
augroup END

augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType javascript.jsx setlocal omnifunc=javascriptcomplete#CompleteJS
augroup end
