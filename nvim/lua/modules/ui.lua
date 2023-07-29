local ui = {}
ui["karb94/neoscroll.nvim"] = {
    lazy = true,
    event = "BufRead",
    config = function()
        require("neoscroll").setup()
    end,
}
ui["RRethy/vim-illuminate"] = {
    lazy = true,
    config = require("configs.others").illuminate
}
ui["goolord/alpha-nvim"] = {
    lazy = true,
    requires = { "kyazdani42/nvim-web-devicons" },
    event = "BufWinEnter",
    config = require("configs.others").alpha,
}
ui["navarasu/onedark.nvim"] = {
    lazy = true,
}
ui["kyazdani42/nvim-web-devicons"] = {}
ui["nvim-lualine/lualine.nvim"] = {
    lazy = true,
    config = require("configs.lualine"),
    dependencies = { "lsp_signature.nvim" },
    event = { "BufRead" },
}
ui["romgrk/barbar.nvim"] = {
    lazy = true,
    event = { "BufRead" },
}
ui["kazhala/close-buffers.nvim"] = {
    lazy = true,
    event = "BufRead",
    config = require("configs.others").bufdelete,
}
ui["lewis6991/gitsigns.nvim"] = {
    lazy = true,
    config = require("configs.gitsigns"),
    -- event = { "BufReadPre", "BufRead" },
    event = { "BufRead" },
    dependencies = { "plenary.nvim" },
}
ui["lukas-reineke/indent-blankline.nvim"] = {
    lazy = true,
    config = require("configs.blankline"),
    -- opt = true,
    event = "BufReadPre",
    -- after = "nvim-treesitter",
}
ui["akinsho/toggleterm.nvim"] = {
    lazy = true,
    config = require("configs.toggleterm"),
    cmd = "ToggleTerm",
}
ui["kyazdani42/nvim-tree.lua"] = {
    lazy = true,
    config = require("configs.tree"),
    event = { "BufRead" },
}
ui["rcarriga/nvim-notify"] = {
    lazy = true,
    config = require("configs.notify"),
    event = { "BufRead" },
    -- opt = true,
    -- after = "alpha-nvim"
}
ui["dstein64/nvim-scrollview"] = {
    lazy = true,
    event = "BufRead",
}
ui["olimorris/onedarkpro.nvim"] = {
    lazy = true,
}
ui["titanzero/zephyrium"] = {
    lazy = true,
}
ui["NTBBloodbath/doom-one.nvim"] = {
    lazy = true,
}
ui["p00f/nvim-ts-rainbow"] = {
    lazy = true,
    event = { "BufRead" },
    -- after = "nvim-treesitter",
}
return ui

--     "akinsho/bufferline.nvim",
--     "kdheepak/tabline.nvim",
--     "noib3/nvim-cokeline",
