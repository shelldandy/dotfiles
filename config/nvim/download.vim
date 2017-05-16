"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

" Colors
Plug 'othree/yajs.vim'                                              " Syntax Highlight for Vim
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'sheerun/vim-polyglot'                                         " Syntax Highlight and Snippets for tons of languages
Plug 'fleischie/vim-styled-components'                              " Vim Styled Components
Plug 'mhartington/oceanic-next'                                     " Oceanic Next
Plug 'shmargum/vim-sass-colors'                                     " Colors in my Sass

" General/Movement
Plug '1995eaton/vim-better-javascript-completion'                   " Extending OmniComplete for JS
Plug 'ervandew/supertab'                                            " Tab autocomplete
Plug 'SirVer/ultisnips'                                             " Ultimate Snippets
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'                                          " NerdTree
Plug 'ctrlpvim/ctrlp.vim'                                           " Ctrl P Fuzzy Finder
Plug 'jiangmiao/auto-pairs'                                         " Auto close brackets smartly
Plug 'airblade/vim-gitgutter'                                       " Git Situation on my Lines like Atom
Plug 'tpope/vim-fugitive'                                           " Vim Fugitive Awesome git shortcuts on vim
Plug 'brooth/far.vim'                                               " Search and replace
Plug 'sjbach/lusty', { 'do': 'gem install neovim' }                 " Keyboard based file explorer
Plug 'mileszs/ack.vim', { 'do': 'brew install ack' }                " Ack Search Files on disk
Plug 'valloric/matchtagalways'
Plug 'christoomey/vim-tmux-navigator'

" Linters
Plug 'w0rp/ale',
  \   {
  \   'do': 'npm install -g standard babel-eslint eslint'
  \   }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }       " Deoplete AutoComplete
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern'}     " Deoplete Ternjs for Smart JS
Plug 'ternjs/tern_for_vim', { 'do': 'npm install'}
Plug 'heavenshell/vim-jsdoc'

" Life Quality Stuff
Plug 'alvan/vim-closetag'                                           " Autoclose html tags
Plug 'vim-airline/vim-airline'                                      " Vim Airline
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
Plug 'ryanoasis/vim-devicons'                                       " Vim Icons Load LAST
Plug 'dodie/vim-disapprove-deep-indentation'                        " ಠ_ಠ
call plug#end()
