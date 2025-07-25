-- Python autocmd to fix all and format on buffer write
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local filepath = vim.api.nvim_buf_get_name(bufnr)

        -- Save current changes to disk so ruff can fix the actual file
        vim.api.nvim_command("write")

        -- Run ruff fix on the saved file
        local cmd = { "ruff", "check", "--fix", filepath }
        vim.fn.system(cmd)

        -- Reload buffer from disk after fix
        vim.api.nvim_command("edit!")

        -- Format buffer with LSP (optional)
        vim.lsp.buf.format({ async = false })
    end,
})

return {
    cmd = { 'ruff', 'server' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
    settings = {},
}
