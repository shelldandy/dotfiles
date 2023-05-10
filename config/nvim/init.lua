-- Neovim Config Files by ShellDandy
-- needs version 0.0.5 or higher
local capi = {
  vim = vim,
}
local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5

capi.vim.cmd('source ~/.config/nvim/download.vim')
capi.vim.cmd('source ~/.config/nvim/general.vim')
capi.vim.cmd('source ~/.config/nvim/functions.vim')
capi.vim.cmd('source ~/.config/nvim/coc.vim')
capi.vim.cmd('source ~/.config/nvim/plugins.vim')
capi.vim.cmd('source ~/.config/nvim/keys.vim')
capi.vim.cmd('source ~/.config/nvim/colors.vim')
capi.vim.cmd('source ~/.config/nvim/javascript.vim')

require("statusline")
require("finder")
require('nvim-tree').setup({
    filters = {
      dotfiles = false,
      custom = {
        "*.pyc"
      }
    },
    view = {
      float = {
        enable = true,
        open_win_config = function()
          local screen_w = capi.vim.opt.columns:get()
          local screen_h = capi.vim.opt.lines:get() - capi.vim.opt.cmdheight:get()
          local window_w = screen_w * WIDTH_RATIO
          local window_h = screen_h * HEIGHT_RATIO
          local window_w_int = math.floor(window_w)
          local window_h_int = math.floor(window_h)
          local center_x = (screen_w - window_w) / 2
          local center_y = ((capi.vim.opt.lines:get() - window_h) / 2)
          - capi.vim.opt.cmdheight:get()
          return {
            border = 'rounded',
            relative = 'editor',
            row = center_y,
            col = center_x,
            width = window_w_int,
            height = window_h_int,
          }
        end,
      },
      width = function()
        return math.floor(capi.vim.opt.columns:get() * WIDTH_RATIO)
      end,
    },
  })
-- TODO: Keep there whenever native LSP > coc.nvim
--require("autocomplete")
require("keys")
