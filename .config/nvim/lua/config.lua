vim.g.mapleader = " "
vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.errorbells = false
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.cmdheight = 1
vim.opt.updatetime = 50
-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.cmd("colorscheme gruvbox")

vim.api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = "%s/\\s\\+$//e",
})

require("keybindings")
require("lsp")
require("treesitter")

local opts = {
  tools = {
    autoSetHints = true,
    inlay_hints = {
      only_current_line = true,
    }
  }
}

local configs = require('nvim-treesitter.configs')
configs.setup = {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  incremental_selection = {
      enable = true
  },
  indent = {
    enable = true,
  },
  textobjects = { enable = true }
}

require('telescope').setup({ defaults = { file_ignore_patterns = { "node_modules", ".git" }} })
require('telescope').load_extension('harpoon')

local cmp = require('cmp')
cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    }, {
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    }),
    snippet = {
      -- REQUIRED by nvim-cmp. get rid of it once we can
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    }
})

require('cmp_tabnine.config').setup({
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = '..',
	ignored_file_types = {
		-- default is not to ignore
		-- uncomment to ignore in lua:
		-- lua = true
	},
	show_prediction_strength = false
})


  -- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

  -- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['sumneko_lua'].setup({
  capabilities = capabilities
})
require('lspconfig')['tsserver'].setup({
  on_attach = on_attach,
  flags = lsp_flags,
})
require('lspconfig')['rust_analyzer'].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  -- Server-specific settings...
  settings = {
    ["rust-analyzer"] = {}
  }
})

-- lualine
require('lualine').setup({
  options = {
    theme = 'auto',
  },
})

require('nvim-web-devicons').setup()
