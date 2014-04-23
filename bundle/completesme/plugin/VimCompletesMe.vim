" VimCompletesMe.vim - For super simple tab completion
" Maintainer:          Akshay Hegde <http://github.com/ajh17>
" Version:             0.3
" Website:             <http://github.com/ajh17/VimCompletesMe>

" Vimscript Setup: {{{1
if exists("g:loaded_VimCompletesMe") || v:version < 703 || &compatible
    finish
endif
let g:loaded_VimCompletesMe = 1

" Options: {{{1
if !exists('g:vcm_s_tab_behavior')
    let g:vcm_s_tab_behavior = 0
endif

if !exists('g:vcm_direction')
    let g:vcm_direction = 'n'
endif

" Functions: {{{1
function! s:vimCompletesMe(type)
    let dirs = ["\<c-p>", "\<c-n>"]
    let dir = g:vcm_direction =~? '[nf]'
    let map = exists('b:vcm_tab_complete') ? b:vcm_tab_complete : ''
    let shift_exists = a:type ==? "shift_tab"

    if pumvisible()
        if shift_exists
            return dirs[!dir]
        else
            return dirs[dir]
        endif
    endif

    let pos = getpos('.')
    let substr = matchstr(strpart(getline(pos[1]), 0, pos[2]-1), "[^ \t]*$")
    if strlen(substr) == 0
        if shift_exists && !g:vcm_s_tab_behavior
            return "\<C-d>"
        else
            return "\<tab>"
        endif
    endif

    let period = match(substr, '\.') != -1
    if has('win32') || has('win64')
        let file_pattern = match(substr, '\\') != -1
    else
        let file_pattern = match(substr, '\/') != -1
    endif

    if file_pattern
        return "\<C-x>\<C-f>"
    elseif period && (&omnifunc != '')
        if get(b:, 'tab_complete_pos', []) == pos
            let exp = "\<C-x>" . dirs[!dir]
        else
            let exp = "\<C-x>\<C-o>"
        endif
        let b:tab_complete_pos = pos
        return exp
    endif

    if map ==? "user"
        return "\<C-x>\<C-u>"
    elseif map ==? "tags"
        return "\<C-x>\<C-]>"
    elseif map ==? "omni"
        return "\<C-x>\<C-o>"
    elseif map ==? "dict"
        return "\<C-x>\<C-k>"
    elseif map ==? "vim"
        return "\<C-x>\<C-v>"
    else
        return "\<C-x>" . dirs[!dir]
    endif
endfunction

" Maps: {{{1
inoremap <expr> <Tab> <SID>vimCompletesMe("")
inoremap <expr> <S-Tab> <SID>vimCompletesMe("shift_tab")
