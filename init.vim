" Enter the current millenium
set nocompatible

filetype plugin on
""""""""""""""""""""""""""""""""""
"           Vim Plug		 "
""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

"Deoplete AutoComplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

Plug 'othree/yajs.vim'

" Ultimate Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'rstacruz/vim-hyperstyle'
" Ctrl P Fuzzy Finder
Plug 'ctrlpvim/ctrlp.vim'
" NerdTree
Plug 'scrooloose/nerdtree'
" Nerdtree with git situation
Plug 'Xuyuanp/nerdtree-git-plugin'
" Auto close brackets smartly
Plug 'jiangmiao/auto-pairs'
" Colors in my Sass
Plug 'ap/vim-css-color'
" Git Situation on my Lines like Atom
Plug 'airblade/vim-gitgutter'
" Pug Syntax Highlight
Plug 'digitaltoad/vim-pug'
" Syntastic for StandardJS
Plug 'vim-syntastic/syntastic'
" Extending OmniComplete for JS on Vim
Plug '1995eaton/vim-better-javascript-completion'
" A bunch of JS Syntax like JSX
Plug 'sheerun/vim-polyglot'
Plug 'mxw/vim-jsx'
" Autoclose html tags
Plug 'alvan/vim-closetag'
" Oceanic Next
Plug 'mhartington/oceanic-next'
" Vim Airline
Plug 'vim-airline/vim-airline'
" Nerd Commenter
Plug 'scrooloose/nerdcommenter'
" Indent lines
Plug 'Yggdroot/indentLine'

call plug#end()
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""
"       Vim-Plug                 "
""""""""""""""""""""""""""""""""""
set encoding=utf8

" Make copy/paste great again
set clipboard=unnamed

" Make delete work on vim8
set backspace=indent,eol,start

" Hidden Buffer files
set hidden
set noswapfile
set nobackup
set nowb

highlight Comment cterm=italic

" Colors
syntax enable
set termguicolors

colorscheme OceanicNext
let g:airline_theme='oceanicnext'

" Numbers on rows
set number

" Mouse mode
set mouse=a

" Search Mode
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" Tabs situation
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" NERDTree Quick Open with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Easier Split Navigation
" Instead of doing CTRL-W + (h|j|k|l)
" Just do CTRL-(h|j|k|l)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|node_modules)$'

" StandardJS
let g:syntastic_javascript_checkers = ['standard']
" StandardJS autoformat on save: needs standard-format global npm package
autocmd bufwritepost *.js silent !standard --fix %
set autoread

" JSX even on just JS
let g:jsx_ext_required = 0

" Deoplete
let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Nerdcomment
let mapleader=","

" filenames like *.html, *js, *jsx ...
let g:closetag_filenames = "*.html,*.js,*.jsx"

" Vim Airline
let g:airline_powerline_fonts = 1

" Indent lines
let g:indentLine_char = '┆'
