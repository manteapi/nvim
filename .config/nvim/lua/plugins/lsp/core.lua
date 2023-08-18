require("mason").setup({})

-- https://github.com/williamboman/mason-lspconfig.nvim
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({ensure_installed={
    "pyright"
}})

-- https://github.com/neovim/nvim-lspconfig
local lspconfig = require("lspconfig")
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local get_servers = require('mason-lspconfig').get_installed_servers

-- Goto previous/next diagnostic warning/error
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

local custom_on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<Leader>f", function() 
        vim.lsp.buf.format{async=true}
    end, bufopts)
end

local nullls = require("null-ls")

nullls.setup({
    sources = {
        nullls.builtins.formatting.black.with({
            args={ "--stdin-filename", "$FILENAME", "--quiet", "--line-length", "120" ,"-" }
        }),
        nullls.builtins.diagnostics.flake8
    },
    on_attach = function(client, buffer)
        custom_on_attach(client, buffer)
    end,
    capabilities = capabilities,
})

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

for _, server_name in ipairs(get_servers()) do
  lspconfig[server_name].setup({
    root_dir = get_root_dir,
    capabilities = lsp_capabilities,
    on_attach = custom_on_attach
  })
end

-- If no active clients were found, we map the formatting shortcut to an indent command
local active_clients = vim.lsp.get_active_clients()
if #active_clients == 0 then
    vim.keymap.set("n", "<Leader>f","gg=G``", {silent=true})
end
