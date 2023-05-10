" Switch between tabs and spaces
function TabToggle()
  if &expandtab
    set noexpandtab
  else
    set expandtab
  endif
endfunction
command TabToggle call TabToggle()

" Switch between tabs and spaces
function BackgroundToggle()
  if &background == 'light'
    set background=dark
  else
    set background=light
  endif
endfunction
command BackgroundToggle call BackgroundToggle()

" Show which syntax highlight is being applied to the current word
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

function HardReload()
  source $MYVIMRC
  mode
endfunction

function WriteMode()
  if &wrap
    set nowrap nolinebreak
  else
    set wrap linebreak
  endif
endfunction
command WriteMode call WriteMode()

function NumbersToggle()
  if &relativenumber
    set norelativenumber
  else
    set relativenumber
  endif
endfunction

function HasPlug(plugin)
  return has_key(g:plugs, a:plugin)
endfunction

" Pane navigation like a bawse
" https://breuer.dev/blog/top-neovim-plugins
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction
