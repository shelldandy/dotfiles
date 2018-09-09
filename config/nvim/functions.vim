" Switch between tabs and spaces
function TabToggle()
  if &expandtab
    set noexpandtab
  else
    set expandtab
  endif
endfunction

" Switch between tabs and spaces
function BackgroundToggle()
  if &background == 'light'
    set background=dark
  else
    set background=light
  endif
endfunction

" Show which syntax highlight is being applied to the current word
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

function HardReload()
  mode
endfunction

function WriteMode()
  if &wrap
    set textwidth=0
    set nowrap nolinebreak list
  else
    set textwidth=79
    set wrap linebreak nolist
  endif
endfunction
