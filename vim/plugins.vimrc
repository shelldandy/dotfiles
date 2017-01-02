filetype plugin indent on

" ColorScheme
colorscheme OceanicNext
let g:airline_theme='oceanicnext'
" CTRLP Ignore Hidden Missiles
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules,*/www,*/bower,*/dist
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|node_modules|bower)$'

" StandardJS
" let g:syntastic_javascript_checkers = ['standard']
" StandardJS autoformat on save: needs standard-format global npm package
" autocmd bufwritepost *.js silent !standard --fix %
set autoread

" JSX even on just JS
let g:jsx_ext_required = 0
" TernJS
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
" Disable relative numbers by default
" let g:enable_numbers = 0

" Pug Auto Lint
let g:syntastic_pug_checkers = ['pug_lint']

" Vim Devicons
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sass'] = ''

" Vdebug
let g:vdebug_options = {
\    "break_on_open" : 0,
\}

