" --- Custom Mappings ---
let mapleader = "\<CR>"
let maplocalleader = "\\"
map Y y$
nnoremap gb :bnext<CR>
nnoremap gB :bprevious<CR>
nnoremap <silent> <C-l> :nohl<CR><C-l>
nnoremap <silent> <leader>ml :setlocal invmodeline <bar> doautocmd BufRead<cr>


" --- UI ---
set number
set relativenumber
set cmdheight=1
set noruler
set laststatus=0
set statusline=\ 
set showcmd
set showmatch
set wildmode=list:longest
set wildignorecase
set lazyredraw
set shortmess=aoOsAIcT
set scrolloff=1
set sidescrolloff=5


" --- Startup ---
:autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif


" --- Search ---
set incsearch
set nohlsearch
set ignorecase
set smartcase


" --- Autocomplete ---
set completeopt=menu,longest


" --- Spaces, tabs and indentation ---
set expandtab
set smarttab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set softtabstop=4


" --- Filetype options ---
filetype plugin indent on


" --- Persistent undo ---
if has('persistent_undo')
    let target_path = expand('~/.vim/.persistent-undo/')
    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
    endif
    let &undodir = target_path
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


" --- CtrlP ---
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.bin,*.obj,*.o,*.class
let g:ctrlp_working_path_mode = 'rwa'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'


" --- Misc ---
set viminfo+=n~/.vim/.viminfo
set nomodeline
set noerrorbells novisualbell t_vb=
set history=1000
set noswapfile
set hidden
set suffixes-=.h


" --- Global Abbreviations ---
:iabbrev @@ fsicardir@gmail.com
:iabbrev _fs Francisco Sicardi
:iabbrev <expr> _date strftime("%d/%m/%Y")
:iabbrev <expr> _cdate strftime("%a %d %b %Y")
:iabbrev <expr> _datetime strftime("%c")
