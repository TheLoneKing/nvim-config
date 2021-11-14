" General vim key bindings

" Set leader key
let mapleader=" "

" Save current buffer
nmap <leader>s :w<CR>

" Reload neovim config
nmap <C-M-s> :source ~/.config/nvim/init.vim<CR>

" Auto-close brackets
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap {<CR> {<CR>}<C-o>O

" More handy insert mode exit
inoremap jk <Esc>
inoremap kj <Esc>

" Remove text highlights
nnoremap <leader><ESC> :noh<CR>

" Search for text recursively in working directory
nnoremap <leader>ps :Rg<SPACE>

" Key-binding to switch buffers
nmap <TAB> :bn<CR>
nmap <S-TAB> :bp<CR>

" Close the current buffer
nmap <leader>bd :bd<CR>

" Resize buffers
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Move lines selected in visual mode UP
xnoremap <M-k> :move '<-2<CR>gv-gv
" Move lines selected in visual mode DOWN
xnoremap <M-j> :move '>+1<CR>gv-gv

" Remove default mapping from Q
nnoremap Q <nop>

" Move through the buffers
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l

" Copy & Paste using system clipboard
nnoremap <leader>y "*y
nnoremap <leader>p "*p
nnoremap <leader>Y "+y
nnoremap <leader>P "+p

" Terminal key mappings
tnoremap <Esc> <C-\><C-n>
tnoremap <M-h> <C-\><C-N><C-w>h
tnoremap <M-j> <C-\><C-N><C-w>j
tnoremap <M-k> <C-\><C-N><C-w>k
tnoremap <M-l> <C-\><C-N><C-w>l
nnoremap <M-t> :vsplit term://bash<CR>

