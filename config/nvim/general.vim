"  ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄
" ███    ███ ███  ▄██▀▀▀███▀▀▀██▄
" ███    ███ ███▌ ███   ███   ███
" ███    ███ ███▌ ███   ███   ███
" ███    ███ ███▌ ███   ███   ███
" ███    ███ ███  ███   ███   ███
" ███    ███ ███  ███   ███   ███
"  ▀██████▀  █▀    ▀█   ███   █▀
" =================================================================================================
" General settings
" =================================================================================================

" Base Situation
set nocompatible                      " vim, not vi
syntax on                             " syntax highlighting
filetype plugin indent on             " try to recognise filetype and load plugins and indent files
set encoding=utf8                     " Show all funky signs
set clipboard=unnamed                 " Make copy/paste great again
set backspace=indent,eol,start        " Make delete work on vim8

" Hidden Buffer files
set hidden
set noswapfile
set nobackup
set nowb

" interface
syntax enable
set termguicolors
set colorcolumn=100                   " show a column at 100 chars
set cursorline                        " highlight current line
set laststatus=2                      " enable airline on open
set noshowmode                        " don't show mode as airline already does
set number                            " show line numbers
set relativenumber                    " show relative line numbers
set ruler                             " show current position at bottom
set scrolloff=5                       " keep at least 5 lines above/below
set shortmess+=aAIsT                  " disable welcome screen and other messages
set showcmd                           " show any commands
set sidescroll=1                      " smoother horizontal scrolling
set sidescrolloff=5                   " keep at least 5 lines left/right
set splitbelow                        " create new splits below
set splitright                        " create new splits to the right
set termguicolors                     " enable true colors
set wildmenu                          " enable wildmenu
set wildmode=longest:full,full        " configure wildmenu
set lazyredraw                        " don't draw everything
highlight Comment cterm=italic

" Mouse mode
set mouse=a

" Search Mode
set incsearch                         " Find the next match as we type the search
set hlsearch                          " Highlight searches by default
set ignorecase                        " Ignore case when searching...
set smartcase                         " ...unless we type a capital

" Tabs situation
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab                         " Actually print 2 spaces when hitting TAB
set foldmethod=indent                 " The folds will happen by indentation like Atom
set foldlevelstart=1                  " Start folding at the top of every function
set foldnestmax=4                     " But just fold up to 4 levels
set exrc                              " Allow the use of per project .nvimrc files
