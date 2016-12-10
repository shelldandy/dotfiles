" Show all funky signs
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


" Easier Split Navigation
" Instead of doing CTRL-W + (h|j|k|l)
" Just do CTRL-(h|j|k|l)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
