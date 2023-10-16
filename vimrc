" --- Functions ---
function! PrintCmdError() abort
    echohl ErrorMsg
    echomsg join(split(v:exception, ":")[1:], ":")
    echohl None
endfunction

function! MapWithCount(cmd) abort
    try
        execute v:count1 . a:cmd
    catch
        call PrintCmdError()
    endtry
endfunction


" --- Custom Mappings ---
let mapleader = "\<Space>"
let maplocalleader = "\\"
map Y y$
nnoremap <silent> gb :<C-U>call MapWithCount('bnext')<CR>
nnoremap <silent> gB :<C-U>call MapWithCount('bprevious')<CR>
nnoremap <silent> [q :<C-U>call MapWithCount('cprevious')<CR>
nnoremap <silent> ]q :<C-U>call MapWithCount('cnext')<CR>
nnoremap <silent> [l :<C-U>call MapWithCount('lprevious')<CR>
nnoremap <silent> ]l :<C-U>call MapWithCount('lnext')<CR>
nnoremap [<CR> O<ESC>
nnoremap ]<CR> o<ESC>
nnoremap <silent> <C-l> :nohl<CR><C-l>
nnoremap <leader>ev :edit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <silent> <leader>m :make<C-[><CR>


" --- UI ---
set number
set cmdheight=1
set noruler
set laststatus=0
set statusline=\ 
set showcmd
set lazyredraw
set shortmess=aoOsAIctT
set scrolloff=1
set sidescrolloff=5
let &t_SI = "\<esc>[5 q"
let &t_EI = "\<esc>[2 q"
let &t_ti .= "\<esc>[2 q"


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

augroup redraw_after_shell
    autocmd!
    autocmd ShellCmdPost * redraw!
augroup END

augroup file_info
    autocmd!
    autocmd WinEnter * file
augroup END


" --- Search ---
set incsearch
set hlsearch
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
set signcolumn=no


" --- Plugins ---
runtime macros/matchit.vim

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nnoremap <buffer> gd <plug>(lsp-definition)
    nnoremap <buffer> gs <plug>(lsp-document-symbol-search)
    nnoremap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nnoremap <buffer> gr <plug>(lsp-references)
    nnoremap <buffer> gi <plug>(lsp-implementation)
    nnoremap <buffer> gt <plug>(lsp-type-definition)
    nnoremap <buffer> <leader>rn <plug>(lsp-rename)
    nnoremap <buffer> <leader>a <plug>(lsp-code-action)
    vnoremap <leader>a :LspCodeAction<CR>
    nnoremap <buffer> <leader>l :silent LspDocumentDiagnostic<CR>
    nnoremap <buffer> K <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Lazy-load LSP and autocompletion
command! LSP
	\   packadd async.vim
	\ | packadd vim-lsp
	\ | packadd vim-lsp-settings
	\ | call lsp#enable()
	\ | packadd asyncomplete.vim
	\ | packadd asyncomplete-lsp.vim
	\ | silent! bufdo! e


" --- Global Abbreviations ---
inoreabbrev @@ fsicardir@gmail.com
inoreabbrev _fs Francisco Sicardi
inoreabbrev <expr> _date strftime("%d/%m/%Y")
inoreabbrev <expr> _cdate strftime("%a %d %b %Y")
inoreabbrev <expr> _cdatetime strftime("%c")
inoreabbrev <expr> _datetime strftime("%FT%T")

cnoreabbrev <expr> make (getcmdtype() ==# ':' && getcmdline() =~# '^make') ? 'silent make' : 'make'
cnoreabbrev <expr> lmake (getcmdtype() ==# ':' && getcmdline() =~# '^lmake') ? 'silent lmake' : 'lmake'
cnoreabbrev <expr> grep (getcmdtype() ==# ':' && getcmdline() =~# '^grep') ? 'silent grep' : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() =~# '^lgrep') ? 'silent lgrep' : 'lgrep'
