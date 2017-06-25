if exists('g:loaded_textobj_matchit')
  finish
endif

call textobj#user#plugin('matchit', {
      \   '-': {
      \     'select-a': 'am', 'select-a-function': 'textobj#matchit#select_a',
      \     'select-i': 'im', 'select-i-function': 'textobj#matchit#select_i',
      \   }
      \ })

let g:loaded_textobj_matchit = 1
