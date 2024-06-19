return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>.",
        LazyVim.pick("files", { root = false }),
        desc = "Find Files",
      },
    },
  },
} -- Why TF they use file dir all the time?
