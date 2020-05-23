" Plug-ins
call plug#begin('~/.config/nvim/plugged')
" Tools
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'jremmen/vim-ripgrep'  " Searches the files recursively for given text
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'scrooloose/nerdcommenter' " Toggle comment/uncomment
    Plug 'airblade/vim-gitgutter'   " Denotes changes in the file
	Plug 'google/vim-searchindex'   " Displays match count while searching
    Plug 'vim-airline/vim-airline'
    Plug 'tpope/vim-fugitive'
" Syntax
    Plug 'ap/vim-css-color' "Displays a preview of colors with CSS 
" Color-scheme / Theme
    Plug 'morhetz/gruvbox'
    " vim-devicons plugin may need additional fonts to work properly.
    " Skip this plugin if not needed. This is just a cosmetic plugin.
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline-themes'
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
set splitbelow splitright 
set nobackup nowritebackup
set relativenumber  " Set line numbers relative to current line
set colorcolumn=100
set nowrap          " Do not wrap overflowing line
set guifont=JetBrains\ Mono\ Regular\ 13

" Key-bindings
let mapleader=" "
nnoremap <leader>g :GitGutterDisable <BAR> :set laststatus=0 <CR>
nnoremap <leader>ps :Rg<SPACE>  " Search for text recursively from working directory
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

" NerdTree Key Bindings
nmap <C-n> :NERDTreeToggle<CR>
vmap <leader>\ <plug>NERDCommenterToggle
nmap <leader>\ <plug>NERDCommenterToggle

" Highlight current file in NerdTree
nnoremap <leader>f :NERDTreeFind<CR>

" GitGutter Keymaps
nmap <leader>gg :GitGutterToggle
nmap <leader>gs :GitGutterSignsToggle
nmap <leader>gh :GitGutterLineHighlightsToggle

" Git (fugitive) Key Bindings
nnoremap gs :Gstatus<CR>
nnoremap gc :Gcommit<CR>
nnoremap gp :Gpush<CR>
nnoremap gl :winc S<CR>:Glog<CR><C-W>j:resize -6<CR>

" Color Settings
color gruvbox
set background=dark termguicolors cursorline
let g:airline_theme='minimalist'

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
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeIgnore = ['^node_modules$', '.*\.iml', '^target$']

" If GitGutter causes lag, uncomment the two lines below
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0

