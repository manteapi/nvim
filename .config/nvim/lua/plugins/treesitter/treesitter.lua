require 'nvim-treesitter'.setup {
    -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
    install_dir = vim.fn.stdpath('data') .. '/site',
}

require('nvim-treesitter').install {
    "yaml",
    "comment",
    "cpp",
    "lua",
    "rust",
    "python",
    "json",
    "javascript",
    "qmljs"
}

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
        if lang and vim.treesitter.language.add(lang) then
            vim.treesitter.start()
        end
    end,
})


vim.keymap.set({ "x", "o" }, "am", function()
    require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "im", function()
    require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
end)

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
