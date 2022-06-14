-- WARNING: check if packer is installed (~/local/share/nvim/site/pack)
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
    if vim.fn.input("Hent packer.nvim? (y for yada)") ~= "y" then
        return
    end

    local directory = string.format(
        '%s/site/pack/packer/opt/',
        vim.fn.stdpath('data')
    )

    vim.fn.mkdir(directory, 'p')

    local git_clone_cmd = vim.fn.system(string.format(
        'git clone %s %s',
        'https://github.com/wbthomason/packer.nvim',
        directory .. '/packer.nvim'
    ))

    print(git_clone_cmd)
    print("Henter packer.nvim...")

    return
end

return require('packer').startup(function(use)

    use {'wbthomason/packer.nvim', opt = true}

    use {'dstein64/vim-startuptime'}

    use {'machakann/vim-sandwich'} -- operators for sandwiched texts

    use{'windwp/nvim-autopairs'}   -- automatic pairs

    use {'andymass/vim-matchup'}   -- highlight pairs

    use {'RRethy/vim-illuminate'}  -- highlight current word

    use {'nvim-lua/plenary.nvim'}  -- nvim lua helpers

    use {'preservim/vim-markdown'}

    use {
        "iamcco/markdown-preview.nvim",
        as = "markdown-preview",
        run = "cd app && yarn install", -- Need `yarn` for installation.
        ft = "markdown"
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
        config = function()
            require('neoscroll').setup()
        end
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
        config = function()
            require'colorizer'.setup()
        end
    }

    use {'ntpeters/vim-better-whitespace'} -- strip trailing whitespaces

    use {'glepnir/dashboard-nvim'} -- greeting screen

    use {
        'kyazdani42/nvim-tree.lua', -- tree filesystem explorer
        requires = {
            'kyazdani42/nvim-web-devicons'
        }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {'nvim-treesitter/nvim-treesitter-textobjects'}

    use {
        'neovim/nvim-lspconfig', -- good defaults for lsp
    }

    use {
        'williamboman/nvim-lsp-installer', -- lsp managers
        config = function()
            require("nvim-lsp-installer").setup(
                {
                    ensure_installed = {
                        "pylsp",
                        "pyright",
                        "jedi_language_server",
                        "clangd",
                        "rust_analyzer",
                        "sumneko_lua"
                    }
                }
            )
        end
    }

    use {'onsails/lspkind.nvim'} -- lsp pictograms

    -- nvim dev
    use {'folke/lua-dev.nvim'}
    use {'tjdevries/nlua.nvim'}

    use {
        "folke/trouble.nvim", -- diagnostics visualizer
        requires = "kyazdani42/nvim-web-devicons"
    }

    use {'liuchengxu/vista.vim'} -- symbols visualizer WARNING: vista requires ctags

    use {'folke/tokyonight.nvim'} -- color scheme

    -- completion
    use {'hrsh7th/nvim-cmp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-cmdline'}
    use {'hrsh7th/cmp-nvim-lua'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'saadparwaiz1/cmp_luasnip'}

    -- snippets
    use {'L3MON4D3/LuaSnip'}

    -- qml
    use {'peterhoeg/vim-qml'}

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
        }
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons'} } -- nice UI/UX for status line

    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'} -- nice UI/UX for buffer line

    use {'numToStr/Comment.nvim'} -- comments

    use {
        'windwp/nvim-spectre', -- easy search and replace across filesystems
        requires = 'nvim-lua/plenary.nvim'
    }

    -- git
    use { 'TimUntersberger/neogit', -- magit for neovim
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require("neogit").setup{}
        end
    }

    use {'tpope/vim-fugitive'}

    use {'lewis6991/gitsigns.nvim', requires = { { 'nvim-lua/plenary.nvim' } }} -- git gutter

    use 'rhysd/git-messenger.vim' -- current line git message displayer

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
end)
