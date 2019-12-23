" -- Startup Commands -------------------------------------------------- {{{

" when started as evim, exit, as 'evim.vim' will already load
if v:progname =~? "evim"
    finish
endif

if &compatible
    set nocompatible                  " use vim settings (as opposed to vi)
endif

let $VIMHOME = $HOME . "/.config/nvim"

" }}}
" -- Dein -------------------------------------------------------------- {{{

let b:plugin_directory = '~/.local/share/nvim/dein'
let b:dein_directory = b:plugin_directory . '/repos/github.com/Shougo/dein.vim'

if (!isdirectory(expand(b:dein_directory)))
    call system(expand('mkdir -p ' . b:dein_directory))
    call system(expand('git clone https://github.com/Shougo/dein.vim ' . b:dein_directory))
endif

let &runtimepath .= ',' . b:dein_directory

if dein#load_state(expand(b:plugin_directory))
    call dein#begin(expand(b:plugin_directory))

" ---- Plugins --------------------------------------------------------- {{{
    call dein#add('Shougo/dein.vim')
    call dein#add('Shougo/echodoc.vim')
    call dein#add('Shougo/deoplete.nvim', { 'do' : ':UpdateRemotePlugins' })
    call dein#add('Shougo/deoplete-lsp')
    call dein#add('Shougo/neco-vim')
    call dein#add('Shougo/neoinclude.vim')
    call dein#add('rust-lang/rust.vim')
    call dein#add('racer-rust/vim-racer')
    call dein#add('w0rp/ale')
    call dein#add('deoplete-plugins/deoplete-clang')
    call dein#add('deoplete-plugins/deoplete-jedi')
    call dein#add('deoplete-plugins/deoplete-zsh')
    call dein#add('wellle/tmux-complete.vim')
    call dein#add('haya14busa/dein-command.vim')
    call dein#add('chriskempson/base16-vim')
    " call dein#add('airblade/vim-gitgutter')
    call dein#add('airblade/vim-rooter')
    call dein#add('tpope/vim-abolish')
    call dein#add('tpope/vim-dispatch')
    " call dein#add('tpope/vim-endwise')
    call dein#add('tpope/vim-eunuch')
    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-repeat')
    call dein#add('tpope/vim-surround')
    call dein#add('tpope/vim-unimpaired')
    call dein#add('tpope/vim-vinegar')
    call dein#add('tomtom/tcomment_vim')
    call dein#add('junegunn/fzf', { 'merged' : 0 })
    call dein#add('junegunn/fzf.vim', { 'depends' : 'fzf' })
    call dein#add('junegunn/limelight.vim')
    call dein#add('junegunn/goyo.vim')
    call dein#add('derekwyatt/vim-fswitch')
    call dein#add('itchyny/lightline.vim')
    call dein#add('gilligan/vim-lldb')
    call dein#add('PotatoesMaster/i3-vim-syntax')
    call dein#add('beyondmarc/glsl.vim')
    call dein#add('baskerville/vim-sxhkdrc')
    call dein#add('Tetralux/odin.vim')
" }}}

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

" }}}
" -- Options ----------------------------------------------------------- {{{

filetype plugin on
filetype indent on
syntax enable

set autowrite
set background=dark
set colorcolumn=101
set complete=.,w,b,u,i,d,t
set completeopt=menu
set confirm
set cscopetag
set cursorline
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set fileencodings=utf-8
set fileformat=unix
set foldmethod=marker
set grepprg=rg\ --vimgrep
set hidden
set incsearch
set ignorecase
set lazyredraw
set list
set listchars=tab:»\ ,trail:·,eol:¬
set mouse=a
set nobackup
set nohlsearch
set noshowmode
set noswapfile
set nowrap
set number
set pastetoggle=<F2>
set relativenumber
set scrolloff=4
set secure
set shiftround
set shiftwidth=4
set showcmd
set showmatch
set smartcase
set smartindent
set softtabstop=4
set splitbelow
set splitright
set textwidth=0
set undofile
set wildmenu
set wildmode=list:longest

" access colors present in 256 colorspace for base16 colorschemes
if filereadable(expand('~/.vimrc_background'))
    let base16colorspace = 256
    source ~/.vimrc_background
endif

if has("cscope")
    set cscopetag
    set cscopetagorder=0
    set cscopeverbose
endif

" }}}
" -- UI Modificatons---------------------------------------------------- {{{

" remember last cursor position in file
augroup LastPosition
    autocmd!
    autocmd BufReadPost *
        \ if &filetype != 'gitcommit' &&
        \     line("'\"") > 0 && line("'\"") <= line('$') |
        \         exec "normal g`\"" |
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

" setup cscope
augroup LoadCscope
    autocmd!
    autocmd BufEnter * call s:load_cscope()
augroup END

