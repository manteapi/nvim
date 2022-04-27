-- Add additional capabilities supported by nvim-cmp
local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true }
    -- code navigation
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "i", "ss", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    -- code actions
    vim.api.nvim_buf_set_keymap(bufnr, "n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
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

-- diagnostic ux
-- Set updatetime for CursorHold
-- 300ms of no cursor movement to trigger CursorHold
-- vim.opt["updatetime"]=300
-- Show diagnostic popup on cursor hold
-- vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float()]])

-- Goto previous/next diagnostic warning/error
--vim.api.nvim_set_keymap("n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
--vim.api.nvim_set_keymap("n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
