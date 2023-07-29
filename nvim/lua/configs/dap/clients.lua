return function()
    -- local dap_breakpoint = {
    --     error = {
    --         text = "🛑",
    --         texthl = "LspDiagnosticsSignError",
    --         linehl = "",
    --         numhl = "",
    --     },
    --     rejected = {
    --         text = "",
    --         texthl = "LspDiagnosticsSignHint",
    --         linehl = "",
    --         numhl = "",
    --     },
    --     stopped = {
    --         text = "⭐️",
    --         texthl = "LspDiagnosticsSignInformation",
    --         linehl = "DiagnosticUnderlineInfo",
    --         numhl = "LspDiagnosticsSignInformation",
    --     },
    -- }
    -- vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
    -- vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
    -- vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
    local dap = require("dap")
    dap.defaults.fallback.terminal_win_cmd = "10split new"
    dap.defaults.fallback.focus_terminal = false
    dap.adapters.codelldb = function(on_adapter)
        local stdout = vim.loop.new_pipe(false)
        local stderr = vim.loop.new_pipe(false)

        -- CHANGE THIS!
        -- local cmd = "/absolute/path/to/codelldb/extension/adapter/codelldb"
        -- local cmd = os.getenv("HOME") .. "/.local/share/nvim/lsp_servers/codelldb/adapter/codelldb"
        local cmd = "/home/daoist/.local/share/nvim/debugger/codelldb/adapter/codelldb"
        -- local cmd = "/home/daoist/.local/share/nvim/site/pack/packer/opt/vimspector/gadgets/linux/CodeLLDB/adapter/codelldb"

        local handle, pid_or_err
        local opts = {
            stdio = { nil, stdout, stderr },
            detached = true,
        }
        handle, pid_or_err = vim.loop.spawn(cmd, opts, function(code)
            stdout:close()
            stderr:close()
            handle:close()
            if code ~= 0 then
                print("codelldb exited with code", code)
            end
        end)
        assert(handle, "Error running codelldb: " .. tostring(pid_or_err))
        stdout:read_start(function(err, chunk)
            assert(not err, err)
            if chunk then
                local port = chunk:match("Listening on port (%d+)")
                if port then
                    vim.schedule(function()
                        on_adapter({
                            type = "server",
                            host = "127.0.0.1",
                            port = port,
                        })
                    end)
                else
                    vim.schedule(function()
                        require("dap.repl").append(chunk)
                    end)
                end
            end
        end)
        stderr:read_start(function(err, chunk)
            assert(not err, err)
            if chunk then
                vim.schedule(function()
                    require("dap.repl").append(chunk)
                end)
            end
        end)
    end
    dap.adapters.cppdbg = {
        id = "cppdbg",
        type = "executable",
        command = os.getenv("HOME") .. "/.local/share/nvim/debugger/cpptools/debugAdapters/bin/OpenDebugAD7",
    }
    dap.configurations.cpp = {
        {
            name = "Launch file with codelldb",
            type = "codelldb",
            -- type = "lldb",
            request = "launch",
            -- program = vim.fn.getcwd() .. "/bin/" .. "${fileBasenameNoExtension}",
            -- program = vim.loop.cwd() .. "/bin/" .. "${fileBasenameNoExtension}",
            program = vim.fn.getcwd() .. "/build/" .. "demo",
            cwd = "${workspaceFolder}",
            -- cwd = "${fileDirname}",
            -- stopOnEntry = false,
            stopOnEntry = true,
            -- externalConsole= true,
            -- MIMode = "gdb",
            -- miDebuggerPath = "/usr/bin/gdb",
            -- args = {},
            -- console = "integratedTerminal",
            -- terminal = "integrated",
            -- runInTerminal = true,
        },
        {
            name = "Launch file",
            type = "cppdbg",
            request = "launch",
            -- program = vim.fn.getcwd() .. "/build/" .. "demo",
            program = vim.loop.cwd() .. "/build/" .. "demo",
            -- program = function()
            --     return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            -- end,
            cwd = "${workspaceFolder}",
            stopOnEntry = true,
            setupCommands = {
                {
                    description = "enable pretty printing",
                    text = "-enable-pretty-printing",
                    ignoreFailures = false,
                },
            },
        },
        -- attach process
        {
            name = "Attach process",
            type = "cppdbg",
            request = "attach",
            processId = require("dap.utils").pick_process,
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            setupCommands = {
                {
                    description = "enable pretty printing",
                    text = "-enable-pretty-printing",
                    ignoreFailures = false,
                },
            },
        },
        -- attach server
        {
            name = "Attach to gdbserver :1234",
            type = "cppdbg",
            request = "launch",
            MIMode = "gdb",
            miDebuggerServerAddress = "localhost:1234",
            miDebuggerPath = "/usr/bin/gdb",
            cwd = "${workspaceFolder}",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            setupCommands = {
                {
                    text = "-enable-pretty-printing",
                    description = "enable pretty printing",
                    ignoreFailures = false,
                },
            },
        },
    }

    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp
    dap.adapters.python = {
        type = "executable",
        command = "/home/daoist/.conda/envs/tools/bin/python",
        args = { "-m", "debugpy.adapter" },
    }
    dap.configurations.python = {
        {
            -- The first three options are required by nvim-dap
            type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
            request = "launch",
            name = "Launch file",
            -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

            program = "${file}", -- This configuration will launch the current file if used.
            pythonPath = function()
                -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
                -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
                -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
                local cwd = vim.fn.getcwd()
                if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                    return cwd .. "/venv/bin/python"
                elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                    return cwd .. "/.venv/bin/python"
                else
                    return "/home/daoist/.conda/envs/d2l/bin/python3"
                end
            end,
            console = "integratedTerminal",
        },
    }
end
