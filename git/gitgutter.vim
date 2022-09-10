" GitGutter Keymaps

" Disable gitgutter
" nnoremap <leader>g :GitGutterDisable<CR>

" Toggle gitgutter
nmap <leader>gg :GitGutterToggle<CR>

" Toggle gitgutter signs
nmap <leader>gs :GitGutterSignsToggle<CR>

" Toggle gitgutter line highlights
nmap <leader>gh :GitGutterLineHighlightsToggle<CR>

" Undo current change
nmap <leader>ghu :GitGutterUndoHunk<CR>
nmap <leader>ghs :GitGutterStageHunk<CR>

" If GitGutter causes lag, uncomment the two lines below
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0

