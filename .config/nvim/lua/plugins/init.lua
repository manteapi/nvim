local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    -- bootstrap lazy.nvim: https://github.com/folke/lazy.nvim
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
        lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

local plugins = {
    -- Utility needed by other plugins
    { "nvim-lua/plenary.nvim",          name = "plenary" },
    -- Allow seamless navigation between vim window and tmux pane
    { "christoomey/vim-tmux-navigator", name = "tmux-navigator" },
}

local treesitter = {
    {
        "nvim-treesitter/nvim-treesitter",
        name = "treesitter",
        config = function() require("plugins.treesitter.treesitter") end,
        build = ":TSUpdate",
        dependencies = { { "nvim-treesitter/nvim-treesitter-textobjects" } }
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function() require("plugins.treesitter.treesitter-context") end,
        dependencies = { { "treesitter" } },
    },
}

local dap = {
    {
        "mfussenegger/nvim-dap",
        name = "dap",
        config = function() require("plugins.dap.core") end,
    },
    {
        'mfussenegger/nvim-dap-python',
        dependencies = { "dap" },
        config = function() require("plugins.dap.debugpy") end,
    },
}

local lsp = {
    {
        "williamboman/mason.nvim",
        name = "mason"
    },
    {
        "williamboman/mason-lspconfig.nvim",
        name = "mason-lspconfig"
    },
    {
        "neovim/nvim-lspconfig",
        name = "lspconfig",
        dependencies = { "mason", "mason-lspconfig" },
        config = function() require("plugins.lsp.core") end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
    },
    {
        url = "https://gitlab.com/schrieveslaach/sonarlint.nvim.git",
        dependencies = { "lspconfig" },
        config = function() require("plugins.lsp.sonarlint") end,
    }
}

local editing = {
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function() require("plugins.editing.indentblankline") end,
    },
    {
        "danymat/neogen",
        config = function() require("plugins.editing.neogen") end,
    },
    {
        "smoka7/hop.nvim",
        config = function() require("plugins.editing.hop") end,
    },
    {
        "ntpeters/vim-better-whitespace",
        config = function() require("plugins.editing.whitespace") end,
    },
    {
        "numToStr/Comment.nvim",
        config = function() require("plugins.editing.comment") end,
    },
    {
        "saghen/blink.cmp",
        version = "1.*",
        config = function() require("plugins.editing.blink") end,
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        config = function() require("plugins.editing.rendermarkdown") end,
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    },
    {
        'kylechui/nvim-surround',
        config = function() require("plugins.editing.surround") end,
    },
    {
        'windwp/nvim-autopairs',
        config = function() require("plugins.editing.autopairs") end,
    },
}

local snippets = {
    {
        "L3MON4D3/LuaSnip",
        config = function() require("plugins.snippets.luasnip") end,
    }
}

local navigation = {
    {
        "nvim-telescope/telescope.nvim",
        config = function() require("plugins.telescope") end,
    },
    {
        "liuchengxu/vista.vim"
    },
    {
        "stevearc/oil.nvim",
        config = function() require("plugins.navigation.oil") end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        config = function() require("plugins.navigation.nvimtree") end,
    },
}

local themes = {
    {
        "folke/tokyonight.nvim",
        config = function() require("plugins.themes.tokyonight") end,
    }
}

local git = {
    {
        "ruifm/gitlinker.nvim",
        config = function() require("plugins.git.gitlinker") end,
        dependencies = { { "plenary" } },
    },
    {
        "tpope/vim-fugitive",
        config = function() require("plugins.git.fugitive") end,
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration
            "nvim-telescope/telescope.nvim", -- optional
        },
        config = function() require("plugins.git.neogit") end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function() require("plugins.git.gitsigns") end,
    },
    {
        "sindrets/diffview.nvim"
    }
}

table.insert(plugins, editing)
table.insert(plugins, snippets)
table.insert(plugins, navigation)
table.insert(plugins, treesitter)
table.insert(plugins, git)
table.insert(plugins, lsp)
table.insert(plugins, dap)
table.insert(plugins, themes)

local opts = {
    install = {
        colorscheme = { 'tokyonight' },
    }
}

require("lazy").setup(plugins, opts)
