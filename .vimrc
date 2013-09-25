"   This is my personal .vimrc, I don't recommend you copy it, just
"   use the pieces you want (and understand!).  When you copy a
"   .vimrc in its entirety, weird and unexpected things can happen.
"
"   If you find an obvious mistake hit me up at:
"   http://robertmelton.com (many forms of communication)

" Startup 
let s:running_windows = has("win16") || has("win32") || has("win64")
let s:colorful_term = (&term =~ "xterm") || (&term =~ "screen")

" Before we do anything, lets get pathogen up 
execute pathogen#infect()

" Basics
set nocompatible " explicitly get out of vi-compatible mode
set noexrc " don't use local version of .(g)vimrc, .exrc
set background=dark " we plan to use a dark background
set fenc=utf-8 " UTF-8
set cpoptions=aABceFsmq
"             |||||||||
"             ||||||||+-- When joining lines, leave the cursor between joined lines
"             |||||||+-- When a new match is created (showmatch) pause for .5
"             ||||||+-- Set buffer options when entering the buffer
"             |||||+-- :write command updates current file name automatically add <CR> to the last line when using :@r
"             |||+-- Searching continues at the end of the match at the cursor position
"             ||+-- A backslash has no special meaning in mappings
"             |+-- :write updates alternative file name
"             +-- :read updates alternative file name
syntax on " syntax highlighting on
let g:skip_loading_mswin=1 " Just in case :)
set history=99999 " big old history
set timeoutlen=500 " super low delay (works for me)
set formatoptions+=n " Recognize numbered lists
set formatlistpat=^\\s*\\(\\d\\\|[-*]\\)\\+[\\]:.)}\\t\ ]\\s* "and bullets, too
set viminfo+=! " Store upper-case registers in viminfo
set nomore " Short nomore

" use modelines
if $USER != "root"
    set modeline
endif

" turn off beep
set noerrorbells
set novisualbell
set t_vb=

" General 
filetype plugin indent on " load filetype plugins/indent settings
set backspace=indent,eol,start " make backspace a more flexible
set backup " make backup files
set clipboard+=unnamed " share windows clipboard
if s:running_windows
    set backupdir=~/vimfiles/backup " where to put backup files
    set undodir=~/vimfiles/undo " where to put undo files
    set directory=~/vimfiles/temp " directory to place swap files in
else
    set backupdir=~/.vim/backup " where to put backup files
    set undodir=~/.vim/undo " where to put undo files
    set directory=~/.vim/temp " directory to place swap files in
