require("mason").setup({})

-- https://github.com/williamboman/mason-lspconfig.nvim
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
    ensure_installed = {
        "pylsp",
        "ruff",
        "clangd",
        "cmake",
        "rust_analyzer",
        "lua_ls",
        -- "harper_ls" -- Configuration is not taken into account correctly. Waiting for a fix.
    },
    automatic_enable = false -- enable / config is performed below
})

-- https://github.com/neovim/nvim-lspconfig
local lspconfig = require("lspconfig")
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local get_servers = require('mason-lspconfig').get_installed_servers

-- Go to previous/next diagnostic warning/error
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

local custom_on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<Leader>f", function()
        vim.lsp.buf.format { async = true }
    end, bufopts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<Leader>h', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<Leader>H', vim.lsp.buf.signature_help, opts)
end

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

local function prequire(m)
    local ok, err = pcall(require, m)
    if not ok then return nil, err end
    return err
end

local get_settings = function(server_name)
    module_name = "plugins.lsp." .. server_name
    local_module = prequire(module_name)
    if local_module then
        return local_module.settings()
    else
        return {}
    end
end

for _, server_name in ipairs(get_servers()) do
    vim.lsp.enable(server_name)
    vim.lsp.config(server_name, {
        -- root_dir = get_root_dir,
        capabilities = lsp_capabilities,
        on_attach = custom_on_attach,
    })
end

-- If no active clients were found, we map the formatting shortcut to an indent command
local active_clients = vim.lsp.get_clients()
if #active_clients == 0 then
    vim.keymap.set("n", "<Leader>f", "gg=G``", { silent = true })
end
