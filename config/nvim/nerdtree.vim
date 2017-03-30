" NERDTree File highlighting
if has_key(g:plugs, 'nerdtree')
  function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction

  call NERDTreeHighlightFile('pug', 'green', 'none', 'green', '#1c2b34')
  call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#1c2b34')
  call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#1c2b34')
  call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#1c2b34')
  call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#1c2b34')
  call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#1c2b34')
  call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#1c2b34')
  call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#1c2b34')
  call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#1c2b34')
  call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#1c2b34')
  call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#1c2b34')
  call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#1c2b34')
  call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#1c2b34')
  call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#1c2b34')

endif
