require('treesitter-context').setup({
    enable = true,
    max_lines = 10
})

vim.keymap.set("n", "[c", function()
    require("treesitter-context").go_to_context()
end, { silent = true, desc = "Jump to context" })
