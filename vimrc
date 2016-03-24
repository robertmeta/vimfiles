" Informational
"   This is my personal .vimrc, I don't recommend you copy it, just
"   use the pieces you want (and understand!).  When you copy a
"   .vimrc in its entirety, weird and unexpected things can happen
"
"   If you find an obvious mistake hit me up at:
"   http://robertmelton.com (many forms of communication)
"
"   source: https://github.com/robertmeta/vimfiles

" Baseline 
set encoding=utf-8 " yey! utf-8
scriptencoding utf-8 " yey! utf-8
" adds stuff under bundles to the path
execute pathogen#infect()
execute pathogen#helptags()

" DRY helpers 
let s:running_windows=has("win16") || has("win32") || has("win64")
let s:colorful_term=(&term=~"xterm") || (&term=~"screen")

" Loading Settings 
let g:skip_loading_mswin=1 " Just in case :)
filetype plugin indent on " if you are going to steal something from my vimrc, this should be it
syntax on " syntax highlighting on
syntax sync minlines=100 " helps to avoid syntax highlighting bugs

" Mappings 
let mapleader="\<space>"
" Scrolling/Line movement
nnoremap gj j
nnoremap gk k
nnoremap j gj
nnoremap k gk
nnoremap <leader>j <C-f>
nnoremap <leader>k <C-b>
" Window control
nnoremap <leader>o <C-W>o
nnoremap <leader>w <C-W>w
nnoremap <silent> <leader>c <esc>:close<cr>
nnoremap <silent> <leader>S <esc>:SyntasticCheck<cr>
nnoremap <silent> <leader>" :split<cr>
nnoremap <silent> <leader>% :vsplit<cr>
" Arrow control
nmap <up> <Plug>QfLprevious
nmap <down> <Plug>QfLnext
nmap <left> <Plug>QfCprevious
nmap <right> <Plug>QfCnext
" page facing view: side-by-side view of same buffer scrollbound
nnoremap <silent> <leader>vs :<C-u>let @z=&so<cr>:set so=0 noscb<cr>:bo vs<cr>Ljzt:setl scb<cr><C-w>p:setl scb<cr>:let &so=@z<cr>
" Make BS/DEL work as expected in visual modes (i.e. delete the selected text)...
vmap <BS> x
" Turn off search highlight with backspace
nnoremap <silent> <BS> :nohlsearch<cr>
" Random Mappings
nnoremap - :e <c-r>=fnameescape(expand('%:p:h'))<cr>/*<C-d>
nnoremap <leader>b :b *
nnoremap <leader>d :Dlist<space>
nnoremap <leader>f :find *
nnoremap <leader>i :Ilist<space>
nnoremap <leader>s :grep<space>
nnoremap <leader>q :b#<cr>
nnoremap <leader>T :tag<space>*
nnoremap <silent> <leader>t :call ToggleFolds()<cr>
" Vimux
nnoremap <silent> <Leader>r :VimuxRunLastCommand<cr>
nnoremap <silent> <Leader>vi :VimuxInspectRunner<cr>
nnoremap <silent> <Leader>vl :VimuxRunLastCommand<cr>
nnoremap <silent> <Leader>vp :VimuxPromptCommand<cr>
nnoremap <silent> <Leader>vq :VimuxCloseRunner<cr>
nnoremap <silent> <Leader>vr :VimuxRunLastCommand<cr>
nnoremap <silent> <Leader>vx :VimuxInterruptRunner<cr>
nnoremap <silent> <Leader>x :VimuxInterruptRunner<cr>
" quick command helpers
cnoremap %% <c-r>=fnameescape(expand('%'))<cr>
cnoremap :: <c-r>=fnameescape(expand('%:p:h'))<cr>/

" Basics Settings 
set backspace=indent,eol,start " make backspace a more flexible
set breakindent " this is just awesome (best patch in a long time)
set cmdheight=2 " Gets rid of all the press enter to continue
set completeopt=longest,menuone " complete menu
set complete=.,w,b,u,t " complete options
set diffopt=filler,iwhite " filler and whitespace
set expandtab " no real tabs please!
set exrc " source .vimrc _vimrc .exrc _exrc files in local tree (deepest found rules all)
set fileencoding=utf-8 " UTF-8
set fileformats=unix,dos,mac " support all three, in this order
set foldcolumn=2 " Only need one for folding
set foldenable " Turn on folding
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldmethod=indent " Fold on the indent
set foldnestmax=1 " I only like to fold outer functions
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
set formatlistpat=^\\s*\\(\\d\\\|[-*]\\)\\+[\\]:.)}\\t\ ]\\s* " and bullets, too
set hidden " load files in background
set history=9999 " big old history
set hlsearch " do highlight searched for phrases
set ignorecase " case insensitive by default
set incsearch " BUT do highlight as you type you search phrase
set infercase " case inferred by default
set laststatus=2 " always show the status line
set lazyredraw " do not redraw while running macros
set linebreak " break on words not mid-word
set linespace=0 " don't insert any extra pixel lines betweens rows
set listchars=tab:»\ ,eol:¬,trail:‽ " if I need listchars
set modeline " I have started using modelines (risky business!)
set modelines=5 " Search for 5 lines for modelines
set noautoread " nope
set noautowriteall " nope
set noautowrite " nope
set nocursorcolumn " disable global cursor column
set cursorline " cursor line
set noerrorbells " don't be noisy
set noexrc " don't use local version of .(g)vimrc, .exrc
set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)
set nolist " nope nope nope
set nomore " Scroll away, no pausing
set norelativenumber " no thank you
set nospell " nope nope nope
set nosplitbelow " split above
set nosplitright " split left
set nostartofline " leave my cursor where it was
set notimeout " better timeout handling
set novisualbell " don't be noisy
set number " line numbers
set numberwidth=8 " We are good up to LOTS lines
set omnifunc=syntaxcomplete#Complete
set path=.,** " Useful path!
set report=0 " tell us when anything is changed via :
set ruler " Always show current positions along the bottom
set scrolljump=5 " If you hit bottom or top, jump 5
set scrolloff=5 " Keep focus on middle of screen when possible
set secure " but lets not go crazy
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
set shiftwidth=4 " auto-indent amount when using cindent, >>, << and stuff like that
set showbreak=›››\  " this is how we show breaks (this comment is broken in vim, dafaq)
set showcmd " Show the commands
set showmatch " do show matching things
set showmode " default but just in case
set sidescroll=5 " If you hit edge, jump 5
set sidescrolloff=5 " Keep 5 lines at the size
set smartcase " Smart case enabled
set softtabstop=4 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
set switchbuf=useopen " when working with quickfix use new splits
set synmaxcol=500 " Don't try to highlight lines longer than X characters.
set tabstop=8 " real tabs should be 8, and they will show with set list on
set textwidth=0 " No autowrapping
set title " mess with the title
set titlestring= " no title string
set ttimeoutlen=10 " 10ms timeout
set ttimeout " time out on key codes
set ttyfast " Assume a fast terminal
set t_vb= " seriously, shhhh, don't be noisy
set virtualedit=block " block mode, yey (onemore is evil)
set wrap " Going to try to love it, again

nmap <leader>F :find <C-R>=fnameescape(expand('%:p:h')).'/**/*'<CR>

