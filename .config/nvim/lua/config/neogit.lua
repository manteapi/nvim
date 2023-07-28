-- local neogit = require('neogit')

-- neogit.setup({
--     disable_commit_confirmation = true
-- })

-- local raw_notify = require("utils.raw_notify").notify
--
-- vim.api.nvim_create_user_command('NeogitOpen',
--     function()
--         local current_directory = vim.fn.expand('%:p:h')
--         neogit.open({ cwd = current_directory })
--         raw_notify(" " .. current_directory .. " used for neogit !", "achieve")
--     end,
--     { desc = "Open Neogit for the current file", nargs = 0 }
-- )
