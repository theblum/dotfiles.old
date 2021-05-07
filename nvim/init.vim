if &compatible
    set nocompatible
endif

let s:home = fnamemodify(resolve(expand("<sfile>:p")), ":h")

command! -nargs=1 LoadScript exec "source" . s:home . "/" . "<args>"

LoadScript init/options.vim
LoadScript init/commands.vim
LoadScript init/colors.vim
LoadScript init/keymaps.vim

LoadScript init/cfg_fzf.vim
LoadScript init/cfg_coc.vim
LoadScript init/cfg_rust.vim
LoadScript init/cfg_lightline.vim
