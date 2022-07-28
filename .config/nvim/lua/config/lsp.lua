local lspconfig = require("lspconfig")

local nullls = require("null-ls")

local servers = {
	"jedi_language_server",
	"pylsp",
	"pyright",
	"cmake",
	"clangd",
	"rust_analyzer",
	"null-ls",
	"sumneko_lua",
}

local h = require("null-ls.helpers")
local methods = require("null-ls.methods")
local DIAGNOSTICS = methods.internal.DIAGNOSTICS
local gitlint = {
    name = "gitlint",
    meta = {
        url = "https://jorisroovers.com/gitlint/",
        description = "Linter for Git commit messages.",
    },
    method = DIAGNOSTICS,
    filetypes = { "gitcommit", "NeogitCommitMessage" },
    generator = nullls.generator({
        command = "gitlint",
        args = { "--msg-filename", "$FILENAME" },
        to_temp_file = true,
        from_stderr = true,
        format = "line",
        check_exit_code = function(code)
            return code <= 1
        end,
        on_output = h.diagnostics.from_patterns({
            {
                pattern = [[(%d+): (%w+) (.+)]],
                groups = { "row", "code", "message" },
            },
        }),
    }),
    factory = h.generator_factory,
}

require("nvim-lsp-installer").setup({
	ensure_installed = servers,
})

local opts = { noremap = true, silent = true }

-- Goto previous/next diagnostic warning/error
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})

vim.keymap.set("n", "<leader>sr", require("telescope.builtin").lsp_references, opts)
vim.keymap.set("n", "<leader>sds", require("telescope.builtin").lsp_document_symbols, opts)
vim.keymap.set("n", "<leader>sws", require("telescope.builtin").lsp_workspace_symbols, opts)

-- INFO: https://github.com/neovim/nvim-lspconfig/wiki/Multiple-language-servers-FAQ#i-see-multiple-formatting-options-and-i-want-a-single-server-to-format-how-do-i-do-this
local formatting_callback = function(client, bufnr, mapping_opts)
	local util = require("vim.lsp.util")
	vim.keymap.set("n", "<leader>f", function()
        local params = util.make_formatting_params({})
        client.request("textDocument/formatting", params, nil, bufnr)
	end, mapping_opts)
end

local on_attach = function(client, buffer)
    vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	vim.api.nvim_buf_set_keymap(buffer, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(buffer, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(buffer, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(buffer, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(buffer, "i", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
end

local flags = {}

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in ipairs(servers) do
	local server_opts = {
		capabilities = capabilities,
		on_attach = on_attach,
		flags = flags,
	}
	if server == "null-ls" then
        -- nullls.register(gitlint)
        nullls.setup({
            sources = {
				require("null-ls").builtins.formatting.stylua,
                nullls.builtins.formatting.stylua,
            },
			on_attach = on_attach,
			capabilities = capabilities,
		})
	elseif server == "sumneko_lua" then
		local luadev_opts = require("lua-dev").setup({
			lspconfig = {
				cmd = {
					vim.fn.expand("$HOME", "", "")
						.. "/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server",
				},
				on_attach = on_attach
               ,
			},
			capabilities = capabilities,
			flags = flags,
		})
		lspconfig[server].setup(luadev_opts)
	elseif server == "pyright" then
		server_opts = {
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
			root_dir = function(filename, _)
				local root_files = {
					"neovim.toml",
				}
				local fallback_root_files = {
					".git",
				}
				local primary = lspconfig.util.root_pattern(unpack(root_files))(filename)
				local fallback = lspconfig.util.root_pattern(unpack(fallback_root_files))(filename)
				return primary or fallback
			end,
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