endif
set fileformats=unix,dos,mac " support all three, in this order
set hidden " you can change buffers without saving
set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
"             | | | | | | | | |
"             | | | | | | | | +-- "]" Insert and Replace
"             | | | | | | | +-- "[" Insert and Replace
"             | | | | | | +-- "~" Normal
"             | | | | | +-- <Right> Normal and Visual
"             | | | | +-- <Left> Normal and Visual
"             | | | +-- "l" Normal and Visual (not recommended)
"             | | +-- "h" Normal and Visual (not recommended)
"             | +-- <Space> Normal and Visual
"             +-- <BS> Normal and Visual
set wildmenu " turn on command line completion wild style
set wildignore=*.pyo,*.pyc,*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png " ignore these
if s:running_windows
    set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
endif
set wildmode=list:longest " turn on wild mode huge list

" Vim UI 
set incsearch " BUT do highlight as you type you search phrase
set laststatus=2 " always show the status line
set lazyredraw " do not redraw while running macros
set linespace=0 " don't insert any extra pixel lines betweens rows
set list " we do want to show tabs and tailing to ensure we get them out of my files
set listchars=tab:>-,trail:- " show tabs and trailing
set matchtime=1 " how many tenths of a second to blink matching brackets for
set nohlsearch " do not highlight searched for phrases
set nostartofline " leave my cursor where it was
set novisualbell " don't blink
set number " turns out I hate relative numbering
set numberwidth=5 " We are good up to 99999 lines
set report=0 " tell us when anything is changed via :...
set ruler " Always show current positions along the bottom
set scrolloff=5 " Keep 5 lines (top/bottom) for scope
set shortmess=aOstT " shortens messages to avoid 'press a key' prompt
set showcmd " show the command being typed
set showmatch " show matching brackets
set sidescrolloff=5 " Keep 5 lines at the size
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    + current column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer

" Text Formatting/Layout 
set completeopt=menuone " don't use a pop up menu for completions
set expandtab " no real tabs please!
set formatoptions=rq " Automatically insert comment leader on return, and let gq format comments
set ignorecase " case insensitive by default
set infercase " case inferred by default
set nowrap " do not wrap line
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
set smartcase " if there are caps, go case-sensitive
set shiftwidth=4 " auto-indent amount when using cindent, >>, << and stuff like that
set softtabstop=4 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
set tabstop=8 " real tabs should be 8, and they will show with set list on

" Folding 
set foldenable " Turn on folding
set foldmethod=marker " Fold on the marker
set foldmarker={,} " use simple markers
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldnestmax=1 " I only like to fold outer functions
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds

" Plugin Settings 
let g:SuperTabDefaultCompletionType = "context"
let html_number_lines = 0
let html_use_css = 0
let use_xhtml = 0
let b:match_ignorecase = 1 " case is stupid
let perl_extended_vars=1 " highlight advanced perl vars inside strings
let tlist_aspjscript_settings = 'asp;f:function;c:class'
let tlist_aspvbs_settings = 'asp;f:function;s:sub'
let tlist_php_settings = 'php;c:class;d:constant;f:function'
let tlist_vb_settings = 'asp;f:function;c:class'
let NERDTreeIgnore = ['\.beam', '\.pyc', 'ebin', 'bin', 'pkg', '\.so', '\.dll']
let NERDChristmasTree = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:rbpt_colorpairs = [
    \ ['red', 'RoyalBlue3'],
    \ ['green', 'SeaGreen3'],
    \ ['blue', 'firebrick3'],
    \ ['yellow', 'DarkOrchid3'],
    \ ['magenta', 'RoyalBlue3'],
    \ ['cyan', 'SeaGreen3'],
    \ ['red', 'RoyalBlue3'],
    \ ['green', 'SeaGreen3'],
    \ ['blue', 'firebrick3'],
    \ ['yellow', 'DarkOrchid3'],
    \ ['magenta', 'RoyalBlue3'],
    \ ['cyan', 'SeaGreen3'],
    \ ['red', 'RoyalBlue3'],
    \ ['green', 'SeaGreen3'],
    \ ['blue', 'firebrick3'],
    \ ['yellow', 'DarkOrchid3'],
    \ ['magenta', 'RoyalBlue3'],
    \ ['cyan', 'SeaGreen3'],
    \ ['red', 'RoyalBlue3'],
    \ ['green', 'SeaGreen3'],
    \ ['blue', 'firebrick3'],
    \ ['yellow', 'DarkOrchid3'],
    \ ['magenta', 'RoyalBlue3'],
    \ ['cyan', 'SeaGreen3'],
\ ]
let g:rbpt_max = 24
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_max_height = 30
let g:ctrlp_max_files = 100000
let g:ctrlp_max_depth = 100
let g:ctrlp_follow_symlinks = 0
let g:tagbar_left = 1
let g:tagbar_ctags_bin = 'ctags-exuberant'
" requires gotags in path
" go get -u github.com/jstemmer/gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
if s:running_windows
    let g:ctrlp_cache_dir = $HOME.'/vimfiles/ctrlp_cache'
else
    let g:ctrlp_cache_dir = $HOME.'/.vim/ctrlp_cache'
endif

" Mappings for Control-P
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>f :CtrlPMixed<CR>
nmap <leader>ff :CtrlPCurWD<CR>
nmap <leader>m :CtrlPMRUFiles<CR>
nmap <leader>l :CtrlPLine<CR>
nmap <leader>t :CtrlPBufTagA<CR>
nmap <leader>ta :CtrlPBufTagAll<CR>
" Random useful mappings
nmap <leader>a :A<CR>
nmap <leader>as :AV<CR>
nmap <up> :bp<CR>
nmap <down> :bn<CR>
nmap <left> :TagbarClose<CR>:NERDTree<CR>
nmap <right> :NERDTreeClose<CR>:TagbarOpen<CR>
" Switch to light theme
nmap <leader>cl :set background=light<CR>:colo summerfruit256<CR>:RainbowParenthesesActivate<CR>
nmap <leader>cd :set background=dark<CR>:colo herald<CR>:RainbowParenthesesActivate<CR>

if has("autocmd")
    augroup vimrcAu
        " Clear!
        au!
        " Things that use two spaces rather than four
        au BufRead,BufNewFile *.rb,*.rhtml set sw=2 sts=2 " ruby likes two 
        au BufRead,BufNewFile *.go set noexpandtab sw=8 sts=8 syntax=go listchars=tab:\|\ ,trail:- " Go uses tabs
        au BufWritePre *.go Fmt
        au BufRead,BufNewFile MakeFile,Makefile,makefile set noexpandtab sw=8 sts=8 syntax=make listchars=tab:\|\ ,trail:- " so does make
        " Override typens
        au BufNewFile,BufRead *.ahk set filetype=ahk " Autohotkey
        au BufNewFile,BufRead *.ps1 set filetype=ps1 " Powershell
        au BufNewFile,BufRead *.md set filetype=markdown " Markdown
        au BufNewFile,BufRead *.dtl set filetype=htmldjango " Django Templates
        " Rainbow Parens
        au VimEnter * RainbowParenthesesActivate " You actually have to turn it on
        au Syntax * RainbowParenthesesLoadRound
        au Syntax * RainbowParenthesesLoadSquare
        au Syntax * RainbowParenthesesLoadBraces
        au Syntax * RainbowParenthesesLoadChevrons
    augroup END
endif

if has("gui_running")
    " Basics
    colorscheme herald " my new favorite!
    set guifont=Consolas:h9:cANSI " My favorite font
    set guioptions=ce
    "              ||
    "              |+-- use simple dialogs rather than pop-ups
    "              +-- use GUI tabs, not console style tabs
    set mousehide " hide the mouse cursor when typing
endif

if s:colorful_term
    "256 color --
    let &t_Co=256
    colorscheme herald
    " restore screen after quitting
    if has("terminfo")
        let &t_Sf="\ESC[3%p1%dm"
        let &t_Sb="\ESC[4%p1%dm"
    else
        let &t_Sf="\ESC[3%dm"
        let &t_Sb="\ESC[4%dm"
    endif
endif

" Odds n Ends
if has("mouse")
    set mouse=a " use mouse everywhere
    set ttymouse=xterm2 " makes it work in everything
endif 
