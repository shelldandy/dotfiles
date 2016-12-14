filetype plugin indent on

" ColorScheme
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

" NERDTree Quick Open with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" NERDTree File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
   exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction

  call NERDTreeHighlightFile('pug', 'green', 'none', 'green', '#151515')
  call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
  call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
  call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
  call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
  call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
  call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" CTRLP Ignore Hidden Missiles
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules,*/www
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|node_modules|bower)$'

" StandardJS
let g:syntastic_javascript_checkers = ['standard']
" StandardJS autoformat on save: needs standard-format global npm package
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
" Disable relative numbers by default
" let g:enable_numbers = 0

