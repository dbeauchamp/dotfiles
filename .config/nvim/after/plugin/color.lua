require("rose-pine").setup({
	--- @usage 'main' | 'moon'
	 -- dark_variant = "main",
   disable_italics = true,
   disable_background = true,
   highlight_groups = {
     TelescopeBorder = { fg = "highlight_high", bg = "none" },
     TelescopeNormal = { bg = "none" },
     TelescopePromptNormal = { bg = "none" },
   },
})

vim.cmd [[colorscheme rose-pine]]
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

