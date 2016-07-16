func! EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc

" Vim Go (vim-go)
let g:go_auto_type_info=0
let g:go_bin_path=$HOME."/go/bin"
let g:godef_same_file_in_same_window=1
let g:godef_split=0
let g:go_fmt_autosave=1
let g:go_fmt_command="goimports"
let g:go_fmt_fail_silently=0
let g:go_highlight_array_whitespace_error=1
let g:go_highlight_build_constraints=1
let g:go_highlight_chan_whitespace_error=1
let g:go_highlight_extra_types=1
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_operators=1
let g:go_highlight_space_tab_error=1
let g:go_highlight_string_spellcheck=0
let g:go_highlight_structs=1
let g:go_highlight_trailing_whitespace_error=1

" Go setlocalup assumptions: gocode, godef, gotags all in path
nnoremap <buffer> gd <Plug>(go-def)
nnoremap <buffer> gi <Plug>(go-info)
nnoremap <buffer> gr <Plug>(go-rename)
" au FileType go nmap gD <Plug>(go-doc)
nnoremap <buffer> gT <Plug>(go-test)
nnoremap <buffer> gt <Plug>(go-test-func)

setlocal noexpandtab
setlocal shiftwidth=8
setlocal softtabstop=8
setlocal makeprg=gometalinter
setlocal errorformat=%f:%l:%c:%trror:\ %m
setlocal errorformat+=%f:%l:%c:%tarning:\ %m
setlocal errorformat+=%f:%l::%trror:\ %m
setlocal errorformat+=%f:%l::%tarning:\ %m
