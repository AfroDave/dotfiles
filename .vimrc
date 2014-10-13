" Vundle {{{
set nocompatible
filetype off

if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif
" }}}

" General {{{
filetype plugin indent on
syntax enable
set background=dark
set fileformats=unix,dos,mac
set mouse=a
set mousehide

set nomodeline
set nostartofline

set encoding=utf-8
setglobal fileencoding=utf-8
set fileencodings=utf-8,latin1
scriptencoding utf-8

let mapleader=','
let maplocalleader=','

if has('clipboard')
    if has('unnamedplus')
        set clipboard=unnamedplus
    else
        set clipboard=unnamed
    endif
endif

set shortmess+=filmnrxoOtT
set viewoptions=folds,options,cursor,unix,slash
set sessionoptions=buffers,folds,tabpages,winsize
set virtualedit=block
set history=1000
set hidden

function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

set backup
set backupdir=~/.vim/tmp/backup
set swapfile
set dir=~/.vim/tmp/swap
set undodir=~/.vim/tmp/undo
if has('persistent_undo')
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

autocmd BufEnter * silent! lcd %:p:h

colorscheme lucius

let &t_SI .= "\<Esc>[5 q"
let &t_EI .= "\<Esc>[0 q"

set tabpagemax=8
set cursorline
set nocursorcolumn
set lazyredraw
set ttyfast
set winminheight=0

highlight clear NonText
highlight clear SpecialKey
highlight NonText guifg=#4A4A59 ctermfg=black
highlight SpecialKey guifg=#4A4A59 ctermfg=black

if has('cmdline_info')
    set ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    set showcmd
endif

if has('statusline')
    set laststatus=2
    set statusline+=%<%f\ " Filename
    set statusline+=%w%h%m%r
    set statusline+=\ [%{&ff}/%Y]
    set statusline+=\ [%{getcwd()}]
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%
endif

set backspace=indent,eol,start
set linespace=0
set nu
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase

set wildmode=list:longest

set wildignore+=.hg,.git,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.pyc,*.class,*.aux,*.odg,*.pdf
set wildignore+=*.spl
set wildignore+=*.swp
set wildignore+=*/tmp/*
set wildignore+=*.zip,*.tar*
set wildignore+=*.DS_Store
set wildignore+=*.luac
set wildignore+=migrations
set wildignore+=*.pyc
set wildignore+=*.orig
set wildignore+=classes
set wildignore+=lib

set whichwrap=b,s,h,l,<,>,[,]
set scrolljump=5
set scrolloff=3
set nofoldenable
set foldlevelstart=99
set foldmethod=syntax

set timeout
set timeoutlen=600
set ttimeout
set ttimeoutlen=10

set autoread
set autochdir
set number

set spelllang=en_gb
nmap <silent> <Leader>s :set spell!<CR>
" }}}

" Formatting {{{
set wrap linebreak nolist
set autoindent
set expandtab
set copyindent
set preserveindent
set softtabstop=4
set shiftwidth=4
set tabstop=4
set shiftround
set nojoinspaces
set splitright
set splitbelow
set textwidth=0
set wrapmargin=0
set synmaxcol=512

set list
set listchars=tab:›\ ,trail:·,extends:»,precedes:«,nbsp:×

set omnifunc=syntaxcomplete#Complete

set complete=.,w,b,u,t
set completeopt=menu,preview,longest
" }}}

" CtrlP {{{
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

let g:ctrlp_extensions = ['funky']

nnoremap <Leader>fu :CtrlPFunky<Cr>
" }}}

" GUI {{{
if has("gui_running")
    set guiheadroom=0
    set guioptions-=r
    set guioptions-=M
    set guioptions-=T
    set guioptions+=g
    set guioptions-=t
    set guioptions-=m
    set guioptions-=L
    set guioptions-=l
    set guioptions-=r
    set guioptions-=R
    set guifont=Monospace\ 11
else
    set t_Co=256
    set t_ut=
    set noerrorbells
    set novisualbell
    let g:rehash256=1
endif
" }}}

" Commands {{{
function! StripTrailingWhitespace()
    normal mZ
    %s/\s\+$//e
    if line("'Z") != line(".")
        echo "Stripped whitespace\n"
    endif
    normal `Z
endfunction
" }}}

" Mapping {{{
nnoremap j jzz
nnoremap k kzz

command! -bang -nargs=* -complete=file E e<bang> <args>
command! -bang -nargs=* -complete=file W w<bang> <args>
command! -bang -nargs=* -complete=file Wq wq<bang> <args>
command! -bang -nargs=* -complete=file WQ wq<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>

cmap Tabe tab

nnoremap Y y$

cmap cwd lcd %:p:h

vnoremap < <gv
vnoremap > >gv

vnoremap . :normal .<CR>

cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <Leader>ew :e %%
map <Leader>es :sp %%
map <Leader>ev :vsp %%
map <Leader>bs :split<CR>
map <Leader>bv :vsp<CR>
map <Leader>et :tabe %%

map zl zL
map zh zH

nnoremap <silent> <Leader>q gwip
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <C-B> :b#<CR>

noremap <Tab> :<C-U>bn<CR>
noremap <C-Tab> :<C-U>bp<CR>

nnoremap <Space> za
vnoremap <Space> za

nnoremap <silent> <Right> <C-W>l
nnoremap <silent> <Left> <C-W>h
nnoremap <silent> <Up> <C-W>k
nnoremap <silent> <Down> <C-W>j

nnoremap <Leader>= <C-W>=
nnoremap <Leader>_ <C-W>_
nnoremap <Leader><bar> <C-W><bar>
" }}}

" Syntastic {{{
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++1y'
"}}}

" Pandoc {{{
command! -nargs=1 Silent
            \ | execute ':silent !'.<q-args>
            \ | execute ':redraw!'
nnoremap <Leader>hmd :Silent htmlmd %<Cr>
let g:pandoc_use_conceal=0
" }}}

" indentLine {{{
let g:indentLine_char='│'
" }}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger="<C-K>"
let g:UltiSnipsJumpForwardTrigger="<C-K>"
let g:UltiSnipsJumpBackwardTrigger="<C-S-K>"
" }}}

" YouCompleteMe {{{
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
" }}}

" Tern {{{
let g:tern_map_keys=1
autocmd FileType *.js set updatetime 1000
" }}}

" Airline {{{
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='lucius'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'
" }}}
