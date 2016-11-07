" Make copy/paste great again
set clipboard=unnamed

" enter the current millenium
set nocompatible 

" Hidden Buffer files
set hidden

""""""""""""""""""""""""""""""""""
"           VUNDLE               "
""""""""""""""""""""""""""""""""""
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Ultimate Snippets
" Track the engine.
Plugin 'SirVer/ultisnips' "required

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'rstacruz/vim-hyperstyle'
" Ctrl P Fuzzy Finder
Plugin 'ctrlpvim/ctrlp.vim'
" NerdTree
Plugin 'scrooloose/nerdtree'
" Nerdtree with git situation
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Auto close brackets smartly
Plugin 'jiangmiao/auto-pairs'
" Colors in my Sass
Plugin 'ap/vim-css-color'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""
"       END VUNDLE PLUGINS       "
""""""""""""""""""""""""""""""""""

" Colors
syntax on

" Numbers on rows
" set number

" Tabs situation
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
   exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction

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
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|node_modules)$'

" MISC PLUGINS:
" VIM Hyperstyle FOR SASS CSS STYLUS:
" Uncomment this if using Sass or Stylus
let g:hyperstyle_use_colon=0

" ULTISNIPS PLUGIN:
" Trigger configuration. Do not use <tab> if you use - https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
