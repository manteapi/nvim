-- Goto previous/next diagnostic warning/error
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, opts)

vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)
vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

vim.keymap.set('n', '<leader>sr', require('telescope.builtin').lsp_references, opts)
vim.keymap.set('n', '<leader>sds', require('telescope.builtin').lsp_document_symbols, opts)
vim.keymap.set('n', '<leader>sws', require('telescope.builtin').lsp_workspace_symbols, opts)

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

local on_attach = function(_, bufnr)
    -- NOTE: Do something here when lsp is attached
end

local flags = {
    -- This will be the default in neovim 0.7+
    debounce_text_changes = 150,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require("nvim-lsp-installer").setup({})

local lspconfig = require("lspconfig")

local luadev = require("lua-dev").setup({
    lspconfig = {
        cmd = {vim.fn.expand('$HOME', "", "") .. "/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server"},
    },
    capabilities = capabilities,
    on_attach = on_attach,
    flags = flags
})
lspconfig.sumneko_lua.setup(luadev)

local pyright_opts = {
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
lspconfig.pyright.setup(pyright_opts)

local clangd_opts = {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = flags
}
lspconfig.clangd.setup(clangd_opts)

local pylsp_opts = {
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
    on_attach = on_attach,
    flags = flags
}
lspconfig.pylsp.setup(pylsp_opts)

local jedi_opts = {
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
lspconfig.jedi_language_server.setup(jedi_opts)

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
