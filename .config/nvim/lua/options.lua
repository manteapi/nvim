local options = {
    showmatch = true,               -- show matching
    ignorecase = true,              -- case insensitive
    mouse="v",                 -- middle-click paste with
    hlsearch = true,                -- highlight search
    incsearch = true,               -- incremental search
    tabstop=4,               -- number of columns occupied by a tab
    softtabstop=4,           -- see multiple spaces as tabstops so <BS> does the right thing
    expandtab = true,               -- converts tabs to white space
    shiftwidth=4,            -- width for autoindents
    autoindent = true,              -- indent a new line the same amount as the line just typed
    number = true,                  -- add line numbers
    wildmode={"longest","list"},   -- get bash-like tab completions
    mouse="a",                 -- enable mouse click
    clipboard="unnamedplus",   -- using system clipboard
    cursorline = true,              -- highlight current cursorline
    ttyfast = true,                 -- Speed up scrolling in Vim
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
