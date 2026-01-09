vim.g.strip_whitelines_at_eof = 1
vim.g.strip_only_modified_lines = 1
vim.g.strip_whitespace_on_save = 1
vim.g.better_whitespace_enabled = 0
vim.g.strip_whitespace_confirm = 0

-- I tried to use better_whitespace_filetypes_blacklist but did not manage to make it work
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "xml" },
    command = "let b:strip_whitespace_on_save = 0"
})
