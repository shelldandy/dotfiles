-- press jj to escape quickly
vim.keymap.set("i", "jj", "<esc>")
-- quickly save from normal mode
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { silent = true })

-- adjust split sizes with arrow keys
vim.keymap.set("n", "<right>", "<c-w>5>", { silent = true })
vim.keymap.set("n", "<left>", "<c-w>5<", { silent = true })
vim.keymap.set("n", "<up>", "<c-w>5+", { silent = true })
vim.keymap.set("n", "<down>", "<c-w>5-", { silent = true })
