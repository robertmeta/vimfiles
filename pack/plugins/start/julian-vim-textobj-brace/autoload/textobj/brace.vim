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


function! textobj#brace#select_i() abort
  return s:select_i()
endfunction


function! textobj#brace#select_a() abort
  return s:select_a()
endfunction
