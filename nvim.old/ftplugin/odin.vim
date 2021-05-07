" NOT NEEDED WITH VIM-DISPATCH PLUGIN
nnoremap <silent> <Leader>m :make<CR>
nnoremap <silent> <Leader>M :ccl<CR>
" nnoremap <silent> M<CR> :ccl<CR>
nnoremap <silent> <Leader>r :!./run.sh<CR>
nnoremap <silent> <Leader>R :silent !code -r .<CR>
nnoremap <silent> <Leader>t :!cscope -bcqR<CR>:cscope reset<CR>
nnoremap <silent> <Leader>T :!generate_cscope -f cscope.gen<CR>:!cscope -bcqR<CR>:cscope kill -1<CR>:cscope add .<CR>

inoremap <C-f> {}<Esc>i<Return><Return><Esc>kS
