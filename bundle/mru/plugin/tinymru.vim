" tinymru.vim - A tiny MRU plugin
" Maintainer:	romainl <romainlafourcade@gmail.com>
" Version:	0.0.1
" License:	MIT
" Location:	plugin/tinynru.vim
" Website:	https://github.com/romainl/vim-tinyMRU

if exists("g:loaded_tinymru") || v:version < 703 || &compatible
  finish
endif
let g:loaded_tinymru = 1

let s:save_cpo = &cpo
set cpo&vim

" MRU command-line completion
function! s:MRUComplete(ArgLead, CmdLine, CursorPos)
    return filter(copy(v:oldfiles), 'v:val =~ a:ArgLead')
endfunction

" MRU function
function! s:MRU(command, arg)
    if a:command == "tabedit"
        execute a:command . " " . a:arg . "\|lcd %:p:h"
    else
        execute a:command . " " . a:arg
    endif
endfunction

" commands
command! -nargs=1 -complete=customlist,<sid>MRUComplete ME call <sid>MRU('edit', <f-args>)
command! -nargs=1 -complete=customlist,<sid>MRUComplete MS call <sid>MRU('split', <f-args>)
command! -nargs=1 -complete=customlist,<sid>MRUComplete MV call <sid>MRU('vsplit', <f-args>)
command! -nargs=1 -complete=customlist,<sid>MRUComplete MT call <sid>MRU('tabedit', <f-args>)

let &cpo = s:save_cpo
