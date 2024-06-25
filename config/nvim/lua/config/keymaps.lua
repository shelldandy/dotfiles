local keymap = vim.keymap
-- press jj to escape quickly
keymap.set("i", "jj", "<esc>")

-- adjust split sizes with arrow keys
keymap.set("n", "<right>", "<c-w>5>", { silent = true })
keymap.set("n", "<left>", "<c-w>5<", { silent = true })
keymap.set("n", "<up>", "<c-w>5+", { silent = true })
keymap.set("n", "<down>", "<c-w>5-", { silent = true })
