local others = {}
others.alpha = function()
    local alpha = require("alpha")
    local startify = require("alpha.themes.startify")
    alpha.setup(startify.config)
end
others.bufdelete = function()
    local close_buffers = require("close_buffers")
    close_buffers.setup({
        preserve_window_layout = { "this" },
    })
end
others.kommentary = function()
    vim.g.kommentary_create_default_mappings = false
    local kommentary_config = require("kommentary.config")
    kommentary_config.configure_language("default", {
        prefer_single_line_comments = true,
    })
end
others.autopairs = function()
    local present1, autopairs = pcall(require, "nvim-autopairs")
    local present2, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")

    if present1 and present2 then
        autopairs.setup({
            disable_filetype = { "TelescopePrompt", "vim" },
            --ignored_next_char = [[ [%w%%%{%(%[%'%'%.] ]]
            ignored_next_char = "[%w%.%(%{%[]",
        })

        local cmp = require("cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
end
others.specs = function()
    require("specs").setup({
        show_jumps = true,
        min_jump = 10,
        popup = {
            delay_ms = 0, -- delay before popup displays
            inc_ms = 10, -- time increments used for fade/resize effects
            blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
            width = 10,
            winhl = "PMenu",
            fader = require("specs").pulse_fader,
            resizer = require("specs").shrink_resizer,
        },
        ignore_filetypes = {},
        ignore_buftypes = { nofile = true },
    })
end
others.symbols = function()
    local symbols_outline = require("symbols-outline")
    symbols_outline.setup({
        highlight_hovered_item = false,
        show_guides = false,
        auto_preview = false,
        position = "right",
        width = 20,
        show_numbers = false,
        show_relative_numbers = false,
        show_symbol_details = false,
    })
end
others.tabout = function()
    require("tabout").setup({
        tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        enable_backwards = true, -- well ...
        completion = false, -- if the tabkey is used in a completion pum
        tabouts = {
            { open = "'", close = "'" },
            { open = '"', close = '"' },
            { open = "`", close = "`" },
            { open = "(", close = ")" },
            { open = "[", close = "]" },
            { open = "{", close = "}" },
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {},
    })
end
others.wilder = function()
    vim.cmd([[
    call wilder#setup({'modes': [':', '/', '?']})
    call wilder#set_option('pipeline', [wilder#branch(wilder#cmdline_pipeline({'use_python': 0,'fuzzy': 1, 'fuzzy_filter': wilder#lua_fzy_filter()}),wilder#vim_search_pipeline(), [wilder#check({_, x -> empty(x)}), wilder#history(), wilder#result({'draw': [{_, x -> ' ' . x}]})])])
    call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({ 'pumblend': 20,'highlights': { 'border': 'Normal', }, 'border': 'rounded',  'left': [wilder#popupmenu_devicons()], 'right': [' ', wilder#popupmenu_scrollbar()]})))
    call wilder#set_option('use_python_remote_plugin', 0)
]])
    -- call wilder#set_option('renderer', wilder#renderer_mux({':': wilder#popupmenu_renderer({'highlighter': wilder#lua_fzy_highlighter(), 'left': [wilder#popupmenu_devicons()], 'right': [' ', wilder#popupmenu_scrollbar()]}), '/': wilder#wildmenu_renderer({'highlighter': wilder#lua_fzy_highlighter()})}))
    -- call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({ 'highlights': { 'border': 'Normal', }, 'border': 'rounded', })))
end
others.eft = function()
    vim.cmd([[
         nmap ; <Plug>(eft-repeat)
         xmap ; <Plug>(eft-repeat)
         omap ; <Plug>(eft-repeat)

         nmap f <Plug>(eft-f)
         xmap f <Plug>(eft-f)
         omap f <Plug>(eft-f)
         nmap F <Plug>(eft-F)
         xmap F <Plug>(eft-F)
         omap F <Plug>(eft-F)

         nmap t <Plug>(eft-t)
         xmap t <Plug>(eft-t)
         omap t <Plug>(eft-t)
         nmap T <Plug>(eft-T)
         xmap T <Plug>(eft-T)
         omap T <Plug>(eft-T)
      ]])
end
others.easyaign = function()
    vim.cmd([[
           xmap ga <Plug>(EasyAlign)
           nmap ga <Plug>(EasyAlign)
      ]])
end
others.virtualtext = function()
    local nvim_dap_virtual_text = require("nvim-dap-virtual-text")
    nvim_dap_virtual_text.setup({
        enabled = true, -- enable this plugin (the default)
        enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
        highlight_changed_variables = false, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
        highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
        show_stop_reason = true, -- show stop reason when stopped for exceptions
        commented = false, -- prefix virtual text with comment string
        -- experimental features:
        virt_text_pos = "eol", -- position of virtual text, see `:h nvim_buf_set_extmark()`
        all_frames = true, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
        virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
        virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
        -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
    })
end
others.filetype = function()
    vim.g.did_load_filetypes = 1
    require("filetype").setup({
        overrides = {},
    })
end
others.lastplace = function()
    require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
        lastplace_open_folds = true,
    })
end
others.illuminate = function()
    -- vim.cmd([[autocmd VimEnter * hi illuminatedWord guibg=Grey]])
    -- vim.cmd[[autocmd VimEnter * hi illuminatedCurWord gui=bold]]
    vim.g.Illuminate_highlightUnderCursor = 0
    vim.g.Illuminate_insert_mode_highlight = true
    vim.g.Illuminate_ftblacklist = { "dashboard", "NvimTree", "Outline" }
end
others.cleverf = function()
    vim.g.clever_f_smart_case = 1
    vim.g.clever_f_use_migemo = 0
    vim.g.clever_f_fix_key_direction = 1
    vim.g.clever_f_chars_match_any_signs = ""
    vim.g.clever_f_repeat_last_char_inputs = { [[\<CR>]], [[\<Tab>]] }
    vim.g.clever_f_mark_direct = 1
    vim.g.clever_f_mark_direct_color = "CleverFDefaultLabel"
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-s>", "<Cmd>ClangdSwitchSourceHeader<cr>", { noremap = true })
end
others.far = function()
    vim.g["far#source"] = "rgnvim"
    vim.g["far#enable_undo"] = 1
    vim.g["far#mapping"] = {
        stoggle_expand_all = "zt",
        toggle_expand_all = "zA",
        expand_all = "zr",
        collapse_all = "zm",
    }
end
others.multi = function()
    vim.g.VM_leader = { default = ",", visual = ",", buffer = "," }
    vim.g.VM_default_mappings = 1
    vim.g.VM_theme = "spacegray"
    -- vim.g.VM_maps = {[vim.type_idx] = vim.types.dictionary}
    -- vim.g.VM_maps['Undo'] = 'u'
    -- vim.g.VM_maps['Redo'] = '<C-r>'
    -- vim.g.VM_maps['Find Under'] = '<M-n>'
    -- vim.g.VM_maps['Find Subword Under'] = '<M-n>'
end
return others
