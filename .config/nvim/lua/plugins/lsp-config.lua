-- Goto previous/next diagnostic warning/error
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})

local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr }
    -- code navigation
    vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, opts)

    vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

    vim.keymap.set('n', '<leader>ssr', require('telescope.builtin').lsp_references, opts)
    vim.keymap.set('n', '<leader>sds', require('telescope.builtin').lsp_document_symbols, opts)
    vim.keymap.set('n', '<leader>sws', require('telescope.builtin').lsp_workspace_symbols, opts)

    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {
        capabilities = capabilities,
        on_attach = on_attach
    }

    if server.name == "sumneko_lua" then
        opts = require("lua-dev").setup({
            lspconfig = {
                cmd = {vim.fn.expand('$HOME') .. "/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server"},
            },
        })
    end

    --Use for diagnostics
    if server.name == "pyright" then
        opts = {
            cmd = {"pyright-langserver", "--stdio"},
            settings = {
                pyright = {
                    disableLanguageServices = true
                },
                python = {
                    analysis = {
                        autoImportCompletions = true
                    },
                }
            },
            capabilities = capabilities,
            on_attach = on_attach
        }
    end

    -- Used for formatting
    if server.name == "pylsp" then
        opts = {
            cmd = {"pylsp"},
            settings = {
                pylsp = {
                    configurationSources = {"flake8"},
                    plugins = {
                        pycodestyle = {enabled = false},
                        flake8 = {
                            enabled = true,
                            maxLineLength = 120
                        },
                        jedi_completion = { enabled = false},
                        rope_completion = {enabled = false}
                    }
                }
            },
            capabilities = capabilities,
            on_attach = on_attach
        }
    end

    -- Used for completion
    if server.name == "jedi_language_server" then
        opts = {
            cmd = {"jedi-language-server"},
            init_options = {
                diagnostics = {
                    enable = false
                }
            },
            capabilities = capabilities,
            on_attach = on_attach
        }
    end

    if server.name == "rust_analyzer" then
        local rust_analyzer_opts = {
            capabilities = capabilities,
            settings = {
                -- to enable rust-analyzer settings visit:
                -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
                ["rust-analyzer"] = {
                    -- enable clippy on save
                    checkOnSave = {
                        command = "clippy"
                    },
                }
            },
        }
        -- Initialize the LSP via rust-tools instead
        require("rust-tools").setup {
            tools = { -- rust-tools options
                autoSetHints = true,
                hover_with_actions = true,
                inlay_hints = {
                    show_parameter_hints = false,
                    parameter_hints_prefix = "",
                    other_hints_prefix = "",
                },
            },
            -- The "server" property provided in rust-tools setup function are the
            -- settings rust-tools will provide to lspconfig during init.
            -- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
            -- with the user's own settings (opts).
            server = vim.tbl_deep_extend("force", server:get_default_options(), rust_analyzer_opts),
        }
        server:attach_buffers()
    else
        server:setup(opts)
    end
end)