" insert header in *.c and *.h files
augroup InsertCHeader
    autocmd!
    autocmd BufNewFile *.c source $VIMHOME/template_c.vim
    autocmd BufNewFile *.h source $VIMHOME/template_h.vim
    autocmd BufNewFile *.h    silent execute "1,%" . "s/%headername%/\\U" .expand('%:t:r') . "_" .expand('%:t:e') . "\\e"
    autocmd BufNewFile *.[ch] silent execute "1,%" . "s/%filename%/" .expand('%:t')
    autocmd BufNewFile *.[ch] silent execute "1,%" . "s/%date%/" .strftime('%d %b %Y')
    autocmd BufNewFile *.[ch] silent execute "1,%" . "s/%author%/Brian Blumberg"
    autocmd BufNewFile *.[ch] silent execute "1,%" . "s/%email%/<blum@disroot.org>"
    autocmd BufNewFile *.[ch] silent execute "1,%" . "s/%year%/" .strftime('%Y')
    autocmd BufNewFile *.[ch] %

    autocmd BufNewFile *.cpp source $VIMHOME/template_cpp.vim
    autocmd BufNewFile *.hpp source $VIMHOME/template_hpp.vim
    autocmd BufNewFile *.hpp    silent execute "1,%" . "s/%headername%/\\U" .expand('%:t:r') . "_" .expand('%:t:e') . "\\e"
    autocmd BufNewFile *.[ch]pp silent execute "1,%" . "s/%filename%/" .expand('%:t')
    autocmd BufNewFile *.[ch]pp silent execute "1,%" . "s/%date%/" .strftime('%d %b %Y')
    autocmd BufNewFile *.[ch]pp silent execute "1,%" . "s/%author%/Brian Blumberg"
    autocmd BufNewFile *.[ch]pp silent execute "1,%" . "s/%email%/<blum@disroot.org>"
    autocmd BufNewFile *.[ch]pp silent execute "1,%" . "s/%year%/" .strftime('%Y')
    autocmd BufNewFile *.[ch]pp %
augroup END

" }}}
" -- Customization ----------------------------------------------------- {{{

" fzf/ripgrep
command! -bang -nargs=* Find 
            \ call fzf#vim#grep(
            \     'rg --column --line-number --no-heading --color=always --smart-case --no-ignore --hidden --follow --glob="!.git/*" --glob="!cscope.*" '.shellescape(<q-args>), 1,
            \     <bang>0 ? fzf#vim#with_preview('up:60%')
            \             : fzf#vim#with_preview('right:50%:hidden', '?'),
            \     <bang>0)

" cscope
function! s:load_cscope()
    if has("cscope")
        let db = findfile("cscope.out", ".;")
        if (!empty(db))
            let path = strpart(db, 0, match(db, "/cscope.out$"))
            set nocscopeverbose
            exec "silent cscope add " . db . " " . path
            set cscopeverbose
        elseif $CSCOPE_DB != ""
            silent cscope add $CSCOPE_DB
        endif
    endif
endfunction

" asm
let g:asmsyntax = "nasm"

" c
"let g:c_syntax_for_h = 1

" rust
let g:racer_cmd = $HOME . "/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:rustfmt_autosave = 1
let $RUST_SRC_PATH = systemlist("rustc --print sysroot")[0] . "/lib/rustlib/src/rust/src"

" linter
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_virtualtext_cursor = 1
let g:ale_linters = { 'rust': ['rls'], 'c': ['clangd'], 'cpp': ['clangd'], 'python': ['flake8'] }
let g:ale_fixers = { 'python': ['isort', 'yapf'] }
let g:ale_c_clangd_options = '-I./include'
let g:ale_cpp_clangd_options = g:ale_c_clangd_options
let g:ale_rust_rls_toolchain = ''
let g:ale_rust_rls_config = { 'rust': { 'clippy_preference': 'on' } }

" echodoc
let g:echodoc#enable_at_startup = 1

" deoplete
let g:deoplete#enable_at_startup = 1
call g:deoplete#custom#option('auto_complete_delay', 0)

" deoplete-clang
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

" tmux-complete
let g:tmuxcomplete#trigger = ''

" goyo/limelight
let g:limelight_priority = -1

let g:goyo_height = '90%'
let g:goyo_width = 120

function! s:goyo_enter()
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
    Limelight
endfunction

function! s:goyo_leave()
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | greq -q Z && tmux resize-pane -Z
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" lightline
let g:lightline = { 'colorscheme': 'Tomorrow_Night' }

" lldb
let g:lldb_map_Lstart = "<Leader>ds"
let g:lldb_map_Lrun = "<Leader>dr"
let g:lldb_map_Lcontinue = "<Leader>dc"
let g:lldb_map_Lstep = "<Leader>ds"
let g:lldb_map_Lstepinst = "<Leader>di"
let g:lldb_map_Lstepinstover = "<Leader>do"
let g:lldb_map_Lnext = "<Leader>dn"
let g:lldb_map_Lfinish = "<Leader>df"
let g:lldb_map_Lbreakpoint = "<Leader>db"
let g:lldb_map_Lprint = "<Leader>dp"
let g:lldb_map_Lframe = "<Leader>dr"

