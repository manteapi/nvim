require("mason").setup({})

-- https://github.com/williamboman/mason-lspconfig.nvim
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
    ensure_installed = {
        "ty",
        "ruff@0.11.13",
        "clangd",
        "cmake",
        "rust_analyzer",
        "lua_ls",
        "just",
        "tombi",
        "qmlls",
        "ansiblels"
        -- "harper_ls" -- Configuration is not taken into account correctly. Waiting for a fix.
    },
})

-- Go to previous/next diagnostic warning/error
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
end, opts)
