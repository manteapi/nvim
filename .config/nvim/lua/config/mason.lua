require("mason").setup({})

local servers = {
    "jedi_language_server",
    "pylsp",
    "pyright",
    "cmake",
    "clangd",
    "rust_analyzer",
    "sumneko_lua",
    "tsserver"
}

require("mason-lspconfig").setup({
	ensure_installed = servers
})
