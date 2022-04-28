vim.o.termguicolors = true

local colors = require("tokyonight.colors").setup({})

vim.g.tokyonight_hide_inactive_statusline = "true"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_italic_variables = true
vim.g.tokyonight_lualine_bold = true
vim.g.tokyonight_colors = {border = colors.dark3}
vim.g.tokyonight_style = "night"
vim.g.tokyonight_colors = {
    gitSigns = {
        add = colors.green,
        change = colors.blue0,
        delete = colors.red1
    },
}

vim.cmd[[colorscheme tokyonight]]

vim.opt.laststatus=3
