local keymap = vim.keymap.set
local ob = require("orderbook")

keymap("n", "<leader>q", ob.price)
