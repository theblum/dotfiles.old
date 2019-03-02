" NOT NEEDED WITH VIM-DISPATCH PLUGIN
nnoremap <silent> <Leader>m :make<CR>
nnoremap <silent> <Leader>M :ccl<CR>
nnoremap <silent> M<CR> :ccl<CR>
nnoremap <silent> <Leader>r :!./run.sh<CR><CR>
nnoremap <silent> <Leader>t :!cscope -bcqR<CR>:cscope reset<CR>
nnoremap <silent> <Leader>T :!generate_cscope -f cscope.gen<CR>:!cscope -bcqR<CR>:cscope kill -1<CR>:cscope add .<CR>

vnoremap gi V'<O#if 0<Esc>'>o#endif<Esc>
"vnoremap gI V'<O#if 0<Esc>'>o#else<CR>#endif<Esc>
nnoremap gI ?^#if<CR>dd/^#endif<CR>dd
