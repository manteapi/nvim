local M = {}

-- INFO: Minimalist logging which does not require any plugin. Useful for bootstrapping.
-- However just use `vlog.nvim` and save yourself the trouble
local echohl = vim.schedule_wrap(
    function(msg, hl)
        local emsg = vim.fn.escape(msg, '"')
        vim.cmd('echohl ' .. hl .. ' | echom "' .. emsg .. '" | echohl None')
    end
)

function M.info(msg)
	echohl(msg, 'None')
end

function M.err(msg)
	echohl(msg, 'ErrorMsg')
end

vim.api.nvim_create_autocmd("User",
    {
        pattern = "PackerComplete",
        callback = function()
            vim.schedule(function()
                M.info('[packer]: Synchronizing done')
            end)
        end,
    }
)

local function init(success, sync, startup)
    if not success then
        M.err('[packer]: Failed setup')
        return
    end

    vim.cmd('packadd packer.nvim')

    -- Uncomment/change this depending on where you want your 'list' of packages
    -- to load from
    --
    -- This would be somewhere on your `:h runtimepath`, and would likely contain
    -- a call to `startup` provided by `packer`
    -- require('pack.list')
    --
    require('packer').startup(startup)
    if sync then
        M.info('[packer]: Synchronizing...')
	    require('packer').sync()
    end
end

function M.bootstrap(startup)
    -- Bootstrap `packer` installation to manage packages
    local packer = {
        opt_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim',
        start_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim',
        url = 'https://github.com/wbthomason/packer.nvim'
    }

    if vim.fn.executable('git') ~= 1 then
        M.err('[packer] Bootstrap failed, git not installed')
        return
    end

    if vim.fn.empty(vim.fn.glob(packer.opt_path)) and vim.fn.empty(vim.fn.glob(packer.start_path)) > 0 then
        M.info('[packer]: Installing...')

        local handle
        handle = vim.loop.spawn(
            'git',
            {
                args = {
                    'clone',
                    packer.url,
                    packer.opt_path,
                },
            },
            vim.schedule_wrap(
                function(code, _)
                    -- Wrapper to call `init` based on the success of the above `git` operation
                    handle:close()
                    init(code == 0, true, startup)
                end
            )
        )
    else
        -- `packer` already installed, continue to load package list
        init(true, false, startup)
    end
end

return M
