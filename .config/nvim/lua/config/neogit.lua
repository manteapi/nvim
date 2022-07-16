local neogit = require('neogit')

neogit.setup({
    disable_commit_confirmation = true
})

vim.api.nvim_create_user_command('NeogitOpen',
    function()
        neogit.open({ cwd = vim.fn.expand('%:p:h') })
    end,
    {nargs=0}
)
