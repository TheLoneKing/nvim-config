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
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
" Syntax
    Plug 'ap/vim-css-color' "Displays a preview of colors with CSS
    Plug 'uiiaoo/java-syntax.vim'
    Plug 'HerringtonDarkholme/yats.vim' " Typescript syntax highlight
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
set smartcase
set hls is ic
set laststatus=2 cmdheight=1
set splitbelow splitright
set nobackup nowritebackup
set relativenumber number  " Set line numbers relative to current line
set colorcolumn=100
set nowrap          " Do not wrap overflowing line
au BufRead,BufNewFile *.md set colorcolumn=0 wrap nolist linebreak
set guifont=JetBrains\ Mono\ Regular\ 13
set t_Co=256
set t_ut=

" Java Settings
autocmd Filetype java set nospell

" Key-bindings
let mapleader=" "

nnoremap <silent> ./ :noh<CR>
nnoremap <leader>g :GitGutterDisable <BAR> :set laststatus=0 <CR>
" Search for text recursively from working directory
nnoremap <leader>ps :Rg<SPACE>
" Reload nvim config
" nnoremap <C-s> :source ~/.config/nvim/init.vim<CR>

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

" Copy & Paste using system clipboard
nnoremap <leader>y "*y
nnoremap <leader>p "*p
nnoremap <leader>Y "+y
nnoremap <leader>P "+p

" NerdTree Key Bindings
nmap <C-n> :NERDTreeToggle<CR>
vmap <leader>\ <plug>NERDCommenterToggle
nmap <leader>\ <plug>NERDCommenterToggle

" Highlight current file in NerdTree
nnoremap <leader>n :NERDTreeFind<CR>

" GitGutter Keymaps
nmap <leader>gg :GitGutterToggle
nmap <leader>gs :GitGutterSignsToggle
nmap <leader>gh :GitGutterLineHighlightsToggle

" Git (fugitive) Key Bindings
nnoremap gs :Gstatus<CR>
nnoremap gc :Gcommit<CR>
nnoremap gp :Gpush<CR>
nnoremap gl :winc S<CR>:Glog<CR><C-W>j:resize -6<CR>

" Key-binding to switch buffers
nmap <leader>] :bn<CR>
nmap <leader>[ :bp<CR>

" Color Settings
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection='0'

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

colorscheme gruvbox
let g:airline_theme='minimalist'
set background=dark termguicolors cursorline

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

" airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Markdown Snippets Settings
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-f>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"

" Markdown Preview Settings
let g:mkdp_refresh_slow = 1	" Refresh markdown when buffer is saved / leaving insert mode
let g:mkdp_auto_start = 1
let g:mkdp_page_title = '${name}'

" If GitGutter causes lag, uncomment the two lines below
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0

" CoC
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> \a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> \e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> \c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> \o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> \s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> \j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> \k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> \p  :<C-u>CocListResume<CR>

