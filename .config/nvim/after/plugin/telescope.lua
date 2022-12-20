local keymap = vim.keymap.set
local builtin = require("telescope.builtin")

keymap("n", "<C-p>", builtin.git_files, {})
keymap("n", "<leader>ps", builtin.live_grep, {})
keymap("n", "<Leader>pf", builtin.find_files, {})
keymap("n", "<leader>pw", function()
  builtin.grep_string({ search = vim.fn.expand("<cword>") })
end)
keymap("n", "<leader>pb", builtin.buffers, {})
keymap("n", "<leader>ph", ":Telescope harpoon marks<cr>")
