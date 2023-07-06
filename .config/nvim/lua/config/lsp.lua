-- WARNING: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({})

local lspconfig = require("lspconfig")

local mason_servers = {
    "pyright",
    "cmake",
    "clangd",
    "rust_analyzer",
    "tsserver",
    "lua_ls"
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
    if client.name ~= "lua_ls" then
        vim.keymap.set("n", "<Leader>f", function()
            vim.lsp.buf.format({ async = true })
        end, bufopts)
        vim.keymap.set("v", "<Leader>f", function()
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

    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)

    vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("i", "<leader>H", vim.lsp.buf.signature_help, opts)
end

local flags = {
    -- NOTE: This is the default in Nvim 0.7+
    -- debounce_text_changes = 150,
}

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

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

nullls.register(devmojilint)
nullls.register(commitlint)
nullls.setup({
    sources = {
        nullls.builtins.formatting.stylua,
        -- nullls.builtins.formatting.yapf,
        nullls.builtins.formatting.black.with({
            args={ "--stdin-filename", "$FILENAME", "--quiet", "--line-length", "120" ,"-" }
        }),
        nullls.builtins.formatting.qmlformat,
        -- nullls.builtins.diagnostics.qmllint,
        nullls.builtins.diagnostics.flake8
    },
    on_attach = function(client, buffer)
        on_attach(client, buffer)
    end,
    capabilities = capabilities,
})

local server_opts = {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
lspconfig["lua_ls"].setup(server_opts)

server_opts = {
    root_dir = get_root_dir,
    capabilities = capabilities,
    on_attach = on_attach,
    flags = flags,
}
lspconfig["pyright"].setup(server_opts)

server_opts = {
    root_dir = get_root_dir,
    capabilities = capabilities,
    on_attach = on_attach,
    flags = flags,
}
lspconfig["clangd"].setup(server_opts)

server_opts = {
    root_dir = get_root_dir,
    capabilities = capabilities,
    on_attach = on_attach,
    flags = flags,
}
lspconfig["tsserver"].setup(server_opts)

server_opts = {
    root_dir = get_root_dir,
    capabilities = capabilities,
    on_attach = on_attach,
    flags = flags,
}
lspconfig["cmake"].setup(server_opts)

require("rust-tools").setup({
    tools = {
        autoSetHints = true,
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

server_opts = {
    cmd = {"qmlls", "--build-dir", "/home/pmanteaux/repositories/build-release/data"},
    filetypes = {"qml"},
    single_file_support = true,
    root_dir = get_root_dir,
    capabilities = capabilities,
    on_attach = on_attach,
    flags = flags,
}
-- lspconfig["qmlls"].setup(server_opts)
