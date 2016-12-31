""""""""""""""""""""""""""""""""""
"           Vim Plug		 "
""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
"Deoplete AutoComplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Deoplete Ternjs for Smart JS
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': ['javascript', 'javascript.jsx'] }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' ,'for': ['javascript', 'javascript.jsx'] }
" Syntax Highlight for Vim
Plug 'othree/yajs.vim'
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
" Tab autocomplete
Plug 'ervandew/supertab'
" Ultimate Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'rstacruz/vim-hyperstyle'
Plug 'greg-js/vim-react-es6-snippets'
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
" Syntastic for StandardJS
Plug 'vim-syntastic/syntastic', { 'do': 'npm install -g standard babel-eslint' }
" Extending OmniComplete for JS on Vim
Plug '1995eaton/vim-better-javascript-completion'
" Syntax Highlight and Snippets for tons of languages
Plug 'sheerun/vim-polyglot'
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
" Numbers craze
Plug 'myusuf3/numbers.vim'
" JSDoc
Plug 'heavenshell/vim-jsdoc'
" Vim Fugitive
Plug 'tpope/vim-fugitive'
" Search and replace
Plug 'brooth/far.vim'
" Vim Icons
Plug 'ryanoasis/vim-devicons'
" Vim For Humans Wisdom
Plug 'sjbach/lusty', { 'do': 'gem install neovim' }
"Ack Search Files on disk
Plug 'mileszs/ack.vim', { 'do': 'brew install ack' }

" Advanced Plugins (Vim for Humans)
" Surround
Plug 'tpope/vim-surround'
call plug#end()
