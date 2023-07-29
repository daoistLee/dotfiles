local tasks = {}

local async = {}
local notify = {}

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
