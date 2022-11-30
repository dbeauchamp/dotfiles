return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  use("tpope/vim-fugitive")

  -- core
  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-telescope/telescope.nvim")
  -- Plug 'nvim-telescope/telescope-fzy-native.nvim' maybe want this
  use("nvim-treesitter/nvim-treesitter", {
    run = ":TSUpdate"
  })
  use({
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  })
  use("nvim-treesitter/playground")
  use("romgrk/nvim-treesitter-context")

  -- lsp
  use("neovim/nvim-lspconfig")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/nvim-cmp")
  use("tzachar/cmp-tabnine", { run = "./install.sh" })

  -- other plugins
  use("ThePrimeagen/harpoon")
  use("gruvbox-community/gruvbox")

end)
