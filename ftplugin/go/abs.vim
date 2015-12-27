func! Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc
iab xif if  {<CR> <BS><CR><BS>}<UP><UP><RIGHT><RIGHT><C-R>=Eatchar('\s')<CR>
iab xel else {<CR> <BS><CR><BS>}<UP><END><C-R>=Eatchar('\s')<CR>
iab xie if  {<CR> <BS><CR><BS>} else {<CR> <BS><CR>}<UP><UP><UP><UP><RIGHT><RIGHT><C-R>=Eatchar('\s')<CR>
iab xerr if err != nil {<CR> <BS><CR><BS>}<UP><END><C-R>=Eatchar('\s')<CR>
iab xdfr defer func() {<CR> <BS>if err := recover(); err != nil {<CR> <BS><CR><BS>}<CR><BS>}()<UP><UP><END><C-R>=Eatchar('\s')<CR>
iab xsw switch  {<CR><BS>case :<CR> <BS><CR>case :<CR> <BS><CR><BS>default:<CR> <BS><CR>}<UP><UP><UP><UP><UP><UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=Eatchar('\s')<CR>
iab xsl select {<CR><BS>case  := <-<CR> <BS><CR>case  := <-<CR><CR> <BS><CR><BS>default:<CR> <BS><CR>}<UP><UP><UP><UP><UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=Eatchar('\s')<CR>
iab xbench func Benchmark (b *testing.B) {<CR>for i := 0; i < b.N; i++ {<CR> <BS><CR>}<CR>}<UP><UP><UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=Eatchar('\s')<CR>
iab xtest func Test (t *testing.T) {<CR> <BS><CR>}<UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=Eatchar('\s')<CR>
iab xfun func ()  {<CR> <BS><CR><BS>}<UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=Eatchar('\s')<CR>
iab xgfun go func ()  {<CR> <BS><CR><BS>}()<UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=Eatchar('\s')<CR>
iab xst struct  {<CR> <BS><CR><BS>}<UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=Eatchar('\s')<CR>
iab xin interface  {<CR> <BS><CR><BS>}<UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=Eatchar('\s')<CR>
iab xfr for k, v := range  {<CR> <BS><CR><BS>}<UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><C-R>=Eatchar('\s')<CR>
iab xfo for i := 0; i < 100; i++ {<CR> <BS><CR><BS>}<UP><END><C-R>=Eatchar('\s')<CR>
iab xvar var (<CR> <BS><CR><BS>)<UP><END><C-R>=Eatchar('\s')<CR>
iab xcon const (<CR> <BS><CR><BS>)<UP><END><C-R>=Eatchar('\s')<CR>
iab xim import (<CR> <BS><CR><BS>)<UP><END><C-R>=Eatchar('\s')<CR>
