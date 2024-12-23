return {
  "echasnovski/mini.nvim",

  config = function()
    require("mini.git").setup()
    require("mini.icons").setup()
    local statusline = require("mini.statusline")
    statusline.setup({ use_icons = true })
  end
}
