-- local opt_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/"
local opt_path = vim.fn.stdpath("data") .. "/site/lazy/"
local onedark_path = opt_path .. "onedark.nvim"
local onedarkpro_path = opt_path .. "onedarkpro.nvim"
local zephyrium_path = opt_path .. "zephyrium"
local doom_path = opt_path .. "doom-one.nvim"

-- local theme = "onedark"
local theme = "onedarkpro"
-- local theme = "zephyrium"
-- local theme = "doom-one"
if theme == "onedark" then
    if vim.loop.fs_stat(onedark_path) then
        vim.cmd([[packadd onedark.nvim]])
        require("onedark").setup({
            style = "cool",
            --  **Options:**  dark, darker, cool, deep, warm, warmer, light
            -- transparent = true,
            -- toggle_style_key = "", Default keybinding to toggle
        })
        require("onedark").load()
    end
elseif theme == "onedarkpro" then
    if vim.loop.fs_stat(onedarkpro_path) then
        -- vim.cmd([[packadd onedarkpro.nvim]])
        local onedarkpro = require("onedarkpro")
        onedarkpro.setup({
            theme = "onedark",
            filetypes = { -- Override which filetype highlight groups are loaded
                html = true,
                java = true,
                javascript = true,
                lua = true,
                markdown = true,
                php = true,
                python = true,
                ruby = true,
                rust = true,
                scss = true,
                toml = true,
                typescript = true,
                typescriptreact = true,
                vue = true,
                xml = true,
                yaml = true,
            },
            plugins = { -- Override which plugin highlight groups are loaded
                aerial = true,
                barbar = true,
                copilot = true,
                dashboard = true,
                gitsigns = true,
                hop = true,
                indentline = true,
                leap = true,
                lsp_saga = true,
                lsp_semantic_tokens = true,
                marks = true,
                neotest = true,
                neo_tree = true,
                nvim_cmp = true,
                nvim_bqf = true,
                nvim_dap = true,
                nvim_dap_ui = true,
                nvim_hlslens = true,
                nvim_lsp = true,
                nvim_navic = true,
                nvim_notify = true,
                nvim_tree = true,
                nvim_ts_rainbow = true,
                op_nvim = true,
                packer = true,
                polygot = true,
                startify = true,
                telescope = true,
                toggleterm = true,
                treesitter = true,
                trouble = true,
                vim_ultest = true,
                which_key = true,
            },
            highlights = {}, -- Override default highlight groups or create your own
            styles = { -- For example, to apply bold and italic, use "bold,italic"
                types = "NONE", -- Style that is applied to types
                methods = "NONE", -- Style that is applied to methods
                numbers = "NONE", -- Style that is applied to numbers
                strings = "NONE", -- Style that is applied to strings
                comments = "NONE", -- Style that is applied to comments
                keywords = "NONE", -- Style that is applied to keywords
                constants = "NONE", -- Style that is applied to constants
                functions = "NONE", -- Style that is applied to functions
                operators = "NONE", -- Style that is applied to operators
                variables = "NONE", -- Style that is applied to variables
                parameters = "NONE", -- Style that is applied to parameters
                conditionals = "NONE", -- Style that is applied to conditionals
                virtual_text = "NONE", -- Style that is applied to virtual text
            },
            options = {
                cursorline = false, -- Use cursorline highlighting?
                transparency = false, -- Use a transparent background?
                terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
                highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
            },
        })
        onedarkpro.load()
        vim.cmd("hi clear CursorColumn")
    end
elseif theme == "zephyrium" then
    if vim.loop.fs_stat(zephyrium_path) then
        vim.cmd([[packadd zephyrium]])
        vim.cmd([[colorscheme zephyrium]])
    end
elseif theme == "doom-one" then
    if vim.loop.fs_stat(doom_path) then
        vim.cmd([[packadd doom-one.nvim]])
        -- require('doom-one').setup()
        -- Add color to cursor
        vim.g.doom_one_cursor_coloring = false
        -- Set :terminal colors
        vim.g.doom_one_terminal_colors = true
        -- Enable italic comments
        vim.g.doom_one_italic_comments = false
        -- Enable TS support
        vim.g.doom_one_enable_treesitter = true
        -- Color whole diagnostic text or only underline
        vim.g.doom_one_diagnostics_text_color = false
        -- Enable transparent background
        vim.g.doom_one_transparent_background = false

        -- Pumblend transparency
        vim.g.doom_one_pumblend_enable = false
        vim.g.doom_one_pumblend_transparency = 20

        -- Plugins integration
        vim.g.doom_one_plugin_neorg = true
        vim.g.doom_one_plugin_barbar = false
        vim.g.doom_one_plugin_telescope = false
        vim.g.doom_one_plugin_neogit = true
        vim.g.doom_one_plugin_nvim_tree = true
        vim.g.doom_one_plugin_dashboard = true
        vim.g.doom_one_plugin_startify = true
        vim.g.doom_one_plugin_whichkey = true
        vim.g.doom_one_plugin_indent_blankline = true
        vim.g.doom_one_plugin_vim_illuminate = true
        vim.g.doom_one_plugin_lspsaga = false
        vim.cmd("colorscheme doom-one")
    end
end
-- vim.cmd([[highlight HighlightedyankRegion cterm=reverse gui=reverse]])
