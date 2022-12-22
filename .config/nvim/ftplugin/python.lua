vim.g.python3_host_prog = '~/.venv/bin/python3'

vim.opt.foldmethod="expr"
vim.wo.foldmethod="expr"
vim.wo.foldexpr="nvim_treesitter#foldexpr()"
vim.wo.foldenable=false
