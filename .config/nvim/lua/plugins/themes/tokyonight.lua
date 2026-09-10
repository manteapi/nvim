tokyonight = require('tokyonight')

tokyonight.setup({
    style = "night",
    transparent = true,
    dim_inactive = true,
    on_highlights = function(hl, c)
        hl.NeogitDiffAdd = {
            fg = c.git_add,
        }

        hl.NeogitDiffDelete = {
            fg = c.git_delete,
        }

        hl.NeogitDiffChange = {
            fg = c.git_change,
        }

        hl.NeogitDiffAddHighlight = {
            bg = c.git_add,
        }

        hl.NeogitDiffDeleteHighlight = {
            bg = c.git_delete,
        }

        hl.NeogitDiffChangeHighlight = {
            bg = c.git_change,
        }
    end,
})

vim.cmd("colorscheme tokyonight")
