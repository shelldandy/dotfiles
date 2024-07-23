require("config.lazy")

if vim.fn.filereadable(".vscode/launch.json") then
  require("dap.ext.vscode").load_launchjs(nil, {})
end

-- Extends dap.configurations with entries read from .vscode/launch.json
-- Remove when this PR is merged
-- https://github.com/LazyVim/LazyVim/pull/4106
local vscode = require("dap.ext.vscode")
if vim.fn.filereadable(".vscode/launch.json") then
  vscode.load_launchjs(nil, {})
end
