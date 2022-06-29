require("db")
require("db.lsp")
require("db.nvim-treesitter-context")

local configs = require('nvim-treesitter.configs')
configs.setup = {
    ensure_installed = { "rust", "typescript", "python" }-- Only use parsers that are maintained
    highlight = { -- enable highlighting
      enable = true,
    },
    incremental_selection = { enable = true },
    indent = {
      enable = false, -- default is disabled anyways
    },
    textobjects = { enable = true }
}
require('telescope').setup{  defaults = { file_ignore_patterns = { "node_modules" , "^./.git/" }} }
