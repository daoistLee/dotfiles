return function()
    local formatter = require("formatter")
    local formatter_path = vim.fn.stdpath("data") .. "/mason/bin/"
    formatter.setup({
        filetype = {
            cpp = {
                function()
                    return {
                        -- exe = "clang-format",
                        exe = formatter_path .. "clang-format",
                        args = {
                            "--style='{Language: Cpp ,BasedOnStyle: Google, Standard: Cpp11, AccessModifierOffset: -2, AlwaysBreakTemplateDeclarations: true, BinPackParameters: true, SpacesInParentheses: false, SpaceInEmptyParentheses:	false, BreakBeforeBinaryOperators: All, BreakBeforeBraces: Custom, ColumnLimit:     160, ContinuationIndentWidth: 4, IndentCaseLabels: true, TabWidth: 4, IndentWidth: 4, UseTab: Never, BreakBeforeBraces: Attach}'",
                            -- "-style=file",
                            "--assume-filename",
                            vim.api.nvim_buf_get_name(0),
                        },
                        stdin = true,
                        cwd = vim.fn.expand("%:p:h"), -- Run clang-format in cwd of the file.
                    }
                end,
            },
            c = {
                function()
                    return {
                        -- exe = "clang-format",
                        exe = formatter_path .. "clang-format",
                        args = {
                            "--style='{BasedOnStyle: Microsoft, IndentWidth: 4}'",
                            "--assume-filename",
                            vim.api.nvim_buf_get_name(0),
                        },
                        stdin = true,
                        cwd = vim.fn.expand("%:p:h"), -- Run clang-format in cwd of the file.
                    }
                end,
            },
            python = {
                function()
                    return {
                        -- exe = vim.fn.stdpath("data") .. "/mason/packages/autopep8/venv/bin/python3 -m autopep8",
                        exe = formatter_path .. "autopep8",
                        args = {
                            "--in-place --aggressive --aggressive",
                            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                        },
                        stdin = false,
                    }
                end,
            },
            lua = {
                -- luafmt
                function()
                    return {
                        -- exe = vim.fn.stdpath('data') .. '/formatter/stylua',
                        exe = formatter_path .. "stylua",
                        args = {
                            "--indent-type",
                            "Spaces",
                            "--indent-width",
                            4,
                            vim.api.nvim_buf_get_name(0),
                        },
                        stdin = false,
                    }
                end,
            },
        },
    })
end
--
