<div align="center">

# Neovim

<!-- prettier-ignore-start -->
<!-- markdownlint-disable-next-line MD036 -->
_✨ neovim lua config ✨_
<!-- prettier-ignore-end -->

</div>

## Toc 
- [Neovim](#neovim)
- [Toc](#toc)
- [Options](#options)
- [Disable](#disable)
- [Plugins](#plugins)
- [Mappings](#mappings)

# Options

```lua
relativenumber = true,
number         = true,
cursorline     = true,
cursorcolumn   = true,
showmode       = true,
showcmd        = true,
mouse          = "a",
autoindent     = true,
tabstop        = 2,
shiftwidth     = 4,
expandtab      = true,
textwidth      = 80,
wrap           = false,
linebreak      = true,
wrapmargin     = 2,
whichwrap      = "b,s,<,>,h,l",
scrolloff      = 10,
sidescrolloff  = 15,
laststatus     = 2,
ruler          = true,
showmatch      = true,
showtabline    = 2,
hlsearch       = true,
ignorecase     = true,
backup         = false,
swapfile       = false,
encoding       = "utf-8",
foldenable     = false,
autochdir      = true,
autoread       = true,
wildmenu       = true,
background     = "dark",
timeout        = true,
ttimeout       = true,
timeoutlen     = 250,
ttimeoutlen    = 0,
termguicolors  = true,
completeopt    = "menuone,noinsert",
clipboard      = "unnamedplus",
splitbelow     = true,
splitright     = true,

```

# Disable

```lua
vim.g.loaded_gzip              = 1
vim.g.loaded_tar               = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_zip               = 1
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_getscript         = 1
vim.g.loaded_getscriptPlugin   = 1
vim.g.loaded_vimball           = 1
vim.g.loaded_vimballPlugin     = 1
vim.g.loaded_matchit           = 1
vim.g.loaded_matchparen        = 1
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_logiPat           = 1
vim.g.loaded_rrhelper          = 1
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_netrwSettings     = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_spellfile_plugin  = 1
```

# Plugins

+ **ui**

| name                                                                       | description                              |
| -------------------------------------------------------------------------- | ---------------------------------------- |
| [onedark](https://github.com/navarasu/onedark.nvim)                        | theme                                    |
| [onedarkpro](https://github.com/olimorris/onedarkpro.nvim)                 | theme                                    |
| [zephyrium](https://github.com/titanzero/zephyrium)                        | theme                                    |
| [alpha](https://github.com/goolord/alpha-nvim)                             | greeter for neovim                       |
| [lualine](https://github.com/nvim-lualine/lualine.nvim)                    | statusline                               |
| [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)       | provides  icons                          |
| [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) | Indent guides                            |
| [neoscroll](https://github.com/karb94/neoscroll.nvim)                      | Smooth scrolling                         |
| [vim-illuminate](https://github.com/RRethy/vim-illuminate)                 | highlight other uses of the current word |
| [close-buffers](https://github.com/kazhala/close-buffers.nvim)             | Delete multiple vim buffers              |
| [gitsigns](https://github.com/lewis6991/gitsigns.nvim)                     | Git integration for buffers              |
| [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)                   | file explorer tree                       |
| [nvim-notify](https://github.com/rcarriga/nvim-notify)                     | notification manage                      |
| [nvim-scrollview](https://github.com/dstein64/nvim-scrollview)             | displays interactive vertical scrollbars |
| [nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow)                 | rainbow parentheses                      |


+ **tool**

| name                                                                                          | description                    |
| --------------------------------------------------------------------------------------------- | ------------------------------ |
| [impatient](https://github.com/lewis6991/impatient.nvim)                                      | Speed up loading Lua modules   |
| [wilder](https://github.com/gelguy/wilder.nvim)                                               | A more adventurous wildmenu    |
| [fzy-lua-native](https://github.com/romgrk/fzy-lua-native)                                    |                                |
| [vim-eft](https://github.com/hrsh7th/vim-eft)                                                 | enhanced f/t                   |
| [vim-easy-align](https://github.com/junegunn/vim-easy-align)                                  | alignment plugin               |
| [nvim-window](https://gitlab.com/yorickpeterse/nvim-window.git)                               | Easily jump between  windows   |
| [fcitx](https://github.com/h-hg/fcitx.nvim)                                                   | switch and restore fcitx state |
| [telescope](https://github.com/nvim-telescope/telescope.nvim)                                 | fuzzy finder                   |
| [telescope-fzf-native](https://github.com/nvim-telescope/telescope-fzf-native.nvim)           |                                |
| [plenary](https://github.com/nvim-lua/plenary.nvim)                                           |                                |
| [popup](https://github.com/nvim-lua/popup.nvim)                                               |                                |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)                         | Treesitter-based highlighting  |
| [completion-treesitter](https://github.com/nvim-treesitter/completion-treesitter)             |                                |
| [nvim-treesitter-refactor](https://github.com/nvim-treesitter/nvim-treesitter-refactor)       |                                |
| [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) |                                |
| [which-key](https://github.com/folke/which-key.nvim)                                          | Create key bindings that stick |
| [vim-rooter](https://github.com/airblade/vim-rooter)                                          | Changes Vim working directory  |
| [vim-startuptime](https://github.com/dstein64/vim-startuptime)                                | profiling Vim's startup time   |


+ **lsp**

| name                                                                                    | description                       |
| --------------------------------------------------------------------------------------- | --------------------------------- |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                              | configurations for the LSP client |
| [lspsaga](https://github.com/tami5/lspsaga.nvim)                                        | language-server-client UI         |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)                    |                                   |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                                         | completion plugin                 |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip)                                          |                                   |
| [cmp-under-comparator](https://github.com/lukas-reineke/cmp-under-comparator)           |                                   |
| [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)                              |                                   |
| [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)                                 |                                   |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)                                 |                                   |
| [cmp-path](https://github.com/hrsh7th/cmp-path)                                         |                                   |
| [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)                                     |                                   |
| [cmp-rg](https://github.com/lukas-reineke/cmp-rg)                                       |                                   |
| [cmp-nvim-lsp-document-symbol](https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol) |                                   |
| [cmp-latex-symbols](https://github.com/kdheepak/cmp-latex-symbols)                      |                                   |
| [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)                                   |                                   |
| [cmp-look](https://github.com/octaltree/cmp-look)                                       |                                   |
| [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)                |                                   |


+ **lang**

| name                                                         | description                         |
| ------------------------------------------------------------ | ----------------------------------- |
| [filetype](https://github.com/nathom/filetype.nvim)          | A faster version of filetype.vim    |
| [lspkind-nvim](https://github.com/onsails/lspkind-nvim)      | adds vscode-like pictograms to lsp  |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs)   |                                     |
| [formatter](https://github.com/mhartington/formatter.nvim)   | A format runner for neovim          |
| [fidget](https://github.com/j-hui/fidget.nvim)               | Standalone UI for nvim-lsp progress |
| [lsp_signature](https://github.com/ray-x/lsp_signature.nvim) | LSP signature hint as you type      |
| [trouble](https://github.com/folke/trouble.nvim)             | showing diagnostics                 |


+ **edit**

| name                                                                    | description                                  |
| ----------------------------------------------------------------------- | -------------------------------------------- |
| [better-escape](https://github.com/max397574/better-escape.nvim)        | Escape from insert mode                      |
| [hop](https://github.com/phaazon/hop.nvim)                              | EasyMotion-like plugin                       |
| [faster](https://github.com/PHSix/faster.nvim)                          | accelerate j or k  moving                    |
| [vim-highlightedyank](https://github.com/machakann/vim-highlightedyank) | Make the yanked region apparent!             |
| [kommentary](https://github.com/b3nj5m1n/kommentary)                    | comment text in and out                      |
| [vim-surround](https://github.com/tpope/vim-surround)                   | delete, change and add surroundings in pairs |
| [specs](https://github.com/edluffy/specs.nvim)                          | Show where your cursor moves                 |
| [symbols-outline](https://github.com/simrat39/symbols-outline.nvim)     | A tree like view for symbols                 |
| [tabout](https://github.com/abecodes/tabout.nvim)                       | tabbing out                                  |
| [vim-cool](https://github.com/romainl/vim-cool)                         | disables search highlighting when moving     |
| [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode)         | instant table creation                       |

+ **dap**

| name                                                                        | description                                  |
| --------------------------------------------------------------------------- | -------------------------------------------- |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap)                        | Debug Adapter Protocol client implementation |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)                      | A UI for nvim-dap                            |
| [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text) | adds virtual text support to nvim-dap        |
| [yabs](https://github.com/pianocomposer321/yabs.nvim)                       | Build System/Code Runner                     |

# Mappings

| mode | keymaping     | cmd or keymaping                         | description        |
| ---- | ------------- | ---------------------------------------- | ------------------ |
| `n`  | `<backspace>` | `nohl                                  ` | 取消搜索高亮       |
| `v`  | `<          ` | `<gv                                   ` | 对齐时保持选中状态 |
| `v`  | `>          ` | `>gv                                   ` | 对齐时保持选中状态 |
| `n`  | `g<C-v>     ` | **\`[v\`]**                              | 选中上次复制的对象 |
| `n`  | `<F1>       ` | `cclose                                ` | 关闭quickfix       |
| `n`  | `<F2>       ` | `YabsTask run                          ` | 组建               |
| `n`  | `<F3>       ` | `YabsTask build                        ` | 运行               |
| `n`  | `<F4>       ` | `lua require("dapui").toggle()         ` | 显示调试界面       |
| `n`  | `<F5>       ` | `lua require'dap'.continue()           ` | 调试开始           |
| `n`  | `<F9>       ` | `lua require'dap'.toggle_breakpoints() ` | 创建断点           |
| `n`  | `<F10>      ` | `lua require'dap'.step_over()          ` | 单步跳出           |
| `n`  | `<F11>      ` | `lua require'dap'.step_into()          ` | 单步步入           |
| `n`  | `<F12>      ` | `lua require'dap'.disconnect()         ` | 断开调试器的链接   |

+ **BDelete**

| mode | keymaping    | cmd or keymaping                          | description                     |
| ---- | ------------ | ----------------------------------------- | ------------------------------- |
| `n`  | `<leader>bh` | `lua require'tasks'.bdelete('hidden')   ` | Delete all non-visible buffers  |
| `n`  | `<leader>bu` | `lua require'tasks'.bdelete('nameless') ` | Delete all buffers without name |
| `n`  | `<leader>bc` | `lua require'tasks'.bdelete('this')     ` | Delete the current buffer       |


```lua
-- bdelete
require('close_buffers').delete({ type = 'hidden', force = true }) -- Delete all non-visible buffers
require('close_buffers').delete({ type = 'nameless' }) -- Delete all buffers without name
require('close_buffers').delete({ type = 'this' }) -- Delete the current buffer
require('close_buffers').delete({ type = 1 }) -- Delete the specified buffer number
require('close_buffers').delete({ regex = '.*[.]md' }) -- Delete all buffers matching the regex

-- bwipeout
require('close_buffers').wipe({ type = 'all', force = true }) -- Wipe all buffers
require('close_buffers').wipe({ type = 'other' }) -- Wipe all buffers except the current focused
require('close_buffers').wipe({ type = 'hidden', glob = '*.lua' }) -- Wipe all buffers matching the glob
```
+ **telescope and file**


| mode | keymaping    | cmd or keymaping                      | description          |
| ---- | ------------ | ------------------------------------- | -------------------- |
| `n`  | `<leader>fc` | `Telescope commands                 ` |                      |
| `n`  | `<leader>ff` | `Telescope find_files               ` | 查找文件             |
| `n`  | `<leader>fl` | `Telescope current_buffer_fuzzy_find` | 当前 buffer 模糊查找 |
| `n`  | `<leader>fo` | `Telescope oldfiles                 ` | 查找最近操作的文件   |
| `n`  | `<leader>fb` | `Telescope buffers                  ` |                      |
| `n`  | `<leader>fg` | `Telescope live_grep                ` |                      |
| `n`  | `<leader>fG` | `Telescope grep_string              ` |                      |
| `n`  | `<leader>fh` | `Telescope help_tags                ` |                      |
| `n`  | `<leader>fd` | `Telescope diagnostics              ` |                      |
| `n`  | `<leader>fs` | `w!                                 ` | save file            |
| `n`  | `<leader>fe` | `edit ~/dotfiles/nvim/lua/utils.lua ` | edit vimrc           |


+ **window**

| mode | keymaping     | cmd or keymaping                     | description    |
| ---- | ------------- | ------------------------------------ | -------------- |
| `n`  | `<leader>wq`  | `qall!                             ` | Vim Exit       |
| `n`  | `<leader>wc`  | `quit!                             ` | Window Conceal |
| `n`  | `<leader>ww`  | `<C-w>w                            ` | window next    |
| `n`  | `<leader>wh`  | `<C-w>h                            ` | window left    |
| `n`  | `<leader>wj`  | `<C-w>j                            ` | window right   |
| `n`  | `<leader>wk`  | `<C-w>k                            ` | window down    |
| `n`  | `<leader>wl`  | `<C-w>l                            ` | window up      |
| `n`  | `<leader>wn`  | `lua require('nvim-window').pick() ` |                |
| `n`  | `<leader>w-`  | `<Cmd>sp<CR><C-w>j                 ` | split          |
| `n`  | `<leader>w\`\ | `<Cmd>vsp<CR><C-w>l                ` | vsplit         |


+ **nvimtree**

| mode | keymaping    | cmd or keymaping                   | description |
| ---- | ------------ | ---------------------------------- | ----------- |
| `n`  | `<leader>nt` | `NvimTreeToggle NvimTreeRefresh`   | 打开文件树  |
| `n`  | `<leader>nt` | `NvimTreeFindFile NvimTreeRefresh` | 查找文件    |
| `n`  | `<leader>nt` | `NvimTreeFocus NvimTreeRefresh`    | 聚焦文件    |


+ **Packer**

| mode | keymaping    | cmd or keymaping | description            |
| ---- | ------------ | ---------------- | ---------------------- |
| `n`  | `<leader>pi` | `PackerInstall`  | install Plugins        |
| `n`  | `<leader>pc` | `PackerCompile`  |                        |
| `n`  | `<leader>pC` | `PackerClean`    | clean Plugins          |
| `n`  | `<leader>pS` | `PackerStatus`   | plugins info           |
| `n`  | `<leader>ps` | `PackerSync`     | update and Compile     |
| `n`  | `<leader>pu` | `PackerUpdate`   | update plugins         |
| `n`  | `<leader>pv` | `PackerConvert`  | convert *.vim to *.lua |


+ **hop**

| mode | keymaping           | cmd or keymaping | description       |
| ---- | ------------------- | ---------------- | ----------------- |
| `n`  | `<leader><Leader>w` | `HopWord`        | 快速跳转(word)    |
| `n`  | `<leader><Leader>p` | `HopPattern`     | 快速跳转(pattern) |
| `n`  | `<leader><Leader>l` | `HopLine`        | 快速跳转(line)    |


+ **Toggle**

| mode | keymaping    | cmd or keymaping | description    |
| ---- | ------------ | ---------------- | -------------- |
| `n`  | `<leader>tt` | `ToggleTerm`     | ToggleTerm     |
| `n`  | `<leader>ts` | `SymbolsOutline` | SymbolsOutline |
| `n`  | `<leader>tl` | `Trouble`        | Toggle Trouble |


+ **lspsaga**

| mode | keymaping    | cmd or keymaping                | description        |
| ---- | ------------ | ------------------------------- | ------------------ |
| `n`  | `<leader>lk` | `Lspsaga hover_doc`             | 查看文档           |
| `n`  | `<leader>lh` | `Lspsaga lsp_finder`            |                    |
| `n`  | `<leader>la` | `Lspsaga code_action`           | codeaction         |
| `n`  | `<leader>ls` | `Lspsaga signature_help`        | 查看 function 参数 |
| `n`  | `<leader>lr` | `Lspsaga rename`                | 重命名             |
| `n`  | `<leader>ld` | `Lspsaga preview_definition`    | 快速查看定义       |
| `n`  | `<leader>lo` | `Lspsaga show_line_diagnostics` |                    |
| `n`  | `<leader>ln` | `Lspsaga diagnostic_jump_next`  | 跳转到下一个错误   |
| `n`  | `<leader>lp` | `Lspsaga diagnostic_jump_prev`  | 跳转到上一个错误   |
| `n`  | `<leader>lf` | `FormatWrite`                   | 格式化文档         |



+ **comment**

| mode | keymaping    | cmd or keymaping                 | description |
| ---- | ------------ | -------------------------------- | ----------- |
| `n`  | `<leader>ci` | `<Plug>kommentary_line_increase` | 注释        |
| `n`  | `<leader>cd` | `<Plug>kommentary_line_decrease` | 取消注释    |

