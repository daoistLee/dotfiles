local lang = {}
-- lang["nathom/filetype.nvim"] = {
--     config = require("configs.others").filetype,
-- }
lang["onsails/lspkind-nvim"] = {
    lazy = true,
}
lang["windwp/nvim-autopairs"] = {
    lazy = true,
    config = require("configs.others").autopairs,
}
lang["mhartington/formatter.nvim"] = {
    lazy = true,
    config = require("configs.formatter"),
    ft = { "cpp", "c", "lua", "python" },
    -- cmd = { "Format", "FormatWrite" },
}
-- lang["j-hui/fidget.nvim"] = {
--     lazy = true,
--     config = function()
--         require("fidget").setup()
--     end,
--     ft = { "cpp", "c", "lua", "python" },
-- }
lang["ray-x/lsp_signature.nvim"] = {
    lazy = true,
}
lang["folke/trouble.nvim"] = {
    lazy = true,
    -- opt = true,
    -- after = "nvim-lsp-installer",
    -- after = "mason-lspconfig.nvim",
    -- after = "nvim-lspconfig",
    config = require("configs.trouble"),
}
return lang
