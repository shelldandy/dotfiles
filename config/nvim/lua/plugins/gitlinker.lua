return {
  -- So you can select some code and get the github link
  -- to share easily with your team
  {
    "ruifm/gitlinker.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      mappings = "<leader>gy",
    },
  },
}
