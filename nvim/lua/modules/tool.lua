local tool = {}
tool["gelguy/wilder.nvim"] = {
    lazy = true,
    dependencies = { "romgrk/fzy-lua-native"},
    event = "CmdlineEnter",
    config = require("configs.others").wilder,
}
tool["hrsh7th/vim-eft"] = {
    lazy = true,
    event = "BufRead",
    config = require("configs.others").eft,
}
tool["junegunn/vim-easy-align"] = {
    lazy = true,
    event = "BufRead",
    config = require("configs.others").easyaign,
}
tool["https://gitlab.com/yorickpeterse/nvim-window.git"] = {
    lazy = true,
    config = require("configs.window"),
    event = "BufRead",
}
tool["sindrets/winshift.nvim"] = {
    lazy = true,
    event = "BufRead",
    config = require("configs.winshift"),
}
tool["beauwilliams/focus.nvim"] = {
    lazy = true,
    event = "BufRead",
    cmd = { " FocusSplitNicely", "FocusSplitCycle" },
    -- module = "focus",
    config = function()
        require("focus").setup({ hybridnumber = false })
    end,
}
tool["h-hg/fcitx.nvim"] = {
    lazy = true,
    -- event = { "BufReadPre", "BufNewFile" },
}
tool["nvim-telescope/telescope-fzf-native.nvim"] = {
    lazy = true,
    build = "make",
    -- after = "telescope.nvim",
}
tool["nvim-lua/plenary.nvim"] = {
    lazy = true,
}
tool["nvim-lua/popup.nvim"] = {
    lazy = true,
}
tool["nvim-telescope/telescope.nvim"] = {
    lazy = true,
    config = require("configs.telescope"),
    cmd = "Telescope",
    dependencies = { "plenary.nvim", "telescope-fzf-native.nvim", "popup.nvim" },
}
tool["nvim-treesitter/nvim-treesitter"] = {
    lazy = true,
    config = require("configs.treesitter"),
    run = ":TSUpdate",
    event = { "BufRead" }, --"BufReadPre"
}
tool["nvim-treesitter/completion-treesitter"] = {
    lazy = true,
    -- after = "nvim-treesitter",
}
tool["nvim-treesitter/nvim-treesitter-refactor"] = {
    lazy = true,
    -- after = "nvim-treesitter",
}
tool["nvim-treesitter/nvim-treesitter-textobjects"] = {
    lazy = true,
    -- after = "nvim-treesitter",
}
tool["folke/which-key.nvim"] = {
    config = require("configs.whichkey"),
}
tool["airblade/vim-rooter"] = {
    lazy = true,
    event = "BufRead",
    config = function()
        vim.g.rooter_patterns = { ".vscode", ".git", "README.md", "CMakeLists.txt" }
    end,
}
tool["dstein64/vim-startuptime"] = {}
tool["ethanholz/nvim-lastplace"] = {
    lazy = true,
    event = "BufRead",
    config = require("configs.others").lastplace,
}
tool["rhysd/clever-f.vim"] = {
    lazy = true,
    -- opt = true,
    -- event = "BufRead",
    config = require("configs.others").cleverf
}
tool['brooth/far.vim'] = {
    lazy = true,
    event = "BufRead",
    config = require("configs.others").far
}
tool['mg979/vim-visual-multi'] = {
    lazy = true,
    event = "BufRead",
    config = require("configs.others").multi
}
return tool
