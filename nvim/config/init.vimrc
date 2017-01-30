""""""""""""""""""""""""""""""""""
"           Vim Plug		 "
""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

""""""""""""""""""""""""""""""""""
"      Colors and Theme          "
""""""""""""""""""""""""""""""""""
" Syntax Highlight for Vim
Plug 'othree/yajs.vim'
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
" Colors in my Sass
Plug 'ap/vim-css-color'
" Oceanic Next
Plug 'mhartington/oceanic-next'
" Vim Icons
Plug 'ryanoasis/vim-devicons'
" Syntax Highlight and Snippets for tons of languages
Plug 'sheerun/vim-polyglot'
" iaWriter Theme
Plug 'reedes/vim-colors-pencil'
" Vim Styled Components
Plug 'fleischie/vim-styled-components'
" Vim ONE Syntax like Atom
Plug 'rakr/vim-one'
""""""""""""""""""""""""""""""""""
"      General/Movement
""""""""""""""""""""""""""""""""""
"Deoplete AutoComplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Extending OmniComplete for JS
Plug '1995eaton/vim-better-javascript-completion'
" Deoplete Ternjs for Smart JS
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': ['javascript', 'javascript.jsx'] }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' ,'for': ['javascript', 'javascript.jsx'] }
" Tab autocomplete
Plug 'ervandew/supertab'
" Ultimate Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'rstacruz/vim-hyperstyle'
Plug 'greg-js/vim-react-es6-snippets'
" NerdTree
Plug 'scrooloose/nerdtree'
" Ctrl P Fuzzy Finder
Plug 'ctrlpvim/ctrlp.vim'
" Auto close brackets smartly
Plug 'jiangmiao/auto-pairs'
" Git Situation on my Lines like Atom
Plug 'airblade/vim-gitgutter'
" Vim Fugitive
Plug 'tpope/vim-fugitive'
" Search and replace
Plug 'brooth/far.vim'
" Keyboard based file explorer
Plug 'sjbach/lusty', { 'do': 'gem install neovim' }
"Ack Search Files on disk
Plug 'mileszs/ack.vim', { 'do': 'brew install ack' }

""""""""""""""""""""""""""""""""""
"      Linters/Standards
""""""""""""""""""""""""""""""""""
" Syntax checking hacks for vim (the do thing is for linting React)
Plug 'vim-syntastic/syntastic', { 'do': 'npm install -g standard babel-eslint eslint' }
" JSDoc
Plug 'heavenshell/vim-jsdoc'
""""""""""""""""""""""""""""""""""
"      Debugging
""""""""""""""""""""""""""""""""""
Plug 'joonty/vdebug' " Multi-language DBGP debugger client for Vim (PHP, Python, Perl, Ruby, etc.)

""""""""""""""""""""""""""""""""""
"      Misc/LifeQuality
""""""""""""""""""""""""""""""""""
" Autoclose html tags
Plug 'alvan/vim-closetag'
" Vim Airline
Plug 'vim-airline/vim-airline'
" Nerd Commenter
Plug 'scrooloose/nerdcommenter'
" Indent lines
Plug 'Yggdroot/indentLine'
" Numbers craze
Plug 'myusuf3/numbers.vim'
" Surround
Plug 'tpope/vim-surround'
" Pencil / Write Mode
Plug 'reedes/vim-pencil'
" BufOnly - Clear buffers
Plug 'vim-scripts/BufOnly.vim'
" Lorem Ipsum Generator
Plug 'vim-scripts/loremipsum'
" Dash Documentation
Plug 'rizzatti/dash.vim'
call plug#end()
