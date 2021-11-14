" NERDTree Key Bindings

" Toggle NERDTree
nmap <C-n> :NERDTreeToggle<CR>

" Highlight current file in NerdTree
nnoremap <leader>n :NERDTreeFind<CR>

" NerdTree Settings
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeIgnore = ['^node_modules$', '.*\.iml', '^target$']

