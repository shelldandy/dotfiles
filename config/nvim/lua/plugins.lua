-- Vim autoclose
vim.g.closetag_filetypes = 'html,js,typescriptreact'
vim.g.closetag_emptyTags_caseSensitive = 1
vim.g.closetag_regions = {
  ['typescript.tsx'] = 'jsxRegion,tsxRegion',
  ['javascript.jsx'] = 'jsxRegion',
}
