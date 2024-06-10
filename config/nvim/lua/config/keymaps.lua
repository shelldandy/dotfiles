local keymap = vim.keymap
-- press jj to escape quickly
keymap.set("i", "jj", "<esc>")

-- adjust split sizes with arrow keys
keymap.set("n", "<right>", "<c-w>5>", { silent = true })
keymap.set("n", "<left>", "<c-w>5<", { silent = true })
keymap.set("n", "<up>", "<c-w>5+", { silent = true })
keymap.set("n", "<down>", "<c-w>5-", { silent = true })

local set_keymap = vim.api.nvim_set_keymap

set_keymap(
  "n",
  "<leader>cpt",
  "<cmd>lua require('package-info').toggle()<cr>",
  { silent = true, noremap = true, desc = "Toggle" }
)
set_keymap(
  "n",
  "<leader>cpd",
  "<cmd>lua require('package-info').delete()<cr>",
  { silent = true, noremap = true, desc = "Delete package" }
)
set_keymap(
  "n",
  "<leader>cpu",
  "<cmd>lua require('package-info').update()<cr>",
  { silent = true, noremap = true, desc = "Update package" }
)
set_keymap(
  "n",
  "<leader>cpi",
  "<cmd>lua require('package-info').install()<cr>",
  { silent = true, noremap = true, desc = "Install package" }
)
