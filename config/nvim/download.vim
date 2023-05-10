"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'rktjmp/lush.nvim'
Plug 'npxbr/gruvbox.nvim'
Plug 'reedes/vim-colors-pencil'                                     " iA Writer mode

" Syntax Highlights
let g:polyglot_disabled = ['markdown']
Plug 'sheerun/vim-polyglot'                                         " Syntax Highlight and Snippets for tons of languages
Plug 'ap/vim-css-color'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'shelldandy/shopify.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'Quramy/vim-js-pretty-template'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'
Plug 'styled-components/vim-styled-components', {
  \   'branch': 'main'
  \   }

Plug 'othree/csscomplete.vim'
Plug 'Fymyte/rasi.vim'

" Javascript
" JS Tools
Plug 'SirVer/ultisnips'                                             " Ultimate Snippets
Plug 'honza/vim-snippets'
" Wanna be autocomplete-paths
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}
Plug 'rhysd/vim-fixjson'                                            " Autofix json

" General/Movement
Plug 'f-person/git-blame.nvim'                                      " Show blame next to the line we're at
Plug 'kyazdani42/nvim-tree.lua'
Plug 'hoob3rt/lualine.nvim'
Plug 'jiangmiao/auto-pairs'                                         " Auto close brackets smartly
Plug 'airblade/vim-gitgutter'                                       " Git Situation on my Lines like Atom
Plug 'tpope/vim-fugitive'                                           " Vim Fugitive Awesome git shortcuts on vim
Plug 'gregsexton/gitv', {'on': ['Gitv']}                            " Vim Fugitive Git Log Extension
Plug 'brooth/far.vim'                                               " Search and replace
Plug 'wesQ3/vim-windowswap'                                         " Quickly swap panes <Leader>ww
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'                                           " IDE-like buffer tabs and navigation
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

" Vim Telescope (Fuzzy finder)
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Linters
Plug 'w0rp/ale'

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Others
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'alvan/vim-closetag'                                           " Autoclose html tags
Plug 'scrooloose/nerdcommenter'                                     " Nerd Commenter
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-ragtag'                                             " Endings for html/xml
Plug 'tpope/vim-surround'                                           " Quickly change parens quotes, etc
Plug 'reedes/vim-pencil'                                            " Pencil / Write Mode
Plug 'vim-scripts/BufOnly.vim'                                      " Clear buffers
Plug 'vim-scripts/loremipsum'                                       " Lorem Ipsum Generator
Plug 'krisajenkins/vim-projectlocal'                                " Per Project Vim Files
Plug 'embear/vim-localvimrc'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/goyo.vim'                                            " Focus mode like iA Writer
Plug 'junegunn/limelight.vim'                                       " Limelight
Plug 'amix/vim-zenroom2'
Plug 'vimlab/split-term.vim'                                        " Fun with inner terminals
Plug 'iamcco/markdown-preview.nvim', {
  \   'do': 'cd app & yarn install'
  \   }
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-sleuth'                                             " Detect indent style
Plug 'eandrju/cellular-automaton.nvim'                              " Fun screensaver kind of plugin

" Spellcheck powers
Plug 'reedes/vim-lexical'
Plug 'arecarn/vim-spell-utils'
call plug#end()
