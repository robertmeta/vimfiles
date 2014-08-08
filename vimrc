"   This is my personal .vimrc, I don't recommend you copy it, just
"   use the pieces you want (and understand!).  When you copy a
"   .vimrc in its entirety, weird and unexpected things can happen
"
"   If you find an obvious mistake hit me up at:
"   http://robertmelton.com (many forms of communication)


" Baseline {{{
scriptencoding utf-8 " yey! utf-8
execute pathogen#infect() 
Helptag " Help for plugins
" }}}

" DRY helpers {{{
let s:running_windows = has("win16") || has("win32") || has("win64")
let s:colorful_term = (&term =~ "xterm") || (&term =~ "screen")
" }}}

" General mappings {{{
nmap <space> <leader>
map Y y$

" quickfix next/prev with centering
nmap <down> :cnext<cr>zvzz
nmap <up> :cprev<cr>zvzz

" folding / unfolding outer layer
nmap <leader>z :%foldc<CR> 
nmap <leader>Z :%foldo<CR>

" Window control
nmap <leader>c <C-W>c 
nmap <leader>< <C-w>15<
nmap <leader>> <C-w>15>
nmap <leader>_ <C-w>15-
nmap <leader>- <C-w>15-
nmap <leader>+ <C-w>15+
nmap <leader>h :split<CR>
nmap <leader>o <C-W>o
nmap <leader>v :vsplit<CR>
nmap <leader>w <C-W>w

" Buffer control
nmap <leader>Q <ESC>:q<CR>
nmap <leader>W <ESC>:w<CR>

" Addon control
nmap <left> :NERDTreeToggle<cr>
nmap <right> :TagbarToggle<cr>

" keep centered when jumping serach results
nmap n nzzzv
nmap N Nzzzv
" }}}

" Loading Settings {{{
filetype plugin indent on " if you are going to steal something from my vimrc, this should be it
let loaded_matchparen = 1 " we don't want to use matching paren plugin, we got RainbowParen
" }}}

" Basics Settings {{{
set backspace=indent,eol,start " make backspace a more flexible
set backup " make backup files
set completeopt=longest,menuone,preview " complete menu
set completeopt=menuone " don't use a pop up menu for completions
set complete=.,w,b,u,t " complete options
set cryptmethod=blowfish " use the good stuff!
set diffopt=filler,iwhite " filler and whitespace
set expandtab " no real tabs please!
set fenc=utf-8 " UTF-8
set fileformats=unix,dos,mac " support all three, in this order
set foldenable " Turn on folding
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldmarker={{{,}}} " use simple markers
set foldmethod=marker " Fold on the marker
set foldnestmax=1 " I only like to fold outer functions
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
set formatlistpat=^\\s*\\(\\d\\\|[-*]\\)\\+[\\]:.)}\\t\ ]\\s* " and bullets, too
set formatoptions=qrn1j " used to be just rq
set hidden " load files in background
set history=9999 " big old history
set ignorecase " case insensitive by default
set incsearch " BUT do highlight as you type you search phrase
set infercase " case inferred by default
set laststatus=2 " always show the status line
set lazyredraw " do not redraw while running macros
set linespace=0 " don't insert any extra pixel lines betweens rows
set noautowriteall " do Write on all changes (too buggy to use)
set noautowrite " don't write on all changes (too buggy to use)
set nocompatible " explicitly get out of vi-compatible mode
set noerrorbells " don't be noisy
set noexrc " don't use local version of .(g)vimrc, .exrc
set nohlsearch " don't  highlight searched for phrases
set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)
set nolist " too much broken, I don't want to see it
set nomodeline " no need to ever use a modeline, I am in control of settings
set nomore " Short nomore
set noshowmatch " don't show matching things (RainbowParentheses is better)
set nostartofline " leave my cursor where it was
set notimeout " better timeout handling 
set novisualbell " don't be noisy
set number " turn on line numbers
set numberwidth=5 " We are good up to 99999 lines
set report=0 " tell us when anything is changed via :
set ruler " Always show current positions along the bottom
set scrolljump=5 " If you hit bottom or top, jump 5
set scrolloff=5 " Keep 5 lines (top/bottom) for scope
set secure " but lets not go crazy
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
set shiftwidth=4 " auto-indent amount when using cindent, >>, << and stuff like that
set shortmess=aOstTI " shortens messages to avoid 'press a key' prompt
set showcmd " Show the commands
set showmode " default but just in case
set sidescroll=5 " If you hit edge, jump 5
set sidescrolloff=5 " Keep 5 lines at the size
set smartcase " if there are caps, go case-sensitive
set softtabstop=4 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
set splitbelow " new splits are down
set splitright " new vsplits are to the right
set switchbuf=split " when working with quickfix use new splits
set synmaxcol=800 " Don't try to highlight lines longer than 800 characters.
set tabstop=8 " real tabs should be 8, and they will show with set list on
set textwidth=0 " No autowrapping
set title " mess witht he title
set ttimeoutlen=10 " 10ms timeout 
set ttimeout " time out on key codes
set ttyfast " Assume a fast terminal
set ttyscroll=5 " See if this helps scroll speed
set t_vb= " seriously, shhhh, don't be noisy
set undofile " persistent undo (between saves)
set undolevels=1000 " persistent undo
set undoreload=10000 " to undo forced reload with :e!
set viminfo+=! " Store upper-case registers in viminfo
set wrap " wrap lines
if s:running_windows
    set clipboard=unnamed "sync with OS clipboard
    set backupdir=~/vimfiles/backup// " where to put backup files
    set undodir=~/vimfiles/undo// " where to put undo files
    set directory=~/vimfiles/temp// " directory to place swap files in
