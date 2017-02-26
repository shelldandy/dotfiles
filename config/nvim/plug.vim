"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

" Colors
Plug 'othree/yajs.vim'                                              " Syntax Highlight for Vim
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'ap/vim-css-color'                                             " Colors in my Sass
Plug 'ryanoasis/vim-devicons'                                       " Vim Icons
Plug 'sheerun/vim-polyglot'                                         " Syntax Highlight and Snippets for tons of languages
Plug 'fleischie/vim-styled-components'                              " Vim Styled Components
Plug 'mike3run/vim-monokai'                                         " My Fork of Monokai Theme

" General/Movement
Plug '1995eaton/vim-better-javascript-completion'                   " Extending OmniComplete for JS
Plug 'ervandew/supertab'                                            " Tab autocomplete
Plug 'SirVer/ultisnips'                                             " Ultimate Snippets
Plug 'honza/vim-snippets'
Plug 'rstacruz/vim-hyperstyle'
Plug 'scrooloose/nerdtree'                                          " NerdTree
Plug 'ctrlpvim/ctrlp.vim'                                           " Ctrl P Fuzzy Finder
Plug 'jiangmiao/auto-pairs'                                         " Auto close brackets smartly
Plug 'airblade/vim-gitgutter'                                       " Git Situation on my Lines like Atom
Plug 'tpope/vim-fugitive'                                           " Vim Fugitive Awesome git shortcuts on vim
Plug 'brooth/far.vim'                                               " Search and replace
Plug 'sjbach/lusty', { 'do': 'gem install neovim' }                 " Keyboard based file explorer
Plug 'mileszs/ack.vim', { 'do': 'brew install ack' }                " Ack Search Files on disk

" Linters
Plug 'vim-syntastic/syntastic', { 'do': 'npm install -g standard babel-eslint eslint' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }       " Deoplete AutoComplete
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': ['javascript', 'javascript.jsx'] } " Deoplete Ternjs for Smart JS
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' ,'for': ['javascript', 'javascript.jsx'] }
Plug 'heavenshell/vim-jsdoc'

" Life Quality Stuff
Plug 'alvan/vim-closetag'                                           " Autoclose html tags
Plug 'vim-airline/vim-airline'                                      " Vim Airline
Plug 'vim-airline/vim-airline-themes'                               " Airline Themes
Plug 'scrooloose/nerdcommenter'                                     " Nerd Commenter
Plug 'Yggdroot/indentLine'                                          " Show Indent lines
Plug 'myusuf3/numbers.vim'                                          " Numbers craze
Plug 'tpope/vim-surround'                                           " Quickly change parens quotes, etc
Plug 'reedes/vim-pencil'                                            " Pencil / Write Mode
Plug 'vim-scripts/BufOnly.vim'                                      " Clear buffers
Plug 'vim-scripts/loremipsum'                                       " Lorem Ipsum Generator
Plug 'rizzatti/dash.vim'                                            " Dash Documentation
Plug 'krisajenkins/vim-projectlocal'                                " Per Project Vim Files
Plug 'editorconfig/editorconfig-vim', { 'do': 'brew install editorconfig' }
Plug 'vim-scripts/TwitVim'                                          " Twitter inside vim lol
call plug#end()
