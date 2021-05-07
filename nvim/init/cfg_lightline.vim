" let g:lightline = {
"     \ 'colorscheme': 'Tomorrow_Night',
"     \ 'active': {
"     \     'left': [ ['mode', 'paste'], ['readonly', 'absolutepath', 'modified'] ]
"     \ }
"     \ }

" use this when coc is installed
let g:lightline = {
    \ 'colorscheme': 'Tomorrow_Night',
    \ 'active': {
    \     'left': [ ['mode', 'paste'], ['cocstatus', 'readonly', 'absolutepath', 'modified'] ]
    \ },
    \ 'component_function': {
    \     'cocstatus': 'coc#status'
    \ },
    \ }

" use autocmd to force lightline update
augroup LightlineGroup
    autocmd!
    autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
augroup END
