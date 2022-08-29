local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }
local function nkeymap(key, map)
    keymap('n', key, map, opts)
end

-- LSP
nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
nkeymap('K', ':lua vim.lsp.buf.hover()<cr>')
nkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nkeymap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')


-- Telescope
nkeymap('<C-p>', ':lua require("telescope.builtin").git_files()<CR>')
nkeymap('<leader>ps', ':lua require("telescope.builtin").live_grep()<CR>')
nkeymap('<Leader>pf', ':lua require("telescope.builtin").find_files({ hidden = true, ignore = true, find_command = rg })<CR>')
nkeymap('<leader>pw', ':lua require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })<CR>')
nkeymap('<leader>pb', ':lua require("telescope.builtin").buffers()<CR>')
nkeymap('<leader>vh', ':lua require("telescope.builtin").help_tags()<CR>')
nkeymap('<leader>ph', ':Telescope harpoon marks<cr>')

-- Harpoon
nkeymap('<leader>h', ':lua require("harpoon.mark").add_file()<cr>')
nkeymap('<leader>ht', ':lua require("harpoon.ui").toggle_quick_menu()<cr>')
nkeymap('<leader>hn', ':lua require("harpoon.ui").nav_next()<cr>')
nkeymap('<leader>hp', ':lua require("harpoon.ui").nav_prev()<cr>')
