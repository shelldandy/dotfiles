return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = {
            "--config",
            os.getenv("HOME") .. "/.config/markdownlint/markdownlint-cli2.yaml",
            "--",
          },
        },
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")

      -- Disable none-ls's markdownlint_cli2 since nvim-lint handles it better
      local markdownlint_cli2_original = nls.builtins.diagnostics.markdownlint_cli2

      opts.sources = opts.sources or {}

      -- Remove any existing markdownlint_cli2 sources
      opts.sources = vim.tbl_filter(function(source)
        return source ~= markdownlint_cli2_original
      end, opts.sources)

      return opts
    end,
  },
}
