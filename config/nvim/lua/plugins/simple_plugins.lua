return {
  -- Show git blame in the current line
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
  },
  -- Prisma DB syntax highlighting and LSP
  {
    "prisma/vim-prisma",
    event = "VeryLazy",
  },
  -- Required for testing
  {
    "nvim-neotest/nvim-nio",
    event = "VeryLazy",
  },
  {
    "ruifm/gitlinker.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      mappings = "<leader>gy",
    },
  },
}
