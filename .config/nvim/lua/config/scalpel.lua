-- INFO: <Leader> r triggers scalpel command
local opts = {}
vim.api.nvim_set_keymap("n", "<leader>r", "<Plug>(Scalpel)", opts)
