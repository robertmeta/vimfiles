" Modeline and Notes {{{
"   This is my personal .vimrc, I don't recommend you copy it, just
"   use the "   pieces you want(and understand!).  When you copy a
"   .vimrc in its entirety, weird and unexpected things can happen.
"
"   If you find an obvious mistake hit me up at:
"   http://robertmelton.com (many forms of communication)
" }}}

" Startup {{{
let s:running_windows = has("win16") || has("win32") || has("win64")
let s:colorful_term = (&term =~ "xterm") || (&term =~ "screen")
" }}}

" Before we do anything, lets get pathogen up {{{
execute pathogen#infect()
" }}}

" Basics {{{
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
" }}}

" General {{{
filetype plugin indent on " load filetype plugins/indent settings
set backspace=indent,eol,start " make backspace a more flexible
set backup " make backup files
set clipboard+=unnamed " share windows clipboard
if s:running_windows
    set backupdir=~/vimfiles/backup " where to put backup files
    set directory=~/vimfiles/temp " directory to place swap files in
else
    set backupdir=~/.vim/backup " where to put backup files
    set directory=~/.vim/temp " directory to place swap files in
endif
set fileformats=unix,dos,mac " support all three, in this order
set hidden " you can change buffers without saving
set mouse=a " use mouse everywhere
set noerrorbells " don't make noise
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
set wildignore=*/python/arcode/*,*.pyo,*.pyc,*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png " ignore these 
set wildmode=list:longest " turn on wild mode huge list
" }}}

" Vim UI {{{
set incsearch " BUT do highlight as you type you search phrase
set laststatus=2 " always show the status line
set lazyredraw " do not redraw while running macros
set linespace=0 " don't insert any extra pixel lines betweens rows
set list " we do what to show tabs, to ensure we get them out of my files
set listchars=tab:>-,trail:- " show tabs and trailing
set matchtime=1 " how many tenths of a second to blink matching brackets for
set nohlsearch " do not highlight searched for phrases
set nostartofline " leave my cursor where it was
set novisualbell " don't blink
set number " turn on line numbers
set numberwidth=5 " We are good up to 99999 lines
set report=0 " tell us when anything is changed via :...
set ruler " Always show current positions along the bottom
set scrolloff=10 " Keep 10 lines (top/bottom) for scope
set shortmess=aOstT " shortens messages to avoid 'press a key' prompt
set showcmd " show the command being typed
set showmatch " show matching brackets
set sidescrolloff=10 " Keep 5 lines at the size
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
" }}}

" Text Formatting/Layout {{{
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
" }}}

" Folding {{{
set foldenable " Turn on folding
set foldmethod=marker " Fold on the indent (damn you python)
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
" }}}

" Plugin Settings {{{
let html_number_lines = 0
let html_use_css = 0
let use_xhtml = 0
let b:match_ignorecase = 1 " case is stupid
let perl_extended_vars=1 " highlight advanced perl vars inside strings
let tlist_aspjscript_settings = 'asp;f:function;c:class'
let tlist_aspvbs_settings = 'asp;f:function;s:sub'
let tlist_php_settings = 'php;c:class;d:constant;f:function'
let tlist_vb_settings = 'asp;f:function;c:class'
let NERDTreeIgnore = ['\.beam', '\.pyc', 'ebin']
let NERDChristmasTree = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 0
let g:rbpt_colorpairs = [
    \ ['red',       'RoyalBlue3'],
    \ ['green',    'SeaGreen3'],
    \ ['blue',   'firebrick3'],
    \ ['yellow',    'DarkOrchid3'],
    \ ['magenta',    'RoyalBlue3'],
    \ ['cyan',     'SeaGreen3'],
    \ ['red',       'RoyalBlue3'],
    \ ['green',    'SeaGreen3'],
    \ ['blue',   'firebrick3'],
    \ ['yellow',    'DarkOrchid3'],
    \ ['magenta',    'RoyalBlue3'],
    \ ['cyan',     'SeaGreen3'],
    \ ['red',       'RoyalBlue3'],
    \ ['green',    'SeaGreen3'],
    \ ['blue',   'firebrick3'],
    \ ['yellow',    'DarkOrchid3'],
    \ ['magenta',    'RoyalBlue3'],
    \ ['cyan',     'SeaGreen3'],
    \ ['red',       'RoyalBlue3'],
    \ ['green',    'SeaGreen3'],
    \ ['blue',   'firebrick3'],
    \ ['yellow',    'DarkOrchid3'],
    \ ['magenta',    'RoyalBlue3'],
    \ ['cyan',     'SeaGreen3'],
    \ ]
let g:rbpt_max = 24
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 30
let g:ctrlp_max_files = 100000
let g:ctrlp_max_depth = 100
let g:ctrlp_follow_symlinks = 0

if s:running_windows
    let g:ctrlp_cache_dir = $HOME.'/vimfiles/ctrlp_cache'
else
    let g:ctrlp_cache_dir = $HOME.'/.vim/ctrlp_cache'
endif
"}}}

" Mappings {{{
nmap <leader>f :CtrlP<CR>
nmap <leader>ff :CtrlPCurWD<CR>
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>t :CtrlPBufTagAll<CR>
nmap <leader>l :CtrlPLine<CR>
nmap <tab> :CtrlPBufTag<CR>

nmap <leader>nt <ESC>:NERDTreeToggle<RETURN>
nmap <leader>tb <ESC>:TagbarToggle<RETURN>
nmap <leader>a <ESC>:A<RETURN>
nmap <leader>as <ESC>:AV<RETURN>

" *** Disabled because co-workers keep breaking my vim! ***
" map <left> <ESC>:NERDTree<RETURN>
" map <right> <ESC>:TagbarToggle<RETURN>
" map <up> <ESC>:bp<RETURN>
" map <down> <ESC>:bn<RETURN>
" }}}

" Autocommands {{{
" Things that use two spaces rather than 4
au BufRead,BufNewFile *.rb,*.rhtml,*.mm,*.cpp,*.h,*.hpp set shiftwidth=2
au BufRead,BufNewFile *.rb,*.rhtml,*.mm,*.cpp,*.h,*.hpp set softtabstop=2
" Override typens
au BufNewFile,BufRead *.ahk set filetype=ahk
au BufNewFile,BufRead *.ps1 set filetype=ps1
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.dtl set filetype=htmldjango
" Rainbow Parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" General stuff
au VimEnter * set cc=126
"}}}

if has("gui_running") " {{{
    " Basics
    colorscheme molokai
    set guifont=Source_Code_Pro_Semibold:h9:cANSI " My favorite font
    set guioptions=ce
    "              ||
    "              |+-- use simple dialogs rather than pop-ups
    "              +-- use GUI tabs, not console style tabs
    set mousehide " hide the mouse cursor when typing
    map <F9> <ESC>:set guifont=Source_Code_Pro_Semibold:h9:cANSI<CR>
    map <F10> <ESC>:set guifont=Source_Code_Pro_Semibold:h12:cANSI<CR>
    map <F11> <ESC>:set guifont=Source_Code_Pro_Semibold:h16:cANSI<CR>
    map <F12> <ESC>:set guifont=Source_Code_Pro_Semibold:h20:cANSI<CR>
endif " }}}

if s:colorful_term " {{{
    "256 color --
    let &t_Co=256
    colorscheme molokai
    " restore screen after quitting
    if has("terminfo")
        let &t_Sf="\ESC[3%p1%dm"
        let &t_Sb="\ESC[4%p1%dm"
    else
        let &t_Sf="\ESC[3%dm"
        let &t_Sb="\ESC[4%dm"
    endif
endif " }}}

" Odds n Ends {{{
set ttymouse=xterm2 " makes it work in everything
" }}}
