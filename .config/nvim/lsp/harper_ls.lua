return {
    default_config = {
        cmd = { 'harper-ls', '--stdio' },
        filetypes = {
            'c',
            'cpp',
            'cs',
            'gitcommit',
            'go',
            'html',
            'java',
            'javascript',
            'lua',
            'markdown',
            'nix',
            'python',
            'ruby',
            'rust',
            'swift',
            'toml',
            'typescript',
            'typescriptreact',
            'haskell',
            'cmake',
            'typst',
            'php',
            'dart',
            'clojure',
        },
        root_dir = function(fname)
            return vim.fs.dirname(vim.fs.find('.git', { path = fname, upward = true })[1])
        end,
        single_file_support = true,
        settings = {
            ["harper-ls"] = {
                userDictPath = "~/.config/nvim/dictionnaries/default.txt"
            }
        },

    },
}
