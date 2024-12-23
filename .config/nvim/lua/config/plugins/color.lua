return {
	"rose-pine/neovim",

  name = "rose-pine",

	config = function()
    require("rose-pine").setup({
      dim_inactive_windows = true,
      disable_italics = true,
      enable = {
       terminal = true,
      },
      highlight_groups = {
        TelescopeBorder = { fg = "none", bg = "none" },
        TelescopeNormal = { bg = "none" },
        TelescopePromptNormal = { bg = "none" },
        TelescopeResultsNormal = { fg = "none", bg = "none" },
        Normal = { bg = "none" },
        NormalNC = { bg = "none" },
      },
    })

		vim.cmd("colorscheme rose-pine-moon")
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end
}
