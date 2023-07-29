source ~/.local/share/nvim/site/vscode/vim-plug/plug.vim

call plug#begin("~/.local/share/nvim/site/vscode")
Plug 'junegunn/vim-easy-align'
Plug 'rhysd/accelerated-jk'
Plug 'asvetliakov/vim-easymotion'


" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Initialize plugin system
call plug#end()
set timeoutlen=200
" source ~/.local/share/nvim/site/vscode/accelerated-jk/plugin/accelerated-jk.vim
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
" nmap j <Plug>(accelerated_jk_gj_position)
" nmap k <Plug>(accelerated_jk_gk_position)
nnoremap <BackSpace> :nohl<CR>

let g:mapleader = "\<Space>"
let g:EasyMotion_do_mapping = 0 
let g:EasyMotion_smartcase = 1
" let g:maplocalleader = ','
" map <Leader> <Plug>(easymotion-prefix)
" <Leader>f{char} to move to {char}
" map  <leader><leader>f <Plug>(easymotion-bd-f)
" nmap <leader><Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
" nmap s <Plug>(easymotion-overwin-f2)

" Move to line
" map <leader><leader>l <Plug>(easymotion-bd-jk)
" nmap <leader><leader>l <Plug>(easymotion-overwin-line)

" Move to word
map  <leader><leader>w <Plug>(easymotion-bd-w)
" nmap <leader><leader>w <Plug>(easymotion-overwin-w)
" map <leader><leader>l <Plug>(easymotion-lineforward)
map <leader><leader>j <Plug>(easymotion-j)
map <leader><leader>k <Plug>(easymotion-k)
" map <leader><leader>h <Plug>(easymotion-linebackward)
"
" nnoremap <leader><leader>w <Plug>(easymotion-w)
" nnoremap <leader><leader>b <Plug>(easymotion-b)
" nnoremap <leader><leader>j <Plug>(easymotion-j)
" nnoremap <leader><leader>k <Plug>(easymotion-k)
" nnoremap <leader><leader>f <Plug>(easymotion-f)
" nnoremap <leader><leader>t <Plug>(easymotion-t)
nnoremap <leader>fs :w!<CR>
nnoremap <leader>fs <Cmd>call VSCodeNotify('workbench.action.files.save')<CR>
