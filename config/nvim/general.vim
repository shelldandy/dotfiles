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
" language en                         " Base Language
set nocompatible                      " vim, not vi
syntax on                             " syntax highlighting
filetype plugin indent on             " try to recognise filetype and load plugins and indent files
set encoding=utf8                     " Show all funky signs
set backspace=indent,eol,start        " Make delete work on vim8
set shell=zsh                         " Specify a POSIX shell since vim don't like 🐟
set magic

" Hidden Buffer files
set hidden
set noswapfile
set nobackup
set nowb

set completeopt=menuone,preview,noinsert,noselect

" interface
syntax enable
set termguicolors
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
" set colorcolumn=100                   " show a column at 100 chars

" Search Mode
set incsearch                         " Find the next match as we type the search
set hlsearch                          " Highlight searches by default
set ignorecase                        " Ignore case when searching...
set smartcase                         " ...unless we type a capital

" interaction
set backspace=2                       " make backspace work like most other apps
set mouse=a                           " enable mouse support
set mousehide                         " hide the mouse cursor while typing
set whichwrap=b,s,h,l,<,>,[,]         " backspace and cursor keys wrap too

" whitespace
" set expandtab                         " use spaces instead of tabs
set nojoinspaces                      " use one space, not two, after punctuation
set shiftround                        " shift to next tabstop
set shiftwidth=2                      " amount of space used for indentation
set softtabstop=2                     " appearance of tabs
set tabstop=2                         " use two spaces for tabs

" Folding
set foldmethod=indent                 " The folds will happen by indentation like Atom
set foldlevelstart=1                  " Start folding at the top of every function
set foldnestmax=99                    " But just fold up to 20 levels

" text appearance
set list                              " show invisible characters
set synmaxcol=500                     " stop syntax highlighting after 500 columns
set listchars=tab:>·,trail:·          " but only show useful chaaracters
set nowrap                            " disable line wrapping

" External vimrc files
set exrc                              " Allow the use of per project .vimrc files

" background processes
set updatetime=250                    " timeout for plugins like gitgutter etc.
set autoread                          " update file when changed outside of vim
set autoindent                        " copy indentation from the previous line for new line
set clipboard+=unnamedplus            " use native clipboard
set history=200                       " store last 200 commands as history
set nobackup                          " don't save backups
set noerrorbells visualbell t_vb=     " no error bells please
set noswapfile                        " no swapfiles
set nowritebackup                     " don't save a backup while editing
set ttyfast                           " indicates a fast terminal connection
set undodir=~/.config/nvim/undodir    " set undofile location
set undofile                          " maintain undo history between sessions
set undolevels=1000                   " store 1000 undos

" character encoding
if !&readonly && &modifiable
  set fileencoding=utf-8              " the encoding written to file
endif

" Binary
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.jar,*.pyc,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.m4a,*.mp3,*.oga,*.ogg,*.wav,*.webm
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*.gem
set wildignore+=.sass-cache
set wildignore+=npm-debug.log
" Compiled
set wildignore+=*.marko.js
set wildignore+=*.min.*,*-min.*
" Temp/System
set wildignore+=*.*~,*~
set wildignore+=*.swp,.lock,.DS_Store,._*,tags.lock

" =================================================================================================
" Autocommands
" =================================================================================================

augroup vimrcEx
  autocmd!

  " disable comment continuation
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

  " better syntax highlighting for eslintrc and babelrc
  autocmd BufNewFile,BufRead *eslintrc,*babelrc,*tern-project,*htmlhintrc setlocal syntax=json

  " only show a cursorline in the active window
  autocmd WinLeave * set nocursorline
  autocmd WinEnter * set cursorline
  autocmd InsertEnter * set nocursorline
  autocmd InsertLeave * set cursorline
augroup END

" Close preview window
augroup vimrc
  if exists('##CompleteDone')
    au CompleteDone * pclose
  else
    au InsertLeave * if !pumvisible() && (!exists('*getcmdwintype') || empty(getcmdwintype())) | pclose | endif
  endif
augroup end
