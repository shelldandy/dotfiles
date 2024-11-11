return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "haydenmeade/neotest-jest",
      "marilari88/neotest-vitest",
      "thenbe/neotest-playwright",
      dependencies = "nvim-telescope/telescope.nvim",
    },
    keys = {
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run Last Test",
      },
      {
        "<leader>tL",
        function()
          require("neotest").run.run_last({ strategy = "dap" })
        end,
        desc = "Debug Last Test",
      },
      {
        "<leader>tw",
        "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
        desc = "Run Watch",
      },
      -- Fixed keybinding to use : syntax
      {
        "<leader>ts",
        function()
          local switcher = require("neotest.switcher")
          switcher:switch_runner()
        end,
        desc = "Switch Test Runner",
      },
    },
    config = function(_, opts)
      local switcher = {
        current = "jest",

        adapters = {
          jest = require("neotest-jest")({
            jestCommand = "npm test --",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function()
              return vim.fn.getcwd()
            end,
          }),
          vitest = require("neotest-vitest"),
          playwright = require("neotest-playwright").adapter({
            options = {
              persist_project_selection = true,
              enable_dynamic_test_discovery = true,
            },
          }),
        },
      }

      function switcher:get_current_adapter()
        return self.adapters[self.current]
      end

      function switcher:switch_runner()
        local runners = { "jest", "vitest", "playwright" }
        local current = self.current

        vim.ui.select(runners, {
          prompt = "Select test runner",
          format_item = function(item)
            return item:upper() .. (item == current and " (current)" or "")
          end,
        }, function(choice)
          if choice then
            self.current = choice
            require("neotest").setup({
              adapters = { self.adapters[choice] },
            })
            vim.notify("Switched to " .. choice:upper(), vim.log.levels.INFO)
          end
        end)
      end

      -- Store the switcher globally
      package.loaded["neotest.switcher"] = switcher

      -- Initial setup
      opts.adapters = { switcher:get_current_adapter() }
      require("neotest").setup(opts)
    end,
  },
}
