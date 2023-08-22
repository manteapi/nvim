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
        "nvim-neorg/neorg",
        ft="norg",
        dependencies={{"plenary", "treesitter"}},
        build= ":Neorg sync-parsers",
        cmd="Neorg",
        config=function() require("plugins.neorg") end,
    }
}

treesitter = {
    {
        "nvim-treesitter/nvim-treesitter",
        name="treesitter",
        config=function() require("plugins.treesitter") end,
        build=":TSUpdate",
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config=function() require("plugins.treesitter-context") end,
        dependencies={{"treesitter"}},
    },
}

lsp = {
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
        event = "InsertEnter",
        dependencies = {
            "cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip"
        },
        config=function() require("plugins.cmp") end,
    },
    {
        "L3MON4D3/LuaSnip",
        config=function() require("plugins.snippets.luasnip") end,
    }
}

navigation = {
    {
        "nvim-tree/nvim-tree.lua",
        config=function() require("plugins.tree") end,
    },
    {
        "nvim-telescope/telescope.nvim",
        config=function() require("plugins.telescope") end,
    }
}

themes = {
    {
        "folke/tokyonight.nvim",
        config=function() require("plugins.themes.tokyonight") end,
    }
}

comments = {
    {
        "numToStr/Comment.nvim", 
        config=function() require("plugins.comment") end,
    }
}

git = {
    {
        "ruifm/gitlinker.nvim",
        config=function() require("plugins.git.gitlinker") end,
        dependencies={{"plenary"}},
    },
}

table.insert(plugins, comments)
table.insert(plugins, navigation)
table.insert(plugins, completion)
table.insert(plugins, treesitter)
table.insert(plugins, git)
table.insert(plugins, lsp)
table.insert(plugins, themes)

opts = {
    install = {
        colorscheme = {'tokyonight'},
    }
}
require("lazy").setup(plugins, opts)
