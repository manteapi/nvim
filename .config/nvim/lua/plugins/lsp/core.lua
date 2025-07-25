require("mason").setup({})

-- https://github.com/williamboman/mason-lspconfig.nvim
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
    ensure_installed = {
        "pylsp",
        "ruff",
        "clangd",
        "cmake",
        "rust_analyzer",
        "lua_ls",
        "just"
        -- "harper_ls" -- Configuration is not taken into account correctly. Waiting for a fix.
    },
})

-- Go to previous/next diagnostic warning/error
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
