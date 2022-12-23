vim.api.nvim_command("set makeprg=cargo")

vim.opt.foldlevel = 99
vim.opt.foldmethod="expr"
vim.wo.foldmethod="expr"
vim.wo.foldexpr="nvim_treesitter#foldexpr()"
vim.wo.foldenable=false
