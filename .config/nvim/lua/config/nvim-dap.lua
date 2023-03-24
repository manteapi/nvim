require('dap-python').setup('~/.venv/bin/python')

vim.keymap.set("n", "<leader>dn", function()
    require('dap').continue()
end, {noremap = true, silent = true})

vim.keymap.set("n", "<leader>dj", function()
    require('dap').step_over()
end, {noremap = true, silent = true})

vim.keymap.set("n", "<leader>do", function()
    require('dap').step_out()
end, {noremap = true, silent = true})

vim.keymap.set("n", "<leader>de", function()
    require('dap').step_into()
end, {noremap = true, silent = true})

vim.keymap.set("n", "<leader>di", function()
    require('dap.ui.widgets').hover()
end, {noremap = true, silent = true})

vim.keymap.set("n", "<leader>db", function()
    require('dap').toggle_breakpoint()
end, {noremap = true, silent = true})
