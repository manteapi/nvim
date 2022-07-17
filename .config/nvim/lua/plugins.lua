local packer_boot = require('utils.packer_boot')

local packer_startup = {
    function(use)
        use {'wbthomason/packer.nvim'}

        use {'nvim-lua/plenary.nvim'}  -- nvim lua helpers

        use {'dstein64/vim-startuptime'}

        use {'machakann/vim-sandwich'} -- operators for sandwiched texts

        use{ -- automatic pairs
            'windwp/nvim-autopairs',
            config = [[require("config/autopairs")]],
        }

        use { -- highlight pairs
            'andymass/vim-matchup',
            config = [[require("config/matchup")]],
        }

        use { -- highlight current word
            'RRethy/vim-illuminate',
            config = [[require("config/illuminate")]],
        }

        use {'preservim/vim-markdown'}

        -- use {
        -- 	"iamcco/markdown-preview.nvim",
        -- 	run = "cd app && yarn install", -- Need `yarn` for installation.
        -- 	ft = "markdown"
        -- }

        use {
            "nvim-neotest/neotest",
            requires = {
                "nvim-lua/plenary.nvim",
                "nvim-treesitter/nvim-treesitter",
                "antoinemadec/FixCursorHold.nvim",
                "nvim-neotest/neotest-vim-test",
                "vim-test/vim-test"
            },
            config = [[require("config/neotest")]],
        }

        use {
            "folke/todo-comments.nvim", -- flashy highlights for todo comments
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("todo-comments").setup()
            end
        }

        use {
            'karb94/neoscroll.nvim', -- smooth scrolling
            config = [[require("config/neoscroll")]],
        }

        use {
            "lukas-reineke/indent-blankline.nvim", -- vertical guideliens for code blocks
            ft = {'lua', 'python', 'c', 'cpp', 'rust', 'qml', 'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'racket'},
            config = function()
                require("indent_blankline").setup {
                    show_current_context = true,
                    show_current_context_start = true,
                }
            end
        }

        use {'godlygeek/tabular'} -- line up texts


        use {
            'norcalli/nvim-colorizer.lua', -- show color in terminal #B22222
            config = [[require("config/colorizer")]],
        }

        use { -- strip trailing whitespaces
            'ntpeters/vim-better-whitespace',
            config = [[require("config/better-whitespace")]],
        }

        use {     -- greeting screen
            'glepnir/dashboard-nvim',
            config = [[require("config/dashboard")]],
        }


        use {
            'kyazdani42/nvim-tree.lua', -- tree filesystem explorer
            requires = {
                'kyazdani42/nvim-web-devicons'
            },
            config = [[require("config/nvimtree")]],
        }

        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = [[require("config/treesitter")]],
        }

        use {
            'nvim-treesitter/nvim-treesitter-textobjects',
            config = [[require("config/treesitter-textobjects")]],
        }

        use {
            'neovim/nvim-lspconfig', -- good defaults for lsp
        }


        use {
            'williamboman/nvim-lsp-installer', -- lsp managers
            config = [[require("config/lsp")]],
        }
        -- nvim dev
        use {
            'folke/lua-dev.nvim',
            config = function()
                require("lua-dev").setup({
                    library = { plugins = { "neotest" }, types = true },
                })
            end
        }

        use {'tjdevries/nlua.nvim'}

        use {
            "folke/trouble.nvim", -- diagnostics visualizer
            requires = "kyazdani42/nvim-web-devicons",
            config = [[require("config/trouble")]],
        }

        use {
            'liuchengxu/vista.vim',
            config = [[require("config/vista")]],
        } -- symbols visualizer WARNING: vista requires ctags

        use {
            'folke/tokyonight.nvim',
            config = [[require("config/tokyonight")]],
        } -- color scheme

        -- completion
        use {
            'hrsh7th/nvim-cmp',
            config = [[require("config/cmp")]],
        }
        use {'hrsh7th/cmp-buffer'}
        use {'hrsh7th/cmp-path'}
        use {'hrsh7th/cmp-cmdline'}
        use {'hrsh7th/cmp-nvim-lua'}
        use {'hrsh7th/cmp-nvim-lsp'}
        use {'saadparwaiz1/cmp_luasnip'}
        use {
            'onsails/lspkind.nvim',
            config = [[require("config/lspkind")]],
        } -- lsp pictograms

        -- snippets
        use {
            'L3MON4D3/LuaSnip',
            config = [[require("config/luasnip")]],
        }

        -- tmux
        use {'christoomey/vim-tmux-navigator'}


        -- fuzzy finder
        -- -------------

        -- fzf
        use {'junegunn/fzf', dir = '~/.fzf', run = './install --all'}
        use {'junegunn/fzf.vim'}

        -- telescope
        use {
            'nvim-telescope/telescope.nvim',
            requires = {
                {'nvim-lua/plenary.nvim'},
                { 'nvim-telescope/telescope-live-grep-args.nvim' },
            },
            config = [[require("config/telescope")]],
        }
        use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons'},
            config = [[require("config/lualine")]],
        } -- nice UI/UX for status line

        use {
            'akinsho/bufferline.nvim',
            requires = 'kyazdani42/nvim-web-devicons',
            config = [[require("config/bufferline")]],
        } -- nice UI/UX for buffer line
        --
        use {'kazhala/close-buffers.nvim',
            config = [[require("config/close-buffers")]],
        } -- shortcuts to close buffer w.r.t different conditions

        use {'numToStr/Comment.nvim',
            config = [[require("config/comment")]],
        } -- comments

        use {
            'windwp/nvim-spectre', -- easy search and replace across filesystems
            requires = 'nvim-lua/plenary.nvim',
            config = [[require("config/spectre")]],
        }

        -- git
        use { 'TimUntersberger/neogit', -- magit for neovim
            requires = 'nvim-lua/plenary.nvim',
            config = [[require("config/neogit")]],
        }

        use {'tpope/vim-fugitive'}
        use { "tpope/vim-abolish"}

        use {'lewis6991/gitsigns.nvim', requires = { { 'nvim-lua/plenary.nvim' } }} -- git gutter

        use {'rhysd/git-messenger.vim'} -- current line git message displayer

        use {
            'ruifm/gitlinker.nvim', -- git code browser
            requires = 'nvim-lua/plenary.nvim',
            config = function()
                require("gitlinker").setup{}
            end
        }

        use('NoahTheDuke/vim-just') -- syntax highlight for justfiles

        use {'simrat39/rust-tools.nvim', -- enhanced tools for rust development
            commit = '7b4d155dd47e211ee661cbb4c7969b245f768edb'
        }

    end,
    config = { autoremove = true }
}

packer_boot.bootstrap(packer_startup)

local packer = vim.api.nvim_create_augroup("Packer", { clear = true })
 vim.api.nvim_create_autocmd("BufWritePost", {
     group = packer,
     pattern = "plugins.lua",
     command = "source <afile> | PackerSync"
})

local raw_notify = require('utils.raw_notify').notify

vim.keymap.set("n", "<leader><leader>r", function()
   local current_file = vim.fn.expand('%:p', "", "")
    if vim.bo.filetype == 'vim' then
        vim.cmd([[:silent! write]])
        vim.cmd([[:source %]])
        raw_notify(" " .. current_file .. " reloaded !", "achieve")
    elseif vim.bo.filetype == 'lua' then
        vim.cmd([[:silent! write]])
        vim.cmd([[:luafile %]])
        raw_notify(" " .. current_file .. " reloaded !", "achieve")
    else
        raw_notify("" .. current_file .. " could not be loaded !", "error")
    end
end)
