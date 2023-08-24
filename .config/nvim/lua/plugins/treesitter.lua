require'nvim-treesitter.configs'.setup {
    highlight = {enable = true},
    ensure_installed = {
        "norg", 
        "lua", 
        "rust", 
        "python", 
        "json", 
        "javascript", 
        "qmljs"
    },
}

vim.opt.foldmethod="expr"
vim.opt.foldexpr="nvim_treesitter#foldexpr()"
