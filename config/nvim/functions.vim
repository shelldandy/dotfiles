" Switch between tabs and spaces
function TabToggle()
  if &expandtab
    set noexpandtab
  else
    set expandtab
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
