local options = {
    timeoutlen = 500,            -- time in milliseconds to wait for a mapped sequence to complete.
    showmatch = true,            -- show matching
    ignorecase = true,           -- case insensitive
    mouse="va",                  -- a="enable mouse click" + v="middle-click paste"
    hlsearch = true,             -- highlight search
    incsearch = true,            -- incremental search
    tabstop=4,                   -- number of columns occupied by a tab
    softtabstop=4,               -- see multiple spaces as tabstops so <BS> does the right thing
    expandtab = true,            -- converts tabs to white space
    shiftwidth=4,                -- width for autoindents
    autoindent = true,           -- indent a new line the same amount as the line just typed
    number = true,               -- add line numbers
    wildmode={"longest","list"}, -- get bash-like tab completions
    clipboard="unnamedplus",     -- using system clipboard
    cursorline = true,           -- highlight current cursorline
    ttyfast = true,              -- Speed up scrolling in Vim
    grepprg='rg --vimgrep --no-heading --smart-case',
    grepformat="%f:%l:%c:%m",
    relativenumber = true,
    signcolumn = "yes"
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.g.matchparen_timeout=12         -- time in ms to find matching parenthesis
vim.g.matchparen_insert_timeout=12  -- time ins ms to find matching parenthesis in insert mode
