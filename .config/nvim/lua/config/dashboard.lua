db = require('dashboard')

db.setup({
    theme = "hyper",
    config = {
        header = {
            ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
            ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
            ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
            ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
            ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
            ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
            '                                                       ',
        },
        shortcut = {
            {
                desc = 'Lucy',
                group = "DashboardShortcut",
                key = "l",
                action = function()
                    require("telescope.builtin").find_files({
                        cwd = "~/repositories/lucy-deployment/sofa-submodules/circle/",
                    })
                end
            },
            {
                desc = 'Dotfiles',
                group = "DashboardShortcut",
                key = "d",
                action = function()
                    require("telescope.builtin").find_files({
                        cwd = "~/repositories/dotfiles/",
                    })
                end
            },
            {
                desc = 'Notes',
                group = "DashboardShortcut",
                key = "n",
                action = function()
                    require("telescope.builtin").find_files({
                        cwd = "~/repositories/dotfiles/neo-notes/",
                    })
                end
            }
        }
    }
})
