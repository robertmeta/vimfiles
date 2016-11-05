" File:		MultipleSearch.vim (global plugin)
" Last Changed: 14 Aug 2008
" Maintainer:	Dan Sharp <dwsharp at hotmail dot com>
" Version:	1.3
" License:      Vim License
" GetLatestVimScripts: 479 1 :AutoInstall: MultipleSearch.vba

if exists('loaded_multiplesearch')
    finish
endif
let loaded_multiplesearch = 1


" Vim versions prior to 7.0 don't support the autoload mechanism, so go ahead
" and load the 'autoload' segment of the code and map the commands using the
" non-autoload format.
if v:version < 700
    runtime autoload/MultipleSearch.vim

    if !(exists(":SearchBuffers") == 2)
        command -nargs=* SearchBuffers :silent call MultipleSearch(1, <q-args>)
    endif

    if !(exists(":Search") == 2)
        command -nargs=* Search :silent call MultipleSearch(0, <q-args>)
    endif

    " Following Manuel's idea, adapt the former 'Super Star' tip from vim.org to work with
    " :Search on a visual selection.
    "vnoremap <silent> <Leader>* y:execute ':Search \V<C-R>=substitute(escape(@@,"/\\"),"\n","\\\\n","ge")<CR>'<CR>
    vnoremap <silent> <Leader>* y:call MultipleSearch(0,'\V'.substitute(escape(@@,"\\/\"'"),"\n",'\\n','ge'))<CR>
else
    " Only autoload the Search commands, since we shouldn't need to use
    " :SearchReset and :SearchReinit until after the first :Search.
    if !(exists(":SearchBuffers") == 2)
        command -nargs=* SearchBuffers :silent call MultipleSearch#MultipleSearch(1, <q-args>)
    endif

    if !(exists(":Search") == 2)
        command -nargs=* Search :silent call MultipleSearch#MultipleSearch(0, <q-args>)
    endif

    " Following Manuel's idea, adapt the former 'Super Star' tip from vim.org to work with
    " :Search on a visual selection.
    vnoremap <silent> <Leader>* y:call MultipleSearch#MultipleSearch(0,'\V'.substitute(escape(@@,"\\/\"'"),"\n",'\\n','ge'))<CR>
endif

" Thanks to Manuel Picaza for the following mapping to :Search the word under
" the cursor.
nnoremap <silent> <Leader>* :execute ':Search \<' . expand('<cword>') . '\>'<cr>

