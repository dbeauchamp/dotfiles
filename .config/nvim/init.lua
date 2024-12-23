require("config.lazy")

local autocmd = vim.api.nvim_create_autocmd
local mygroup = vim.api.nvim_create_augroup("DBGroup", {})

autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

autocmd("BufEnter", {
  group = mygroup,
  pattern = "*.go",
  command = "setlocal softtabstop=4 tabstop=4 shiftwidth=4",
})
