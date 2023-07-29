local ui = {}
ui["karb94/neoscroll.nvim"] = {
    event = "BufRead",
    config = function()
        require("neoscroll").setup()
    end,
}
ui["RRethy/vim-illuminate"] = {
    opt = true,
    config = require("configs.others").illuminate
}
ui["goolord/alpha-nvim"] = {
    requires = { "kyazdani42/nvim-web-devicons" },
    opt = true,
    event = "BufWinEnter",
    config = require("configs.others").alpha,
}
ui["navarasu/onedark.nvim"] = {
    opt = true,
}
ui["kyazdani42/nvim-web-devicons"] = {}
ui["nvim-lualine/lualine.nvim"] = {
    config = require("configs.lualine"),
    wants = { "lsp_signature.nvim" },
    event = { "BufRead" },
}
ui["romgrk/barbar.nvim"] = {
    event = { "BufRead" },
}
ui["kazhala/close-buffers.nvim"] = {
    event = "BufRead",
    config = require("configs.others").bufdelete,
}
ui["lewis6991/gitsigns.nvim"] = {
    config = require("configs.gitsigns"),
    -- event = { "BufReadPre", "BufRead" },
    event = { "BufRead" },
    wants = { "plenary.nvim" },
    -- ft = {"lua", "python","cpp","c"},
    -- opt = true,
}
ui["lukas-reineke/indent-blankline.nvim"] = {
    config = require("configs.blankline"),
    opt = true,
    -- event = "BufReadPre",
    -- after = "nvim-treesitter",
}
ui["akinsho/toggleterm.nvim"] = {
    config = require("configs.toggleterm"),
    cmd = "ToggleTerm",
}
ui["kyazdani42/nvim-tree.lua"] = {
    config = require("configs.tree"),
    event = { "BufRead" },
}
ui["rcarriga/nvim-notify"] = {
    config = require("configs.notify"),
    -- opt = true,
    -- after = "alpha-nvim"
}
ui["dstein64/nvim-scrollview"] = {
    event = "BufRead",
}
ui["olimorris/onedarkpro.nvim"] = {
    opt = true,
}
ui["titanzero/zephyrium"] = {
    opt = true,
}
ui["NTBBloodbath/doom-one.nvim"] = {
    opt = true,
}
ui["p00f/nvim-ts-rainbow"] = {
    opt = true,
    after = "nvim-treesitter",
}
return ui

--     "akinsho/bufferline.nvim",
--     "kdheepak/tabline.nvim",
--     "noib3/nvim-cokeline",
