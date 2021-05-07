" remember last cursor position
augroup LastPosition
    autocmd!
    autocmd BufReadPost *
        \ if &filetype != 'gitcommit' &&
        \     line("'\"") > 0 && line("'\"") <= line('$') |
        \     exec "normal g`\"" |
        \ endif
augroup END

" save file when leaving buffer or losing focus
augroup AutoWrite
    autocmd!
    autocmd FocusLost,WinLeave * silent! update
augroup END

" reloads buffer to check for external changes when gaining focus
augroup AutoReload
    autocmd!
    autocmd FocusGained,BufEnter * silent! checktime
augroup END

" auto rebalance windows on resize
augroup ResizeWindows
    autocmd!
    autocmd VimResized * wincmd =
augroup END

" auto open quickfix window after :make
augroup QuickFixWindow
    autocmd!
    autocmd QuickFixCmdPost [^l]* nested botright cwindow
    autocmd QuickFixCmdPost l* nested botright lwindow
augroup END

" source project.vim on startup and directory change
augroup ProjectVim
    autocmd!
    autocmd VimEnter,DirChanged * if filereadable("./project.vim")
    autocmd VimEnter,DirChanged *     source ./project.vim
    autocmd VimEnter,DirChanged * endif
augroup END

augroup Brackets
    autocmd!
    autocmd FileType java,rust inoremap <buffer> <C-f> {}<Esc>i<CR><CR><Esc>kS
augroup END
