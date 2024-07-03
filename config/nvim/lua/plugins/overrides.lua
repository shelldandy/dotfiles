return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>.",
        LazyVim.pick("auto", { root = false }),
        desc = "Find Files",
      },
    },
  },
  {
    "nvim-neotest/neotest",
    keys = {
      {
        "<leader>td",
        function()
          require("neotest").run.run({ strategy = "dap" })
        end,
        desc = "Debug Nearest",
      },
    },
  },
} -- Why TF they use file dir all the time?
