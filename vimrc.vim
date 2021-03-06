
" === General Config ===

set autoread
set backspace=indent,eol,start
set encoding=utf-8
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set nobackup
set nocompatible
set noswapfile
set nowb
set number
set showcmd
set showmode
set smartcase
set t_Co=256
set visualbell
set nohidden


filetype indent on
filetype plugin on
syntax on


" === Endline movement ===

set linebreak
set textwidth=0
set wrapmargin=0
set formatoptions+=l
set whichwrap+=<,>,h,l,[,]
set nowrap



" === Word Separators ===

set iskeyword+=$
set iskeyword+=-
set iskeyword+=@



" === Folds ===

syn match MyEmptyLines "\(^\s*\n\)\+" fold
syn sync fromstart
set foldmethod=indent
set foldlevel=20


" === Indentation ===

set autoindent
set smartindent
set smarttab
set shiftwidth=4    "4 spaces by default
set softtabstop=4
set tabstop=4
set expandtab
nohlsearch


" === Scrolling ===

set scrolloff=3
set sidescroll=1
set sidescrolloff=1


" === Undo Files ===

silent !mkdir ~/.vim-backups > /dev/null 2>&1
set undofile
set undodir=~/.vim-backups
set undolevels=1000


" === Tell vim to ignore these files ==
set wildignore=.git,.hg,.svn,bower_components,node_modules,*.exe,*.so,*.dll,*.jpg,*.jpeg,*.png,*.gif,*.woof,*.swf,*.mp3,*.mp4,*.vid,*.tiff,*.pdf


" === Trailing characters (off by default) ===
set nolist listchars=trail:·,tab:➟\ 


" === GUI ===
set mouse=a

function! ColorsTomorrow()
    set background=dark
    colorscheme TomorrowNightBright
    " Fixing the html tag color
    hi htmlEndTag guifg=#4472b5
    hi htmlScriptTag guifg=#4472b5
    hi htmlTag guifg=#4472b5
    hi htmlTagN guifg=#4472b5
    hi htmlTagName guifg=#4472b5
endfunction

call ColorsTomorrow()


" === Keys ===

let mapleader=","
set timeoutlen=1000

function! CloseBufferOrVim()
    if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
        :q
    else
        :bd
    endif
endfunction


" Paste and DO NOT override buffer
xnoremap <expr> p 'pgv"'.v:register.'y'

" when wrapped
noremap <down> g<down>
noremap <up> g<up>
noremap j gj
noremap k gk

" disabling q
nnoremap q NOP

" slipt line
nnoremap K i<CR><Esc>

" <leader>s and <Command-S> to save
noremap <leader>s :w <CR>
noremap <leader>S :w <CR>
noremap <C-S> :w <CR>

" navigation through tabs
noremap <leader><left> :tabp <CR>
noremap <leader><right> :tabn <CR>

" navigation through windows
noremap <leader>h <C-w>h
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l

" close buffer with <leader> Q
noremap <leader>q :call CloseBufferOrVim() <CR>

" <leader><space> to clean search selection
noremap <leader><space> :nohlsearch <CR>

" Reaload Vim
noremap <leader><F5> :source $MYVIMRC <CR>

" Hilight tabs and trailing spaces
noremap <leader>L :set list! <CR>

" Simple Search
noremap <leader>f :execute '/\V' . escape(input('/'), '\\/')<CR>

" Global Search
function! GlobalSeach()
    let text = escape(input("what do you want to seach?: "),  '\\/')
    if text == ""
        echo "" | return
    endif
    let extension = escape(input("Wich extension? (* for all): "), '\\/')
    if extension == ""
        echo "" | return
    endif
    
    let search_command = ':lvimgrep /\V' . text . '/gj ./**/*.' . extension
    try
        execute search_command 
    catch
        echo "Nothing found"
        return
    endtry
    
    lwindow
endfunction

noremap <leader>F :call GlobalSeach() <CR>

" Buffers to tabs
noremap <leader>t :tab sball <CR>

" Fixing movements
noremap j gj
noremap k gk

" Indentation
noremap <leader>4 :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
noremap <leader>2 :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

" Copy Text to clipboard
vmap <C-c> "+y

" Cut text to clipboard
vmap <C-x> "+d


" === Autocompletion ===

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" === Plugins ===

" Pathogen
execute pathogen#infect()

" Command P
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
 

