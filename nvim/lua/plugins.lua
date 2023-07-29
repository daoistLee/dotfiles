-- local  config_dir = vim.fn.stdpath("config")
local data_dir = vim.fn.stdpath("data") .. "/site/"
-- local packer_compiled = vim_path .. "/plugin/_compiled.vim"
-- local convert_to_lua = vim_path .. "/plugin/_compiled.lua"

local packer_compiled = data_dir .. "/lua/_compiled.vim"
local convert_to_lua = data_dir .. "/lua/_compiled.lua"
local packer = nil
local modules = { "daps", "edit", "lang", "lsp", "tool", "ui" }

local Packer = {}
Packer.__index = Packer

function Packer:load_packer()
    if not packer then
        vim.api.nvim_command("packadd packer.nvim")
        packer = require("packer")
    end
    packer.init({
        git = { clone_timeout = 120 },
        disable_commands = true,
        max_jobs = 20,
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "rounded" })
            end,
        },
    })
    packer.reset()
    local use = packer.use
    packer.startup({
        function()
            use({
                "wbthomason/packer.nvim",
                opt = true,
            })
            for _, i in pairs(modules) do
                for repo, conf in pairs(require("modules." .. i)) do
                    use(vim.tbl_extend("force", { repo }, conf))
                end
            end
        end,
        config = {
            compile_path = packer_compiled,
        },
    })
end

function Packer:init_ensure_plugins()
    local packer_dir = data_dir .. "pack/packer/opt/packer.nvim"
    local state = vim.loop.fs_stat(packer_dir)
    if not state then
        print("Cloning packer..")
        vim.fn.system({
            "git",
            "clone",
            "--depth",
            "20",
            "https://github.com/wbthomason/packer.nvim",
            packer_dir,
        })
        vim.loop.fs_mkdir(data_dir .. "lua", 511, function()
            assert("make compile path dir faield")
        end)
        self:load_packer()
        packer.install()
    end
end

local plugins = setmetatable({}, {
    __index = function(_, key)
        if not packer then
            Packer:load_packer()
        end
        return packer[key]
    end,
})

function plugins.ensure_plugins()
    Packer:init_ensure_plugins()
end

function plugins.convert_compile_file()
    local lines = {}
    local lnum = 1
    lines[#lines + 1] = "vim.cmd [[packadd packer.nvim]]\n"

    if vim.fn.empty(vim.fn.glob(packer_compiled)) > 0 then
        vim.notify("no _compiled.vim need to be converted")
        return
    end
    if vim.fn.filereadable(convert_to_lua) == 1 then
        os.remove(convert_to_lua)
    end
    for line in io.lines(packer_compiled) do
        lnum = lnum + 1
        if lnum > 15 then
            lines[#lines + 1] = line .. "\n"
            if line == "END" then
                break
            end
        end
    end
    table.remove(lines, #lines)

    if vim.fn.filereadable(packer_compiled) == 1 then
        os.rename(packer_compiled, convert_to_lua)
    end

    local file = io.open(convert_to_lua, "w")
    for _, line in ipairs(lines) do
        file:write(line)
    end
    file:close()
    vim.notify("convert complete")
end

function plugins.magic_compile()
    plugins.compile()
end

function plugins.load_compile()
    vim.cmd([[command! PackerCompile lua require('plugins').magic_compile()]])
    vim.cmd([[command! PackerInstall lua require('plugins').install()]])
    vim.cmd([[command! PackerUpdate lua require('plugins').update()]])
    vim.cmd([[command! PackerSync lua require('plugins').sync()]])
    vim.cmd([[command! PackerClean lua require('plugins').clean()]])
    vim.cmd([[command! PackerConvert lua require('plugins').convert_compile_file()]])
    vim.cmd([[command! PackerStatus lua  require('plugins').status()]])
end

return plugins
