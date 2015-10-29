" vim:sw=8:ts=8
"
" act like t_Co=0 but use (256) color on just a few things
"

hi clear
if exists("syntax_on")
        syntax reset
endif

let colors_name = "nofrils"

if &background == "light"
        hi Normal cterm=none ctermbg=white ctermfg=235 gui=none guibg=snow1 guifg=gray11
        hi SpecialKey cterm=bold ctermfg=none gui=bold guifg=none
        hi IncSearch cterm=reverse ctermfg=none gui=reverse guifg=none
        hi Search cterm=reverse ctermfg=none gui=reverse guifg=none
        hi MoreMsg cterm=bold ctermfg=none gui=bold guifg=none
        hi ModeMsg cterm=bold ctermfg=none gui=bold guifg=none
        hi LineNr cterm=none ctermfg=235 gui=none guifg=gray60
        hi StatusLine cterm=bold,reverse ctermfg=none gui=bold,reverse guifg=none
        hi StatusLineNC cterm=reverse ctermfg=none gui=reverse guifg=none
        hi VertSplit cterm=reverse ctermfg=none gui=reverse guifg=none
        hi Title cterm=bold ctermfg=none gui=bold guifg=none
        hi Visual cterm=reverse ctermfg=none gui=reverse guifg=none
        hi VisualNOS cterm=bold ctermfg=none gui=bold guifg=none
        hi WarningMsg cterm=standout ctermfg=none gui=standout guifg=none
        hi WildMenu cterm=standout ctermfg=none gui=standout guifg=none
        hi Folded cterm=standout ctermfg=none gui=standout guifg=none
        hi FoldColumn cterm=standout ctermfg=none gui=standout guifg=none
        hi DiffAdd cterm=bold ctermfg=none gui=bold guifg=none
        hi DiffChange cterm=bold ctermfg=none gui=bold guifg=none
        hi DiffDelete cterm=bold ctermfg=none gui=bold guifg=none
        hi DiffText cterm=reverse ctermfg=none gui=reverse guifg=none
        hi Type cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        hi Keyword cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        hi Number cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        hi Char cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        hi Format cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        hi Special cterm=bold ctermbg=none ctermfg=none gui=bold guibg=none guifg=none
        hi Constant cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        hi PreProc cterm=none ctermfg=none gui=none guifg=none
        hi Directive cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        hi Conditional cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        hi Comment cterm=bold ctermbg=none ctermfg=240 gui=bold guibg=none guifg=gray17
        hi Func cterm=none ctermbg=234 ctermfg=250 gui=none guibg=none guifg=gray17
        hi Identifier cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        hi Statement cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        hi Ignore cterm=bold ctermfg=none gui=bold guifg=none
        hi String term=bold ctermfg=8 term=italic guifg=none
        hi ErrorMsg cterm=reverse ctermbg=15 ctermfg=9 gui=reverse guibg=none guifg=firebrick3
        hi Error cterm=reverse ctermbg=15 ctermfg=9 gui=reverse guibg=none guifg=firebrick3
        hi Todo cterm=bold,standout ctermbg=0 ctermfg=11 gui=bold,standout guibg=none guifg=darkgoldenrod2
        hi MatchParen cterm=bold ctermbg=250 ctermfg=none gui=bold guibg=gray70 guifg=none
        hi ColorColumn ctermbg=255 guifg=gray60
else
        hi Normal cterm=none ctermbg=234 ctermfg=250 gui=none guibg=#1d1f21 guifg=gray70
        hi SpecialKey cterm=bold ctermfg=none gui=bold guifg=none
        hi IncSearch cterm=reverse ctermfg=none gui=reverse guifg=none
        hi Search cterm=reverse ctermfg=none gui=reverse guifg=none
        hi MoreMsg cterm=bold ctermfg=none gui=bold guifg=none
        hi ModeMsg cterm=bold ctermfg=none gui=bold guifg=none
        hi LineNr cterm=none ctermfg=238 gui=none guifg=gray30
        hi StatusLine cterm=bold,reverse ctermfg=none gui=bold,reverse guifg=none
        hi StatusLineNC cterm=reverse ctermfg=none gui=reverse guifg=none
        hi VertSplit cterm=reverse ctermfg=none gui=reverse guifg=none
        hi Title cterm=bold ctermfg=none gui=bold guifg=none
        hi Visual cterm=reverse ctermfg=none gui=reverse guifg=none
        hi VisualNOS cterm=bold ctermfg=none gui=bold guifg=none
        hi WarningMsg cterm=standout ctermfg=none gui=standout guifg=none
        hi WildMenu cterm=standout ctermfg=none gui=standout guifg=none
        hi Folded cterm=standout ctermfg=none gui=standout guifg=none
        hi FoldColumn cterm=standout ctermfg=none gui=standout guifg=none
        hi DiffAdd cterm=bold ctermfg=none gui=bold guifg=none
        hi DiffChange cterm=bold ctermfg=none gui=bold guifg=none
        hi DiffDelete cterm=bold ctermfg=none gui=bold guifg=none
        hi DiffText cterm=reverse ctermfg=none gui=reverse guifg=none
        hi Type cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        hi Keyword cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        hi Number cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        hi Char cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        hi Format cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        hi Special cterm=bold ctermbg=none ctermfg=none gui=bold guibg=none guifg=none
        hi Constant cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        hi PreProc cterm=none ctermfg=none gui=none guifg=none
        hi Directive cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        hi Conditional cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        hi Comment cterm=none ctermbg=none ctermfg=245 gui=none guibg=none guifg=gray50
        hi Func cterm=none ctermbg=234 ctermfg=250 gui=none guibg=none guifg=gray50
        hi Identifier cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        hi Statement cterm=none ctermbg=none ctermfg=none gui=none guibg=none guifg=none
        hi Ignore cterm=bold ctermfg=none gui=bold guifg=none
        hi String cterm=bold ctermfg=7 gui=italic guifg=none
        hi ErrorMsg cterm=reverse ctermbg=15 ctermfg=9 gui=reverse guibg=none guifg=firebrick3
        hi Error cterm=reverse ctermbg=15 ctermfg=9 gui=reverse guibg=none guifg=firebrick3
        hi Todo cterm=bold,standout ctermbg=0 ctermfg=11 gui=bold,standout guibg=none guifg=darkgoldenrod2
        hi MatchParen cterm=bold ctermbg=250 ctermfg=none gui=bold guibg=gray45 guifg=none
        hi ColorColumn ctermbg=255 guibg=gray10
endif
