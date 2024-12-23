return {
  "ThePrimeagen/harpoon",

  config = function()
    local keymap = vim.keymap.set
    local ui = require("harpoon.ui")
    local mark = require("harpoon.mark")

    keymap("n", "<leader>h", mark.add_file)
    keymap("n", "<leader>ht", ui.toggle_quick_menu)
    keymap("n", "<leader>hn", ui.nav_next)
    keymap("n", "<leader>hp", ui.nav_prev)
  end
}
