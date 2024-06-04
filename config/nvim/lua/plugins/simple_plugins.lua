return {
  -- Show git blame in the current line
  {
    "f-person/git-blame.nvim",
  },
  -- Prisma DB syntax highlighting and LSP
  {
    "prisma/vim-prisma",
  },
  -- Update package.json dependencies
  {
    "vuki656/package-info.nvim",
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
