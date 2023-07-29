return function()
    local function custom_cwd()
        if vim.loop.cwd() == vim.loop.os_homedir() then
            return vim.fn.expand("%:p:h")
        end
        return vim.loop.cwd()
    end
    -- vim.g.Illuminate_ftblacklist = { "NvimTree", "Outline" }
    -- vim.api.nvim_command([[ hi def link LspReferenceText CursorLine ]])
    -- vim.api.nvim_command([[ hi def link LspReferenceWrite CursorLine ]])
    -- vim.api.nvim_command([[ hi def link LspReferenceRead CursorLine ]])
    -- vim.api.nvim_command([[hi link illuminatedWord VisualCursorLine]])
    vim.api.nvim_set_keymap(
        "n",
        "<a-n>",
        '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>',
        { noremap = true }
    )
    vim.api.nvim_set_keymap(
        "n",
        "<a-p>",
        '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>',
        { noremap = true }
    )

    local custom_capabilities = vim.lsp.protocol.make_client_capabilities()
    custom_capabilities = require("cmp_nvim_lsp").default_capabilities(custom_capabilities)
    custom_capabilities.textDocument.completion.completionItem.snippetSupport = true
    custom_capabilities.textDocument.completion.completionItem.preselectSupport = true
    custom_capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
    custom_capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
    custom_capabilities.textDocument.completion.completionItem.deprecatedSupport = true
    custom_capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
    custom_capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
    custom_capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    }
    custom_capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }

    local custom_attach = function(client, bufnr)
        local lsp_publish_diagnostics_options = {
            virtual_text = {
                prefix = "»",
                spacing = 0,
            },
            signs = true,
            underline = false,
            update_in_insert = false, -- update diagnostics insert mode
        }
        vim.lsp.handlers["textDocument/publishDiagnostics"] =
            vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, lsp_publish_diagnostics_options)
        require("illuminate").on_attach(client)
        require("lsp_signature").on_attach({
            bind = false, -- This is mandatory, otherwise border config won't get registered.
            floating_window = false,
            hint_enable = false,
            always_trigger = false,
        }, bufnr)
        -- lsp_highlight_document(client)
    end

    local lspconfig = require("lspconfig")
    local function switch_source_header_splitcmd(bufnr, splitcmd)
        bufnr = lspconfig.util.validate_bufnr(bufnr)
        local clangd_client = lspconfig.util.get_active_client_by_name(bufnr, "clangd")
        local params = { uri = vim.uri_from_bufnr(bufnr) }
        if clangd_client then
            clangd_client.request("textDocument/switchSourceHeader", params, function(err, result)
                if err then
                    error(tostring(err))
                end
                if not result then
                    vim.notify(
                        "Corresponding file can’t be determined",
                        vim.log.levels.ERROR,
                        { title = "LSP Error!" }
                    )
                    return
                end
                vim.api.nvim_command(splitcmd .. " " .. vim.uri_to_fname(result))
            end)
        else
            vim.notify(
                "Method textDocument/switchSourceHeader is not supported by any active server on this buffer",
                vim.log.levels.ERROR,
                { title = "LSP Error!" }
            )
        end
    end
    -- local server_path = vim.fn.stdpath("data") .. "/lsp_servers"
    local server_path = vim.fn.stdpath("data") .. "/mason/"

    local servers = {}
    -- servers["pylsp"] = {
    --     cmd = {
    --         server_path .. "bin/pylsp",
    --         -- server_path .. "packages/python-lsp-server/venv/bin/python3 -m" .. " python-lsp-server",
    --         -- "--stdio",
    --     },
    --     on_attach = function(client, bufnr)
    --         custom_attach(client, bufnr)
    --     end,
    --     capabilities = custom_capabilities,
    --     flags = {
    --         debounce_text_changes = 150,
    --     },
    --     root_dir = custom_cwd,
    --     -- root_dir = lspconfig.util.root_pattern("__pycache__", ".git", ".vscode"),
    --     settings = {
    --         python = {
    --             plugins = {
    --                 autopep8 = {
    --                     enable = true,
    --                 },
    --                 flake8 = {
    --                     enable = true,
    --                 },
    --             },
    --             -- analysis = {
    --             --     useLibraryCodeForTypes = false,
    --             --     autoImportCompletions = true,
    --             --     autoSearchPaths = true,
    --             --     diagnosticMode = "openFilesOnly",
    --             --     -- diagnosticMode = "workspace",
    --             --     typeCheckingMode = "basic",
    --             -- },
    --         },
    --     },
    -- }
    servers["jedi_language_server"] = {
        cmd = {
            server_path .. "bin/jedi-language-server",
        },
        filetypes = { "python" },
        root_dir = custom_cwd,
        single_file_support = true,
    }
    servers["clangd"] = {
        on_attach = function(client, bufnr)
            -- client.server_capabilities.document_formatting = false
            -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-s>", "<Cmd>ClangdSwitchSourceHeader<cr>", { noremap = true })
            custom_attach(client, bufnr)
        end,
        capabilities = custom_capabilities,
        cmd = {
            server_path .. "bin/clangd",
            -- "--background-index",
            -- -- "-std=c++11",
            -- "--pch-storage=memory",
            -- "--query-driver=/usr/bin/g++,/usr/bin/gcc",
            -- "--compile-commands-dir=build",
            -- "--clang-tidy",
            -- -- "--clang-tidy-checks=performance-*,bugprone-*",
            -- "--all-scopes-completion",
            -- "--cross-file-rename",
            -- "--completion-style=detailed",
            -- -- "--suggest-missing-includes",
            -- "--header-insertion-decorators",
            -- "--header-insertion=iwyu",
        },
        args = {
            "--background-index",
            "-std=c++11",
            "--pch-storage=memory",
            "--compile-commands-dir=build",
            "--clang-tidy",
            -- "--clang-tidy-checks=performance-*,bugprone-*",
            "--all-scopes-completion",
            "--completion-style=detailed",
            "--query-driver=/usr/bin/g++,/usr/bin/gcc",
            "--suggest-missing-includes",
            "--header-insertion=iwyu",
        },
        flags = {
            debounce_text_changes = 150,
        },
        commands = {
            ClangdSwitchSourceHeader = {
                function()
                    switch_source_header_splitcmd(0, "edit")
                end,
                description = "Open source/header in current buffer",
            },
            ClangdSwitchSourceHeaderVSplit = {
                function()
                    switch_source_header_splitcmd(0, "vsplit")
                end,
                description = "Open source/header in a new vsplit",
            },
            ClangdSwitchSourceHeaderSplit = {
                function()
                    switch_source_header_splitcmd(0, "split")
                end,
                description = "Open source/header in a new split",
            },
        },
        -- filetypes = { "c", "cpp", "objc", "objcpp" },
        single_file_support = true,
        -- fallbackFlags = {
        --     "-std=c++11",
        --     "-I./include/"
        -- },
        -- root_dir = custom_cwd,
        -- root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git", ".vscode"),
        root_dir = lspconfig.util.root_pattern("CMakeLists.txt", ".git", ".vscode", "README.md"),
    }
    local runtime_path = vim.split(package.path, ";")
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua") -- table.insert(runtime_path, "lua/?/init.lua")
    servers["lua_ls"] = {
        on_attach = function(client, bufnr)
            custom_attach(client, bufnr)
        end,
        capabilities = custom_capabilities,
        -- cmd = { "lua-language-server", string.format("--logpath=%s/.cache/nvim/sumneko_lua", vim.loop.os_homedir()) },
        cmd = {
            server_path .. "bin/lua-language-server",
            -- "-E",
            -- server_path .. "packages/lua-language-server/extension/server/bin/main.lua",
        },
        -- root_dir = lspconfig.util.root_pattern(".git", ".vscode"),
        root_dir = custom_cwd,
        filetypes = { "lua" },
        single_file_support = true,
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                    path = runtime_path,
                },
                diagnostics = {
                    enable = true,
                    globals = { "vim", "packer_plugins" },
                    -- globals = { "vim", "packer_plugins", "awesome", "use", "client", "root", "s", "screen" },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    -- library = vim.api.nvim_get_runtime_file("", true),
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                        -- [vim.fn.stdpath("config") .. "/lua"] = true,
                        -- [vim.fn.expand "$HOME/dotfiles/nvim/lua"] = true,
                        -- [vim.fn.expand "$HOME/.local/share/nvim/site/pack/packer/"] = true,
                    },
                    maxPreload = 1000,
                    preloadFileSize = 100000,
                },
                telemetry = {
                    enable = false,
                },
            },
        },
    }
    servers["jdtls"] = {
        on_attach = function(client, bufnr)
            custom_attach(client, bufnr)
        end,
        capabilities = custom_capabilities,
        cmd = {
            server_path .. "bin/jdtls",
            "-configuration",
            "/home/daoist/.cache/jdtls/config",
            "-data",
            "/home/daoist/.cache/jdtls/workspace",
        },
        filetypes = { "java" },
        init_options = {
            jvm_args = {},
            workspace = "/home/daoist/.cache/jdtls/workspace",
        },
        -- root_dir = vim.fn.getcwd,
        root_dir = custom_cwd,
        single_file_support = true,
    }
    for name, opt in pairs(servers) do
        if opt then
            lspconfig[name].setup(opt)
        end
    end
end
