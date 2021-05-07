command! -bang -nargs=* Find
        \ call fzf#vim#grep(
        \     'rg --column --line-number --no-heading --color=always --smart-case --no-ignore --hidden --follow --glob="!.git/*" --glob="!cscope.*" '.shellescape(<q-args>), 1,
        \     <bang>0 ? fzf#vim#with_preview('up:60%')
        \             : fzf#vim#with_preview('right:50%:hidden', '?'),
        \     <bang>0)

nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fg :Find<Space>
nnoremap <Leader>fd "zyiw:execute "Find ".@z<CR>
nnoremap <Leader>fb :Buffers<CR>
