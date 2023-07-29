return function()
    vim.opt.termguicolors = true
    vim.opt.list = true
    -- vim.opt.listchars:append("space:⋅")
    vim.opt.listchars:append("eol:↴")
    local indent_blankline = require("indent_blankline")
    indent_blankline.setup({
        show_end_of_line = true,
        indentLine_enabled = 1,
        char = "▏",
        use_treesitter = true,
        filetype_exclude = {
            "vista",
            "help",
            "alpha",
            "terminal",
            "packer",
            "lspinfo",
            "TelescopePrompt",
            "TelescopeResults",
            "Outline",
            "Trouble",
            "lsp-installer",
            "NvimTree",
            "dapui_scopes",
            "dapui_stacks",
            "dapui_watches",
            "dapui_breakpoints",
            "",
        },
        buftype_exclude = { "terminal", "alpha", "nofile" },
        show_trailing_blankline_indent = false,
        show_first_indent_level = true,
        context_patterns = {
            "class",
            "function",
            "method",
            "block",
            "list_literal",
            "selector",
            "^if",
            "^table",
            "if_statement",
            "while",
            "for",
            "type",
            "var",
            "import",
        },
        -- context_highlight_list = { "Error", "Warning" },
        space_char_blankline = " ",
        show_current_context = true,
        -- show_current_context_start = true,
    })
    vim.cmd("autocmd CursorMoved * IndentBlanklineRefresh")
end
