local set = vim.keymap.set
-- press jj to escape quickly
set("i", "jj", "<esc>", { noremap = true, silent = true, desc = "Quickly escape" })

-- adjust split sizes with arrow keys
set("n", "<right>", "<c-w>5>", { silent = true, desc = "Increase window width" })
set("n", "<left>", "<c-w>5<", { silent = true, desc = "Decrease window width" })
set("n", "<up>", "<c-w>5+", { silent = true, desc = "Increase window height" })
set("n", "<down>", "<c-w>5-", { silent = true, desc = "Decrease window height" })

-- toggle floating terminal with claude
set("n", "<C-;>", function()
  Snacks.terminal("claude", { cwd = vim.fn.getcwd() })
end, { desc = "Toggle Claude terminal" })

-- toggle out of terminal mode with ctrl+q in terminal
set("t", "<C-;>", function()
  vim.cmd("stopinsert")
  vim.cmd("close")
end, { desc = "Close terminal and return to previous buffer" })
