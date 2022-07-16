require("Comment").setup({
    toggler = {
        line = '<leader>cc',
        block = '<leader>cbb',
    },
    opleader = {
        line = '<leader>c',
        block = '<leader>cb',
    },
    extra = {
        ---Add comment on the line above
        above = '<leader>cO',
        ---Add comment on the line below
        below = '<leader>co',
        ---Add comment at the end of line
        eol = '<leader>cA',
    },
})
