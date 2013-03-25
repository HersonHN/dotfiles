
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
set nolist
set textwidth=0
set wrapmargin=0
set formatoptions+=l
set whichwrap+=<,>,h,l,[,]
set nowrap



" === Folds ===

set foldmethod=indent
set nofoldenable



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
set sidescrolloff=15



" === Undo Files ===

silent !mkdir ~/.vim-backups > /dev/null 2>&1
set undodir=~/.vim-backups
set undofile



" === GUI ===

set mouse=a

if has("gui_macvim")
    set guifont=Menlo:h14
    set linespace=3
    colorscheme Solarized

    " Fixing the html tag color
    hi htmlEndTag guifg=#268bd2  gui=bold
    hi htmlScriptTag guifg=#268bd2 gui=bold
    hi htmlTag guifg=#268bd2 gui=bold
    hi htmlTagN guifg=#268bd2 gui=bold
endif



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


" <leader>s and <Command-S> to save
noremap <leader>s :w <CR>
noremap <C-S> :w <CR>

" navigation throughout tabs
noremap <leader>m :tabp <CR>
noremap <leader>. :tabn <CR>

" close buffer with <leader> Q
noremap <leader>q :call CloseBufferOrVim() <CR>

" <leader><space> to clean search selection
noremap <leader><space> :nohlsearch <CR>

" Reaload Vim
noremap <leader><F5> :source $MYVIMRC <CR>

" Simple Search
noremap <leader>f :execute '/\V' . escape(input('/'), '\\/')<CR>

" Buffers to tabs
noremap <leader>t :tab sball <CR>

" Fixing movements
noremap j gj
noremap k gk

" Indentation
noremap <leader>4 :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
noremap <leader>2 :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>



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
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|.class'

" CSS-Colors
au! FileType scss syntax cluster sassCssAttributes add=@cssColors

" vim-powerline
" let g:Powerline_colorscheme="solarized"




