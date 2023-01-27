-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  -- core
  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-telescope/telescope.nvim")
  use("ThePrimeagen/harpoon")
  use("gruvbox-community/gruvbox")
  use({ "rose-pine/neovim", as = "rose-pine" })
  use({ "catppuccin/nvim", as = "catppuccin" })
  use({ "kabouzeid/nvim-jellybeans", requires = "rktjmp/lush.nvim" })
  use("nvim-treesitter/nvim-treesitter", {
    run = ":TSUpdate"
  })
  use("nvim-treesitter/nvim-treesitter-context")
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  })
  use("tpope/vim-fugitive")
  use("tpope/vim-commentary")
  use("mbbill/undotree")
  use("sbdchd/neoformat")
  use("github/copilot.vim")

  use({
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  })

  -- local dev
  use("/home/davidbeauchamp/workspace/orderbook.nvim")
end)
