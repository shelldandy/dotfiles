return {
  {
    "olimorris/codecompanion.nvim",
    opts = {
      strategies = {
        -- Change the default chat adapter
        chat = {
          adapter = function()
            return require("codecompanion.adapters").extend("anthropic", {
              env = {
                api_key = "cmd:gpg --batch --quiet --decrypt ~/.claude.gpg",
              },
            })
          end,
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
  },
}
