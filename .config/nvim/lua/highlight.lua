local colors = require("tokyonight.colors").setup({})

vim.api.nvim_set_hl(0, 'NeogitDiffAddHighlight', {background=colors.green2, foreground=colors.black})
vim.api.nvim_set_hl(0, 'NeogitDiffDeleteHighlight', {background=colors.red1, foreground=colors.black})

vim.api.nvim_set_hl(0, 'DiffChange', {background=colors.green2, foreground=colors.black})
vim.api.nvim_set_hl(0, 'DiffDelete', {background=colors.red1, foreground=colors.black})

vim.api.nvim_set_hl(0, 'CursorLine', {
    underline = true
})

vim.api.nvim_set_hl(0, 'illuminatedCurWord', {})

vim.api.nvim_set_hl(0, 'illuminatedWord', {
    underline = true
})