" }}}
" -- Keymappings ------------------------------------------------------- {{{

let g:mapleader = ","
let g:localmapleader = "\\"

" edit and source nvim config file
nnoremap <silent> <Leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <Leader>sv :so $MYVIMRC<CR>

" edit .xinitrc and .Xresources
nnoremap <silent> <Leader>ex :e ~/.xinitrc<CR>
nnoremap <silent> <Leader>eX :e ~/.Xresources<CR>

" edit i3 config file
nnoremap <silent> <Leader>ei :e ~/.config/i3/config<CR>

" edit bspwm/sxhkd config file
nnoremap <silent> <Leader>eb :e ~/.config/bspwm/bspwmrc<CR>
nnoremap <silent> <Leader>es :e ~/.config/sxhkd/sxhkdrc<CR>

" edit herbstluftwm config file
nnoremap <silent> <Leader>eh :e ~/.config/herbstluftwm/autostart<CR>

" edit dwm config file
nnoremap <silent> <Leader>ed :e ~/dtf/dwm/config.h<CR>

" edit zsh config file
nnoremap <silent> <Leader>ez :e ~/.zshrc<CR>

" save current file
inoremap <C-s> <Esc>:w<CR>a
nnoremap <C-s> :w<CR>

" cut/copy/paste system clipboard
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" better j and k line movement
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" open and grep files recursively
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fg :Find 
nnoremap <Leader>fd "zyiw:execute "Find " . @z<CR>
nnoremap <Leader>fb :Buffers<CR>

" ale commands
inoremap <silent> <C-Space> <C-\><C-O>:ALEComplete<CR>
nnoremap <Leader>gdd :ALEGoToDefinition<CR>
nnoremap <Leader>gds :ALEGoToDefinitionInSplit<CR>
nnoremap <Leader>gdv :ALEGoToDefinitionInVSplit<CR>
nnoremap <Leader>gr :ALEFindReferences<CR>
nnoremap <Leader>gh :ALEHover<CR>
nnoremap <Leader>gi :ALEDetail<CR>
nnoremap <Leader>gn :ALENextWrap<CR>
nnoremap <Leader>gp :ALEPreviousWrap<CR>
nnoremap <Leader>= :ALEFix<CR>

" toggle goyo
nnoremap <Leader>ng :Goyo<CR>

" toggle limelight
nnoremap <Leader>nl :Limelight!!<CR>

" deoplete
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

" move around windows
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <Leader>H <C-w>H
nnoremap <Leader>J <C-w>J
nnoremap <Leader>K <C-w>K
nnoremap <Leader>L <C-w>L

" open/close windows
nnoremap <silent> <Leader>S :split<CR>
nnoremap <silent> <Leader>V :vsplit<CR>
nnoremap <silent> <Leader>D :buffer#<BAR>bdelete#<CR>
nnoremap <silent> <Leader>C :close<CR>
nnoremap <silent> <Leader>O :only<CR>

" switch between source/header files
nnoremap <silent> <Leader>of :FSHere<CR>
nnoremap <silent> <Leader>ol :FSRight<CR>
nnoremap <silent> <Leader>oL :FSSplitRight<CR>
nnoremap <silent> <Leader>oh :FSLeft<CR>
nnoremap <silent> <Leader>oH :FSSplitLeft<CR>
nnoremap <silent> <Leader>ok :FSAbove<CR>
nnoremap <silent> <Leader>oK :FSSplitAbove<CR>
nnoremap <silent> <Leader>oj :FSBelow<CR>
nnoremap <silent> <Leader>oJ :FSSplitBelow<CR>

" keep selection when {in,out}denting
vnoremap > >gv
vnoremap < <gv

" use jk to escape insert/command mode
inoremap jk <Esc>
cnoremap jk <Esc>

" swap : and ;
"nnoremap ; :
"nnoremap : ;
"vnoremap ; :
"vnoremap : ;

" toggle syntax highlighting
nnoremap <silent> <Leader>nt :if exists("g:syntax_on")<BAR>syntax off<BAR>else<BAR>syntax enable<BAR>endif<CR>

" insert date
nnoremap <silent> <Leader>nd a<<Esc>"=strftime('%d %b %Y')<CR>pa><Esc>

" change working directory to match current file
nnoremap <silent> <Leader>cd :cd %:p:h<CR>:pwd<CR>

" return to previous buffer
nnoremap <Leader><Leader> <C-^>

" in normal mode, space toggles folds
nnoremap <Space> za

" uppercase previous word
nnoremap <Leader>u gUiwea
nnoremap <Leader>U gUiwe

" command mode movement
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" delete all open buffers
cnoremap bbd bufdo :bd

" }}}
