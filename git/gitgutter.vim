" GitGutter Keymaps

" Disable gitgutter
nnoremap <leader>g :GitGutterDisable <BAR> :set laststatus=0 <CR>

" Toggle gitgutter
nmap <leader>gg :GitGutterToggle

" Toggle gitgutter signs
nmap <leader>gs :GitGutterSignsToggle

" Toggle gitgutter line highlights
nmap <leader>gh :GitGutterLineHighlightsToggle

" If GitGutter causes lag, uncomment the two lines below
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0

