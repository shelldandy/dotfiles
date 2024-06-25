return {
  {
    "vuki656/package-info.nvim",
    ft = "json",
    dependencies = { "MunifTanjim/nui.nvim" },
    keys = {
      { "<leader>cpt", "<cmd>lua require('package-info').toggle()<cr>", desc = "Toggle package-info" },
      { "<leader>cpd", "<cmd>lua require('package-info').delete()<cr>", desc = "Delete package" },
      { "<leader>cpu", "<cmd>lua require('package-info').update()<cr>", desc = "Update package" },
      { "<leader>cpi", "<cmd>lua require('package-info').install()<cr>", desc = "Install package" },
      { "<leader>cpv", "<cmd>lua require('package-info').change_version()<cr>", desc = "Change version" },
    },
  },
}
