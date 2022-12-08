-- WARNING: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({})

local lspconfig = require("lspconfig")

local mason_servers = {
	"jedi_language_server",
	"pylsp",
	"pyright",
	"cmake",
	"clangd",
	"rust_analyzer",
	"sumneko_lua",
	"tsserver",
}

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = mason_servers,
})

local nullls = require("null-ls")
local devmojilint = require("config.null-ls.devmoji")
local commitlint = require("config.null-ls.commitlint")

-- Goto previous/next diagnostic warning/error
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

local on_attach = function(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	-- INFO: see https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
	if client.name ~= "sumneko_lua" then
        vim.keymap.set("n", "<Leader>f", function()
            vim.lsp.buf.format({ async = true })
        end, bufopts)
	end
	vim.keymap.set("n", "<leader>sr", require("telescope.builtin").lsp_references, bufopts)
	vim.keymap.set("n", "<leader>sds", require("telescope.builtin").lsp_document_symbols, bufopts)
	vim.keymap.set("n", "<leader>sws", require("telescope.builtin").lsp_workspace_symbols, bufopts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)

	-- INFO: Replaced by IncRename in inc-rename.lua
	-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)

	vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, opts)
end

local flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local get_root_dir = function(filename, _)
	local root_files = {
		"neovim.toml",
	}
	local fallback_root_files = {
		".git",
	}
	local primary = lspconfig.util.root_pattern(unpack(root_files))(filename)
	local fallback = lspconfig.util.root_pattern(unpack(fallback_root_files))(filename)
	return primary or fallback
end

local servers = mason_servers
table.insert(servers, "null-ls")

for _, server in ipairs(servers) do
	local server_opts = {
		capabilities = capabilities,
		on_attach = on_attach,
		flags = flags,
	}
	if server == "null-ls" then
		-- nullls.register(devmojilint)
		nullls.register(commitlint)
		nullls.setup({
			sources = {
				nullls.builtins.formatting.stylua,
			},
			on_attach = function(client, buffer)
				on_attach(client, buffer)
			end,
			capabilities = capabilities,
		})
	elseif server == "sumneko_lua" then
		server_opts = {
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
				},
			},
			on_attach = on_attach,
			capabilities = capabilities,
			flags = flags,
		}
		lspconfig[server].setup(server_opts)
	elseif server == "pyright" then
		server_opts = {
			root_dir = get_root_dir,
			cmd = { "pyright-langserver", "--stdio" },
			settings = {
				pyright = {
					disableLanguageServices = true,
				},
				python = {
					analysis = {
						autoImportCompletions = true,
					},
				},
			},
			capabilities = capabilities,
			on_attach = on_attach,
			flags = flags,
		}
		lspconfig[server].setup(server_opts)
	elseif server == "pylsp" then
		server_opts = {
			root_dir = get_root_dir,
			-- NOTE: See https://pypi.org/project/python-lsp-server/
			-- Install all optional providers: pip install "python-lsp-server[all]"
			cmd = { "pylsp" },
			settings = {
				pylsp = {
					configurationSources = { "flake8" },
					plugins = {
						pycodestyle = { enabled = false },
						mccabe = { enabled = false },
						pyflakes = { enabled = false },
						yapf = { enabled = true },
						autopep8 = { enabled = false },
						flake8 = {
							enabled = true,
							maxLineLength = 120,
						},
						jedi_completion = { enabled = false },
						rope_completion = { enabled = false },
					},
				},
			},
			capabilities = capabilities,
			on_attach = on_attach,
			flags = flags,
		}
		lspconfig[server].setup(server_opts)
	elseif server == "jedi_language_server" then
		server_opts = {
			root_dir = get_root_dir,
			cmd = { "jedi-language-server" },
			init_options = {
				diagnostics = {
					enable = false,
				},
			},
			capabilities = capabilities,
			on_attach = on_attach,
			flags = flags,
		}
		lspconfig[server].setup(server_opts)
	elseif server == "rust_analyzer" then
		require("rust-tools").setup({
			tools = {
				autoSetHints = true,
				hover_with_actions = true,
				inlay_hints = {
					show_parameter_hints = false,
					parameter_hints_prefix = "",
					other_hints_prefix = "",
				},
			},
			settings = {
				["rust-analyzer"] = { -- INFO: https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
					checkOnSave = {
						command = "clippy",
					},
				},
			},
			server = {
				capabilities = capabilities,
				on_attach = on_attach,
				flags = flags,
			},
		})
	else
		server_opts = {
			capabilities = capabilities,
			on_attach = on_attach,
			flags = flags,
		}
		lspconfig[server].setup(server_opts)
	end
end
