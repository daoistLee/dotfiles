return function()
    local nvim_tree = require("nvim-tree")
    nvim_tree.setup({
        disable_netrw = true,
        hijack_netrw = true,
        open_on_setup = false,
        ignore_ft_on_setup = {},
        open_on_tab = false,
        hijack_cursor = true,
        update_cwd = true,
        update_focused_file = {
            enable = true,
            update_cwd = true,
            ignore_list = {},
        },
        system_open = {
            cmd = nil,
            args = {},
        },
        diagnostics = {
            enable = false,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = "",
            },
        },
        git = {
            enable = true,
            ignore = true,
            timeout = 500,
        },
        filters = {
            custom = {
                ".git",
                "node_modules",
                ".cache",
                "__pycache__",
                ".vscode",
                ".ipynb_checkpoints",
            },
        },
        renderer = {
            indent_markers = {
                enable = true,
                icons = {
                    corner = "└ ",
                    edge = "│ ",
                    none = "  ",
                },
            },
            icons = {
                webdev_colors = true,
                git_placement = "before",
                padding = " ",
                symlink_arrow = " ➛ ",
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
                },
                glyphs = {
                    default = "",
                    symlink = "",
                    folder = {
                        arrow_closed = "",
                        arrow_open = "",
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = "",
                        symlink_open = "",
                    },
                    git = {
                        unstaged = "✗",
                        staged = "✓",
                        unmerged = "",
                        renamed = "➜",
                        untracked = "★",
                        deleted = "",
                        ignored = "◌",
                    },
                },
            },
            -- special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
            special_files = {},
        },
        view = {
            width = 30,
            side = "left",
            mappings = {
                custom_only = false,
                list = {},
            },
            number = false,
            relativenumber = false,
            signcolumn = "yes",
        },
        trash = {
            cmd = "trash",
            require_confirm = true,
        },
        actions = {
            change_dir = {
                enable = true,
                global = false,
            },
            open_file = {
                quit_on_open = false,
                resize_window = false,
                window_picker = {
                    enable = true,
                    chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                    exclude = {
                        -- filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                        -- buftype = { "nofile", "terminal", "help" },
                        filetype = { "notify", "packer", "qf", "vista_kind", "Outline", "Trouble" },
                        buftype = { "terminal", "help" },
                    },
                },
            },
        },
    })
end
