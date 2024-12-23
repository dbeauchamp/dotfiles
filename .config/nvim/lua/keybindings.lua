local keymap = vim.keymap.set
local opts = { noremap = true }
-- nnoremap "n"
-- vnoremap "v"
-- xnoremap "x"
-- inoremap "i"
-- vim.keymap.set(type, keys, command, options)

keymap("n", "<Leader>f", ":Ex<CR>")
keymap("n", "H", "^")
keymap("n", "L", "$")
keymap("v", "L", "$h")
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")
keymap("n", "<C-j>", "<C-W><C-j>")
keymap("n", "<C-k>", "<C-W><C-k>")
keymap("n", "<C-l>", "<C-W><C-l>")
keymap("n", "<C-h>", "<C-W><C-h>")
keymap("x", "<leader>p", "\"+p")
keymap("n", "<leader>y", "\"+y")
keymap("v", "<leader>y", "\"+y")
keymap("n", "<leader>k", ":bd<CR>")
keymap("n", "<leader>K", ":bd!<CR>")
keymap("n", "<leader>s", ":w<CR>")
keymap("i", "jk", "<esc>")
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

keymap("n", "<leader>e", vim.diagnostic.open_float)
  -- keymap("n", "[d", vim.diagnostic.goto_next)
  -- keymap("n", "]d", vim.diagnostic.goto_prev)
