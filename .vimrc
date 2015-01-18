set nocompatible
filetype off
" vim-plug {{{
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif
" }}}

" General {{{
filetype plugin indent on

set omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType cpp set omnifunc=omni#cpp#complete#Main

syntax enable
set background=dark
set fileformats=unix,dos,mac
set mouse=a
set mousehide

set nomodeline
set nostartofline

set encoding=utf-8
setglobal fileencoding=utf-8
set fileencodings=utf-8
scriptencoding utf-8

nnoremap <Space> <NOP>
let mapleader="\<Space>"
let maplocalleader="\<Space>"

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

let g:gruvbox_italic=0
colorscheme gruvbox

let &t_SI .= "\<Esc>[5 q"
let &t_EI .= "\<Esc>[0 q"

set tabpagemax=8
set cursorline
set nocursorcolumn
set lazyredraw
set ttyfast
set ttymouse=xterm2
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
set hlsearch | nohlsearch
set ignorecase
set smartcase

set wildmode=list:longest,list:full

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
set timeoutlen=200
set ttimeout
set ttimeoutlen=10

set autoread
set autochdir
set number
set numberwidth=5

set spelllang=en_gb
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
set smarttab
set shiftround
set nojoinspaces
set splitright
set splitbelow
set textwidth=0
set wrapmargin=0
set synmaxcol=120

set list
set listchars=tab:›\ ,trail:·,extends:»,precedes:«,nbsp:×

set omnifunc=syntaxcomplete#Complete

set complete=.,w,b,u,t
set completeopt=menu,longest
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
    set guifont=ttyp0\ 12
else
    set t_Co=256
    set t_ut=
    set noerrorbells
    set novisualbell
    let g:rehash256=1
endif
" }}}

" Mapping {{{
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
nnoremap <Leader>bs :split<CR>
nnoremap <Leader>bv :vsp<CR>

nnoremap <Leader>e :e
nnoremap <Leader>w :w<CR>

nnoremap <Leader>ls :ls<CR>

noremap <Leader><Leader> :bn<CR>
noremap <Leader><Leader>b :bp<CR>
noremap <Leader><Leader>p :CtrlPBuffer<CR>

nnoremap <silent> <Right> <C-W>l
nnoremap <silent> <Left> <C-W>h
nnoremap <silent> <Up> <C-W>k
nnoremap <silent> <Down> <C-W>j

nnoremap <silent> <Leader>sp :set spell!<CR>
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

map q: :q
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

" CtrlP {{{
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_custom_ignore={
            \ 'dir': '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

let g:ctrlp_extensions=['funky']

nnoremap <Leader>p :CtrlP<Cr>
nnoremap <Leader>fu :CtrlPFunky<Cr>
" }}}

" Pandoc {{{
command! -nargs=1 Silent
            \ | execute ':silent !'.<q-args>
            \ | execute ':redraw!'
nnoremap <Leader>hmd :Silent htmlmd %<Cr>
let g:pandoc_use_conceal=0
let g:pandoc#syntax#conceal#use=0
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
let g:ycm_global_ycm_extra_conf="~/.vim/.ycm_extra_conf.py"
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_semantic_triggers={
\   'c,cpp': ['.', '->', 're![a-zA-Z]'],
\   'python,java,javascript': ['.', 're![a-zA-Z]']
\ }
" }}}

" Airline {{{
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'
" }}}

" tern_for_vim {{{
autocmd FileType javascript setlocal completeopt-=preview
" }}}

" python-syntax {{{
let python_highlight_all=1
" }}}
" Jedi {{{
autocmd FileType python setlocal completeopt-=preview
" }}}

" Syntastic {{{
let g:syntastic_mode_map={ 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_cpp_compiler='clang++'
let g:syntastic_cpp_compiler_options=' -std=c++1y'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_cpp_check_header=1
let g:syntastic_cpp_no_include_search=0
"}}}

" Eclim {{{
let g:EclimCompletionMethod='omnifunc'
" }}}

" incsearch {{{
let g:incsearch#auto_nohlsearch=1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" }}}

" matchit {{{
let g:html_indent_tags='li\p'
" }}}

" easy-align {{{
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}}

" LiteDFM {{{
nnoremap <Leader>z :LiteDFMToggle<CR>
" }}}

" vim-expand-region {{{
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" }}}
