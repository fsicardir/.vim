nnoremap <buffer> <Leader>b
      \ :<C-U>compiler bash<CR>

nnoremap <buffer> <Leader>s
      \ :<C-U>compiler shellcheck<CR>

let b:undo_ftplugin .= '|setlocal makeprg< errorformat<'
      \ . '|nunmap <buffer> <Leader>b'
      \ . '|nunmap <buffer> <Leader>s'

if executable('shellckeck')
    compiler shellcheck
else
    compiler bash
endif
