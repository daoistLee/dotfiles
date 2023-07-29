local tool = {}
tool["lewis6991/impatient.nvim"] = {
    opt = true,
}
tool["gelguy/wilder.nvim"] = {
    requires = { { "romgrk/fzy-lua-native", after = "wilder.nvim" } },
    event = "CmdlineEnter",
    config = require("configs.others").wilder,
}
tool["hrsh7th/vim-eft"] = {
    -- opt = true,
    event = "BufRead",
    config = require("configs.others").eft,
}
tool["junegunn/vim-easy-align"] = {
    event = "BufRead",
    config = require("configs.others").easyaign,
}
tool["https://gitlab.com/yorickpeterse/nvim-window.git"] = {
    config = require("configs.window"),
    -- opt = true,
    event = "BufRead",
}
tool["sindrets/winshift.nvim"] = {
    event = "BufRead",
    config = require("configs.winshift"),
}
tool["beauwilliams/focus.nvim"] = {
    -- event = "BufRead",
    cmd = { " FocusSplitNicely", "FocusSplitCycle" },
    module = "focus",
    config = function()
        require("focus").setup({ hybridnumber = false })
    end,
}
tool["h-hg/fcitx.nvim"] = {
    opt = true,
    -- event = { "BufReadPre", "BufNewFile" },
}
tool["nvim-telescope/telescope-fzf-native.nvim"] = {
    run = "make",
    after = "telescope.nvim",
}
tool["nvim-lua/plenary.nvim"] = {
    opt = false,
}
tool["nvim-lua/popup.nvim"] = {
    opt = true,
}
tool["nvim-telescope/telescope.nvim"] = {
    config = require("configs.telescope"),
    cmd = "Telescope",
    wants = { "plenary.nvim", "telescope-fzf-native.nvim", "popup.nvim" },
}
tool["nvim-treesitter/nvim-treesitter"] = {
    config = require("configs.treesitter"),
    run = ":TSUpdate",
    event = { "BufRead" }, --"BufReadPre"
}
tool["nvim-treesitter/completion-treesitter"] = {
    after = "nvim-treesitter",
}
tool["nvim-treesitter/nvim-treesitter-refactor"] = {
    after = "nvim-treesitter",
}
tool["nvim-treesitter/nvim-treesitter-textobjects"] = {
    after = "nvim-treesitter",
}
tool["folke/which-key.nvim"] = {
    config = require("configs.whichkey"),
}
tool["airblade/vim-rooter"] = {
    event = "BufRead",
    config = function()
        vim.g.rooter_patterns = { ".vscode", ".git", "README.md" }
    end,
}
tool["dstein64/vim-startuptime"] = {}
tool["ethanholz/nvim-lastplace"] = {
    event = "BufRead",
    config = require("configs.others").lastplace,
}
tool["rhysd/clever-f.vim"] = {
    opt = true,
    -- event = "BufRead",
    config = require("configs.others").cleverf
}
tool['brooth/far.vim'] = {
    event = "BufRead",
    config = require("configs.others").far
}
tool['mg979/vim-visual-multi'] = {
    event = "BufRead",
    config = require("configs.others").multi
}
return tool
--     "ygm2/rooter.nvim", -- nvim-tree don't work well
--     "ms-jpq/chadtree",
-- 'wfxr/minimap.vim',
--
-- tool["lewis6991/nvim-treesitter-context"] = {
--     after = "nvim-treesitter",
--     config = function()
--         require("treesitter-context").setup({
--             enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
--             throttle = true, -- Throttles plugin updates (may improve performance)
--             max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
--             patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
--                 -- For all filetypes
--                 -- Note that setting an entry here replaces all other patterns for this entry.
--                 -- By setting the 'default' entry below, you can control which nodes you want to
--                 -- appear in the context window.
--                 default = {
--                     "class",
--                     "function",
--                     "method",
--                     -- 'for', -- These won't appear in the context
--                     -- 'while',
--                     -- 'if',
--                     -- 'switch',
--                     -- 'case',
--                 },
--                 -- Example for a specific filetype.
--                 -- If a pattern is missing, *open a PR* so everyone can benefit.
--                 --   rust = {
--                 --       'impl_item',
--                 --   },
--             },
--             exact_patterns = {
--                 -- Example for a specific filetype with Lua patterns
--                 -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
--                 -- exactly match "impl_item" only)
--                 -- rust = true,
--             },
--         })
--     end,
-- }
