if executable('goimports')
    let &l:formatprg = 'cd ' . expand('%:h') . ' && goimports 2>/dev/null'
else
    set formatprg=goformat\ -s\ 2>/dev/null
endif

setlocal noet ts=4 sw=4 sts=4

function! Format()
    let pos = getcurpos()
    normal gggqG
    call setpos(".", pos)
    if v:shell_error != 0
        undo
    endif
endfunction

augroup go_autocmds
    autocmd!
    autocmd BufWritePre *.go silent! call Format()
augroup END

nnoremap <silent> <leader>l :silent cexpr system('golint ' . shellescape(expand('%')))<CR>

compiler go
