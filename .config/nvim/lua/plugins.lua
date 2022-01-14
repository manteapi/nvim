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

    -- helpers
    use {"folke/which-key.nvim"}

    -- dashboard
    use 'glepnir/dashboard-nvim'

    -- tree explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        config = function() require'nvim-tree'.setup {} end
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
    use {'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- lines
    use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

    -- comments
    use('preservim/nerdcommenter')

    -- git
    use('tpope/vim-fugitive')

    use {'lewis6991/gitsigns.nvim', requires = { { 'nvim-lua/plenary.nvim' } }}


    -- justfiles
    use('NoahTheDuke/vim-just')

    -- rust
    -- use ('rust-lang/rust.vim')
    use ('simrat39/rust-tools.nvim')

    -- conquer of completion - a.k.a coc
    -- i decided to use lsp instead for now
    -- use {'neoclide/coc.nvim', branch = 'release'}
end)
