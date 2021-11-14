" CtrlP Settings
let g:ctrlp_use_caching = 0
" Ignore files ignored by version control
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" Custom command for finding files
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

