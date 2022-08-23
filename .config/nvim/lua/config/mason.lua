require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"jedi_language_server",
		"pylsp",
		"pyright",
		"cmake",
		"clangd",
		"rust_analyzer",
		"null-ls",
		"sumneko_lua",
		"tsserver",
	},
})
