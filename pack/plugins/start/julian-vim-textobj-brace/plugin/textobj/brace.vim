" textobj-brace: a text object for braces of any kind
" Author: Julian Berman
" Version: 0.1.0

if exists('g:loaded_textobj_brace')
    finish
endif

call textobj#user#plugin('brace', {
    \ '-': {
    \     '*sfile*': expand('<sfile>:p'),
    \     'select-a': 'aj',  '*select-a-function*': 'textobj#brace#select_a',
    \     'select-i': 'ij',  '*select-i-function*': 'textobj#brace#select_i',
    \ }})

let g:loaded_textobj_brace = 1
