return {
  {
    "olimorris/codecompanion.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>ac", "", desc = "+CodeCompanion", mode = { "n", "v" } },
      {
        "<leader>acc",
        function()
          return require("codecompanion").chat()
        end,
        desc = "Open CodeCompanion Chat",
        mode = { "n", "v" },
      },
      {
        "<leader>aca",
        function()
          return require("codecompanion").actions({ provider = { name = "snacks" } })
        end,
        desc = "Open CodeCompanion Actions",
        mode = { "n", "v" },
      },
      {
        "<leader>act",
        function()
          return require("codecompanion").toggle()
        end,
        desc = "Toggle CodeCompanion Chat",
        mode = { "n", "v" },
      },
      {
        "<leader>acv",
        "<cmd>CodeCompanionChat Add<cr>",
        desc = "Toggle CodeCompanion Chat",
        mode = { "n", "v" },
      },
    },
    opts = {
      adapters = {
        anthropic = function()
          return require("codecompanion.adapters").extend("anthropic", {
            env = {
              api_key = "cmd:gpg --batch --quiet --decrypt ~/.claude.gpg 2>/dev/null || echo 'GPG_DECRYPT_FAILED'",
            },
          })
        end,
      },
      display = {
        action_palette = {
          width = 95,
          height = 10,
        },
        chat = {
          window = {
            layout = "vertical", -- vertical|horizontal|float
            width = 0.45,
            height = 0.8,
          },
          show_settings = true,
          diff = {
            enabled = true,
            close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
            layout = "vertical", -- vertical|horizontal split for default provider
            opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
            provider = "mini_diff", -- default|mini_diff
          },
        },
      },
      opts = {
        system_prompt = "You are an AI programming assistant. Be concise and helpful.",
        log_level = "DEBUG",
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
    opts = {
      file_types = { "markdown", "codecompanion" },
    },
  },
  {
    "HakonHarnes/img-clip.nvim",
    opts = {
      filetypes = {
        codecompanion = {
          prompt_for_file_name = false,
          template = "[Image]($FILE_PATH)",
          use_absolute_path = true,
        },
      },
    },
  },
}
