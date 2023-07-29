return function()
    local yabs = require("yabs")
    local tasksbuild = function()
        local filepath = vim.fn.expand("%:p")
        -- local outputFile = vim.fn.expand("%:p:r")
        local outputFile = vim.loop.cwd() .. "/build/" .. vim.fn.expand("%:t:r")
        -- return "c++ -g " .. filepath .. " -o " .. outputFile
        return "clang++ -g " .. filepath .. " -o " .. outputFile
    end
    local tasksrun = function()
        local exe = vim.loop.cwd() .. "/build/" .. vim.fn.expand("%:t:r")
        return exe
    end
    local cmakebuild = function()
        return "cd " .. vim.loop.cwd() .. "/build" .. " && cmake .. && make"
    end
    yabs:setup({
        languages = { -- List of languages in vim's `filetype` format
            cpp = {
                default_task = "build",
                tasks = {
                    build = {
                        command = tasksbuild,
                        -- command = cmakebuild,
                        output = "quickfix", -- Where to show output of the
                        -- command. Can be `buffer`,
                        -- `consolation`, `echo`,
                        -- `quickfix`, `terminal`, or `none`
                        opts = { -- Options for output (currently, there's only
                            -- `open_on_run`, which defines the behavior
                            -- for the quickfix list opening) (can be
                            -- `never`, `always`, or `auto`, the default)
                            open_on_run = "auto",
                        },
                    },
                    run = {
                        command = tasksrun,
                        output = "quickfix", -- Where to show output of the
                        -- output = "terminal", Where to show output of the
                    },
                    build_and_run = { -- Setting the type to lua means the command
                        -- is a lua function
                        command = function()
                            -- The following api can be used to run a task when a
                            -- previous one finishes
                            -- WARNING: this api is experimental and subject to
                            -- changes
                            require("yabs"):run_task("build", {
                                -- Job here is a plenary.job object that represents
                                -- the finished task, read more about it here:
                                -- https://github.com/nvim-lua/plenary.nvim#plenaryjob
                                on_exit = function(Job, exit_code)
                                    -- The parameters `Job` and `exit_code` are optional,
                                    -- you can omit extra arguments or
                                    -- skip some of them using _ for the name
                                    if exit_code == 0 then
                                        require("yabs").languages.cpp:run_task("run")
                                    end
                                end,
                            })
                        end,
                        type = "lua",
                    },
                },
            },
        },
        tasks = { -- Same values as `language.tasks`, but global
            build = {
                command = "echo building project...",
                output = "consolation",
            },
            run = {
                command = "echo running project...",
                output = "echo",
            },
            optional = {
                command = "echo runs on condition",
                -- You can specify a condition which determines whether to enable a
                -- specific task
                -- It should be a function that returns boolean,
                -- not a boolean directly
                -- Here we use a helper from yabs that returns such function
                -- to check if the files exists
                condition = require("yabs.conditions").file_exists("filename.txt"),
            },
        },
        opts = { -- Same values as `language.opts`
            output_types = {
                quickfix = {
                    open_on_run = "always",
                },
            },
        },
    })
end
