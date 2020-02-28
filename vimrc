runtime! debian.vim

let mapleader = "-"


" --- Custom Mappings ---
map Y y$
nnoremap <CR> o<ESC>


" --- UI ---
set number
set cmdheight=2
set ruler
set laststatus=2
set showcmd
set showmatch
set wildmode=longest,list,full
set wildmenu
set lazyredraw

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
set hlsearch


" --- Autocomplete ---
set completeopt+=longest


" --- Spaces, tabs and indentation ---
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent

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
set foldlevelstart=15
set foldnestmax=10
set foldmethod=indent


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


" --- Plugins ---
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

let g:gutentags_cache_dir = '~/.tags'

" --- Misc ---
set nomodeline
set nostartofline
set novisualbell
set history=1000
set noswapfile