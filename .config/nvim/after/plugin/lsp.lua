local lsp = require("lsp-zero")
local keymap = vim.keymap.set

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
  'rust_analyzer',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.set_preferences({
  sign_icons = { }
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  keymap("n", "gd", function() vim.lsp.buf.definition() end, opts)
  keymap("n", "gD", function() vim.lsp.buf.declaration() end, opts)
  keymap("n", "gi", function() vim.lsp.buf.implementation() end, opts)
  keymap("n", "K", function() vim.lsp.buf.hover() end, opts)
  keymap("n", "gw", function() vim.lsp.buf.workspace_symbol() end, opts)
  keymap("n", "<c-k>", function() vim.lsp.buf.signature_help() end, opts)
  keymap("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  keymap("n", "<leader>af", function() vim.lsp.buf.code_action() end, opts)
  keymap("n", "gr", function() vim.lsp.buf.references() end, opts)
end)

lsp.setup()
