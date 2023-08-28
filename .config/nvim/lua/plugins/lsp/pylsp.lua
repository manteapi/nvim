local M = {}

-- Requirements
-- pip install python-lsp-server
-- pip install "python-lsp-server[all]"
-- :PyLspInstall pylsp-black pylsp-ruff pylsp-rope pylsp-mypy
-- Source: https://github.com/williamboman/mason-lspconfig.nvim/blob/main/lua/mason-lspconfig/server_configurations/pylsp/README.md
function M.settings()
    return {
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
                    enabled = true,
                    line_length = 120
                },
                ruff = {
                    enabled = true,
                    config = "~/.config/ruff/pyproject.toml"
                },
                mypy = {
                    enabled = false
                },
            }
        }
    }
end

return M
