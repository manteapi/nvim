require 'nvim-treesitter.configs'.setup {
    highlight = { enable = true },
    ensure_installed = {
        "yaml",
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
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
            },
        },
    }
}

vim.keymap.set("n", "<Leader>ps", function()
    print(require('nvim-treesitter').statusline(
        {
            indicator_size = 200,
            type_patterns = { 'class', 'function', 'method' },
            transform_fn = function(line, _) return line:gsub("%s*[%[%(%{]*%s*$", "") end,
            separator = ' -> ',
            allow_duplicates = false
        }
    ))
end, { desc = "Show breadcrumb", silent = true, noremap = true })
