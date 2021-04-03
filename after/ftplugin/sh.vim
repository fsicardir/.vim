nnoremap <buffer> <Leader>b
      \ :<C-U>compiler bash<CR>

nnoremap <buffer> <Leader>s
      \ :<C-U>compiler shellcheck<CR>

if executable('shellcheck')
    compiler shellcheck
else
    compiler bash
endif
