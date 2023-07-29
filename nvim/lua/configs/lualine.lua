return function()
    vim.g.qf_disable_statusline = true
    local function scopes()
        return [[scopes]]
    end
    local function breakpoints()
        return [[breakpoints]]
    end
    local function stacks()
        return [[stacks]]
    end
    local function watches()
        return [[watches]]
    end
    local dapui_scopes = {
        sections = { lualine_a = { scopes } },
        filetypes = { "dapui_scopes" },
    }
    local dapui_breakpoints = {
        sections = { lualine_a = { breakpoints } },
        filetypes = { "dapui_breakpoints" },
    }
    local dapui_stacks = {
        sections = { lualine_a = { stacks } },
        filetypes = { "dapui_stacks" },
    }
    local dapui_watches = {
        sections = { lualine_a = { watches } },
        filetypes = { "dapui_watches" },
    }

    local function label()
        return [[quickfix]]
    end
    local qf = {
        sections = { lualine_a = { label }, lualine_z = { "location" } },
        filetypes = { "qf" },
    }

    local buffers = {
        "buffers",
        filetype_names = {
            -- TelescopePrompt = "Telescope",
            -- packer = "Packer",
        },
    }
    local diagnostics = {
        "diagnostics",
        -- Table of diagnostic sources, available sources are:
        --   'nvim_lsp', 'nvim_diagnostic', 'coc', 'ale', 'vim_lsp'.
        -- or a function that returns a table as such:
        --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
        sources = { "nvim_diagnostic", "nvim_lsp" },
        -- Displays diagnostics for the defined severity types
        sections = { "error", "warn", "info", "hint" },
        diagnostics_color = {
            -- Same values as the general color option can be used here.
            error = "DiagnosticError", -- Changes diagnostics' error color.
            warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
            info = "DiagnosticInfo", -- Changes diagnostics' info color.
            hint = "DiagnosticHint", -- Changes diagnostics' hint color.
        },
        -- symbols = { error = "E", warn = "W", info = "I", hint = "H" },
        colored = false, -- Displays diagnostics status in color if set to true.
        update_in_insert = false, -- Update diagnostics in insert mode.
        always_visible = false, -- Show diagnostics even if there are none.
    }
    local current_signature = function(width)
        if not packer_plugins["lsp_signature.nvim"] or packer_plugins["lsp_signature.nvim"].loaded == false then
            return ""
        end
        local sig = require("lsp_signature").status_line(80)
        return sig.label .. "🐼" .. sig.hint
    end

    local lualine = require("lualine")
    lualine.setup({
        options = {
            icons_enabled = true,
            theme = "auto",
            -- theme = "onedark",
            component_separators = "│",--"|"
            -- component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            -- section_separators = { left = "", right = "" },
            -- section_separators = { left = "", right = "" },
            -- component_separators = { left = "", right = "" },
            disabled_filetypes = {
                "minimap"
                -- "codelldb",
                -- "toggleterm",
                -- "NvimTree",
                -- "Outline",
                -- "Trouble",
            }, -- "dapui_scopes", "dapui_breakpoints", "dapui_stacks", "dapui_watches", "dap-repl" "vista_kind",
        },
        -- tabline = {
        --     lualine_a = { buffers },
        --     lualine_b = { "" },
        --     lualine_c = { "" },
        --     lualine_x = {},
        --     lualine_y = { diagnostics, "diff" },
        --     lualine_z = { { "tabs" } },
        -- },
        sections = {
            lualine_a = { { "mode" } },
            lualine_b = { "branch" },
            lualine_c = { { "filename" }, current_signature },
            -- lualine_x = { "encoding", { "fileformat" } , { "filetype", icon_only = true } },
            lualine_x = { "encoding", { "filetype" } }, -- , { "fileformat" },{ "os.date('%a')" },
            lualine_y = { "progress" },
            lualine_z = { { "location" } },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            -- lualine_c = { " %= ", " %t %m ", " %3p " },
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        extensions = {
            "nvim-tree",
            "symbols-outline",
            -- "quickfix",
            "toggleterm",
            dapui_scopes,
            dapui_breakpoints,
            dapui_watches,
            dapui_stacks,
            qf,
        }
    })
end
