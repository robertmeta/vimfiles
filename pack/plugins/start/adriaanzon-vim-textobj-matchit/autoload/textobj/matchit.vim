function! s:throw_if(condition, exception)
  if a:condition
    throw 'textobj-matchit: ' . a:exception
  endif
endfunction

function! s:skip() abort
  " TODO If b:endwise_syngroups is available, use that because it's more reliable for searching.
  if !exists('b:match_skip')
    return 'synIDattr(synID(line("."),col("."),1),"name") =~? "comment\\|string"'
  endif

  " Adapted from matchit.vim's s:ParseSkip()
  if b:match_skip[1] == ":"
    if b:match_skip[0] == "s"
      return "synIDattr(synID(line('.'),col('.'),1),'name') =~? '" . strpart(b:match_skip,2) . "'"
    elseif b:match_skip[0] == "S"
      return "synIDattr(synID(line('.'),col('.'),1),'name') !~? '" . strpart(b:match_skip,2) . "'"
    elseif b:match_skip[0] == "r"
      return "strpart(getline('.'),0,col('.'))=~'" . strpart(b:match_skip,2). "'"
    elseif b:match_skip[0] == "R"
      return = "strpart(getline('.'),0,col('.'))!~'" . strpart(b:match_skip,2). "'"
    endif
  endif

  return b:match_skip
endfunction

function! s:parse_match_words() abort
  return map(
        \   map(
        \     filter(split(b:match_words, '\\\@<!,'), 'v:val =~ ''\w'''),
        \     'split(v:val, ''\\\@<!:'')'
        \   ),
        \   '[v:val[0], v:val[-1:][0]]'
        \ )
endfunction

" Position the cursor to prepare for a searchpair(), and get the necessary
" flags according to the context of the cursor position.
function! s:flags(start, end)
  let cursor_col = getpos('.')[2]
  let end_match_col = match(getline('.'), a:end) + 1

  if end_match_col && end_match_col <= cursor_col
    call cursor('.', end_match_col)
    return 'cnW'
  endif

  let start_match_col = match(getline('.'), a:start) + 1
  if start_match_col >= cursor_col
    call cursor('.', start_match_col)
  endif

  return 'nW'
endfunction

function! s:closest_pair() abort
  call s:throw_if(!exists('g:loaded_matchit'), 'Matchit.vim not enabled')
  call s:throw_if(!exists('b:match_words'), 'No match found')

  let candidates = {}

  for [start, end] in s:parse_match_words()
    let [lnum, col] = searchpairpos(start, '', end, s:flags(start, end), s:skip())
    if lnum
      let candidates[lnum] = [0, lnum, col, 0]
    endif
  endfor

  call s:throw_if(empty(candidates), 'No match found')

  let closest = keys(candidates)[0]
  if len(candidates) > 1
    for lnum in keys(candidates)[1:]
      if abs(lnum - line('.')) > closest
        let closest = lnum
      endif
    endfor
  endif

  return candidates[closest]
endfunction

function! s:select(start_adjustment, end_adjustment) abort
  try
    let end_pos = s:closest_pair()
    call setpos('.', end_pos)
    normal %
    let start_pos = getpos('.')

    " Give up when the cursor doesn't move after invoking matchit
    call s:throw_if(start_pos == end_pos, 'No match found')

    let start_pos[1] = start_pos[1] + a:start_adjustment
    let end_pos[1] = end_pos[1] + a:end_adjustment

    return ['V', start_pos, end_pos]
  catch /^textobj-matchit: No match found/
    return 0
  endtry
endfunction

function! textobj#matchit#select_a() abort
  return s:select(0, 0)
endfunction

function! textobj#matchit#select_i() abort
  return s:select(1, -1)
endfunction

function! textobj#matchit#map(char) abort
  if get(g:, 'textobj_matchit_filetype_mappings', 0)
        \ && empty(maparg('a' . a:char, 'x')) && empty(maparg('a' . a:char, 'o'))
        \ && empty(maparg('i' . a:char, 'x')) && empty(maparg('i' . a:char, 'o'))
    execute 'xmap <buffer> a' . a:char . ' <Plug>(textobj-matchit-a)'
    execute 'omap <buffer> a' . a:char . ' <Plug>(textobj-matchit-a)'
    execute 'xmap <buffer> i' . a:char . ' <Plug>(textobj-matchit-i)'
    execute 'omap <buffer> i' . a:char . ' <Plug>(textobj-matchit-i)'
  endif
endfunction
