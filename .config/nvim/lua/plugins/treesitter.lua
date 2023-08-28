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
