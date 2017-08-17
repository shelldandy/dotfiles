"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'mhartington/oceanic-next'                                     " Oceanic Next
Plug 'morhetz/gruvbox'                                              " Gruvbox
Plug 'whatyouhide/vim-gotham'
Plug 'sonph/onehalf', { 'rtp': 'vim/' }

" Syntax Highlights
Plug 'sheerun/vim-polyglot'                                         " Syntax Highlight and Snippets for tons of languages
Plug 'fleischie/vim-styled-components'                              " Vim Styled Components
Plug 'gko/vim-coloresque'                                           " Colors in my Sass
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'shmargum/vim-sass-colors'
Plug 'mike3run/kwm.vim'

" Deoplete
Plug 'Shougo/deoplete.nvim', {
  \   'do': ':UpdateRemotePlugins'
  \   }
Plug 'fszymanski/deoplete-emoji'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'
Plug 'othree/csscomplete.vim'

" Javascript
Plug 'SirVer/ultisnips'                                             " Ultimate Snippets
Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', {
  \   'do': 'npm install --no-package-lock',
  \   'for': ['Javascript', 'javascript.jsx']
  \   }
Plug 'carlitux/deoplete-ternjs', {
  \   'do': 'npm install -g tern',
  \   'for': ['Javascript', 'javascript.jsx']
  \   }
Plug 'othree/jspc.vim', {
  \   'for': ['javascript', 'javascript.jsx']
  \   }
Plug 'heavenshell/vim-jsdoc'

" General/Movement
Plug '1995eaton/vim-better-javascript-completion'                   " Extending OmniComplete for JS
Plug 'ervandew/supertab'                                            " Tab autocomplete
Plug 'scrooloose/nerdtree'                                          " NerdTree
Plug 'jiangmiao/auto-pairs'                                         " Auto close brackets smartly
Plug 'airblade/vim-gitgutter'                                       " Git Situation on my Lines like Atom
Plug 'tpope/vim-fugitive'                                           " Vim Fugitive Awesome git shortcuts on vim
Plug 'brooth/far.vim'                                               " Search and replace
Plug 'valloric/matchtagalways'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', {
 \    'dir': '~/.fzf',
 \    'do': './install --bin'
 \    }
Plug 'junegunn/fzf.vim'
Plug 'wesQ3/vim-windowswap'

" Linters
Plug 'w0rp/ale'
" Life Quality Stuff
Plug 'alvan/vim-closetag'                                           " Autoclose html tags
Plug 'vim-airline/vim-airline'                                      " Vim Airline
Plug 'scrooloose/nerdcommenter'                                     " Nerd Commenter
Plug 'Yggdroot/indentLine'                                          " Show Indent lines
Plug 'tpope/vim-surround'                                           " Quickly change parens quotes, etc
Plug 'reedes/vim-pencil'                                            " Pencil / Write Mode
Plug 'vim-scripts/BufOnly.vim'                                      " Clear buffers
Plug 'vim-scripts/loremipsum'                                       " Lorem Ipsum Generator
Plug 'rizzatti/dash.vim'                                            " Dash Documentation
Plug 'krisajenkins/vim-projectlocal'                                " Per Project Vim Files
Plug 'editorconfig/editorconfig-vim', {
 \    'do': 'brew install editorconfig'
 \    }
Plug 'junegunn/goyo.vim'                                            " Focus mode like iA Writer
Plug 'junegunn/limelight.vim'                                       " Limelight

Plug 'mattn/emmet-vim'

Plug 'ryanoasis/vim-devicons'                                       " Vim Icons Load LAST
call plug#end()
