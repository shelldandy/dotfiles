" Remap ESC to something usable
:imap jj <Esc>
" Save right from insert mode
:imap ,w <Esc>:w<CR>
" Set our Leader Key to something usable
let mapleader=","

nnoremap <Leader>w :w<CR>
nnoremap <Leader>wq :wq<CR>

" Quickly re-open a buffer for syntax reasons like styled-components
nnoremap <Leader>e :filetype detect<CR>

" jsdoc
nnoremap <Leader>d :JsDoc<CR>

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

" Quickly wrap or unwrap text
nnoremap <Leader>W :set wrap!<CR>

" FZF
if HasPlug('telescope.nvim')
  nnoremap <Leader>pp             <cmd>Telescope git_files<cr>
  nnoremap <Leader>ff             <cmd>Telescope live_grep<cr>
  nnoremap <Leader>rg             <cmd>Telescope grep_string<cr>
  nnoremap <Leader>hh             <cmd>Telescope help_tags<cr>
  nnoremap <Leader>ag             <cmd>Telescope grep_string<cr>
  nnoremap <Leader>bb             <cmd>Telescope buffers<cr>
  nnoremap <silent> <Leader>`     <cmd>Telescope marks<cr>
endif

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
nnoremap <Leader>bc :BufferCloseAllButCurrent<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap <leader>bq :bp <BAR> bd #<CR>

" Git Controls Flow
if HasPlug('vim-fugitive')
  nnoremap <Leader>gaa :Git add .<CR>
  nnoremap <Leader>gat :Git add %<CR>
  nnoremap <Leader>gc :Git commit<CR>
  nnoremap <Leader>gp :Git push<CR>
  nnoremap <Leader>gs :Git status<CR>
  nnoremap <Leader>gb :Git blame<CR>
  nnoremap <Leader>gd :Git diff<CR>
  nnoremap <Leader>gvd :vdiff<CR>
  nnoremap <Leader>gw :Gwrite<CR>
endif

" " adjust window size with arrow keys
noremap <right> <C-w>5>
noremap <left> <C-w>5<
noremap <up> <C-w>5+
noremap <down> <C-w>5-

" keep selection after indent
vnoremap < <gv
vnoremap > >gv

" press enter for newline without insert
nnoremap <cr> o<esc>

" reload vim config
com HardReload call HardReload()
nnoremap <Leader>r :silent! HardReload<CR>

" clear search
nnoremap <leader>c :let @/ = ""<CR>

if HasPlug('ale')
  nnoremap <Leader>at :ALEToggle<Cr>
  nnoremap <Leader>an :ALENext<Cr>
  nnoremap <Leader>ap :ALEPrevious<Cr>
  nnoremap <Leader>af :ALEFix<CR>
endif

if HasPlug('goyo.vim')
  nnoremap <Leader>gg :Goyo<CR>
endif

nmap <leader>hi :call <SID>SynStack()<CR>

if HasPlug('emmet-vim')
  let g:user_emmet_leader_key='<C-M>'
  nnoremap <Leader>em :call emmet#expandAbbr(0, "")<CR>
  :imap ,e <C-M>,
endif
nnoremap <Leader><Tab> :call TabToggle()<CR>
nnoremap <Leader>wm :call WriteMode()<CR>
nnoremap <Leader>tb :call BackgroundToggle()<CR>
nnoremap <Leader>pt :PencilToggle <CR>

" Focus mode (like iaWriter)
nnoremap <Leader>ll :Limelight!!<CR>
nnoremap <Leader>fm :Limelight!!<CR>

" Navigate between same lines
nnoremap j gj
nnoremap k gk

" make moving to beginning and end of lines easier
noremap H g^
noremap L g$

" Spellcheck lang
nnoremap <Leader>es :setlocal spell spelllang=es_mx<cr>
nnoremap <Leader>en :setlocal spell spelllang=en_en<cr>

" relative line numbers
nnoremap <Leader>0 :call NumbersToggle()<CR>

" Search with // visually selected text
vnoremap // y/<C-R>"<CR>

if HasPlug('split-term.vim')
  nnoremap <Leader>t :Term<CR>
  nnoremap <Leader>vt :VTerm<CR>
  nnoremap <Leader>t- :Term<CR>
  nnoremap <Leader>t\| :VTerm<CR>
  nnoremap <Leader>tt :TTerm<CR>
endif

if HasPlug('barbar.nvim')
  " Move to previous/next
  nnoremap <silent>    <A-,> :BufferPrevious<CR>
  nnoremap <silent>    <A-left> :BufferPrevious<CR>
  nnoremap <silent>    <A-j> :BufferPrevious<CR>
  nnoremap <silent>    <A-h> :BufferPrevious<CR>

  nnoremap <silent>    <A-.> :BufferNext<CR>
  nnoremap <silent>    <A-right> :BufferNext<CR>
  nnoremap <silent>    <A-k> :BufferNext<CR>
  nnoremap <silent>    <A-l> :BufferNext<CR>
  " Re-order to previous/next
  nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
  nnoremap <silent>    <A->> :BufferMoveNext<CR>
  " Goto buffer in position...
  nnoremap <silent>    <A-1> :BufferGoto 1<CR>
  nnoremap <silent>    <A-2> :BufferGoto 2<CR>
  nnoremap <silent>    <A-3> :BufferGoto 3<CR>
  nnoremap <silent>    <A-4> :BufferGoto 4<CR>
  nnoremap <silent>    <A-5> :BufferGoto 5<CR>
  nnoremap <silent>    <A-6> :BufferGoto 6<CR>
  nnoremap <silent>    <A-7> :BufferGoto 7<CR>
  nnoremap <silent>    <A-8> :BufferGoto 8<CR>
  nnoremap <silent>    <A-9> :BufferLast<CR>
  " Close buffer
  nnoremap <silent>    <A-c> :BufferClose<CR>
  nnoremap <silent>    <A-w> :BufferClose<CR>
  " Wipeout buffer
  "                          :BufferWipeout<CR>
  " Close commands
  "                          :BufferCloseAllButCurrent<CR>
  "                          :BufferCloseBuffersLeft<CR>
  "                          :BufferCloseBuffersRight<CR>
  " Magic buffer-picking mode
  nnoremap <silent> <C-s>    :BufferPick<CR>
  " Sort automatically by...
  nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
  nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
endif

" NerdTree
if HasPlug('nvim-tree.lua')
  nnoremap <Leader>n :NvimTreeToggle<CR>
  nnoremap <Leader>N :NvimTreeFindFile<CR>
endif

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

if HasPlug('nvim-compe')
  inoremap <silent><expr> <C-Space> compe#complete()
  inoremap <silent><expr> <CR>      compe#confirm('<CR>')
  inoremap <silent><expr> <C-e>     compe#close('<C-e>')
  inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
  inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
endif
