local M = {}

M.maps = {
    -- {'i', 'jk', '<Esc>' },
    { "n", "<backspace>", "<Cmd>nohl<CR>" },
    -- keep visual selection when (de)indenting
    { "v", "<", "<gv" },
    { "v", ">", ">gv" },
    -- Select last pasted/yanked text
    { "n", "g<C-v>", "`[v`]" },
    { "n", "<F1>", "<cmd>cclose<CR>" },
    { "n", "<F2>", "<cmd>lua require'tasks'.yabstask('run')<CR>" },
    { "n", "<F3>", "<cmd>lua require'tasks'.yabstask('build')<CR>" },
    { "n", "<F4>", "<cmd>lua require'tasks'.dapui()<CR>" },
    { "n", "<F5>", "<cmd>lua require'tasks'.dap('continue')<CR>" },
    -- { "n", "<F5>", "<Plug>VimspectorContinue<CR>" },
    -- { "n", "<F5>", "<Plug>VimspectorContinue" },
    { "n", "<F9>", "<cmd>lua require'tasks'.dap('toggle_breakpoint')<CR>" },
    { "n", "<F10>", "<cmd>lua require'tasks'.dap('step_over')<CR>" },
    { "n", "<F11>", "<cmd>lua require'tasks'.dap('step_into')<CR>" },
    { "n", "<F12>", "<cmd>lua require'tasks'.dap('disconnect')<CR>" },
}
return M
