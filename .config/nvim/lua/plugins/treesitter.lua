require'nvim-treesitter.configs'.setup {
    highlight = {enable = true},
    ensure_installed = {
        "comment",
        "cpp",
        "norg",
        "lua",
        "rust",
        "python",
        "json",
        "javascript",
        "qmljs"
    },
}

vim.keymap.set("n", "<Leader>ps", function()
    print(require('nvim-treesitter').statusline(
    {
        indicator_size = 200,
        type_patterns = {'class', 'function', 'method'},
        transform_fn = function(line, _node) return line:gsub("%s*[%[%(%{]*%s*$", "") end,
        separator = ' -> ',
        allow_duplicates = false
    }
    ))
end, {desc = "Show breadcrumb", silent = true, noremap = true})
