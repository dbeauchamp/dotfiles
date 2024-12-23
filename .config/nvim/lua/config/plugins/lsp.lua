return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "saghen/blink.cmp",
    "stevearc/conform.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },

  config = function(_, opts)
    local lspconfig = require('lspconfig')
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      require('blink.cmp').get_lsp_capabilities())

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "rust_analyzer",
        "gopls",
      },
      handlers = {
        function(server_name) -- default handler (optional)
            lspconfig[server_name].setup {
                capabilities = capabilities
            }
        end,
      }
    })

    local keymap = vim.keymap.set
    keymap("n", "gd", function() vim.lsp.buf.definition() end, opts)
    keymap("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    keymap("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    keymap("n", "K", function() vim.lsp.buf.hover() end, opts)
    keymap("n", "gw", function() vim.lsp.buf.workspace_symbol() end, opts)
    keymap("n", "<c-s>", function() vim.lsp.buf.signature_help() end, opts)
    keymap("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    keymap("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    keymap("n", "gr", function() vim.lsp.buf.references() end, opts)

    -- Create a command `:Format` local to the LSP buffer
    -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    --   vim.lsp.buf.format()
    -- end, { desc = 'Format current buffer with LSP' })
  end
}
