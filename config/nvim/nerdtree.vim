" NERDTree File highlighting
if has_key(g:plugs, 'nerdtree')
  function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction
  " Ignore annoying files
  let NERDTreeIgnore=['\.pyc$', '\.DS_Store$', 'tmp$[[dir]]', '\~$']
endif

if has_key(g:plugs, 'vim-devicons')
  " If you need to add an unicode first use like this: "\uE275"
  " then copy and paste the resulting one
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sass'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['svg'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['liquid'] = ''
  if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
  endif

endif

if has_key(g:plugs, 'vim-nerdtree-syntax-highlight')
  let s:brown = "905532"
  let s:aqua =  "3AFFDB"
  let s:blue = "689FB6"
  let s:darkBlue = "44788E"
  let s:purple = "834F79"
  let s:lightPurple = "834F79"
  let s:red = "AE403F"
  let s:beige = "F5C06F"
  let s:yellow = "F09F17"
  let s:orange = "D4843E"
  let s:darkOrange = "F16529"
  let s:pink = "CB6F6F"
  let s:salmon = "EE6E73"
  let s:green = "8FAA54"
  let s:lightGreen = "31B53E"
  let s:white = "FFFFFF"
  let s:rspec_red = 'FE405F'
  let s:git_orange = 'F54D27'

  let g:NERDTreeExtensionHighlightColor = {}
  let g:NERDTreeExtensionHighlightColor['svg'] = s:blue
  let g:NERDTreeExtensionHighlightColor['png'] = s:blue
  let g:NERDTreeExtensionHighlightColor['gif'] = s:blue
  let g:NERDTreeExtensionHighlightColor['jpg'] = s:blue
  let g:NERDTreeExtensionHighlightColor['liquid'] = s:blue

  " Show hidden files
  let NERDTreeShowHidden=1
endif
