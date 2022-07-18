local lspconfig = require("lspconfig")

local servers = {
    "jedi_language_server",
    "pylsp",
    "pyright",
    "cmake",
    "clangd",
    "sumneko_lua",
    "rust_analyzer",
}

require("nvim-lsp-installer").setup({
    ensure_installed = servers,
})

local opts = { noremap = true, silent = true }

-- Goto previous/next diagnostic warning/error
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})

vim.keymap.set('n', '<leader>sr', require('telescope.builtin').lsp_references, opts)
vim.keymap.set('n', '<leader>sds', require('telescope.builtin').lsp_document_symbols, opts)
vim.keymap.set('n', '<leader>sws', require('telescope.builtin').lsp_workspace_symbols, opts)

local on_attach = function(_, buffer)
    vim.api.nvim_buf_set_keymap(buffer, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(buffer, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(buffer, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(buffer, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>f', "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(buffer, "n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(buffer, "i", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
end

local flags = {}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in ipairs(servers) do
    local server_opts = {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = flags
    }
    if server == 'sumneko_lua' then
        local luadev_opts = require("lua-dev").setup({
            lspconfig = {
                cmd = {vim.fn.expand('$HOME', "", "") .. "/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server"},
            },
            capabilities = capabilities,
            on_attach = on_attach,
            flags = flags
        })
        lspconfig[server].setup(luadev_opts)
    elseif server == "pyright" then
        server_opts = {
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
            on_attach = on_attach,
            flags = flags
        }
        lspconfig[server].setup(server_opts)
    elseif server == "pylsp" then
        server_opts = {
            cmd = {"pylsp"},
            settings = {
                pylsp = {
                    configurationSources = {"flake8"},
                    plugins = {
                        pycodestyle = {enabled = false},
                        mccabe = {enabled = false},
                        pyflakes = {enabled = false},
                        yapf = { enabled = true},
                        autopep8 = {enabled = false},
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
            on_attach = on_attach,
            flags = flags
        }
        lspconfig[server].setup(server_opts)
    elseif server == "jedi_language_server" then
        server_opts = {
            cmd = {"jedi-language-server"},
            init_options = {
                diagnostics = {
                    enable = false
                }
            },
            capabilities = capabilities,
            on_attach = on_attach,
            flags = flags
        }
        lspconfig[server].setup(server_opts)
    elseif server == "rust_analyzer" then
        require('rust-tools').setup({
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
                        command = "clippy"
                    },
                }
            },
            server = {
                capabilities = capabilities,
                on_attach = on_attach,
                flags = flags
            }
        })
    else
        server_opts = {
            capabilities = capabilities,
            on_attach = on_attach,
            flags = flags
        }
        lspconfig[server].setup(server_opts)
    end
end
