local set = vim.keymap.set
-- press jj to escape quickly
set("i", "jj", "<esc>")

-- adjust split sizes with arrow keys
set("n", "<right>", "<c-w>5>", { silent = true })
set("n", "<left>", "<c-w>5<", { silent = true })
set("n", "<up>", "<c-w>5+", { silent = true })
set("n", "<down>", "<c-w>5-", { silent = true })
