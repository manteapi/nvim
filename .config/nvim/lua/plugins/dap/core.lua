vim.keymap.set("n", "<leader>dn", function()
    require('dap').continue()
end, {desc="dap::continue debug", noremap = true, silent = true})

vim.keymap.set("n", "<leader>dj", function()
    require('dap').step_over()
end, {desc="dap::step over", noremap = true, silent = true})

vim.keymap.set("n", "<leader>do", function()
    require('dap').step_out()
end, {desc="dap::step out", noremap = true, silent = true})

vim.keymap.set("n", "<leader>de", function()
    require('dap').step_into()
end, {desc="dap::step into", noremap = true, silent = true})

vim.keymap.set("n", "<leader>di", function()
    require('dap.ui.widgets').hover()
end, {desc="dap::debug info hover", noremap = true, silent = true})

vim.keymap.set("n", "<leader>db", function()
    require('dap').toggle_breakpoint()
end, {desc="dap::toggle breakpoint", noremap = true, silent = true})
