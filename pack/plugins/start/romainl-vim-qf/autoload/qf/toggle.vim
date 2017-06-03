" vim-qf - Tame the quickfix window
" Maintainer:	romainl <romainlafourcade@gmail.com>
" Version:	0.1.2
" License:	MIT
" Location:	autoload/toggle.vim
" Website:	https://github.com/romainl/vim-qf
"
" Use this command to get help on vim-qf:
"
"     :help qf
"
" If this doesn't work and you installed vim-qf manually, use the following
" command to index vim-qf's documentation:
"
"     :helptags ~/.vim/doc
"
" or read your runtimepath/plugin manager documentation.

let s:save_cpo = &cpo
set cpo&vim

" toggles the quickfix window
function! qf#toggle#ToggleQfWindow(stay) abort
    " save the view if the current window is not a quickfix window
    let winview = qf#IsQfWindow(winnr()) ? {} : winsaveview()

    " if one of the windows is a quickfix window close it and return
    if qf#IsQfWindowOpen()
        cclose
        if !empty(winview)
            call winrestview(winview)
        endif
    else
        cwindow
        if qf#IsQfWindowOpen()
            wincmd p
            if !empty(winview)
                call winrestview(winview)
            endif
            if !a:stay
                wincmd p
            endif
        endif
    endif
endfunction

" toggles the location window associated with the current window
" or whatever location window has the focus
function! qf#toggle#ToggleLocWindow(stay) abort
    " save the view if the current window is not a location window
    let winview = qf#IsLocWindow(winnr()) ? {} : winsaveview()

    if qf#IsLocWindowOpen(0)
        lclose
        if !empty(winview)
            call winrestview(winview)
        endif
    else
        lwindow
        if qf#IsLocWindowOpen(0)
            wincmd p
            if !empty(winview)
                call winrestview(winview)
            endif
            if !a:stay
                wincmd p
            endif
        endif
    endif
endfunction

let &cpo = s:save_cpo
