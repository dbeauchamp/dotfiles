return {
  "nvim-telescope/telescope.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
  },

  config = function()
    require('telescope').setup({
      extensions = {
        fzf = {}
      }
    })

    require('telescope').load_extension("fzf")

    local keymap = vim.keymap.set
    local builtin = require("telescope.builtin")

    keymap("n", "<C-p>", builtin.git_files, { desc = "Search [P]roject files" })
    keymap("n", "<leader>ps", builtin.live_grep, { desc = "grep [P]roject [S]earch" })
    keymap("n", "<Leader>pf", builtin.find_files, {})
    keymap("n", "<leader>pw", function()
      builtin.grep_string({ search = vim.fn.expand("<cword>") })
    end, { desc = "grep [P]roject current [W]ord" })
    keymap("n", "<leader>pb", builtin.buffers, { desc = "Search [P]roject [B]uffers" })
    keymap("n", "<leader>ph", ":Telescope harpoon marks<cr>", { desc = "List [P]roject [H]arpoon marks" })
    keymap("n", "<leader>/", function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {})
    end, { desc = "[/] Fuzzily search in current buffer" })
    keymap("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
  end
}
