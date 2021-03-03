runtime! debian.vim


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
set laststatus=1
set showcmd
set showmatch
set wildmode=list:longest
set wildignorecase
set lazyredraw
set shortmess=aoOsAIcT

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

if has("autocmd")
  filetype plugin indent on
  " move cursor to where you left
  :au BufReadPost *
	 \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
	 \ |   exe "normal! g`\""
	 \ | endif
endif


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


" --- Persistent undo ---
if has('persistent_undo')
    let target_path = expand('~/.config/vim-persistent-undo/')
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
let g_gruvbox_contrast_dark='hard'

set background=dark
colorscheme gruvbox


" --- CtrlP ---
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.bin,*.obj,*.o,*.class
let g:ctrlp_working_path_mode = 'rwa'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'


" --- Misc ---
set viminfo+=n~/.vim/viminfo
set nomodeline
set noerrorbells novisualbell t_vb=
set history=1000
set noswapfile
set hidden


" --- GLobal Abbreviations ---
:iabbrev @@ fsicardir@gmail.com
:iabbrev _fs Francisco Sicardi
:iabbrev <expr> _date strftime("%d/%m/%Y")
:iabbrev <expr> _cdate strftime("%a %d %b %Y")
:iabbrev <expr> _datetime strftime("%c")
