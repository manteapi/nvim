local neogit = require('neogit')

neogit.setup({})

local open_neogit_locally = function()
    local current_directory = vim.fn.expand('%:p:h')
    neogit.open({ cwd = current_directory })
end

vim.api.nvim_create_user_command(
    'NeogitOpen',
    open_neogit_locally,
    { desc = "Open Neogit for the current file", nargs = 0 }
)

vim.keymap.set("n", "<Leader>gs", open_neogit_locally, {silent = true, noremap=true, desc="Open neogit locally"})
vim.keymap.set("n", "<Leader>gc", ":Neogit commit<CR>", {silent = true, noremap=true, desc="Commit changes"})
vim.keymap.set("n", "<Leader>gp", ":Neogit pull<CR>", {silent = true, noremap=true, desc="Pull current branch"})
vim.keymap.set("n", "<Leader>gP", ":Neogit push<CR>", {silent = true, noremap=true, desc="Push current branch"})
