if exists('g:no_vim_conceal') || !has('conceal') || &enc != 'utf-8'
    finish
endif

syntax match goNiceOperator "<-" conceal cchar=←
syntax match goNiceOperator "->" conceal cchar=→
syntax match goNiceOperator "<>" conceal cchar=≠
syntax match goNiceOperator "||" conceal cchar=∨
syntax match goNiceOperator "<-" conceal cchar=←
syntax match goNiceOperator "->" conceal cchar=→
syntax match goNiceOperator "<=\ze[^<]" conceal cchar=≤
syntax match goNiceOperator ">=\ze[^>]" conceal cchar=≥
syntax match goNiceOperator "!=" conceal cchar=≠
syntax match goNiceOperator ":=" conceal cchar=≔
syntax match goNiceKeyword "math.Pi" conceal cchar=π

hi link goNiceOperator Operator
hi link goNiceStatement Statement
hi link goNiceKeyword Keyword

hi! link Conceal Operator
hi! link Conceal Statement
hi! link Conceal Keyword

setlocal conceallevel=2
