if exists('g:vscode')
    "vscode
    "
    source ~/.config/nvim/vim/vscode.vim
else 

    lua <<EOF
    local impatient_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/impatient.nvim'
    if vim.loop.fs_stat(impatient_path) then
        vim.cmd([[packadd impatient.nvim]])
        require('impatient')
    end
    require('utils')

    local config_dir = vim.fn.stdpath("config") 
    local compile_to_lua = vim.fn.stdpath("data")  .. "/site/lua/_compiled.lua"
    if vim.fn.empty(vim.fn.glob(compile_to_lua)) == 0 then
        require('_compiled')
    end

EOF
endif

    " local color = config_dir .. "/lua/color.lua"
    " if vim.fn.empty(vim.fn.glob(color)) == 0 then
    "     require('color')
    " end
    " local compile_to_lua = config_dir .. "/lua/_compiled.lua"