else
    set backupdir=~/.vim/backup// " where to put backup files
    set undodir=~/.vim/undo// " where to put undo files
    set directory=~/.vim/temp// " directory to place swap files in
endif
syntax on " syntax highlighting on
syntax sync minlines=300 " helps to avoid syntax highlighting bugs
" }}}

" Wildmenu {{{
set wildmenu " turn on command line completion wild style
set wildignore=*.swp,*.bak " ignore these
if s:running_windows
    set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*,*\\bin\\*,*\\pkg\\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/bin/*,*/pkg/*
endif
set wildignore+=*.pdf,*.zip,*.so " binaries
set wildignore+=*.aux,*.out,*.toc " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " binary images
set wildignore+=*.a,*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl " compiled spelling word lists
set wildignore+=*.sw? " Vim swap files
set wildignore+=*.DS_Store " OSX bullshit
set wildignore+=*.luac " Lua byte code
set wildignore+=migrations " Django migrations
set wildignore+=*.pyc,*.pyo " Python byte code
set wildignore+=*.orig " Merge resolution file
set wildmode=list:longest " turn on wild mode huge list
" }}}

" Status Line {{{
set statusline=%F%m%r%h%w[%L]%{fugitive#statusline()}[%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |  |                        |      |  |     |    |
"              | | | | |  |  |                        |      |  |     |    +-- current column
"              | | | | |  |  |                        |      |  |     +-- current line
"              | | | | |  |  |                        |      |  +-- current % into file
"              | | | | |  |  |                        |      +-- current syntax in square brackets
"              | | | | |  |  |                        +-- current fileformat
"              | | | | |  |  +-- add fugitive info
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer
" }}}

" cpoptions {{{
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
" }}}

" whichwrap {{{
set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
" | | | | | | | | |
" | | | | | | | | +-- "]" Insert and Replace
" | | | | | | | +-- "[" Insert and Replace
" | | | | | | +-- "~" Normal
" | | | | | +-- <Right> Normal and Visual
" | | | | +-- <Left> Normal and Visual
" | | | +-- "l" Normal and Visual (not recommended)
" | | +-- "h" Normal and Visual (not recommended)
" | +-- <Space> Normal and Visual
" +-- <BS> Normal and Visual
" }}}

" General Autocommands {{{
if has("autocmd")
    augroup general
        " Clear!
        au!
        " Resize windows automagically
        au VimResized * :wincmd =

        " For secure reading/writing
        au BufReadPost * if &key != "" | setlocal noswapfile nowritebackup viminfo= nobackup noshelltemp history=0 secure | endif

        " Things that use two spaces rather than four
        au BufRead,BufNewFile *.rb,*.rhtml setlocal sw=2 sts=2 " ruby likes two
        au BufRead,BufNewFile *.yaml setlocal sw=2 sts=2 " ruby likes two

        " Go setlocalup assumptions: gocode, godef, gotags all in path
        au BufRead,BufNewFile *.go setlocal noexpandtab sw=8 sts=8 syntax=go ft=go foldmarker={,} " use simple markers
        au BufRead,BufNewFile MakeFile,Makefile,makefile setlocal noexpandtab sw=8 sts=8 syntax=make listchars=tab:\|\ ,trail:- " so does make

        " Override types
        au BufNewFile,BufRead *.ahk setlocal filetype=ahk " Autohotkey
        au BufNewFile,BufRead *.ps1 setlocal filetype=ps1 " Powershell
        au BufNewFile,BufRead *.md setlocal filetype=markdown spell " Markdown and spelling on
        au BufNewFile,BufRead *.dtl setlocal filetype=htmldjango " Django Templates

        " Rainbow Parens
        au VimEnter * RainbowParenthesesActivate
        au Syntax * RainbowParenthesesLoadRound
        au Syntax * RainbowParenthesesLoadSquare
        au Syntax * RainbowParenthesesLoadBraces

        " Things I like spellcheck in
        au FileType gitcommit setlocal spell
        au FileType svn       setlocal spell
        au FileType asciidoc  setlocal spell
    augroup END
endif
" }}}

" GUI {{{
if has("gui_running")
    set guifont=Consolas:h9:cANSI " My favorite font
    set guioptions=ce
    "              ||
    "              |+-- use simple dialogs rather than pop-ups
    "              +-- use GUI tabs, not console style tabs

    " Different cursors for different modes.
    set guicursor=n-c:block-Cursor-blinkon0
    set guicursor+=v:block-vCursor-blinkon0
    set guicursor+=i-ci:ver20-iCursor
endif 
" }}}

" 256 color term tweaks {{{
if s:colorful_term
    "256 color --
    let &t_Co=256

    " restore screen after quitting
    if has("terminfo")
        let &t_Sf="\ESC[3%p1%dm"
        let &t_Sb="\ESC[4%p1%dm"
    else
        let &t_Sf="\ESC[3%dm"
        let &t_Sb="\ESC[4%dm"
    endif

    " don't clear background color
    set t_ut=
endif 
" }}}

" ConEMU Settings (awesome!) {{{
if s:running_windows && has("gui_running") == 0
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
endif
" }}}

" Mousing {{{
if has("mouse")
    set mouse=a " use mouse everywhere
    set ttymouse=xterm2 " makes it work in everything
endif 
" }}}

" CtrlP {{{
if s:running_windows
        let g:ctrlp_cache_dir = $HOME.'/vimfiles/ctrlp_cache'
    else
        let g:ctrlp_cache_dir = $HOME.'/.vim/ctrlp_cache'
endif
let g:skip_loading_mswin=1 " Just in case :)
let g:ctrlp_buftag_types = {'go': '--language-force=go --golang-types=ftv'}
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_max_depth = 100
let g:ctrlp_max_files = 100000
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 1
let g:ctrlp_show_hidden = 1
let g:ctrlp_open_multiple_files = 'ij'
let g:ctrlp_buftag_ctags_bin = 'ctags'
if s:running_windows
    let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d | findstr /v \.git | findstr /v \.hg' " Windows
else
    let g:ctrlp_user_command = 'find %s -type f \( -iname "*" ! -iname "*.a" ! -iname "*.o" ! -iwholename "*.hg*"  ! -iwholename "*.git*" \)'       " MacOSX/Linux
endif
let g:ctrlp_show_hidden = 1
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>t :CtrlPBufTag<CR>
nmap <leader>T :CtrlPBufTagAll<CR>
nmap <leader>p :CtrlPCurWD<CR>
nmap <leader>m :CtrlPMRU<CR>
" }}}

" vim-go {{{
let g:godef_split = 0
let g:godef_same_file_in_same_window = 1
let g:go_auto_type_info = 0
if has("autocmd")
    augroup vimgo
        " Clear!
        au!

        " Go setlocalup assumptions: gocode, godef, gotags all in path
        au FileType go nmap gd <Plug>(go-def)
        au FileType go nmap <Leader>i <Plug>(go-info)
    augroup END
endif
" }}}

" Supertab {{{
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestHighlight = 1
let g:SuperTabCrMapping = 1
" }}}

" RainbowParentheses {{{
let g:rbpt_colorpairs = [
    \ ['blue', 'RoyalBlue3'],
    \ ['darkred', 'firebrick3'],
    \ ['darkgreen', 'Seagreen3'],
    \ ['brown', 'DarkOrchid3'],
    \ ['darkcyan', 'Seagreen3'],
    \ ['darkmagenta', 'RoyalBlue3'],
    \ ['blue', 'RoyalBlue3'],
    \ ['darkred', 'firebrick3'],
    \ ['darkgreen', 'Seagreen3'],
    \ ['brown', 'DarkOrchid3'],
    \ ['darkcyan', 'Seagreen3'],
    \ ['darkmagenta', 'RoyalBlue3'],
    \ ['blue', 'RoyalBlue3'],
    \ ['darkred', 'firebrick3'],
    \ ['darkgreen', 'Seagreen3'],
    \ ['brown', 'DarkOrchid3'],
    \ ['darkcyan', 'Seagreen3'],
    \ ['darkmagenta', 'RoyalBlue3'],
    \ ['blue', 'RoyalBlue3'],
    \ ['darkred', 'firebrick3'],
    \ ['darkgreen', 'Seagreen3'],
    \ ['brown', 'DarkOrchid3'],
    \ ['darkcyan', 'Seagreen3'],
    \ ['darkmagenta', 'RoyalBlue3'],
\ ]
let g:rbpt_max = 24
" }}}

" HTML Settings {{{
let html_number_lines = 0
let html_use_css = 0
let use_xhtml = 0
" }}}

" Perl Settings {{{
let perl_extended_vars = 1 " highlight advanced perl vars inside strings
" }}}

" NERDTree {{{
let NERDTreeHijackNetrw = 0 " I use vim-vinegar most of the time, don't mess with -
let NERDChristmasTree = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 0
" }}}

" Tagbar {{{
let g:tagbar_left = 1 " Stack on left with NERDTree for terminal mouse limits
" }}}

" Ag grep {{{
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
endif
" }}}

" Dispatch {{{
nmap <leader>d :Dispatch<CR>
" }}}

" Fugitive {{{
nmap <leader>gd :Gdiff<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>gw :Gwrite<cr>
nmap <leader>ga :Gadd<cr>
nmap <leader>gb :Gblame<cr>
nmap <leader>gco :Gcheckout<cr>
nmap <leader>gci :Gcommit<cr>
nmap <leader>gm :Gmove<cr>
nmap <leader>gr :Gremove<cr>
" }}}

" Easy Motion {{{
let g:EasyMotion_do_shade = 1
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'
let g:EasyMotion_inc_highlight = 1
let g:EasyMotion_landing_highlight = 0
let g:EasyMotion_off_screen_search = 0
let g:EasyMotion_use_smartsign_us = 1
nmap <leader>f <Plug>(easymotion-bd-w)
nmap <leader>F <Plug>(easymotion-bd-W)
nmap <leader>s <Plug>(easymotion-s)
nmap <leader>S <Plug>(easymotion-s2)
" }}}

" Theme setup {{{
function SeoulDarkColors()
    set background=dark
    let g:seoul256_background=236
    colo seoul256
    RainbowParenthesesActivate
endfunction

function FruitLightColors()
    set background=light
    colo summerfruit256
    hi SpecialKey cterm=NONE ctermfg=grey
    hi StatusLine ctermbg=152 ctermfg=32
    hi Comment ctermfg=22
    match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
    RainbowParenthesesActivate
endfunction

" Basline Theme (diff from function, because RainbowParenActivate not called)
set background=dark
colo solarized
" }}}
