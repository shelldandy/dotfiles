return {
  -- Show git blame in the current line
  { "f-person/git-blame.nvim" },
  -- Prisma DB syntax highlighting and LSP
  { "prisma/vim-prisma" },
  -- Required for testing
  { "nvim-neotest/nvim-nio" },
  {
    "ruifm/gitlinker.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      mappings = "<leader>gy",
    },
  },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup()
    end,
  },
}
