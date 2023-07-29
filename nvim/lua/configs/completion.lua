return function()
    -- vim.cmd([[highlight CmpItemAbbrDeprecated guifg=#D8DEE9 guibg=NONE gui=strikethrough]])
    -- vim.cmd([[highlight CmpItemKindSnippet guifg=#BF616A guibg=NONE]])
    -- vim.cmd([[highlight CmpItemKindUnit guifg=#D08770 guibg=NONE]])
    -- vim.cmd([[highlight CmpItemKindProperty guifg=#A3BE8C guibg=NONE]])
    -- vim.cmd([[highlight CmpItemKindKeyword guifg=#EBCB8B guibg=NONE]])
    -- vim.cmd([[highlight CmpItemAbbrMatch guifg=#5E81AC guibg=NONE]])
    -- vim.cmd([[highlight CmpItemAbbrMatchFuzzy guifg=#5E81AC guibg=NONE]])
    -- vim.cmd([[highlight CmpItemKindVariable guifg=#8FBCBB guibg=NONE]])
    -- vim.cmd([[highlight CmpItemKindInterface guifg=#88C0D0 guibg=NONE]])
    -- vim.cmd([[highlight CmpItemKindText guifg=#81A1C1 guibg=NONE]])
    -- vim.cmd([[highlight CmpItemKindFunction guifg=#B48EAD guibg=NONE]])
    -- vim.cmd([[highlight CmpItemKindMethod guifg=#B48EAD guibg=NONE]])
    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end
    local lspkind = require("lspkind")
    local symbol_map = require("configs.lspkind")

    -- if not packer_plugins["cmp-under-comparator"].loaded then
    --     vim.cmd([[packadd cmp-under-comparator]])
    -- end
    local cmp = require("cmp")
    cmp.setup({
        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = lspkind.cmp_format({
                mode = "symbol_text",
                maxwidth = 30,
                symbol_map = symbol_map,
                before = function(entry, vim_item)
                    local word = entry:get_insert_text()
                    if entry.completion_item.insertTextFormat == require("cmp.types").lsp.InsertTextFormat.Snippet then
                        word = vim.lsp.util.parse_snippet(word)
                    end
                    word = require("cmp.utils.str").oneline(word)

                    if
                        entry.completion_item.insertTextFormat == require("cmp.types").lsp.InsertTextFormat.Snippet
                        and string.sub(vim_item.abbr, -1, -1) == "~"
                    then
                        word = word .. "~"
                    end
                    vim_item.abbr = word
                    vim_item.dup = ({
                        buffer = 1,
                        path = 1,
                        nvim_lsp = 1,
                        rg = 1,
                    })[entry.source.name] or 0
                    return vim_item
                end,
            }),
        },
        sorting = {
            comparators = {
                -- cmp.config.compare.offset,
                -- cmp.config.compare.exact,
                -- cmp.config.compare.score,
                -- require("cmp-under-comparator").under,
                -- cmp.config.compare.kind,
                -- cmp.config.compare.sort_text,
                -- cmp.config.compare.length,
                -- cmp.config.compare.order,
            },
        },
        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
            documentation = {
                border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            },
        },
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        mapping = {
            ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {
                "i",
                "c",
            }),
            ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {
                "i",
                "c",
            }),
            ["<C-e>"] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),
            ["<CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }),
            ["<M-j>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif require("luasnip").expand_or_jumpable() then
                    vim.fn.feedkeys(
                        vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
                        ""
                    )
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<M-k>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif require("luasnip").jumpable(-1) then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                else
                    fallback()
                end
            end, { "i", "s" }),
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "treesitter" },
            { name = "cmdline" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "nvim_lua" },
            -- { name = "spell" },
            -- { name = "latex_symbols" },
            { name = "path" },
            { name = "rg" },
        },
        experimental = {
            ghost_text = false,
            native_menu = false,
        },
    })
end
