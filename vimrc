runtime! debian.vim

if has("syntax")
    syntax on
endif

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set nu
" set relativenumber

set nocompatible
syntax on
syntax enable
set t_Co=256
set cursorline

" let g:solarized_termtrans=256
set background=dark
colorscheme solarized

set showmatch   " Show matching brackets.
set ignorecase        " Do case insensitive matching
set smartcase        " Do smart case matching
set hidden        " Hide buffers when they are abandoned

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set showmode

set nobackup
set noswapfile
set nowb

set history=700
filetype plugin on
filetype indent on

" check double quotation marks
set ambiwidth=double

" incorrect handle the chinese splicing
set formatoptions+=mM

" set paste mode, to avoid offset
" set paste

" code comletion
set completeopt=preview,menu
" set list
" set listchars=tab:>-,trail:-

set autoread
set autowrite        " Automatically save before commands like :next and :make

set ruler
set hid
set cmdheight=2
set incsearch        " Incremental search
set hlsearch

set magic
set lazyredraw
set mat=2

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,utf-16,big5,gb2312,gb18030,gbk,cp936,chinese,latin1
set ffs=unix

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"language messages zh_CN.utf-8

set so=2
set wildmenu

set smarttab
set lbr
set tw=500

set autoindent
set smartindent
set wrap

set guifont=Consolas:h9:cANSI

set whichwrap+=<,>,h,l

let mapleader=","
let g:mapleader=","

nmap <leader>w :w!<cr>

vnoremap <silent> * :call VisualSelection("f")<CR>
vnoremap <silent> # :call VisualSelection("b")<CR>

map j gj
map k gk

map <space> /
map <c-space> ?

map <silent> <leader><cr> :noh<cr>

" set ctrl+j/k/h/l replace ctrl+w+j/k/h/l
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" inoremap <C-h> <Left>
" inoremap <C-j> <Down>
" inoremap <C-k> <Up>
" inoremap <C-l> <Right>

map <leader>bd :Bclose<cr>
map <leader>ba :1,1000 bd!<cr>
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
map <leader>cd :cd %:p:h<cr>:pwd<cr>

try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

set backspace=indent,eol,start
set laststatus=2
set statusline=%F%m%r%h%w\ [ENC=%{&fenc}]\ [FMT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [%p%%]\ [LEN=%L]\ 
" set statusline=%F%m%r%h%w\ [ENC=%{&fenc}]\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]\ 

" map 0 ^

nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
nmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
nmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif

func! DeleteTrailingWS()
      exe "normal mz"
      %s/\s\+$//ge
      exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

vnoremap <silent> gv :call VisualSelection('gv')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

map <leader>ss :setlocal spell!<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Enable Folding
set foldmethod=indent
set foldlevel=99
" nnoremap <space> za

set vb t_vb=
highlight Comment ctermfg=magenta guifg=magenta
set nobomb




" ======================================================================================
" Plugins For VIM
" ======================================================================================

" ===================================
" NERD tree
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" autocmd vimenter * if !argc() | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nmap <F5> :NERDTreeToggle<cr>

" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

" ===================================
" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>

" ===================================
" Syntastic
execute pathogen#infect()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" ===================================
" Neocompletion
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
