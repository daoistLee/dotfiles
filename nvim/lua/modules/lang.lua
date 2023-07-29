local lang = {}
lang["nathom/filetype.nvim"] = {
    config = require("configs.others").filetype,
}
lang["onsails/lspkind-nvim"] = {
    opt = true,
}
lang["windwp/nvim-autopairs"] = {
    config = require("configs.others").autopairs,
    after = "nvim-cmp",
}
lang["mhartington/formatter.nvim"] = {
    config = require("configs.formatter"),
    ft = { "cpp", "c", "lua", "python" },
    -- cmd = { "Format", "FormatWrite" },
}
lang["j-hui/fidget.nvim"] = {
    config = function()
        require("fidget").setup()
    end,
    opt = true,
    after = "nvim-lspconfig",
    -- after = "mason-lspconfig.nvim",
    -- after = "nvim-lsp-installer",
    -- ft = { "cpp", "c", "lua", "python" },
}
lang["ray-x/lsp_signature.nvim"] = {
    opt = true,
}
lang["folke/trouble.nvim"] = {
    opt = true,
    -- after = "nvim-lsp-installer",
    -- after = "mason-lspconfig.nvim",
    after = "nvim-lspconfig",
    config = require("configs.trouble"),
}
return lang
