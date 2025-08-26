require("conform").setup({
    formatters_by_ft = {
        python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
        qml = { "qmlformat" }
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
    },
})