" Clipboard, Backup and Undo 
set backup " make backup files
if s:running_windows
    set backupdir=~/vimfiles/backup/ " where to put backup files
    set directory=~/vimfiles/temp/ " directory to place swap files in
    set undodir=~/vimfiles/undo/ " where to put undo files
else
    set backupdir=~/.vim/backup/ " where to put backup files
    set directory=~/.vim/temp/ " directory to place swap files in
    set undodir=~/.vim/undo/ " where to put undo files
endif
set undofile " persistent undo (between saves)
set undolevels=1000 " persistent undo
set undoreload=10000 " to undo forced reload with :e!

" Wildmenu 
set wildmenu " turn on command line completion wild style
set wildignore=*.a,*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.aux,*.out,*.toc " LaTeX intermediate files
set wildignore+=*.DS_Store " OSX bullshit
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " binary images
set wildignore+=*.luac " Lua byte code
set wildignore+=migrations " Django migrations
set wildignore+=*.orig " Merge resolution file
set wildignore+=*.pdf,*.zip,*.so " binaries
set wildignore+=*.pyc,*.pyo " Python byte code
set wildignore+=*.spl " compiled spelling word lists
set wildignore+=*.swp,*.bak " ignore these
set wildignore+=*.sw? " Vim swap files
if s:running_windows
    set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*,*\\bin\\*,*\\pkg\\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/bin/*,*/pkg/*
endif
set wildmode=list:longest " turn on wild mode huge list

" Various formatting / output options 
set viminfo=!,h,'500,<10000,s1000,/1000,:1000
"             | | |    |      |     |     |
"             | | |    |      |     |     +-- remember last 1000 commands
"             | | |    |      |     +-- remember last 1000 search patterns
"             | | |    |      +- remember up to 1MB in each register
"             | | |    +-- remember up to 10000 lines in each register
"             | | +-- remember marks for last 500 files
"             | +-- disable hlsearch while loading viminfo
"             +-- include uppercase registers
"
set formatoptions=qrn1j " used to be just rq
"                   |||||
"                   ||||+-- remove comment when joining lines
"                   |||+-- don't break after one letter word
"                   ||+-- format numbered lists using 'formatlistpat'
"                   |+-- enter extends comments
"                   +-- allow gq to work on comment
"
set shortmess=aOstTI " shortens messages to avoid 'press a key' prompt
"               ||||||
"               |||||+-- no intro message
"               ||||+-- truncate messages in the middle
"               |||+-- truncate file message
"               ||+-- not "Search hit bottom" crap
"               |+-- file read message overwrites subsequent
"               +-- use every short text trick
"
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"                | | | | |  | |      |  |     |    |
"                | | | | |  | |      |  |     |    +-- current column
"                | | | | |  | |      |  |     +-- current line
"                | | | | |  | |      |  +-- current % into file
"                | | | | |  | |      +-- current syntax in square brackets
"                | | | | |  | +-- current fileformat
"                | | | | |  +-- number of lines
"                | | | | +-- preview flag in square brackets
"                | | | +-- help flag in square brackets
"                | | +-- readonly flag in square brackets
"                | +-- rodified flag in square brackets
"                +-- full path to file in the buffer
"
set cpoptions=aABceFsmq
"               |||||||||
"               ||||||||+-- When joining lines, leave the cursor between joined lines
"               |||||||+-- When a new match is created (showmatch) pause for .5
"               ||||||+-- Set buffer options when entering the buffer
"               |||||+-- :write command updates current file name automatically add <cr> to the last line when using :@r
"               |||+-- Searching continues at the end of the match at the cursor position
"               ||+-- A backslash has no special meaning in mappings
"               |+-- :write updates alternative file name
"               +-- :read updates alternative file name
"
set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
"               | | | | | | | | |
"               | | | | | | | | +-- "]" Insert and Replace
"               | | | | | | | +-- "[" Insert and Replace
"               | | | | | | +-- "~" Normal
"               | | | | | +-- <Right> Normal and Visual
"               | | | | +-- <Left> Normal and Visual
"               | | | +-- "l" Normal and Visual (not recommended)
"               | | +-- "h" Normal and Visual (not recommended)
"               | +-- <Space> Normal and Visual
"               +-- <BS> Normal and Visual

" Autocommands 
if has("autocmd")
    augroup general
        " Clear!
        au!
        " Resize windows automagically
        au VimResized * :wincmd =
        " Things that use two spaces rather than four
        au BufRead,BufNewFile *.rb,*.rhtml setlocal sw=2 sts=2 " ruby likes two
        au BufRead,BufNewFile *.yaml setlocal sw=2 sts=2 " ruby likes two
        " Go setlocalup assumptions: gocode, godef, gotags all in path
        au BufRead,BufNewFile *.go setlocal noexpandtab sw=8 sts=8 syntax=go ft=go " so does make
        au BufRead,BufNewFile MakeFile,Makefile,makefile setlocal noexpandtab sw=8 sts=8 syntax=make " so does make
        " Some JS awesome via romainl
        au BufRead,BufNewFile *.js nnoremap <C-}> :ptjump /<c-r>=expand('<cword>')<cr><cr>
        au BufRead,BufNewFile *.js nnoremap <C-]> :tjump /<c-r>=expand('<cword>')<cr><cr>
        " Override types
        au BufNewFile,BufRead *.ahk setlocal filetype=autohotkey " Autohotkey
        au BufNewFile,BufRead *.dtl setlocal filetype=htmldjango " Django Templates
        au BufNewFile,BufRead *.md,*.markdown setlocal filetype=markdown " Markdown (common markdown?)
        au BufNewFile,BufRead *.ps1 setlocal filetype=ps1 " Powershell
        " Things I like spellcheck in
        au FileType asciidoc setlocal spell
        au FileType gitcommit setlocal spell
        au FileType markdown setlocal spell
        au FileType svn setlocal spell
        " Go setlocalup assumptions: gocode, godef, gotags all in path
        au FileType go nmap gd <Plug>(go-def)
        au FileType go nmap gi <Plug>(go-info)
        au FileType go nmap gr <Plug>(go-rename)
        " au FileType go nmap gD <Plug>(go-doc)
        au FileType go nmap gT <Plug>(go-test)
        au FileType go nmap gt <Plug>(go-test-func)
        " Highlight current line
        au VimEnter,WinEnter,BufWinEnter,BufRead * setlocal relativenumber cursorline 
        au WinLeave * setlocal nocursorline norelativenumber
        " Quickfix open
        au QuickFixCmdPost [^l]* cwindow
        au QuickFixCmdPost    l* lwindow
    augroup END
endif

" GUI 
if has("gui_running")
    set guifont=Hack:h08:cANSI " My favorite font
    set guioptions=ce
    "              ||
    "              |+-- use GUI tabs, not console style tabs
    "              +-- use simple dialogs rather than pop-ups
endif

" 256 color term tweaks 
if s:colorful_term
    " 256 color -- this is a bad idea generally, but I use it anyway
    let &t_Co=256
    " don't clear background color
    set t_ut=
    " restore screen after quitting
    if has("terminfo")
        let &t_Sb="\ESC[4%p1%dm"
        let &t_Sf="\ESC[3%p1%dm"
    else
        let &t_Sb="\ESC[4%dm"
        let &t_Sf="\ESC[3%dm"
    endif
endif

" Mousing 
if has("mouse")
    set mouse=a " use mouse everywhere
    set nomousehide " don't hide the mouse
    if !has('nvim')
          set ttymouse=xterm2
    endif
    " allows clicking after the 223rd column
    if has('mouse_sgr')
        set ttymouse=sgr
    endif
endif

" Ag Grep 
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
if executable("pt")
    set grepprg=pt\ --nogroup\ --nocolor\ --ignore-case\ --column
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Markdown 
let g:vim_markdown_folding_disabled=0
let g:vim_markdown_frontmatter=1

" Netrw 
let g:netrw_altfile=1

" Vim Go (vim-go) 
let g:go_auto_type_info=0
let g:go_bin_path=$HOME."/go/bin"
let g:godef_same_file_in_same_window=1
let g:godef_split=0
let g:go_fmt_autosave=1
let g:go_fmt_command="goimports"
let g:go_fmt_fail_silently=0
let g:go_highlight_array_whitespace_error=1
let g:go_highlight_build_constraints=1
let g:go_highlight_chan_whitespace_error=1
let g:go_highlight_extra_types=1
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_operators=1
let g:go_highlight_space_tab_error=1
let g:go_highlight_string_spellcheck=0
let g:go_highlight_structs=1
let g:go_highlight_trailing_whitespace_error=1

" Nofrils 
let g:nofrils_strbackgrounds=0 " to turn off highlighted string backgrounds
colo nofrils-dark

" Functions 
function! ToggleFolds()
    if !exists("b:myfolded") 
        let b:myfolded = 0
    endif

    if b:myfolded ># 0
        execute("%foldo")
        let b:myfolded = 0
    else
        execute("%foldc")
        let b:myfolded = 1
    endif
endfunction
