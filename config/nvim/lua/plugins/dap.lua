return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<leader>dO",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<leader>do",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
    },
    config = function()
      local dap = require("dap")
      -- Function to load project-specific debug configurations
      local function load_project_debug_config()
        local config_file = vim.fn.getcwd() .. "/.nvim/debug.lua"

        if vim.fn.filereadable(config_file) == 1 then
          local config_func = loadfile(config_file)
          if config_func then
            local status, config = pcall(config_func)
            if status and type(config) == "table" then
              -- Merge or replace existing configurations
              for lang, configs in pairs(config) do
                dap.configurations[lang] = configs
              end
              print("Loaded project-specific debug configuration")
            else
              print("Error loading configuration from " .. config_file)
            end
          end
        end
      end

      -- Auto-command to load project config when entering a buffer
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*",
        callback = load_project_debug_config,
      })

      -- Optional: Command to manually reload debug config
      vim.api.nvim_create_user_command("ReloadDebugConfig", load_project_debug_config, {})

      -- Add any other DAP configurations or setup here
      require("dap.ext.vscode").load_launchjs(nil, {})
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = {
      virt_text_win_col = 80,
    },
  },
}
