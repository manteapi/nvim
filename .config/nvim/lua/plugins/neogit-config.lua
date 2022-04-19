local neogit = require('neogit')

vim.api.nvim_create_user_command('NeogitOpen',
    function()
        neogit.open({ cwd = vim.fn.expand('%:p:h') })
    end,
    {nargs=0}
)
