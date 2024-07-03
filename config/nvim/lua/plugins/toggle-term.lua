return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<c-\>]],
      direction = "horizontal", -- Default to float, but allow for splits
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      local function toggle_term_cmd(cmd, direction)
        return function()
          local count = vim.v.count1
          if count == 1 then
            if direction then
              vim.cmd("ToggleTerm direction=" .. direction)
            else
              vim.cmd("ToggleTerm")
            end
          else
            vim.cmd(count .. "ToggleTerm")
          end

          if cmd ~= "" then
            vim.cmd("TermExec cmd='" .. cmd .. "'")
          end
        end
      end

      -- Define keymaps
      -- Init a terminal if not exist
      vim.keymap.set("n", "<leader>;;", function()
        vim.cmd([[ ToggleTermToggleAll ]])

        -- list current buffers
        local buffers = vim.api.nvim_list_bufs()

        -- check if toggleterm buffer exists. If not then create one by vim.cmd [[ exe 1 . "ToggleTerm" ]]
        local toggleterm_exists = false
        for _, buf in ipairs(buffers) do
          local buf_name = vim.api.nvim_buf_get_name(buf)
          if buf_name:find("toggleterm#") then
            toggleterm_exists = true
            break
          end
        end

        if not toggleterm_exists then
          vim.cmd([[ exe 1 . "ToggleTerm" ]])
        end
      end, { noremap = true, silent = true, desc = "Toggle all terminals" })
      vim.keymap.set(
        "n",
        "<leader>;h",
        toggle_term_cmd("", "horizontal"),
        { noremap = true, silent = true, desc = "Toggle horizontal terminal" }
      )
      vim.keymap.set(
        "n",
        "<leader>;v",
        toggle_term_cmd("", "vertical"),
        { noremap = true, silent = true, desc = "Toggle vertical terminal" }
      )
      vim.keymap.set(
        "n",
        "<leader>;n",
        toggle_term_cmd("node"),
        { noremap = true, silent = true, desc = "Toggle NodeJS" }
      )

      -- Function to open a new ToggleTerm
      local function new_toggle_term(direction)
        local term_count = #require("toggleterm.terminal").get_all()
        vim.cmd((term_count + 1) .. "ToggleTerm direction=" .. (direction or "float"))
      end

      -- Create commands to open new ToggleTerm in different modes
      vim.api.nvim_create_user_command("NewTerm", function()
        new_toggle_term()
      end, {})
      vim.api.nvim_create_user_command("NewTermH", function()
        new_toggle_term("horizontal")
      end, {})
      vim.api.nvim_create_user_command("NewTermV", function()
        new_toggle_term("vertical")
      end, {})

      -- Add keymaps for the new commands
      vim.keymap.set(
        "n",
        "<leader>;]",
        ":NewTerm<CR>",
        { noremap = true, silent = true, desc = "Open new floating terminal" }
      )
      vim.keymap.set(
        "n",
        "<leader>;'",
        ":NewTermH<CR>",
        { noremap = true, silent = true, desc = "Open new horizontal terminal" }
      )
      vim.keymap.set(
        "n",
        "<leader>;[",
        ":NewTermV<CR>",
        { noremap = true, silent = true, desc = "Open new vertical terminal" }
      )
    end,
  },
}
