" Plug-ins
call plug#begin('~/.config/nvim/plugged')
" Tools
    Plug 'vifm/vifm.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'jremmen/vim-ripgrep'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'scrooloose/nerdcommenter'
" Syntax
    Plug 'tpope/vim-markdown'
    Plug 'ap/vim-css-color' "Displays a preview of colors with CSS 
    Plug 'vim-scripts/fountain.vim'
" Color-scheme
    Plug 'morhetz/gruvbox'
    Plug 'ryanoasis/vim-devicons'
call plug#end() 
 
" General Settings
set encoding=UTF-8
filetype plugin indent on  "Enabling Plugin & Indent
syntax on  "Turning Syntax on
set autoread wildmode=longest,list,full
set spell spelllang=en_us
set backspace=indent,eol,start confirm
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab  
set hls is ic
set laststatus=2 cmdheight=1
au BufRead,BufNewFile *.fountain set filetype=fountain
set splitbelow splitright 
set nobackup nowritebackup
set relativenumber  " Set line numbers relative to current line
set colorcolumn=100
set nowrap          " Do not wrap overflowing line

" Status-line
set statusline=
set statusline+=%#IncSearch#
set statusline+=\ %M    " Indicate if the file has changed with a '+' on bottom left of statusline
set statusline+=\ %y    " Indicate the current filetype
set statusline+=\ %r    " Indicate if the file is opened in Read-Only mode
set statusline+=%#CursorLineNr#
set statusline+=\ %F    " Indicate the full path of current file
set statusline+=%= "Right side settings
set statusline+=%#Search#
set statusline+=\ %l/%L " Indicate current line / total lines
set statusline+=\ [%c]

" Key-bindings
let mapleader=" "
nnoremap <leader><Space> :EditVifm .<CR>
"nnoremap <leader>n :CtrlP<CR>
nnoremap <leader>, :vsplit ~/.config/nvim/init.vim<CR>
nnoremap <leader>g :GitGutterDisable <BAR> :set laststatus=0 <CR>
nnoremap <leader>ps :Rg<SPACE>
" Reload nvim config
nnoremap <C-s> :source ~/.config/nvim/init.vim<CR>

nnoremap <Up> :resize +2<CR> 
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Move lines selected in visual mode UP
xnoremap K :move '<-2<CR>gv-gv
" Move lines selected in visual mode DOWN
xnoremap J :move '>+1<CR>gv-gv

nnoremap Q <nop>

nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l

" Color Settings
color gruvbox
set background=dark termguicolors cursorline

hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

" CtrlP Settings
let g:ctrlp_use_caching = 0
" Ignore files ignored by git in ctrlp fuzzy find
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" RipGrep Settings
if executable('rg')
    let g:rg_derive_root='true'
endif

" NerdTree Settings
nmap <C-n> :NERDTreeToggle<CR>
vmap <leader>\ <plug>NERDCommenterToggle
nmap <leader>\ <plug>NERDCommenterToggle
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeIgnore = ['^node_modules$', '.*\.iml', '^target$']

" Find current file in NerdTree
nnoremap <leader>n :NERDTreeFind<CR>

