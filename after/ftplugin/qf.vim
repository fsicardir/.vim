setlocal nowrap
setlocal norelativenumber
setlocal number
set nobuflisted
" exit vim if the last window is a quickfix window
autocmd BufEnter <buffer> if winnr('$') < 2 | q | endif
