return {
  {
    "olimorris/codecompanion.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>cc", "<cmd>CodeCompanionChat<cr>", desc = "Open CodeCompanion Chat" },
      { "<leader>ca", "<cmd>CodeCompanionActions<cr>", desc = "Open CodeCompanion Actions" },
      { "<leader>ct", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle CodeCompanion Chat" },
      { "<leader>cx", "<cmd>CodeCompanionChat Add<cr>", mode = { "n", "v" }, desc = "Add selection to chat" },
    },
    opts = {
      strategies = {
        chat = {
          adapter = function()
            return require("codecompanion.adapters").extend("anthropic", {
              env = {
                api_key = "cmd:gpg --batch --quiet --decrypt ~/.claude.gpg 2>/dev/null || echo 'GPG_DECRYPT_FAILED'",
              },
            })
          end,
        },
        inline = {
          adapter = function()
            return require("codecompanion.adapters").extend("anthropic", {
              env = {
                api_key = "cmd:gpg --batch --quiet --decrypt ~/.claude.gpg 2>/dev/null || echo 'GPG_DECRYPT_FAILED'",
              },
            })
          end,
        },
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
        },
      },
      opts = {
        system_prompt = "You are an AI programming assistant. Be concise and helpful.",
        log_level = "INFO",
      },
    },
    config = function(_, opts)
      require("codecompanion").setup(opts)

      -- Additional keymaps that might be useful
      vim.keymap.set("v", "<leader>ce", "<cmd>CodeCompanionChat Explain<cr>", { desc = "Explain code" })
      vim.keymap.set("v", "<leader>cf", "<cmd>CodeCompanionChat Fix<cr>", { desc = "Fix code" })
      vim.keymap.set("n", "<leader>cq", "<cmd>CodeCompanionChat<cr>", { desc = "Quick chat" })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp", -- Optional: for better completion
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
