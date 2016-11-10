" Vim Go (vim-go)
let g:go_alternate_mode="edit"
let g:go_asmfmt_autosave=1
let g:go_autodetect_gopath=1
let g:go_auto_sameids=0
let g:go_auto_type_info=0
let g:go_bin_path=$HOME."/go/bin"
let g:go_decls_includes='func,type'
let g:go_def_mapping_enabled=0
let g:go_def_mode='guru'
let g:go_def_reuse_buffer=1
let g:godef_same_file_in_same_window=1
let g:godef_split=0
let g:go_dispatch_enabled=0
let g:go_doc_command="godoc"
let g:go_doc_keywordprg_enabled=1
let g:go_doc_options=''
let g:go_fmt_autosave=1
let g:go_fmt_command="goimports"
let g:go_fmt_experimental=1
let g:go_fmt_fail_silently=0
let g:go_fmt_options=''
let g:go_get_update=1
let g:go_gocode_autobuild=1
let g:go_gocode_propose_builtins=1
let g:go_gocode_socket_type='unix'
let g:go_gocode_unimported_packages=1
let g:go_gorename_prefill=1
let g:go_guru_scope=[]
let g:go_guru_tags=''
let g:go_highlight_array_whitespace_error=1
let g:go_highlight_build_constraints=0
let g:go_highlight_chan_whitespace_error=1
let g:go_highlight_extra_types=0
let g:go_highlight_fields=0
let g:go_highlight_format_strings=0
let g:go_highlight_functions=0
let g:go_highlight_generate_tags=0
let g:go_highlight_methods=0
let g:go_highlight_operators=0
let g:go_highlight_space_tab_error=1
let g:go_highlight_string_spellcheck=0
let g:go_highlight_structs=0
let g:go_highlight_trailing_whitespace_error=1
let g:go_highlight_types=0
let g:go_jump_to_error=0
let g:go_list_height=0
let g:go_list_type=""
let g:go_metalinter_autosave=1
let g:go_metalinter_autosave_enabled=['vet', 'golint']
let g:go_metalinter_command=""
let g:go_metalinter_deadline="5s"
let g:go_metalinter_enabled=['vet', 'golint', 'errcheck']
let g:go_play_browser_command=''
let g:go_play_open_browser=0
let g:go_template_autocreate=1
let g:go_template_file="hello_world.go"
let g:go_term_enabled=0
let g:go_test_timeout='10s'
let g:go_textobj_enabled=1
let g:go_textobj_include_function_doc=1

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
