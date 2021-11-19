" General Settings

" File encoding
set encoding=UTF-8

"Enabling Plugin & Indent
filetype plugin indent on

" Enable syntax highlighting
syntax enable

" Enable filetype plugin
filetype plugin on

" Search down into sub-folders.
" Provides tab-completion for all file related tasks
set path+=**

" Display all matching files for tab complete
set wildmenu

set autoread wildmode=longest,list,full

" Set language for spell check
set spell spelllang=en_us

set backspace=indent,eol,start confirm

" Set tab & indentation config
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab

" Search options
set hlsearch incsearch ignorecase smartcase

" Command palette options
set laststatus=2 cmdheight=2

" Split config
set splitbelow splitright

" When opening a new file, hide current buffer instead of closing it
set hidden

" Disable swapfile
set noswapfile

" Disable backup files
set nobackup nowritebackup

" Line number config
set relativenumber number

" Highlight 120th column with different color
set colorcolumn=120

" Disable wordwrap
" set nowrap

" Font
set guifont=JetBrains\ Mono\ Regular\ 13

" Terminal color config
set t_Co=256
set t_ut=

" Ignore these files and folders
set wildignore+=**/target/*,**/dist/*,**/.settings/*,**/.idea/*,**/node_modules/*,*.swp,*.iml    " Ignore these files

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" RipGrep Settings
if executable('rg')
    let g:rg_derive_root='true'
endif

" Json comment highlighting
  autocmd FileType json syntax match Comment +\/\/.\+$+

" Markdown files config
au BufRead,BufNewFile *.md set colorcolumn=0 wrap nolist linebreak

" Java Settings
autocmd Filetype java set nospell

" Python 3 path
let g:python3_host_prog = "/usr/bin/python3"

" Python 2 path
let g:python_host_prog = "/usr/bin/python2"

" Disable markdown syntax conceal
let g:markdown_syntax_conceal = 0
