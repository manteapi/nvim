local colors = require("tokyonight.colors").setup()

vim.g.tokyonight_hide_inactive_statusline = "true"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_italic_variables = true
vim.g.tokyonight_lualine_bold = true
vim.g.tokyonight_colors = {border = colors.dark3}
vim.g.tokyonight_style = "night"

vim.opt.laststatus=3

vim.cmd[[colorscheme tokyonight]]
