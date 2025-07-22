return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        "ravitemer/mcphub.nvim",
        cmd = "MCPHub",
        build = "pnpm install -g mcp-hub@latest",
        opts = {},
        keys = {
          { "<leader>am", "<cmd>MCPHub<cr>", mode = { "n" }, desc = "MCP Hub" },
        },
      },
    },
    opts = {
      hints = { enabled = false },
      provider = "copilot", -- Recommend using Claude
      providers = {
        copilot = {
          -- model = "gpt-4o",
          model = "claude-3.7-sonnet",
          endpoint = "https://api.githubcopilot.com",
          allow_insecure = false,
          timeout = 10 * 60 * 1000,
          extra_request_body = { temperature = 0 },
          max_completion_tokens = 1000000,
          reasoning_effort = "high",
        },
      },
      web_search_engine = {
        provider = "searxng", -- tavily, serpapi, google, kagi, brave, or searxng
        proxy = nil, -- proxy support, e.g., http://127.0.0.1:7890
      },
      auto_suggestions_provider = nil,
      behaviour = {
        auto_suggestions = false,
      },

      -- File selector configuration
      file_selector = {
        provider = "snacks", -- Avoid native provider issues
        provider_opts = {},
      },
      selector = { provider = "snacks" },
      system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        return hub and hub:get_active_servers_prompt() or ""
      end,
      custom_tools = function()
        return {
          require("mcphub.extensions.avante").mcp_tool(),
        }
      end,
      extensions = {
        avante = {
          make_slash_commands = true,
        },
      },
      input = { provider = "snacks" },
    },
    build = LazyVim.is_win() and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" or "make",
  },
  {
    "Kaiser-Yang/blink-cmp-avante",
    lazy = true,
    specs = {
      {
        "saghen/blink.cmp",
        optional = true,
        opts = {
          sources = {
            default = { "avante" },
            providers = { avante = { module = "blink-cmp-avante", name = "Avante" } },
          },
        },
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    ft = function(_, ft)
      vim.list_extend(ft, { "Avante" })
    end,
    opts = function(_, opts)
      opts.file_types = vim.list_extend(opts.file_types or {}, { "Avante" })
    end,
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>a", desc = "ai" },
      },
    },
  },
}
