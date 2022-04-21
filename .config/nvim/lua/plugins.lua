-- check if packer is installed (~/local/share/nvim/site/pack)
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

    use {'andymass/vim-matchup'}

    use {
        'karb94/neoscroll.nvim',
        config = function()
            require('neoscroll').setup()
        end
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        ft = {'lua', 'python', 'c', 'cpp', 'rust', 'qml', 'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'racket'},
        config = function()
            require("indent_blankline").setup {
                show_current_context = true,
                show_current_context_start = true,
            }
        end
    }
    use 'godlygeek/tabular'

    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require'colorizer'.setup()
        end
    }
    -- whitespaces
    use 'ntpeters/vim-better-whitespace'

    -- dashboard
    use 'glepnir/dashboard-nvim'

    -- tree explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        }
    }

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {'nvim-treesitter/nvim-treesitter-textobjects'}

    -- lsp & languages
    use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer',
    }

    use {'folke/lua-dev.nvim'}

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons"
    }

    -- :warning: vista requires ctags
    use {'liuchengxu/vista.vim'}

    -- color schemes
    use {'folke/tokyonight.nvim'}

    -- NOTE: pip install nvim is required to make it work
    use {'psf/black'}

    -- completion
    use {'hrsh7th/nvim-cmp'}
    -- LSP completion source for nvim-cmp
    use {'hrsh7th/cmp-nvim-lsp'}
    -- Other usefull completion sources
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-buffer'}

    -- snippets
    use {'saadparwaiz1/cmp_luasnip'} -- Snippets source for nvim-cmp
    use {'L3MON4D3/LuaSnip'} -- Snippets plugin

    -- qml
    use {'peterhoeg/vim-qml'}

    -- tmux
    use {'christoomey/vim-tmux-navigator'}

    -- nvim dev
    use {'tjdevries/nlua.nvim'}

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
            { 'nvim-telescope/telescope-live-grep-raw.nvim' },
        }
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- lines
    use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

    -- comments
    use('preservim/nerdcommenter')

    -- git
    use { 'TimUntersberger/neogit',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require("neogit").setup{}
        end
    }

    use('tpope/vim-fugitive')

    use {'lewis6991/gitsigns.nvim', requires = { { 'nvim-lua/plenary.nvim' } }}

    use 'rhysd/git-messenger.vim'

    use {
        'ruifm/gitlinker.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require("gitlinker").setup{}
        end
    }

    -- justfiles
    use('NoahTheDuke/vim-just')

    -- rust
    -- use ('rust-lang/rust.vim')
    use {'simrat39/rust-tools.nvim',
        commit = '7b4d155dd47e211ee661cbb4c7969b245f768edb'
    }

    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {}
        end
    }
end)
