local edit = {}
edit["max397574/better-escape.nvim"] = {
    lazy = true,
    config = function()
        require("better_escape").setup()
    end,
    event = "InsertEnter",
}
edit["phaazon/hop.nvim"] = {
    lazy = true,
    -- as = "hop",
    config = function()
        require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    end,
    cmd = { "HopLine", "HopLineStart", "HopWord", "HopPattern", "HopChar1", "HopChar2" },
}
edit["PHSix/faster.nvim"] = {
    lazy = true,
    event = "CursorMoved",
    -- event = { "VimEnter *" },
    config = function() -- Specifies code to run after this plugin is loaded
        vim.api.nvim_set_keymap("n", "j", "<Plug>(faster_move_j)", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("n", "k", "<Plug>(faster_move_k)", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("v", "j", "<Plug>(faster_vmove_j)", { noremap = false, silent = true })
        vim.api.nvim_set_keymap("v", "k", "<Plug>(faster_vmove_k)", { noremap = false, silent = true })
    end,
}
edit["machakann/vim-highlightedyank"] = {
    lazy = true,
    event = "TextYankPost",
}
edit["b3nj5m1n/kommentary"] = {
    lazy = true,
    config = require("configs.others").kommentary,
    event = { "BufReadPre", "BufNewFile" },
}
edit["tpope/vim-surround"] = {
    lazy = true,
    event = "BufRead",
}
edit["edluffy/specs.nvim"] = {
    lazy = true,
    -- event = { "BufReadPre", "BufNewFile" },
    event = "CursorMoved",
    config = require("configs.others").specs,
}
edit["simrat39/symbols-outline.nvim"] = {
    lazy = true,
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen" },
    config = require("configs.others").symbols,
    -- after = "nvim-lspconfig",
}
edit["abecodes/tabout.nvim"] = {
    lazy = true,
    -- dependencies = { "nvim-treesitter", "nvim-treesitter-context" },
    dependencies = { "nvim-treesitter" },
    -- after = { "nvim-cmp" },
    config = require("configs.others").tabout,
}
edit["romainl/vim-cool"] = {
    lazy = true,
    opt = true,
    -- event = { "CursorMoved", "InsertEnter" },
    event = { "BufReadPre", "BufNewFile" },
}
return edit
