# ~~Better~~ Much simpler Rainbow Parentheses

A heavily-rewritten fork of [kien/rainbow_parentheses.vim][k].

- Simpler commands and configuration
- Automatic color extraction
- Adjusts itself when color scheme is changed

## Installation

Using [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'junegunn/rainbow_parentheses.vim'
```

## Commands

```vim
" Activate
:RainbowParentheses

" Deactivate
:RainbowParentheses!

" Toggle
:RainbowParentheses!!

" See the enabled colors
:RainbowParenthesesColors

" Activation based on file type
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END
```

## Customization

```vim
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']']]

" List of colors that you do not want. ANSI code or #RRGGBB
let g:rainbow#blacklist = [233, 234]
```

[k]: https://github.com/kien/rainbow_parentheses.vim

