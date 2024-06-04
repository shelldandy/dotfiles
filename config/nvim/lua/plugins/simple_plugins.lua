return {
  -- Show git blame in the current line
  {
    "f-person/git-blame.nvim",
  },
  {
    "preservim/nerdcommenter",
  },
  {
    "tpope/vim-surround",
  },
  {
    "prisma/vim-prisma",
  },
  -- Required for testing
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "ruifm/gitlinker.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      mappings = "<leader>gy",
    },
  },
}
