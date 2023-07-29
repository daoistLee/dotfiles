local opt_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/"
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
        vim.cmd([[packadd onedarkpro.nvim]])
        local onedarkpro = require("onedarkpro")
        onedarkpro.setup({
            theme = "onedark",
            colors = {}, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
            highlights = {}, -- Override default highlight groups
            -- ft_highlights = {}, -- Override default highlight groups for specific filetypes
            plugins = { -- Override which plugins highlight groups are loaded
                -- all = false,
                native_lsp = true,
                polygot = true,
                treesitter = true,
                nvim_cmp = false,
                hop = false,
                -- NOTE: Other plugins have been omitted for brevity
            },
            styles = {
                strings = "NONE", -- Style that is applied to strings
                comments = "italic", -- Style that is applied to comments
                keywords = "NONE", -- Style that is applied to keywords
                functions = "NONE", -- Style that is applied to functions
                variables = "NONE", -- Style that is applied to variables
            }, -- Where italic, bold, underline and NONE are possible values for styles.
            options = {
                bold = false, -- Use the themes opinionated bold styles?
                italic = false, -- Use the themes opinionated italic styles?
                underline = false, -- Use the themes opinionated underline styles?
                undercurl = false, -- Use the themes opinionated undercurl styles?
                cursorline = true, -- Use cursorline highlighting?
                transparency = false, -- Use a transparent background?
                terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
                window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
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
