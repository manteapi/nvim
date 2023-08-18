local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    -- bootstrap lazy.nvim: https://github.com/folke/lazy.nvim
    -- stylua: ignore
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

plugins = {
    -- Utility needed by other plugins
    { "nvim-lua/plenary.nvim", name = "plenary", lazy = true },
    -- Allow seamless navigation between vim window and tmux pane
    { "christoomey/vim-tmux-navigator", name = "tmux-navigator"},
    {
        "nvim-treesitter/nvim-treesitter",
        name="treesitter"
    },
    {
        "nvim-neorg/neorg",
        ft="norg",
        dependencies={{"plenary", "treesitter"}},
        build= ":Neorg sync-parsers",
        cmd="Neorg",
        config=function() require("plugins.neorg") end,
    }
}

lsp_plugins = {
    {
        "williamboman/mason.nvim", 
        name="mason"
    },
    {
        "williamboman/mason-lspconfig.nvim", 
        name="mason-lspconfig"
    },
    {
        "neovim/nvim-lspconfig",
        dependencies={"mason", "mason-lspconfig"},
        config=function() require("plugins.lsp.core") end,
    },
    {
        "hrsh7th/cmp-nvim-lsp", -- lsp completion
        name="cmp-nvim-lsp"
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
    }
}

completion =  {
    {
        "hrsh7th/nvim-cmp",
        version = false, -- last release is way too old
        event = "InsertEnter",
        dependencies = {
            "cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
        config=function() require("plugins.cmp") end,
    }
}

navigation = {
    {
        "nvim-telescope/telescope.nvim",
        config=function() require("plugins.telescope") end,
    }
}

table.insert(plugins, navigation)
table.insert(plugins, completion)
table.insert(plugins, lsp_plugins)

require("lazy").setup(plugins)
