set nocompatible
set ls=2
set tabstop=4
set shiftwidth=2
set scrolloff=3
set showcmd
set hlsearch
set incsearch
set ruler
set visualbell t_vb=
set novisualbell
set nobackup
set number
set ignorecase
set ttyfast
set modeline
set shortmess=atI
set nostartofline
set autoindent
set smartindent
set cindent
set sm
set wildmenu
set wildmode=longest:full
set linespace=0
set numberwidth=4
set scrolloff=10

set statusline=%F%m%r%h%w[%L][%p%%][%04l,%04v]
set ofu=syntaxcomplete#Complete
let clj_highlight_builtins = 1
set expandtab
set ts=4
set sw=4
set isk+=_,$,@,%,#,- " none of these should be word dividers, so make them not be
"set lz 
set smarttab

let mapleader=","
let maplocalleader="\\"

filetype plugin indent on
filetype on
filetype plugin on
syntax on

au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set complete=.,w,b,u,t,i
set completeopt=menuone,menu,longest,preview
set omnifunc=syntaxcomplete#Complete

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

au BufRead sup.*        set ft=mail

set background=dark
set t_Co=256
let g:colors_name="256-bronsa"

let c_gnu = 1

hi Normal       ctermfg=white         ctermbg=None        cterm=None
hi Cursor       ctermfg=white         ctermbg=None       cterm=None
hi SpecialKey   ctermfg=242          ctermbg=None       cterm=Bold
hi Directory    ctermfg=76          ctermbg=None       cterm=None
hi ErrorMsg     ctermfg=124         ctermbg=None      cterm=None    term=standout
hi Search       ctermfg=160         ctermbg=232        cterm=Bold
hi Type         ctermfg=160         ctermbg=None
hi Statement    ctermfg=184         ctermbg=None       cterm=None
hi Comment      ctermfg=241         ctermbg=None       cterm=None
hi Identifier   ctermfg=40         ctermbg=None         cterm=None
hi DiffText     ctermfg=88          ctermbg=250        cterm=None
hi Constant     ctermfg=160         ctermbg=None
hi Todo         ctermfg=233         ctermbg=118        cterm=Bold
hi Error        ctermfg=233         ctermbg=124
hi Special      ctermfg=yellow         ctermbg=None
hi Ignore       ctermfg=220         ctermbg=None       cterm=Bold
hi Underline    ctermfg=244         ctermbg=None       cterm=None
hi PreProc     ctermfg=darkgreen

hi FoldColumn   ctermfg=247         ctermbg=None       cterm=Bold
hi StatusLineNC ctermfg=white       ctermbg=None
hi StatusLine   ctermfg=white       ctermbg=None    cterm=None
hi VertSplit    ctermfg=247         ctermbg=234        cterm=Bold
hi LineNr       ctermfg=black         ctermbg=None        cterm=Bold
hi NonText      ctermfg=235          ctermbg=None       cterm=Bold

hi Pmenu        ctermfg=White       ctermbg=232    cterm=None
hi PmenuSel     ctermfg=None        ctermbg=234        cterm=Bold
hi PmenuSbar    ctermfg=None        ctermbg=232    cterm=None
hi PmenuThumb   ctermfg=None        ctermbg=237        cterm=None

let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-n>"

let g:slimv_python="/usr/bin/python"
let g:slimv_lisp="/usr/bin/sbcl"
let g:slimv_impl = 'sbcl'
let g:slimv_clhs_root="http://www.lispworks.com/documentation/HyperSpec/"

set fileencodings=utf-8
set encoding=utf-8
set termencoding=utf-8
set enc=utf-8

map <C-t> :tabnew<CR>
map <C-c> :tabclose<CR>
map <C-N> :tabnext<CR>
map <C-P> :tabprevious<CR>
map Q :q!<CR>
map q :q<CR>
map S :shell<CR>
map W :w<CR>
map s :s<CR>
map t :tabnew<CR>:e 
map . <C-r>

set spelllang=it
set viminfo='10,\"100,:20,%,n~/.viminfo
