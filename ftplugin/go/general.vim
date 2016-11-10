" Vim Go (vim-go)
let g:go_bin_path=$HOME."/go/bin"
" let g:go_def_mode='godef'
let g:godef_same_file_in_same_window=1
let g:godef_split=0
let g:go_highlight_array_whitespace_error=1
let g:go_highlight_build_constraints=1
let g:go_highlight_chan_whitespace_error=1
let g:go_highlight_extra_types=1
let g:go_highlight_fields=1
let g:go_highlight_format_strings=1
let g:go_highlight_functions=1
let g:go_highlight_generate_tags=1
let g:go_highlight_methods=1
let g:go_highlight_operators=1
let g:go_highlight_space_tab_error=1
let g:go_highlight_string_spellcheck=1
let g:go_highlight_structs=1
let g:go_highlight_trailing_whitespace_error=1
let g:go_highlight_types=1
let g:go_jump_to_error=0
let g:go_metalinter_autosave=1
let g:go_metalinter_autosave_enabled=['vet', 'golint']
let g:go_metalinter_deadline="5s"
let g:go_metalinter_enabled=['vet', 'golint', 'errcheck']
let g:go_template_autocreate=1
let g:go_template_file="hello_world.go"

" Go setlocalup assumptions: gocode, godef, gotags all in path
nnoremap <buffer> gd :GoDef<CR>
nnoremap <buffer> gD :GoDoc<CR>
nnoremap <buffer> gi :GoInfo<CR>
nnoremap <buffer> gr :GoRename<CR>
nnoremap <buffer> ga :GoAlternate!<CR>

" Vim settings
setlocal noexpandtab
setlocal makeprg=gometalinter
setlocal errorformat=%f:%l:%c:%trror:\ %m
setlocal errorformat+=%f:%l:%c:%tarning:\ %m
setlocal errorformat+=%f:%l::%trror:\ %m
setlocal errorformat+=%f:%l::%tarning:\ %m
