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
nmap <buffer> gd <Plug>(go-def)
nmap <buffer> gi <Plug>(go-info)
nmap <buffer> gr <Plug>(go-rename)
" au FileType go nmap gD <Plug>(go-doc)
nmap <buffer> gT <Plug>(go-test)
nmap <buffer> gt <Plug>(go-test-func)

setlocal noexpandtab 
setlocal sw=8 
setlocal sts=8 
setlocal syntax=go 
setlocal ft=go 
setlocal makeprg=gometalinter

func! EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc

iab <buffer> xif if  {<CR> <BS><CR><BS>}<UP><UP><RIGHT><RIGHT><C-R>=EatChar('\s')<CR>
iab <buffer> xel else {<CR> <BS><CR><BS>}<UP><END><C-R>=EatChar('\s')<CR>
iab <buffer> xie if  {<CR> <BS><CR><BS>} else {<CR> <BS><CR>}<UP><UP><UP><UP><RIGHT><RIGHT><C-R>=EatChar('\s')<CR>
iab <buffer> xerr if err != nil {<CR> <BS><CR><BS>}<UP><END><C-R>=EatChar('\s')<CR>
iab <buffer> xdfr defer func() {<CR> <BS>if err := recover(); err != nil {<CR> <BS><CR><BS>}<CR><BS>}()<UP><UP><END><C-R>=EatChar('\s')<CR>
iab <buffer> xsw switch  {<CR><BS>case :<CR> <BS><CR>case :<CR> <BS><CR><BS>default:<CR> <BS><CR>}<UP><UP><UP><UP><UP><UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=EatChar('\s')<CR>
iab <buffer> xsl select {<CR><BS>case  := <-<CR> <BS><CR>case  := <-<CR><CR> <BS><CR><BS>default:<CR> <BS><CR>}<UP><UP><UP><UP><UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=EatChar('\s')<CR>
iab <buffer> xbench func Benchmark (b *testing.B) {<CR>for i := 0; i < b.N; i++ {<CR> <BS><CR>}<CR>}<UP><UP><UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=EatChar('\s')<CR>
iab <buffer> xtest func Test (t *testing.T) {<CR> <BS><CR>}<UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=EatChar('\s')<CR>
iab <buffer> xfun func ()  {<CR> <BS><CR><BS>}<UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=EatChar('\s')<CR>
iab <buffer> xgfun go func ()  {<CR> <BS><CR><BS>}()<UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=EatChar('\s')<CR>
iab <buffer> xst struct  {<CR> <BS><CR><BS>}<UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=EatChar('\s')<CR>
iab <buffer> xin interface  {<CR> <BS><CR><BS>}<UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=EatChar('\s')<CR>
iab <buffer> xfr for k, v := range  {<CR> <BS><CR><BS>}<UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=EatChar('\s')<CR>
iab <buffer> xfo for i := 0; i < 100; i++ {<CR> <BS><CR><BS>}<UP><END><C-R>=EatChar('\s')<CR>
iab <buffer> xvar var (<CR> <BS><CR><BS>)<UP><END><C-R>=EatChar('\s')<CR>
iab <buffer> xcon const (<CR> <BS><CR><BS>)<UP><END><C-R>=EatChar('\s')<CR>
iab <buffer> xim import (<CR> <BS><CR><BS>)<UP><END><C-R>=EatChar('\s')<CR>
