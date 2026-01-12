return {
    cmd = { 'ty' },
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
        ty = {
            experimental = {
                rename = true,
            },
        }
    }
}
