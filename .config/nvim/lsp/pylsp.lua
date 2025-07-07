return {
    cmd = { 'pylsp' },
    filetypes = { 'python' },
    root_markers = {
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
        '.git',
    },
    settings = {
        pylsp = {
            plugins = {
                autopep8 = {
                    enabled = false
                },
                jedi_completion = {
                    enabled = true,
                    include_params = true
                },
                mccabe = {
                    enabled = false
                },
                pycodestyle = {
                    enabled = false
                },
                pyflakes = {
                    enabled = false
                },
                yapf = {
                    enabled = false
                },
                black = {
                    enabled = false,
                    line_length = 120
                },
                ruff = {
                    enabled = false,
                    config = "~/.config/ruff/pyproject.toml"
                },
                pylsp_mypy = {
                    enabled = true
                },
                -- WARNING: rope is too slow on large projects
                pylsp_rope = {
                    enabled = false
                },
            }
        }
    }
}
