"
" Erlang syntax highlighting
"

if exists('b:current_syntax')
  finish
endif

let b:current_syntax = 'erlang'
setlocal iskeyword=a-z,A-Z,48-57,_,@

syn sync fromstart

hi def link erlDelim Delimiter
hi def link erlRes Keyword

syn match erlOutside '\S'
" maybe a bit excessive?
hi def link erlOutside SpellBad

" Comments {{{1
syn match erlComment '%.*$' contains=erlTodo containedin=ALL
hi def link erlComment Comment

syn keyword erlTodo TODO XXX FIXME contained
hi def link erlTodo Todo

" Module attributes {{{1
syn match erlModAttr /-\%(\<\l\k*\>\|'\%(\\[\\']\|.\)\+'\)/
      \ nextgroup=erlModAttrArgs skipwhite skipempty
syn cluster erlTopLevel add=erlModAttr
hi def link erlModAttr PreProc

syn region erlModAttrArgs matchgroup=erlDelim start='(' end=')'
      \ contains=@erlAttrExpr contained
      \ nextgroup=erlFullStop skipwhite skipempty

syn cluster erlAttrExpr contains=@erlLit,@erlIdent,@erlOp
syn cluster erlAttrExpr add=erlFunName,erlAttrList,erlAttrTuple,erlAttrParens

syn region erlAttrList matchgroup=erlDelim start='\[' end=']'
      \ contains=@erlAttrExpr,erlComma contained
syn region erlAttrTuple matchgroup=erlDelim start='{' end='}'
      \ contains=@erlAttrExpr,erlComma contained
syn region erlAttrParens matchgroup=erlDelim start='(' end=')'
      \ contains=@erlAttrExpr,erlComma contained

" Module declaration {{{1
syn match erlModDec '-module\>' nextgroup=erlModDecArgs skipwhite skipempty
syn cluster erlTopLevel add=erlModDec
hi def link erlModDec erlModAttr

syn region erlModDecArgs matchgroup=erlDelim start='(' end=')'
      \ contains=erlModDecName contained
      \ nextgroup=erlFullStop skipwhite skipempty

syn match erlModDecName '\l\k*\%(\.\l\k*\)*' contained
hi def link erlModDecName erlModule

" Type declarations and specifications {{{1

" Types {{{2
syn cluster erlType contains=@erlLit,@erlIdent,erlPipe

syn region erlListType matchgroup=erlDelim start='\[' end=']'
      \ contains=@erlType,erlComma,erlEllipsis contained
syn cluster erlType add=erlListType

syn region erlTypeParens matchgroup=erlDelim start='(' end=')'
      \ contains=@erlType contained
syn cluster erlType add=erlTypeParens

syn match erlEllipsis '\.\.\.' contained
hi def link erlEllipsis Special

syn match erlRange '\.\.\.\@!' contained
syn cluster erlType add=erlRange
hi def link erlRange Special

" Type declarations {{{2
syn match erlTypeDec '-\%(type\|opaque\)\>' nextgroup=erlTypeDecName
      \ skipwhite skipempty
syn cluster erlTopLevel add=erlTypeDec
hi def link erlTypeDec erlModAttr

syn match erlTypeDecName /\%(\<\l\k*\>\|'\%(\\[\\']\|.\)\+'\)/
      \ nextgroup=erlTypeDecArgs skipwhite skipempty contained
hi def link erlTypeDecName Type

syn region erlTypeDecArgs matchgroup=erlDelim start='(' end=')' skip='(.\{-})'
      \ contains=@erlIdent contained nextgroup=erlTypeBody skipwhite skipempty

syn region erlTypeBody matchgroup=erlDelim start='::' end='\.\@<!\.\.\@!'
      \ contains=@erlType contained

" Type specifications {{{2
syn match erlTypeSpec '-spec\>' nextgroup=erlTypeSpecName,erlTypeSpecMod
      \ skipwhite skipempty
hi def link erlTypeSpec erlModAttr

syn match erlTypeSpecMod /\<\l\k*\%(\.\l\k*\)*\>\|'\%(\\[\\']\|.\)\+'\s*:/
      \ contains=erlColon contained nextgroup=erlTypeSpecName
      \ skipwhite skipempty
hi def link erlTypeSpecMod erlModule

syn match erlTypeSpecName /\%(\<\l\k*\>\|'\%(\\[\\']\|.\)\+'\)/
      \ contained nextgroup=erlTypeSpecArgs skipwhite skipempty
hi def link erlTypeSpecName Function

syn region erlTypeSpecArgs matchgroup=erlDelim start='(' end=')'
      \ contains=@erlType,erlDblColon contained nextgroup=erlTypeSpecRet
      \ skipwhite skipempty

syn match erlDblColon '::' contained
hi def link erlDblColon erlDelim

