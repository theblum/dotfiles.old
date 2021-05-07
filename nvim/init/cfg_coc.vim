function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <C-Space> coc#refresh()

if exists('*complete_info')
    inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> <Leader>gd <Plug>(coc-definition)
nmap <silent> <Leader>gy <Plug>(coc-type-definition)
nmap <silent> <Leader>gi <Plug>(coc-implementation)
nmap <silent> <Leader>gr <Plug>(coc-references)

function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>

nmap <Leader>rn <Plug>(coc-rename)

xmap <Leader>fm <Plug>(coc-format-selected)
nmap <Leader>fm <Plug>(coc-format-selected)

augroup CocGroup
    autocmd!
    autocmd CursorHold * silent call CocActionAsync('highlight')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END

xmap <Leader>a <Plug>(coc-codeaction-selected)
xmap <Leader>a <Plug>(coc-codeaction-selected)

nmap <Leader>ac <Plug>(coc-codeaction)
nmap <Leader>qf <Plug>(coc-fix-current)

nnoremap <silent><nowait> <Leader>oa :<C-u>CocList diagnostics<CR>
nnoremap <silent><nowait> <Leader>oe :<C-u>CocList extensions<CR>
nnoremap <silent><nowait> <Leader>oc :<C-u>CocList commands<CR>
nnoremap <silent><nowait> <Leader>oo :<C-u>CocList outline<CR>
nnoremap <silent><nowait> <Leader>os :<C-u>CocList -I symbols<CR>
nnoremap <silent><nowait> <Leader>oj :<C-u>CocNext<CR>
nnoremap <silent><nowait> <Leader>ok :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <Leader>op :<C-u>CocListResume<CR>

" coc-explorer
nnoremap <Leader>fr :CocCommand explorer --position floating<CR>
nnoremap <Leader>fR :CocCommand explorer<CR>
