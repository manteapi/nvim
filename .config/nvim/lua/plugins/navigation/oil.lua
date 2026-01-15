require("oil").setup({
    view_options = {
        show_hidden = true,
        skip_confirm_for_simple_edits = false,
    },
    keymaps = {
        ['yp'] = {
            desc = 'Copy filepath to system clipboard',
            callback = function()
                require('oil.actions').copy_entry_path.callback()
                vim.fn.setreg("+", vim.fn.getreg(vim.v.register))
            end,
        },
        -- Release those keys for tmux
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["<C-s>"] = false,
        -- Set the actions to other keys
        ["<Leader>r"] = "actions.refresh",
        ["<Leader>|"] = { "actions.select", opts = { vertical = true } },
        ["<Leader>-"] = { "actions.select", opts = { horizontal = true } },
    },
})

vim.keymap.set("n", "<Leader>e", ":Oil<cr>", { silent = true, noremap = true, desc = "Edit filesystem in a buffer" })
