local tasks = {}

local async = {}
local notify = {}
local function dapPre()
    if not packer_plugins["plenary.nvim"] then
        vim.notify("module plenary isn't installed")
        return false
    end
    if not packer_plugins["nvim-notify"].loaded then
        vim.notify("module notify isn't loaded")
        return false
    end
    if not packer_plugins["plenary.nvim"].loaded then
        vim.cmd([[packadd plenary.nvim]])
    end
    async = require("plenary.async")
    notify = require("notify").async
    return true
end

tasks.dapui = function()
    if dapPre() == false then
        return
    end
    if packer_plugins["nvim-dap-ui"].loaded then
        require("dapui").toggle()
    else
        async.run(function()
            notify("module dapui not load", "error", { title = "dapui toggle", timeout = 1000 })
        end)
    end
end

tasks.dap = function(type)
    if dapPre() == false then
        return
    end
    if packer_plugins["nvim-dap"].loaded then
        -- if type == "continue" then
        --     local extension = vim.fn.expand("%:e")
        --     if extension == "cpp" or extension == "c" then
        --         vim.cmd("YabsTask build")
        --     end
        -- elseif type == "disconnect" then
        --     vim.api.nvim_command([[lua require'dap'.disconnect()]])
        --     -- vim.api.nvim_command([[lua require'dap'.close()]])
        --     return
        -- end
        vim.api.nvim_command([[lua require'dap'.]] .. type .. [[()]])
    else
        async.run(function()
            notify("module dap not load", "error", { title = "dap " .. type, timeout = 1000 })
        end)
    end
end

tasks.yabstask = function(type)
    if dapPre() == false then
        return
    end
    if packer_plugins["yabs.nvim"].loaded then
        vim.api.nvim_command([[YabsTask ]] .. type)
    else
        async.run(function()
            notify("module yabs not load", "error", { title = "YabsTask " .. type, timeout = 1000 })
        end)
    end
end

tasks.bdelete = function(type)
    if packer_plugins["close-buffers.nvim"].loaded then
        local pre = [[lua require('close_buffers').delete({type = ']]
        vim.api.nvim_command(pre .. type .. [['})]])
    else
        async.run(function()
            notify("module close-buffers not load", "error", { title = "BDelete " .. type, timeout = 1000 })
        end)
    end
end

return tasks
