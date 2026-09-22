return {
    cmd = { "nixd" },
    filetypes = { "nix" },

    settings = {
        nixd = {
            formatting = {
                command = { "nixfmt" },
            },
        },
    },
}
