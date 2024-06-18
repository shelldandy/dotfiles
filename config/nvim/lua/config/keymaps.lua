local keymap = vim.keymap
-- press jj to escape quickly
keymap.set("i", "jj", "<esc>")

-- adjust split sizes with arrow keys
keymap.set("n", "<right>", "<c-w>5>", { silent = true })
keymap.set("n", "<left>", "<c-w>5<", { silent = true })
keymap.set("n", "<up>", "<c-w>5+", { silent = true })
keymap.set("n", "<down>", "<c-w>5-", { silent = true })

keymap.set(
  "n",
  "<leader>cpt",
  require('package-info').toggle,
  { silent = true, noremap = true, desc = "Toggle" }
)
keymap.set(
  "n",
  "<leader>cpd",
  require('package-info').delete,
  { silent = true, noremap = true, desc = "Delete package" }
)
keymap.set(
  "n",
  "<leader>cpu",
  require('package-info').update,
  { silent = true, noremap = true, desc = "Update package" }
)
keymap.set(
  "n",
  "<leader>cpi",
  require('package-info').install,
  { silent = true, noremap = true, desc = "Install package" }
)
keymap.set(
  "n",
  "<leader>cpv",
  require('package-info').change_version,
  { silent = true, noremap = true, desc = "Change version" }
)
