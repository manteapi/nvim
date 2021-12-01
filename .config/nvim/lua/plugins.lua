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

return require('packer').startup(function()
    use {'wbthomason/packer.nvim', opt = true}

    -- qml
    use {'peterhoeg/vim-qml'}

    -- tmux
    use {'christoomey/vim-tmux-navigator'}

    -- fzf
    use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
    use {'junegunn/fzf.vim'}

    -- theme
    use('vim-airline/vim-airline')
    use('vim-airline/vim-airline-themes')
    use('edkolev/tmuxline.vim')

    use('preservim/nerdcommenter')

    -- git
    use('airblade/vim-gitgutter')
    use('tpope/vim-fugitive')
    use('APZelos/blamer.nvim')


    -- rust
    use ('rust-lang/rust.vim')

    -- completion
    use {'neoclide/coc.nvim', branch = 'release'}
    use {'neoclide/coc-json'}
    use {'neoclide/coc-rls'}
    use {'git@github.com:fannheyward/coc-pyright.git'}
end)
