local lsp = {}
local from_vscode = function()
    require("luasnip").config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
    })
    require("luasnip.loaders.from_vscode").lazy_load()
end
lsp["neovim/nvim-lspconfig"] = {
    config = require("configs.lspconfig"),
    ft = { "cpp", "lua", "python", "c", "java" },
    opt = true,
    -- wants = { "cmp-nvim-lsp", "lsp_signature.nvim","vim-illuminate", "mason.nvim" },
    wants = { "cmp-nvim-lsp", "lsp_signature.nvim","vim-illuminate", "mason-lspconfig.nvim" },
    -- after = "fidget.nvim"
    -- ft = { "cpp", "lua", "python", "c" },
    -- wants = { "cmp-nvim-lsp", "lsp_signature.nvim", },
    -- event = { "BufReadPre", "BufNewFile" },
    -- event = "BufRead",
}
lsp["williamboman/mason.nvim"] = {
    opt = true,
    config = require("configs.mason").mason,
}
lsp["williamboman/mason-lspconfig.nvim"] = {
    opt = true,
    config = require("configs.mason").lspconfig,
    wants = {"mason.nvim"}
    -- ft = { "cpp", "lua", "python", "c" },
    -- wants = { "cmp-nvim-lsp", "lsp_signature.nvim","vim-illuminate", "mason.nvim", "nvim-lspconfig" },
    -- wants = { "cmp-nvim-lsp", "lsp_signature.nvim","vim-illuminate", "mason.nvim"  },
}
lsp["tami5/lspsaga.nvim"] = {
    config = require("configs.lspsaga"),
    -- after = "nvim-lsp-installer",
    -- after = "mason-lspconfig.nvim",
    -- opt = true,
    after = "nvim-lspconfig",
}
lsp["rafamadriz/friendly-snippets"] = {
    opt = true,
}
lsp["hrsh7th/nvim-cmp"] = {
    requires = {
        { "L3MON4D3/LuaSnip", after = "nvim-cmp", config = from_vscode },
        { "lukas-reineke/cmp-under-comparator", after = "nvim-cmp" },
        { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
        { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
        { "hrsh7th/cmp-path", after = "nvim-cmp" },
        { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
        { "lukas-reineke/cmp-rg", after = "nvim-cmp" },
        -- { "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" },
        -- { "kdheepak/cmp-latex-symbols", after = "nvim-cmp" },
        { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
        -- { "octaltree/cmp-look", after = "nvim-cmp" },
        --
    },
    config = require("configs.completion"),
    event = "InsertEnter",
    wants = { "friendly-snippets", "lspkind-nvim" },
}
return lsp
--     "neoclide/coc.nvim",
-- lsp["williamboman/nvim-lsp-installer"] = {
--     opt = true,
--     -- -- ft = { "cpp", "lua", "python", "c", "java" },
--     -- ft = { "cpp", "lua", "python", "c" },
--     -- wants = { "cmp-nvim-lsp", "lsp_signature.nvim", "nvim-lspconfig", "vim-illuminate" },
--     -- -- wants = { "cmp-nvim-lsp", "lsp_signature.nvim", "nvim-lspconfig" },
--     -- config = require("configs.lspconfig"),
--     -- -- cmd = "LspInstall",
-- }