syn region erlTypeSpecRet matchgroup=erlDelim start='->' end='\.\@<!\.\.\@!'
      \ contains=@erlType,erlTypeSpecAlt,erlTypeSpecWhen contained

syn match erlTypeSpecAlt ';' nextgroup=erlTypeSpecArgs skipwhite skipempty
      \ contained
hi def link erlTypeSpecAlt erlDelim

syn region erlTypeSpecWhen matchgroup=erlRes start='\<when\>' end='\.\@='
      \ contains=@erlType,erlDblColon contained

" Record declarations {{{2
syn match erlRecDec '-record\>' nextgroup=erlRecDecArgs skipwhite skipempty
hi def link erlRecDec erlModAttr

syn region erlRecDecArgs matchgroup=erlDelim start='(' end=')'
      \ contains=erlRecDecName,erlRecDecBody,erlComma contained
      \ nextgroup=erlFullStop skipwhite skipempty

syn match erlRecDecName '\l\k*' contained
hi def link erlRecDecName Type

syn region erlRecDecBody matchgroup=erlDelim start='{' end='}'
      \ contains=erlRecDecField,erlRecDecType,erlDblColon,erlComma,@erlExpr,
      \          @erlResErr
      \ contained

syn match erlRecDecField '\l\k*\%(\_s*::\)\@=' contained
syn match erlRecDecField '\%(::\_s*\)\@<!\l\k*' contained
hi def link erlRecDecField Identifier

syn match erlRecDecType '\%(::\_s*\)\@<=\l\k*(\@=' contained
hi def link erlRecDecType Type

" Function declarations {{{1
syn match erlFunDec /\%(\%(\<\l\k*\>\|'\%(\\[\\']\|.\)\+'\)\)\%(\_s*(\)\@=/
      \ nextgroup=erlFunDecArgs skipwhite skipempty
syn cluster erlTopLevel add=erlFunDec
hi def link erlFunDec erlFunName

syn region erlFunDecArgs matchgroup=erlDelim start='(' end=')'
      \ contains=@erlExpr,erlComma,@erlResErr contained
      \ nextgroup=erlFunGuard,erlFunBody skipwhite skipempty

syn region erlFunGuard matchgroup=erlRes start='\<when\>' end='\%(->\)\@='
      \ contains=@erlGuard contained
      \ nextgroup=erlFunBody skipwhite skipempty

syn cluster erlGuard contains=@erlTerm,@erlOp,@erlResErr,erlComma,erlSemi

syn region erlFunBody matchgroup=erlDelim start='->' end='[;.]'
      \ contains=@erlExpr,erlComma,@erlResErr contained

" Expressions {{{1

" Atoms and other identifiers {{{2
syn cluster erlExpr add=@erlIdent

" Atoms {{{3
syn region erlQAtom matchgroup=erlDelim start=+'+ end=+'+ skip=+\\'+ contained
syn cluster erlIdent add=erlQAtom
hi def link erlQAtom Constant

" Some common atoms like bools get special highlighting.
syn keyword erlSpecialAtom true false ok undefined infinity contained
syn cluster erlIdent add=erlSpecialAtom
hi def link erlSpecialAtom Constant

" Variables {{{3
syn match erlVar '\<\%(\u\|_\)\k*\>' contains=erlVarWild contained
syn cluster erlIdent add=erlVar
hi def link erlVar Identifier

syn match erlVarWild '\<_' contained
hi def link erlVarWild Special

" Macros {{{3
syn match erlMacro '?\k\+\>' contains=erlMacroQ contained
syn cluster erlIdent add=erlMacro
hi def link erlMacro Macro

syn match erlMacroQ '?' contained
hi def link erlMacroQ erlDelim

" Module names {{{3
syn match erlModule '\<\l\k*\%(\.\l\k*\)*\>' contained
hi def link erlModule Structure

syn match erlModuleQual '\<\l\k*\%(\.\l\k*\)*:'
      \ contains=erlModule,erlColon contained
syn cluster erlIdent add=erlModuleQual

" Dotted module names {{{3
syn match erlDotModule '\<\l\k*\%(\.\l\k*\)\+\>' contained
syn cluster erlIdent add=erlDotModule
hi def link erlDotModule Structure

" Function names, e.g. foo/1 {{{3
syn match erlFunName '\<\l\k*/\d\+' contained
hi def link erlFunName Function

" Literals {{{2

syn cluster erlExpr add=@erlLit

