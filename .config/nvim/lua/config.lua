require('lsp')
require('keybindings')

local opts = {
  tools = {
    autoSetHints = true,
    inlay_hints = {
      only_current_line = true,
    }
  }
}

require('rust-tools').setup(opts)

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

require('telescope').setup{  defaults = { file_ignore_patterns = { "node_modules", ".git" }} }
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

local tabnine = require('cmp_tabnine.config')
tabnine.setup({
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
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['sumneko_lua'].setup {
    capabilities = capabilities
}

-- lualine
require('lualine').setup({
  options = {
    theme = 'auto',
  },
})

require('nvim-web-devicons').setup()
