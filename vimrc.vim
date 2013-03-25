" Vim. Live it.
" noremap  <up> <nop>
" inoremap <up> <nop>
" noremap  <down> <nop>
" inoremap <down> <nop>
" noremap  <left> <nop>
" noremap  <right> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
"      B-A <start>


" === General Config ===

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set laststatus=2
set nocompatible
set encoding=utf-8
set t_Co=256
autocmd BufEnter * silent! lcd %:p:h

" turn on syntax highlighting
syntax on




" === Search Settings  ===

set incsearch
set ignorecase
set smartcase
set hlsearch



" === Turn Off Swap Files ===

set noswapfile
set nobackup
set nowb



" === Persistent Undo ===
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim-backups > /dev/null 2>&1
set undodir=~/.vim-backups
set undofile



" === Indentation ===

set autoindent
set smartindent
set smarttab
" 4 spaces by default
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

filetype plugin on
filetype indent on



" === Folds ===

set foldmethod=indent
set nofoldenable



" === Completion ===

set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*~
set wildignore+=*vim-backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*.png,*.jpg,*.gif



" === Scrolling ===

set scrolloff=3
set sidescrolloff=15
set sidescroll=1



" === Endline movement ===

set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set formatoptions+=l
set whichwrap+=<,>,h,l,[,]
set nowrap



" === GUI ===

set mouse=a

if has("gui_macvim")
    set guifont=Menlo:h14
    set linespace=3
    colorscheme Solarized
    call Solarizame()
endif

function! Solarizame()
    " I don't like to much yellow :(
    hi Normal guibg=#ffffff
    hi SpecialKey guibg=#eeeeee
    hi LineNr guibg=#eeeeee
    hi Folded guibg=#eeeeee
    hi FoldColumn guibg=#eeeeee
    hi DiffAdd guibg=#eeeeee
    hi DiffChange guibg=#eeeeee
    hi DiffDelete guibg=#eeeeee
    hi DiffText guibg=#eeeeee
    
    hi TabLine guibg=#eeeeee
    hi TabLineFill guibg=#eeeeee
    hi CursorColumn guibg=#eeeeee
    hi CursorLine guibg=#eeeeee
    hi ColorColumn guibg=#eeeeee
    hi Visual guibg=#000000

    hi htmlTag guifg=#268bd2 gui=bold
    hi htmlEndTag guifg=#268bd2  gui=bold
    hi htmlTagN guifg=#268bd2 gui=bold
    hi htmlScriptTag guifg=#268bd2 gui=bold
endfunction



" ALLWAYS open buffers in tabs
au BufAdd,BufNewFile,BufRead * nested tab sball
se switchbuf=usetab,newtab



" === Keys ===
let mapleader=","
set timeoutlen=1000

" <leader>s and <Command-S> to save
noremap <leader>s :w <CR>
noremap <C-S> :w <CR>

" navigation throughout tabs
noremap <leader>m :tabp <CR>
noremap <leader>. :tabn <CR>

" exit with command/contro Q
noremap <leader>q :q <CR>

" <leader><space> to clean search selection
noremap <leader><space> :nohlsearch<CR>

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

" CSS-Colors
au! FileType scss syntax cluster sassCssAttributes add=@cssColors

" vim-powerline
" let g:Powerline_colorscheme="solarized"