" Escape sequences used in chars and strings {{{3
syn match erlEscape +\\[bdefnrstv'"\\]+ contained   " \s
syn match erlEscape '\\\o\{1,3}'        contained   " \040
syn match erlEscape '\\x\x\{2}'         contained   " \x20
syn match erlEscape '\\x{\x\+}'         contained   " \x{20}
syn match erlEscape '\\^\a'             contained   " \^c
hi def link erlEscape SpecialChar

" Characters {{{3
syn match erlChar '\$' nextgroup=erlEscape,erlCharInner contained
syn cluster erlLit add=erlChar
hi def link erlChar erlDelim

syn match erlCharInner '[^\\]' contained
hi def link erlCharInner Character

" Strings {{{3
syn region erlString matchgroup=erlDelim start='"' end='"'
      \ contains=erlEscape contained
syn cluster erlLit add=erlString
hi def link erlString String

" Bitstrings {{{3
syn region erlBitString matchgroup=erlDelim start='<<' end='>>'
      \ contains=@erlBS contained
syn cluster erlLit add=erlBitString

syn cluster erlBS contains=@erlLit,erlComma,erlBSPunc,erlBSSpecs,@erlCompr

syn match erlBSPunc '[/-]' contained
hi def link erlBSPunc erlDelim

syn keyword erlBSSpecs contained utf8 utf16 utf32 integer float binary bytes
      \ bitstring bits signed unsigned big little native unit
hi def link erlBSSpecs Type

" Integers {{{3
syn match erlInt '\<-\?\d\+\>' contained
syn match erlInt '\<-\?\d\+#\%(\d\|\a\)\+\>' contains=erlIntHash contained
syn cluster erlLit add=erlInt
hi def link erlInt Number

syn match erlIntHash '#' contained
hi def link erlIntHash Special

" Floats {{{3
syn match erlFloat '\<-\?\d\+\.\d\+\%(e-\?\d\+\)\?\>' contains=erlFloatE
      \ contained
syn cluster erlLit add=erlFloat
hi def link erlFloat Float

syn match erlFloatE 'e' contained
hi def link erlFloatE Special

" Compound types {{{2

syn cluster erlExpr add=@erlTerm
syn cluster erlTerm contains=@erlLit,@erlIdent

" Tuples {{{3
syn region erlTuple matchgroup=erlDelim start='{' end='}'
      \ contains=@erlExpr,erlComma,@erlResErr contained
syn cluster erlTerm add=erlTuple

" Lists {{{3
syn region erlList matchgroup=erlDelim start='\[' end=']'
      \ contains=@erlExpr,@erlCompr,erlComma,erlPipe,@erlResErr contained
syn cluster erlTerm add=erlList

" Comprehensions (also in bitstrings) {{{4
syn cluster erlCompr contains=erlDblPipe,erlGenerator

syn match erlDblPipe '||' contained
hi def link erlDblPipe erlDelim

syn match erlGenerator '<-\|<=' contained
hi def link erlGenerator erlDelim

" Records {{{3
syn match erlRecordName /#\%(\<\l\k*\>\|'\%(\\[\\']\|.\)\+'\)/
      \ nextgroup=erlRecordBody skipwhite skipempty
      \ contains=erlRecordNameHash contained
syn cluster erlExpr add=erlRecordName
hi def link erlRecordName Type

syn match erlRecordNameHash '#' contained
hi def link erlRecordNameHash erlDelim

syn region erlRecordBody matchgroup=erlDelim start='{' end='}'
      \ contains=@erlExpr,erlComma,erlRecLabel,erlRecEquals,@erlResErr
      \ contained

syn match erlRecLabel '\<\l\k*\ze\s*=' contained
hi def link erlRecLabel Identifier

syn match erlRecEquals '=' contained
hi def link erlRecEquals erlDelim

syn match erlRecordField
  \ /#\%(\<\l\k*\>\|'\%(\\[\\']\|.\)\+'\)\.\%(\<\l\k*\>\|'\%(\\[\\']\|.\)\+'\)/
  \ contained contains=erlRecordName,erlFullStop
syn cluster erlExpr add=erlRecordField


" Operators {{{2
syn cluster erlExpr add=@erlOp

" Alphabetic-named operators {{{3
syn keyword erlAlphOp contained and andalso band bnot bor bsl bsr div not or
      \ orelse rem xor
syn cluster erlOp add=erlAlphOp
hi def link erlAlphOp Operator

" Symbolic operators {{{3
syn match erlSymOp '==\|/=\|=<\|>=\|=:=\|=/=' contained
syn match erlSymOp '++\|--\|+\|-\|\*\|/\|!' contained
syn match erlSymOp '<\@<!<<\@!' contained
syn match erlSymOp '>\@>!>>\@!' contained
syn cluster erlOp add=erlSymOp
hi def link erlSymOp Operator

" Block expressions {{{2
syn cluster erlExpr add=@erlBlockExpr

" If {{{3
syn region erlIf matchgroup=erlRes start='\<if\>' end='\<end\>'
      \ contains=erlIfGuard contained
syn cluster erlBlockExpr add=erlIf

syn match erlIfGuard '\%(\%(\<if\>\|;\)\_s*\)\@<=\_.\{-}\%(->\)\@='
      \ contains=@erlGuard contained
      \ nextgroup=erlIfExpr skipwhite skipempty

syn region erlIfExpr matchgroup=erlDelim start='->' end=';\|\%(end\)\@='
      \ contains=@erlExpr,erlComma,@erlResErr contained
      \ nextgroup=erlIfGuard skipwhite skipempty

" Case {{{3
syn region erlCase matchgroup=erlRes start='\<case\>' end='\<end\>'
      \ contains=@erlTerm,erlCaseOf,erlWhenErr,erlEndErr,erlAfterErr contained
syn cluster erlBlockExpr add=erlCase

syn region erlCaseOf matchgroup=erlRes
      \ start='\<of\>' end='\%(\<\%(end\|catch\)\>\)\@='
      \ contains=@erlTerm,erlCaseGuard,erlCaseBranch,erlOfErr,
      \          erlAfterErr contained

syn region erlCaseGuard matchgroup=erlRes start='\<when\>' end='\%(->\)\@='
      \ contains=@erlGuard contained
      \ nextgroup=erlCaseBranch skipwhite skipempty

syn region erlCaseBranch matchgroup=erlDelim
      \ start='->' end=';\|\%(\<\%(end\|after\)\>\)\@='
      \ contains=@erlExpr,erlComma,@erlResErr contained

" Receive {{{3
syn region erlReceive matchgroup=erlRes start='\<receive\>' end='\<end\>'
      \ contains=@erlTerm,erlCaseGuard,erlCaseBranch,erlReceiveAfter,
      \          erlAfterErr,erlOfErr contained
syn cluster erlBlockExpr add=erlReceive

syn region erlReceiveAfter matchgroup=erlRes
      \ start='\<after\>' end='\%(\<end\>\)\@='
      \ contains=@erlExpr,@erlResErr

" Fun {{{3
syn region erlFun matchgroup=erlRes start='\<fun\>\%(\_s*(\)\@=' end='\<end\>'
      \ contains=erlFunArgs contained
syn cluster erlBlockExpr add=erlFun

syn region erlFunArgs matchgroup=erlDelim start='(' end=')'
      \ contains=@erlTerm,erlComma,@erlResErr contained
      \ nextgroup=erlCaseGuard,erlCaseBranch skipwhite skipempty

syn match erlFunRef '\<fun\_s\+\%(\%(\k\|\.\)\+:\)\?\l\k*/\d\+'
      \ contains=erlModuleQual,erlFunKW contained
syn cluster erlExpr add=erlFunRef
hi def link erlFunRef Function

syn keyword erlFunKW fun contained
hi def link erlFunKW erlRes

" Try {{{3
syn region erlTry matchgroup=erlRes start='\<try\>' end='\<end\>'
      \ contains=@erlExpr,erlComma,erlCaseOf,erlTryCatch,erlTryAfter
      \ contained
syn cluster erlBlockExpr add=erlTry

syn region erlTryCatch matchgroup=erlRes
      \ start='\<catch\>' end='\<\%(end\|after\)\>'
      \ contains=@erlTerm,erlCaseGuard,erlCaseBranch,erlOfErr contained

syn region erlTryAfter matchgroup=erlRes
      \ start='\<after\>' end='\%(\<end\>\)\@='
      \ contains=@erlExpr,erlComma,@erlResErr

" Begin/end {{{3
syn region erlBegin matchgroup=erlRes start='\<begin\>' end='\<end\>'
      \ contains=@erlExpr,erlComma,erlAfterErr,erlOfErr,erlWhenErr
      \ contained
syn cluster erlBlockExpr add=erlBegin

" Expression errors {{{2
fun! s:keyword_err(word, group)
  exe 'syn keyword' a:group a:word 'contained'
  exe 'syn cluster erlResErr add=' a:group
  exe 'hi def link' a:group 'erlOutside'
endf

call s:keyword_err('when',  'erlWhenErr')
call s:keyword_err('end',   'erlEndErr')
call s:keyword_err('of',    'erlOfErr')
call s:keyword_err('after', 'erlAfterErr')

" Misc punctuation {{{1

" Full stop {{{2
syn match erlFullStop '\.' contained
hi def link erlFullStop erlDelim

" Parens {{{2
syn region erlExprParens matchgroup=erlDelim start='(' end=')'
      \ contains=@erlExpr,@erlResErr contained
syn cluster erlExpr add=erlExprParens

" Comma {{{2
syn match erlComma ',' contained
hi def link erlComma erlDelim

" Semicolon {{{2
syn match erlSemi ';' contained
hi def link erlSemi erlDelim

" Pipe {{{2
syn match erlPipe '|' contained
hi def link erlPipe erlDelim

" Colon {{{2
syn match erlColon ':' contained
hi def link erlColon erlDelim

" }}}1
" vim: set fdm=marker
