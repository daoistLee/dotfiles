local lsp = {}
local from_vscode = function()
    require("luasnip").config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
    })
    require("luasnip.loaders.from_vscode").lazy_load()
end
lsp["neovim/nvim-lspconfig"] = {
    lazy = true,
    config = require("configs.lspconfig"),
    ft = { "cpp", "lua", "python", "c", "java" },
    dependencies = { "cmp-nvim-lsp", "lsp_signature.nvim", "vim-illuminate", "mason-lspconfig.nvim", "tami5/lspsaga.nvim" },
    -- after = "fidget.nvim"
    -- ft = { "cpp", "lua", "python", "c" },
    -- dependencies = { "cmp-nvim-lsp", "lsp_signature.nvim", },
    -- event = { "BufReadPre", "BufNewFile" },
    -- event = "BufRead",
}
lsp["williamboman/mason.nvim"] = {
    lazy = true,
    config = require("configs.mason").mason,
}
lsp["williamboman/mason-lspconfig.nvim"] = {
    lazy = true,
    config = require("configs.mason").lspconfig,
    dependencies = { "mason.nvim" },
    -- ft = { "cpp", "lua", "python", "c" },
    -- dependencies = { "cmp-nvim-lsp", "lsp_signature.nvim","vim-illuminate", "mason.nvim", "nvim-lspconfig" },
    -- dependencies = { "cmp-nvim-lsp", "lsp_signature.nvim","vim-illuminate", "mason.nvim"  },
}
lsp["tami5/lspsaga.nvim"] = {
    lazy = true,
    config = require("configs.lspsaga"),
    -- after = "nvim-lsp-installer",
    -- after = "mason-lspconfig.nvim",
    -- opt = true,
    -- after = "nvim-lspconfig",
}
lsp["rafamadriz/friendly-snippets"] = {
    lazy = true,
}
lsp["hrsh7th/nvim-cmp"] = {
    lazy = true,
    dependencies = {
        { "L3MON4D3/LuaSnip" },
        { "lukas-reineke/cmp-under-comparator" },
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-nvim-lua" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-buffer" },
        { "lukas-reineke/cmp-rg" },
        -- { "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" },
        -- { "kdheepak/cmp-latex-symbols", after = "nvim-cmp" },
        { "hrsh7th/cmp-cmdline" },
        { "friendly-snippets" },
        { "lspkind-nvim" },
        {"windwp/nvim-autopairs"}
        -- { "octaltree/cmp-look", after = "nvim-cmp" },
        --
    },
    config = require("configs.completion"),
    event = "InsertEnter",
}
return lsp
