vim.g.python3_host_prog = '~/.venv/bin/python3'
vim.g.black_linelength = 120
vim.cmd([[autocmd BufWritePre *.py execute ':Black']])
