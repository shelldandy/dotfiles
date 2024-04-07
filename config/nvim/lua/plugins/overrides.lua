return {
  -- Why TF they use file dir all the time?
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>ff",
        LazyVim.telescope("files", { cwd = false }),
        desc = "Find Files",
      },
      {
        "<leader><space>",
        LazyVim.telescope("files", { cwd = false }),
        desc = "Find Files",
      },
      {
        "<leader>fF",
        LazyVim.telescope("files"),
        desc = "Find Files (File dir)",
      },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
	███████╗██╗  ██╗███████╗██╗     ██╗     ██████╗  █████╗ ███╗   ██╗██████╗ ██╗   ██╗
	██╔════╝██║  ██║██╔════╝██║     ██║     ██╔══██╗██╔══██╗████╗  ██║██╔══██╗╚██╗ ██╔╝
	███████╗███████║█████╗  ██║     ██║     ██║  ██║███████║██╔██╗ ██║██║  ██║ ╚████╔╝ 
	╚════██║██╔══██║██╔══╝  ██║     ██║     ██║  ██║██╔══██║██║╚██╗██║██║  ██║  ╚██╔╝  
	███████║██║  ██║███████╗███████╗███████╗██████╔╝██║  ██║██║ ╚████║██████╔╝   ██║   
	╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝    ╚═╝   
	                                                                           
      ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
