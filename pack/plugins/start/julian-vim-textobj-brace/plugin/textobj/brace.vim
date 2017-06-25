" textobj-brace: a text object for braces of any kind
" Author: Julian Berman
" Version: 0.1.0

if exists('g:loaded_textobj_brace')
    finish
endif


call textobj#user#plugin('brace', {
    \ '-': {
    \     '*sfile*': expand('<sfile>:p'),
    \     'select-a': 'aj',  '*select-a-function*': 's:select_a',
    \     'select-i': 'ij',  '*select-i-function*': 's:select_i',
    \ }})


function! s:select(object_type)
    call search('[\|(\|{\|<', 'bce')
    let start_position = getpos('.')
    normal! %
    let end_position = getpos('.')

    if a:object_type ==? 'i'
        let start_position[2] += 1
        let end_position[2] -= 1
    endif

    return ['v', start_position, end_position]
endfunction


function! s:select_a()
    return s:select('a')
endfunction


function! s:select_i()
    return s:select('i')
endfunction


let g:loaded_textobj_brace = 1
