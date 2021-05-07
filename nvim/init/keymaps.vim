let g:mapleader = ","
let g:localmapleader = "\\"

" edit configs
nnoremap <silent> <Leader>ev :edit $MYVIMRC<CR>
nnoremap <silent> <Leader>ex :edit $HOME/.xinitrc<CR>
nnoremap <silent> <Leader>eX :edit $HOME/.Xresources<CR>
nnoremap <silent> <Leader>ea :edit $HOME/.config/alacritty/alacritty.yml<CR>
nnoremap <silent> <Leader>ei :edit $HOME/.config/i3/config<CR>
nnoremap <silent> <Leader>ez :edit $HOME/.zshrc<CR>

" save current file
inoremap <C-s> <Esc>:w<CR>a
nnoremap <C-s> :w<CR>

" use jk to escape insert/command mode
inoremap jk <Esc>
cnoremap jk <Esc>

" cut/copy/paste system clipboard
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P

" change working directory to match current file
nnoremap <silent> <Leader>cd :cd %:p:h<CR>:pwd<CR>

" highlight last inserted text
nnoremap gV `[v`]

" better j and k line movement
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" switch to previous buffer
nnoremap <Leader><Leader> <C-^>

" window management
nnoremap <silent> <Leader>S :split<CR>
nnoremap <silent> <Leader>V :vsplit<CR>
nnoremap <silent> <Leader>D :buffer#<BAR>bdelete#<CR>
nnoremap <silent> <Leader>C :close<CR>
nnoremap <silent> <Leader>O :only<CR>

" move around windows
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <Leader>H <C-w>H
nnoremap <Leader>J <C-w>J
nnoremap <Leader>K <C-w>K
nnoremap <Leader>L <C-w>L

" keep selection when {in,out}denting
vnoremap > >gv
vnoremap < <gv

" uppercase previous word
nnoremap <Leader>u gUiwea
nnoremap <Leader>U guiew
imap <C-l> <Esc><Leader>u
