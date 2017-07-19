" Remap ESC to something usable
:imap jj <Esc>
" Set our Leader Key to something usable
let mapleader=","

nnoremap <Leader>w :w<CR>
nnoremap <Leader>wq :wq<CR>

" relative line numbers
nnoremap <Leader>0 :NumbersToggle<CR>

" jsdoc
nnoremap <Leader>d :JsDoc<CR>

" Easier Split Navigation
" Instead of doing CTRL-W + (h|j|k|l)
" Just do CTRL-(h|j|k|l)
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>
" Neovim fix to get CTRL-H Back 💁
if has('nvim')
  nmap <bs> <c-w>h
endif

" window keys
nnoremap <Leader>w< <C-w><
nnoremap <Leader>w> <C-w>>
nnoremap <Leader>w- <C-w>-
nnoremap <Leader>w+ <C-w>+
nnoremap <Leader>ws :split<CR>
nnoremap <Leader>wv :vsplit<CR>
nnoremap <Leader>wx :close<CR>

" window reordering
nnoremap <Leader>wr <C-W><C-R>

" NerdTree
nnoremap <Leader>n :NERDTreeToggle<CR>

if has_key(g:plugs, 'ctrlp.vim')
  " CtrlP
  nnoremap <Leader>FF :CtrlPClearCache<bar>CtrlP<CR>
  nnoremap <Leader>ff :CtrlP<CR>
endif

" FZF
if has_key(g:plugs, 'fzf.vim')
  nnoremap <Leader>p :Files<CR>
  nnoremap <Leader>f :Ag<CR>
endif

" Tab Switching
nnoremap <Leader>t :tabn<CR>
nnoremap <Leader>r :tabp<CR>

" Disabling the directional keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Debugger situation
" Toggle a breakpoint
nnoremap <Leader>db :Breakpoint<CR>

" Clear Buffer Quickly
nnoremap <Leader>bc :BufOnly<CR>
" Buffer Switching
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bv :bprevious<CR>

" Git Controls Flow
nnoremap <Leader>gaa :Git add .<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gs :Gstatus<CR>

" Dash docs
nmap <Leader>fd :Dash<CR>

" adjust window size with arrow keys
noremap <right> <C-w>5>
noremap <left> <C-w>5<
noremap <up> <C-w>5+
noremap <down> <C-w>5-

" keep selection after indent
vnoremap < <gv
vnoremap > >gv

" make moving to beginning and end of lines easier
noremap H ^
noremap L $

" press enter for newline without insert
nnoremap <cr> o<esc>

" reload vim config
function HardReload()
  source $MYVIMRC
  AirlineRefresh
  mode
endfunction
com -nargs=0 HardReload call HardReload()
nnoremap <Leader>r :silent! HardReload<CR>

" clear search
nnoremap <leader>c :let @/ = ""<CR>

if has_key(g:plugs, 'deoplete-ternjs')
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
endif

" React Magic HTML Format
function ReactFormatMagic()
  %s/src='img/src='\/static\/img/g
  %s/class=/className=/g
  %s/xlink\:href/xlinkHref/g
  %s/background="../background="\/static/g
  %s/background='../background='\/static/g
endfunction
com -nargs=0 ReactFormatMagic call ReactFormatMagic()
nnoremap <Leader>m :silent! ReactFormatMagic<CR>

" Auto fix javascript with StandardJS
function FixJavascript()
  write
  silent !standard --fix %
  if has_key(g:plugs, 'ale')
    ALELint
  endif
endfunction
com -nargs=0 FixJavascript call FixJavascript()
nnoremap <Leader>js :silent! FixJavascript<CR>

if has_key(g:plugs, 'ale')
  nnoremap <Leader>at :ALEToggle<Cr>
  nnoremap <Leader>an :ALENext<Cr>
  nnoremap <Leader>ap :ALEPrevious<Cr>
endif

if has_key(g:plugs, 'goyo.vim')
  nnoremap <Leader>gg :Goyo<CR>
endif

nmap <leader>hi :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
