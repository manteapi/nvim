local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    -- bootstrap lazy.nvim: https://github.com/folke/lazy.nvim
    -- stylua: ignore
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

plugins = {
    -- Utility needed by other plugins
    { "nvim-lua/plenary.nvim", name = "plenary"},
    -- Allow seamless navigation between vim window and tmux pane
    { "christoomey/vim-tmux-navigator", name = "tmux-navigator"},
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
        name = "luarocks",
    },
    {
        -- TIPS: If any error then run:
        -- 0. sudo apt install lua5.4
        -- 1. Lazy build luarocks
        -- 2. Lazy build neorg
        "nvim-neorg/neorg",
        ft = "norg",
        dependencies = {{ "luarocks" }
        },
        config=function() require("plugins.neorg") end,
        cmd="Neorg",
        version = "*",
        lazy = false
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

dap = {
    {
        "mfussenegger/nvim-dap",
        name="dap",
        config=function() require("plugins.dap.core") end,
    },
    {
        'mfussenegger/nvim-dap-python',
        dependencies={"dap"},
        config=function() require("plugins.dap.debugpy") end,
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
        name="lspconfig",
        dependencies={"mason", "mason-lspconfig"},
        config=function() require("plugins.lsp.core") end,
    },
    {
        "hrsh7th/cmp-nvim-lsp", -- lsp completion
        name="cmp-nvim-lsp"
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
    },
    {
        url="https://gitlab.com/schrieveslaach/sonarlint.nvim.git",
        dependencies={"lspconfig"},
        config=function() require("plugins.lsp.sonarlint") end,
    }
}

editing = {
    {
        "max397574/better-escape.nvim",
        config=function() require("plugins.editing.betterescape") end,
    },
    {
        "smoka7/hop.nvim",
        config=function() require("plugins.editing.hop") end,
    },
    {
        "ntpeters/vim-better-whitespace",
        config=function() require("plugins.editing.whitespace") end,
    },
    {
        "numToStr/Comment.nvim",
        config=function() require("plugins.editing.comment") end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "saadparwaiz1/cmp_luasnip"
        },
        config=function() require("plugins.editing.cmp") end,
    },
}

snippets = {
    {
        "L3MON4D3/LuaSnip",
        config=function() require("plugins.snippets.luasnip") end,
    }
}

navigation = {
    {
        "nvim-telescope/telescope.nvim",
        config=function() require("plugins.telescope") end,
    },
    {
        "liuchengxu/vista.vim"
    },
    {
        "nvim-tree/nvim-tree.lua",
        config=function() require("plugins.navigation.nvimtree") end,
    }
}

themes = {
    {
        "folke/tokyonight.nvim",
        config=function() require("plugins.themes.tokyonight") end,
    }
}

git = {
    {
        "ruifm/gitlinker.nvim",
        config=function() require("plugins.git.gitlinker") end,
        dependencies={{"plenary"}},
    },
    {
        "tpope/vim-fugitive",
        config=function() require("plugins.git.fugitive") end,
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration
            "nvim-telescope/telescope.nvim", -- optional
        },
        config=function() require("plugins.git.neogit") end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config=function() require("plugins.git.gitsigns") end,
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

opts = {
    install = {
        colorscheme = {'tokyonight'},
    }
}
require("lazy").setup(plugins, opts)
