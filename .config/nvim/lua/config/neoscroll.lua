require("neoscroll").setup({})
local map = {}

map["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "80" } }
map["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "80" } }

require("neoscroll.config").set_mappings(map)
