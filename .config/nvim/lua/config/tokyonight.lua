vim.o.termguicolors = true

require("tokyonight").setup({
    style = "night",
    terminal_colors = true,
    styles = {
        comments = {italic = true},
        functions = {italic = true},
        sidebars = "dark",
        floats = "dark",
    },
    lualine_bold = true,
    on_colors = function(colors)
        colors.border = colors.blue5
    end
})

local colors = require("tokyonight.colors").setup({})

-- WARNING: set colorscheme after configuration
vim.cmd[[colorscheme tokyonight]]

-- Setup neogit highlight colors
vim.api.nvim_set_hl(0, 'NeogitDiffAddHighlight', {background=colors.green2, foreground=colors.black})
vim.api.nvim_set_hl(0, 'NeogitDiffDeleteHighlight', {background=colors.red1, foreground=colors.black})

-- Setup diff highlight colors
vim.api.nvim_set_hl(0, 'DiffChange', {background=colors.green2, foreground=colors.black})
vim.api.nvim_set_hl(0, 'DiffDelete', {background=colors.red1, foreground=colors.black})


-- Setup colors for AchieveMsg and ErrorMsg
vim.api.nvim_set_hl(0, 'AchieveMsg', {
    background=colors.green2,
    foreground=colors.black,
    italic=true,
    bold=true
})
vim.api.nvim_set_hl(0, 'ErrorMsg', {
    background=colors.red1,
    foreground=colors.black,
    italic=true,
    bold=true
})


-- Display a line under the current line
vim.api.nvim_set_hl(0, 'CursorLine', {
    underline = true
})

-- INFO: With tokyonight I wanted to changed the visual background color
vim.api.nvim_set_hl(0, 'Visual', {
    background = colors.bg_highlight
})


-- Setup options for illuminated highlights groups
vim.api.nvim_set_hl(0, 'illuminatedCurWord', {})
vim.api.nvim_set_hl(0, 'illuminatedWord', {
    underline = true
})
