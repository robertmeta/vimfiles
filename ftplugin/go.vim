func! Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc

iab <buffer> xif if {<CR> <BS><CR><BS>}<UP><UP><RIGHT><RIGHT><RIGHT><C-R>=Eatchar('\s')<CR><RIGHT>
iab <buffer> xel else {<CR> <BS><CR><BS>}<UP><END><C-R>=Eatchar('\s')<CR>
iab <buffer> xie if  {<CR> <BS><CR><BS>} else {<CR> <BS><CR>}<UP><UP><UP><UP><RIGHT><RIGHT><C-R>=Eatchar('\s')<CR>
iab <buffer> xerr if err != nil {<CR> <BS><CR><BS>}<UP><END><C-R>=Eatchar('\s')<CR>
iab <buffer> xdfr defer func() {<CR> <BS>if err := recover(); err != nil {<CR> <BS><CR><BS>}<CR><BS>}()<UP><UP><END><C-R>=Eatchar('\s')<CR>
iab <buffer> xsw switch  {<CR><BS>case :<CR> <BS><CR>case :<CR> <BS><CR><BS>default:<CR> <BS><CR>}<UP><UP><UP><UP><UP><UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=Eatchar('\s')<CR>
iab <buffer> xsl select {<CR><BS>case  := <-<CR> <BS><CR>case  := <-<CR><CR> <BS><CR><BS>default:<CR> <BS><CR>}<UP><UP><UP><UP><UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=Eatchar('\s')<CR>
iab <buffer> xbench func Benchmark (b *testing.B) {<CR>for i := 0; i < b.N; i++ {<CR> <BS><CR>}<CR>}<UP><UP><UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=Eatchar('\s')<CR>
iab <buffer> xtest func Test (t *testing.T) {<CR> <BS><CR>}<UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=Eatchar('\s')<CR>
iab <buffer> xfun func ()  {<CR> <BS><CR><BS>}<UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=Eatchar('\s')<CR>
iab <buffer> xgfun go func ()  {<CR> <BS><CR><BS>}()<UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=Eatchar('\s')<CR>
iab <buffer> xst struct  {<CR> <BS><CR><BS>}<UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=Eatchar('\s')<CR>
iab <buffer> xin interface  {<CR> <BS><CR><BS>}<UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=Eatchar('\s')<CR>
iab <buffer> xfr for k, v := range  {<CR> <BS><CR><BS>}<UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=Eatchar('\s')<CR>
iab <buffer> xfo for i := 0; i < 100; i++ {<CR> <BS><CR><BS>}<UP><END><C-R>=Eatchar('\s')<CR>
iab <buffer> xvar var (<CR> <BS><CR><BS>)<UP><END><C-R>=Eatchar('\s')<CR>
iab <buffer> xcon const (<CR> <BS><CR><BS>)<UP><END><C-R>=Eatchar('\s')<CR>
iab <buffer> xim import (<CR> <BS><CR><BS>)<UP><END><C-R>=Eatchar('\s')<CR>

let g:go_autodetect_gopath=1
let g:go_auto_type_info=0
let g:go_bin_path=$HOME.'/go/bin'
let g:go_def_mapping_enabled=1
let g:go_def_mode='guru'
let g:go_def_reuse_buffer=1
let g:go_doc_command='godoc'
let g:go_fmt_autosave=1
let g:go_fmt_command='goimports'
let g:go_fmt_experimental=1
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
let g:go_highlight_trailing_whitespace_error=1
let g:go_highlight_types=1
let g:go_info_mode='guru'
let g:go_jump_to_error=0
let g:go_template_autocreate=0
let g:go_textobj_enabled=1

augroup go
        " Clear!
        au!
        au BufRead,BufNewFile *.go setlocal syntax=go ft=go noexpandtab sw=8 sts=8 omnifunc=go#complete#Complete foldmethod=syntax
        au BufRead,BufNewFile *.go nnoremap <buffer> gd :GoDef<cr>
        au BufRead,BufNewFile *.go nnoremap <buffer> gD :GoDoc<cr>
        au BufRead,BufNewFile *.go nnoremap <buffer> gi :GoInfo<cr>
        au BufRead,BufNewFile *.go nnoremap <buffer> gr :GoRename<cr>
        au BufRead,BufNewFile *.go nnoremap <buffer> gt :GoTest<cr>
        au BufRead,BufNewFile *.go nnoremap <buffer> ga :GoAlternate!<cr>
augroup end
