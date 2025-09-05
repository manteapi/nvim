require("conform").setup({
    formatters_by_ft = {
        python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
        qml = { "qmlformat" }
    },
    format_on_save = function(bufnr)
        if vim.g.disable_autoformat then
            return
        end

        local ignore_filetypes = { "cpp" }
        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
            return
        end

        return { timeout_ms = 500, lsp_format = "fallback" }
    end,
})

vim.api.nvim_create_user_command("ConformToggle", function()
    vim.g.disable_autoformat = not vim.g.disable_autoformat
    print("Conform autoformat " .. (vim.g.disable_autoformat and "disabled" or "enabled"))
end, {})
