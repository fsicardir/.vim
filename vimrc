" --- Custom Mappings ---
let mapleader = "\<Space>"
let maplocalleader = "\\"
map Y y$
nnoremap gb :bnext<CR>
nnoremap gB :bprevious<CR>
nnoremap <silent> <C-l> :nohl<CR><C-l>
nnoremap <silent> <leader>ml :setlocal invmodeline <BAR> doautocmd BufRead<CR>
nnoremap <leader>ev :edit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <silent> <leader>m :make<C-[><CR>

" --- UI ---
set number
set relativenumber
set cmdheight=1
set noruler
set laststatus=0
set statusline=\ 
set showcmd
set showmatch
set lazyredraw
set shortmess=aoOsAIctT
set scrolloff=1
set sidescrolloff=5


" --- Useful autocommands ---
augroup last_cursor_position
    autocmd!
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
          \ | exe "normal! g`\""
          \ | endif
augroup END

augroup open_quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
augroup END


" --- Search ---
set incsearch
set nohlsearch
set ignorecase
set smartcase


" --- Autocomplete ---
set completeopt=menu,longest
set wildmenu
set wildmode=list:longest,full
set wildignorecase


" --- Spaces, tabs and indentation ---
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set autoindent


" --- Filetype options ---
filetype plugin indent on


" --- Persistent undo ---
if has('persistent_undo')
    let &undodir = expand('~/.vim/.persistent-undo/')
    set undofile
endif


" --- Folding ---
set foldenable
set foldnestmax=10
set foldlevelstart=15
set foldmethod=syntax


" --- Colors and theme ---
if has("syntax") && !exists('g:syntax_on')
  syntax enable
endif

let g:gruvbox_bold = 1
let g:gruvbox_underline = 1
let g:gruvbox_italic = 0

set background=dark
colorscheme gruvbox


" --- Misc ---
set viminfo+=n~/.vim/.viminfo
set nomodeline
set noerrorbells novisualbell t_vb=
set history=1000
set noswapfile
set hidden
set suffixes-=.h
set autowrite
set backspace=indent,eol,start


" --- Plugins ---
runtime macros/matchit.vim


" --- Global Abbreviations ---
inoreabbrev @@ fsicardir@gmail.com
inoreabbrev _fs Francisco Sicardi
inoreabbrev <expr> _date strftime("%d/%m/%Y")
inoreabbrev <expr> _cdate strftime("%a %d %b %Y")
inoreabbrev <expr> _datetime strftime("%c")

cnoreabbrev <expr> make (getcmdtype() ==# ':' && getcmdline() =~# '^make') ? 'silent make \| redraw!' : 'make'
