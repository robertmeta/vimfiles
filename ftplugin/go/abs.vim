func! Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc
iab <buffer> xif if  {<CR> <BS><CR><BS>}<UP><UP><RIGHT><RIGHT><C-R>=Eatchar('\s')<CR>
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
