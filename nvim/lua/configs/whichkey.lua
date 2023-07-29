return function()
    local whick_key = require("which-key")
    whick_key.setup({
        triggers = { "<leader>" },
        plugins = {
            marks = true, -- shows a list of your marks on ' and `
            registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            spelling = {
                enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                suggestions = 20, -- how many suggestions should be shown in the list?
            },
        },
        icons = {
            breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
            -- separator = "➜ ", -- symbol used between a key and it's label
            separator = "»", -- symbol used between a key and it's label
            group = "+", -- symbol prepended to a group
        },
        window = {
            border = "none", -- none, single, double, shadow
            position = "bottom", -- bottom, top
            margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
            padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
        },
        layout = {
            height = { min = 1, max = 6 }, -- min and max height of the columns
            width = { min = 30, max = 40 }, -- min and max width of the columns
            spacing = 3, -- spacing between columns
            align = "left", -- align columns left, center or right
        },
    })
    whick_key.register({
        ["<leader>"] = { name = "which key" },
        ["<leader>b"] = { name = "BDelete" },
        ["<leader>bh"] = { "<cmd>lua require'tasks'.bdelete('hidden')<CR>", "hidden" },
        ["<leader>bu"] = { "<cmd>lua require'tasks'.bdelete('nameless')<CR>", "nameless" },
        ["<leader>bc"] = { "<cmd>lua require'tasks'.bdelete('this')<CR>", "this" },
        ["<leader>f"] = { name = "telescope" },
        ["<leader>fc"] = { "<cmd>Telescope commands<cr>", "commands" },
        ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find File" },
        ["<leader>fl"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "fuzzy search" },
        ["<leader>fo"] = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "Find buffers" },
        ["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "Live grep" },
        ["<leader>fG"] = { "<cmd>Telescope grep_string<cr>", "grep_string" },
        ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "help tags" },
        ["<leader>fd"] = { "<cmd>Telescope diagnostics<cr>", "diagnostics" },
        ["<leader>fs"] = { "<cmd>w!<cr>", "Save File" },
        ["<leader>fe"] = { "<cmd>edit ~/dotfiles/nvim/lua/utils.lua<cr>", "Edit utils.lua" },
        ["<leader>w"] = { name = "window" },
        ["<leader>wq"] = { "<Cmd>qall!<CR>", "window Exit" },
        ["<leader>wc"] = { "<Cmd>quit!<CR>", "window conceal" },
        ["<leader>ww"] = { "<C-w>w", "window next" },
        ["<leader>wh"] = { "<C-w>h", "window left" },
        ["<leader>wj"] = { "<C-w>j", "window down" },
        ["<leader>wk"] = { "<C-w>k", "window up" },
        ["<leader>wl"] = { "<C-w>l", "window right" },
        ["<leader>wn"] = { "<cmd>lua require('nvim-window').pick()<CR>", "pick" },
        ["<leader>w-"] = { "<Cmd>sp<CR><C-w>j", "split" },
        ["<leader>w\\"] = { "<Cmd>vsp<CR><C-w>l", "vsplit" },
        -- ["<leader>n"] = { name = "nvimtree" },
        -- ["<leader>nt"] = { "<Cmd>NvimTreeToggle<CR><Cmd>NvimTreeRefresh<CR>", "NvimTree Toggle" },
        -- ["<leader>nf"] = { "<Cmd>NvimTreeFindFile<CR><Cmd>NvimTreeRefresh<CR>", "NvimTree FindFile" },
        -- ["<leader>no"] = { "<Cmd>NvimTreeFocus<CR><Cmd>NvimTreeRefresh<CR>", "NvimTree FindFile" },
        ["<leader>p"] = { name = "Packer" },
        ["<leader>pi"] = { "<Cmd>PackerInstall<CR>", "PackerInstall" },
        ["<leader>pc"] = { "<Cmd>PackerCompile<CR>", "PackerCompile" },
        ["<leader>pC"] = { "<Cmd>PackerClean<CR>", "PackerClean" },
        ["<leader>pS"] = { "<Cmd>PackerStatus<CR>", "PackerStatus" },
        ["<leader>ps"] = { "<Cmd>PackerSync<CR>", "PackerSync" },
        ["<leader>pu"] = { "<Cmd>PackerUpdate<CR>", "PackerUpdate" },
        ["<leader>pv"] = { "<Cmd>PackerConvert<CR>", "PackerConvert" },
        ["<leader><leader>"] = { name = "hop" },
        ["<leader><Leader>w"] = { "<cmd>HopWord<cr>", "HopWord" },
        ["<leader><Leader>p"] = { "<cmd>HopPattern<cr>", "HopPattern" },
        ["<leader><Leader>l"] = { "<cmd>HopLine<cr>", "HopLine" },
        -- ["<leader>t"] = { name = "Toggle" },
        -- ["<leader>tt"] = { "<cmd>ToggleTerm<cr>", "ToggleTerm" },
        -- ["<leader>ts"] = { "<cmd>SymbolsOutline<cr>", "SymbolsOutline" },
        -- ["<leader>tl"] = { "<cmd>Trouble<cr>", "Trouble" },
        -- ["<leader>l"] = { name = "+Lsp" },
        -- ["<leader>lk"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "hover" },
        -- ["<leader>ls"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "signature_help" },
        -- ["<leader>lR"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "rename" },
        -- ["<leader>lr"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "references" },
        -- ["<leader>le"] = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "show_line_diagnostics" },
        -- ["<leader>lq"] = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "set_loclist" },
        -- ["<leader>lf"] = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "formatting" },
        ["<leader>l"] = { name = "lspsaga" },
        ["<leader>lk"] = { "<cmd>Lspsaga hover_doc<CR>", "HoverDoc" },
        ["<leader>lh"] = { "<cmd>Lspsaga lsp_finder<CR>", "lsp finder" },
        ["<leader>la"] = { "<cmd>Lspsaga code_action<CR>", "code action" },
        ["<leader>ls"] = { "<cmd>Lspsaga signature_help<CR>", "signature help" },
        ["<leader>lr"] = { "<cmd>Lspsaga rename<CR>", "rename" },
        ["<leader>ld"] = { "<cmd>Lspsaga preview_definition<CR>", "preview definition" },
        ["<leader>lo"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", "show line diagnostics" },
        ["<leader>ln"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "diagnostic jump next" },
        ["<leader>lp"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "diagnostic jump prev" },
        ["<leader>lf"] = { "<cmd>FormatWrite<CR>", "FormatWrite" },
        ["<leader>c"] = { name = "comment" },
        ["<leader>ci"] = { "<Plug>kommentary_line_increase", "increase" },
        ["<leader>cd"] = { "<Plug>kommentary_line_decrease", "decrease" },
        ["<leader>o"] = { name = "open" },
        ["<leader>ot"] = { "<cmd>ToggleTerm<cr>", "ToggleTerm" },
        ["<leader>os"] = { "<cmd>SymbolsOutline<cr>", "SymbolsOutline" },
        ["<leader>oT"] = { "<cmd>Trouble<cr>", "Trouble" },
        ["<leader>op"] = { "<Cmd>NvimTreeToggle<CR><Cmd>NvimTreeRefresh<CR>", "NvimTree Toggle" },
        ["<leader>of"] = { "<Cmd>NvimTreeFindFile<CR><Cmd>NvimTreeRefresh<CR>", "NvimTree FindFile" },
        -- ["<leader>oo"] = { "<Cmd>NvimTreeFocus<CR><Cmd>NvimTreeRefresh<CR>", "NvimTree FindFile" },
    })
    whick_key.register({
        ["<leader>c"] = { name = "comment" },
        ["<leader>ci"] = { "<Plug>kommentary_visual_increase", "increase" },
        ["<leader>cd"] = { "<plug>kommentary_visual_decrease", "decrease" },
        ["<leader><leader>"] = { name = "hop" },
        ["<leader><Leader>w"] = { "<cmd>HopWord<cr>", "HopWord" },
        ["<leader><Leader>p"] = { "<cmd>HopPattern<cr>", "HopPattern" },
        ["<leader><Leader>l"] = { "<cmd>HopLine<cr>", "HopLine" },
    }, {
        mode = "v",
    })
end
