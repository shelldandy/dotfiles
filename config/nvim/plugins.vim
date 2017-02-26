filetype plugin indent on

colorscheme monokai
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

if has_key(g:plugs, 'ctrlp.vim')
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules,*/bower,*/dist,*/public
  let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|node_modules|bower|public)$'
  let g:ctrlp_show_hidden = 1
endif

" Eslint Projects
"let g:syntastic_javascript_checkers = ['eslint']
"autocmd bufwritepost *.js silent !eslint --fix %

" StandardJS Projects
let g:syntastic_javascript_checkers = ['standard']
autocmd bufwritepost *.js silent !standard --fix %
set autoread

" JSX even on just JS
let g:jsx_ext_required = 0

" Deoplete
let g:deoplete#enable_at_startup = 1
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs', 'buffer']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" Tab-complete
let g:SuperTabDefaultCompletionType = "<c-n>"
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" filenames like *.html, *js, *jsx ...
let g:closetag_filenames = "*.html,*.js,*.jsx"

" Indent lines
let g:indentLine_char = '┆'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Numbers exclude
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']

" Pug Auto Lint
let g:syntastic_pug_checkers = ['pug_lint']

" Vim Devicons
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sass'] = ''

" Vdebug
let g:vdebug_options = {
\    "break_on_open" : 0,
\}

" TwitVim
let g:twitvim_enable_python3 = 1
