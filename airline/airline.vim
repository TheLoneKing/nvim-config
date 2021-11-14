" Airline Settings
let g:airline_theme='minimalist'
set background=dark termguicolors cursorline

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Enable tabline
let g:airline#extensions#tabline#enabled = 1

" Format for the buffer name (filename with devicons)
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Highlight current tab/buffer
let g:airline#extensions#tabline#alt_sep = 1

" Show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1

