" Informational {{{
"   This is my personal .vimrc, I don't recommend you copy it, just
"   use the pieces you want (and understand!).  When you copy a
"   .vimrc in its entirety, weird and unexpected things can happen
"
"   If you find an obvious mistake hit me up at:
"   http://robertmelton.com (many forms of communication)
"
"   source: https://github.com/robertmeta/vimfiles
" }}}

" Baseline {{{
set encoding=utf-8 " yey! utf-8
scriptencoding utf-8 " yey! utf-8
" adds stuff under bundles to the path
execute pathogen#infect() 
set rtp+=~/.fzf " fzf is awesome
Helptag " Help for plugins
" }}}

" DRY helpers {{{
let s:running_windows=has("win16") || has("win32") || has("win64")
let s:colorful_term=(&term  =~ "xterm") || (&term  =~ "screen")
" }}}
"
" Loading Settings {{{
let g:skip_loading_mswin=1 " Just in case :)
filetype plugin indent on " if you are going to steal something from my vimrc, this should be it
let loaded_matchparen=1 " we don't want to use matching paren plugin, we got RainbowParen
syntax on " syntax highlighting on
syntax sync minlines=200 " helps to avoid syntax highlighting bugs
" }}}

" General mappings {{{
nmap <space> <leader>
" quickfix/list next/prev with centering
nnoremap <C-down> :cnext<cr>zvzz
nnoremap <C-up> :cprev<cr>zvzz
nnoremap <S-down> :lnext<cr>zvzz
nnoremap <S-up> :lprev<cr>zvzz
nnoremap <down> <C-f>
nnoremap <up> <C-b>
" folding / unfolding outer layer
nnoremap <leader>z :%foldc<cr> 
nnoremap <leader>Z :%foldo<cr>
" Scrolling
" Window control
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
nnoremap <leader>o <C-W>o
nnoremap <leader>" :split<cr>
nnoremap <leader>% :vsplit<cr>
nnoremap <leader>w <C-W>w 
nnoremap <leader>x <esc>:close<cr>
" Addon control
nnoremap <left> :NERDTreeToggle<cr>
nnoremap <right> :TagbarToggle<cr>
" keep centered when jumping serach results
nnoremap n nzzzv
nnoremap N Nzzzv
" page facing view: side-by-side view of same buffer scrollbound
nnoremap <leader>vs :<C-u>let @z=&so<cr>:set so=0 noscb<cr>:bo vs<cr>Ljzt:setl scb<cr><C-w>p:setl scb<cr>:let &so=@z<cr>
" }}}

" Basics Settings {{{
set backspace=indent,eol,start " make backspace a more flexible
set breakindent " this is just awesome (best patch in a long time)
set completeopt=longest,menuone,preview " complete menu
set completeopt=menuone " don't use a pop up menu for completions
set complete=.,w,b,u,t " complete options
set diffopt=filler,iwhite " filler and whitespace
set expandtab " no real tabs please!
set fileencoding=utf-8 " UTF-8
set fileformats=unix,dos,mac " support all three, in this order
set foldenable " Turn on folding
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldmarker={{{,}}} " use simple markers
set foldmethod=marker " Fold on the marker
set foldnestmax=1 " I only like to fold outer functions
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
set formatlistpat=^\\s*\\(\\d\\\|[-*]\\)\\+[\\]:.)}\\t\ ]\\s* " and bullets, too
set hidden " load files in background
set history=9999 " big old history
set ignorecase " case insensitive by default
set incsearch " BUT do highlight as you type you search phrase
set infercase " case inferred by default
set laststatus=2 " always show the status line
set lazyredraw " do not redraw while running macros
set linespace=0 " don't insert any extra pixel lines betweens rows
set modeline " I have started using modelines (risky business!)
set modelines=5 " Search for 5 lines for modelines
set noautoread " do NOT read on all changes
set noautowriteall " do NOT write on all changes
set noautowrite " do NOT write on all changes
set nocursorcolumn " disable global cursor column 
set nocursorline " no global cursor line 
set noerrorbells " don't be noisy
set noexrc " don't use local version of .(g)vimrc, .exrc
set nohlsearch " don't  highlight searched for phrases
set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)
set nolist " too much broken, I don't want to see it
set nomore " Scroll away, no pausing
set norelativenumber " no relative numbers (I tried to love them)
set noshowmatch " don't show matching things (RainbowParentheses is better)
set nospell " too many broken syntax files to have spellcheck on everywhere
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
set showbreak=+++\  " this is how we show breaks (this comment is broken in vim, dafaq)
set showcmd " Show the commands
set showmode " default but just in case
set sidescroll=5 " If you hit edge, jump 5
set sidescrolloff=5 " Keep 5 lines at the size
set smartcase " Smart case enabled
set softtabstop=4 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
set splitbelow " new splits are down
set splitright " new vsplits are to the right
set switchbuf=useopen " when working with quickfix use new splits
set synmaxcol=5000 " Don't try to highlight lines longer than X characters.
set tabstop=8 " real tabs should be 8, and they will show with set list on
set textwidth=0 " No autowrapping
set title " mess witht he title
set ttimeoutlen=10 " 10ms timeout 
set ttimeout " time out on key codes
set ttyfast " Assume a fast terminal
set ttyscroll=5 " See if this helps scroll speed
set t_vb= " seriously, shhhh, don't be noisy
set viminfo+=! " Store upper-case registers in viminfo
set virtualedit=block,onemore " one more virtual char at line ends, plus block mode of course
set wrap " Going to try to love it, again
" }}}

" Clipboard, Backup and Undo {{{
set backup " make backup files
if s:running_windows
    set backupdir=~/vimfiles/backup/ " where to put backup files
    set clipboard=unnamed "sync with OS clipboard
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
" }}}

" Wildmenu {{{
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
" }}}

" {{{
set formatoptions=qrn1j " used to be just rq
"                 |||||
"                 ||||+-- remove comment when joining lines
"                 |||+-- don't break after one letter word
"                 ||+-- format numbered lists using "formatlistpat"
"                 |+-- enter extends comments
"                 +-- allow gq to work on comment
" }}}

" {{{
set shortmess=aOstTI " shortens messages to avoid 'press a key' prompt
"             ||||||
"             |||||+-- no intro message
"             ||||+-- truncate messages in the middle
"             |||+-- truncate file message
"             ||+-- not "Search hit bottom" crap
"             |+-- file read message overwrites subsequent
"             +-- use every short text trick
" }}}

" Status Line {{{
set statusline=%F%m%r%h%w[%L]%{fugitive#statusline()}%{gutentags#statusline()}[%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |  |                       |                         |      |  |     |    |
"              | | | | |  |  |                       |                         |      |  |     |    +-- current column
"              | | | | |  |  |                       |                         |      |  |     +-- current line
"              | | | | |  |  |                       |                         |      |  +-- current % into file
"              | | | | |  |  |                       |                         |      +-- current syntax in square brackets
"              | | | | |  |  |                       |                         +-- current fileformat
"              | | | | |  |  |                       +-- Display the gutentags current status
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
"             |||||+-- :write command updates current file name automatically add <cr> to the last line when using :@r
"             |||+-- Searching continues at the end of the match at the cursor position
"             ||+-- A backslash has no special meaning in mappings
"             |+-- :write updates alternative file name
"             +-- :read updates alternative file name
" }}}

" whichwrap {{{
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
" }}}

" General Autocommands {{{
if has("autocmd")
    augroup general
        " Clear!
        au!
        " Resize windows automagically
        au VimResized * :wincmd =
        " For secure reading/writing
        " au BufReadPost * if &key != "" | setlocal noswapfile nowritebackup viminfo= nobackup noshelltemp history=0 secure | endif " never used anyway, not nvim compatible
        " Things that use two spaces rather than four
        au BufRead,BufNewFile *.rb,*.rhtml setlocal sw=2 sts=2 " ruby likes two
        au BufRead,BufNewFile *.yaml setlocal sw=2 sts=2 " ruby likes two
        " Go setlocalup assumptions: gocode, godef, gotags all in path
        au BufRead,BufNewFile *.go setlocal noexpandtab ts=8 sw=8 sts=8 syntax=go ft=go foldmethod=indent foldmarker={,}
        au BufRead,BufNewFile MakeFile,Makefile,makefile setlocal noexpandtab sw=8 sts=8 syntax=make listchars=tab:\|\ ,trail:- " so does make
        " Override types
        au BufNewFile,BufRead *.ahk setlocal filetype=ahk " Autohotkey
        au BufNewFile,BufRead *.dtl setlocal filetype=htmldjango " Django Templates
        au BufNewFile,BufRead *.md setlocal filetype=markdown " Markdown (common markdown?)
        au BufNewFile,BufRead *.ps1 setlocal filetype=ps1 " Powershell
        " Rainbow Parens
        au Syntax * RainbowParenthesesLoadBraces
        au Syntax * RainbowParenthesesLoadRound
        au Syntax * RainbowParenthesesLoadSquare
        au VimEnter * RainbowParenthesesActivate
         " Things I like spellcheck in
        au FileType asciidoc setlocal spell
        au FileType gitcommit setlocal spell
        au FileType markdown setlocal spell
        au FileType svn setlocal spell
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
endif 
" }}}

" 256 color term tweaks {{{
if s:colorful_term
    "256 color --
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
    set nomousehide " don't hide the mouse
    set ttymouse=xterm2 " makes it work in everything
endif 
" }}}

" CtrlP {{{
" Settings
let g:ctrlp_buftag_ctags_bin='ctags'
let g:ctrlp_buftag_types={'go': '--language-force=go --golang-types=ftv', 'javascript': '--langauge-force=js'}
let g:ctrlp_follow_symlinks=1
let g:ctrlp_match_window_bottom=1
let g:ctrlp_match_window_reversed=1
let g:ctrlp_max_depth=1000
let g:ctrlp_max_files=100000
let g:ctrlp_max_height=30
let g:ctrlp_open_multiple_files='ij'
let g:ctrlp_show_hidden=1
let g:ctrlp_use_caching=1
let g:ctrlp_working_path_mode='ra'
if s:running_windows
    let g:ctrlp_cache_dir=$HOME.'/vimfiles/ctrlp_cache'
    let g:ctrlp_user_command='dir %s /-n /b /s /a-d | findstr /v \.git | findstr /v \.hg' " Windows
else
    let g:ctrlp_cache_dir=$HOME.'/.vim/ctrlp_cache'
    let g:ctrlp_user_command='find %s -type f \( -iname "*" ! -iname "*.a" ! -iname "*.o" ! -iwholename "*.hg*"  ! -iwholename "*.git*" \)'       " MacOSX/Linux
endif
" Mappings
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>p :CtrlPMixed<cr>
nnoremap <leader>T :CtrlPBufTagAll<cr>
nnoremap <leader>t :CtrlPBufTag<cr>
" }}}

" vim-go {{{
" Settings
let g:go_auto_type_info=0
let g:godef_same_file_in_same_window=1
let g:godef_split=0
let g:go_fmt_autosave=1
let g:go_fmt_command="goimports"
let g:go_fmt_fail_silently=0 " don't duplicate syntastic
let g:go_highlight_array_whitespace_error=1
let g:go_highlight_chan_whitespace_error=1
let g:go_highlight_extra_types=1
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_operators=1
let g:go_highlight_space_tab_error=1
let g:go_highlight_structs=1
let g:go_highlight_trailing_whitespace_error=1
" Not sure why this doesn't work by default on windows
let g:go_bin_path=$HOME."/go/bin"
" Autocommands
if has("autocmd")
    augroup vimgo
        " Clear!
        au!
        " Go setlocalup assumptions: gocode, godef, gotags all in path
        au FileType go nnoremap gd <Plug>(go-def)
        au FileType go nnoremap gr <Plug>(go-rename)
        au FileType go nnoremap gi <Plug>(go-info)
    augroup END
endif
" }}}

" Supertab {{{
let g:SuperTabCrMapping=1
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabLongestHighlight=1
" }}}

" Syntastic {{{
let g:syntastic_mode_map = { "mode": "active", "active_filetypes": [], "passive_filetypes": ["go"] }
" }}}

" RainbowParentheses {{{
let g:rbpt_colorpairs=[
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
let g:rbpt_max=24
" }}}

" HTML Settings {{{
let html_number_lines=0
let html_use_css=0
let use_xhtml=0
" }}}

" Perl Settings {{{
let perl_extended_vars=1 " highlight advanced perl vars inside strings
" }}}

" Netrw {{{
let g:netrw_altfile=1
" }}}

" NERDTree {{{
let NERDChristmasTree=1
let NERDTreeDirArrows=1
let NERDTreeHijackNetrw=0 " I use vim-vinegar most of the time, don't mess with -
let NERDTreeMinimalUI=0
" }}}

" Tagbar {{{
let g:tagbar_left=1 " Stack on left with NERDTree for terminal mouse limits
" }}}

" Ag grep {{{
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
endif
" }}}

" {{{ Syntastic 
let g:syntastic_always_populate_loc_list=1
" }}}

" Fugitive {{{
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>go :Gcheckout<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gg :Gwrite<cr>:Gcommit<cr>
" }}}

" Easy Motion {{{
" Settings
let g:EasyMotion_do_mapping=0
let g:EasyMotion_do_shade=1
let g:EasyMotion_inc_highlight=1
let g:EasyMotion_keys='ABCDEFGHIJKLMNOPQRSTUVWXYZ;'
let g:EasyMotion_landing_highlight=0
let g:EasyMotion_off_screen_search=1
let g:EasyMotion_use_smartsign_us=1
let g:EasyMotion_use_upper=1
" Mappings
nmap <leader><space> <Plug>(easymotion-jumptoanywhere)
" Highlight Overrides
hi link EasyMotionTarget2First Identifier
hi link EasyMotionTarget2Second Number
" }}}

" Javascript {{{
let g:angular_filename_convention='camelcased'
" }}}

" Gutentags {{{
let g:gutentags_tagfile='.tags'
set tags+=.tags
" }}}

" Theme setup {{{
let g:seoul256_background=235 " 233-239 (237) Dark -> Light
let g:seoul256_light_background=256 " 252-256 (253) Dark -> Light
let g:bluedrake_256=1
let g:lucius_contrast='normal'
let g:lucius_contrast_bg='normal'
let g:lucius_style='dark'
set background=dark
colo lucius

fun! SeoulDarkColors()
    set background=dark
    colo seoul256
    RainbowParenthesesActivate
endfun

fun! SeoulLightColors()
    set background=light
    colo seoul256-light
    RainbowParenthesesActivate
endfun

fun! KalisiDarkColors()
    set background=dark
    colo kalisi
    RainbowParenthesesActivate
endfun

fun! LuciousLightColors()
    set background=light
    LuciusLightHighContrast
    RainbowParenthesesActivate
endfun

fun! LuciousDarkColors()
    set background=dark
    LuciusDark
    RainbowParenthesesActivate
endfun

fun! KalisiLightColors()
    set background=light
    colo kalisi
    RainbowParenthesesActivate
endfun

fun! Disciple()
    set background=dark
    colo disciple
    RainbowParenthesesActivate
endfun

fun! Apprentice()
    set background=light
    colo apprentice
    RainbowParenthesesActivate
endfun

fun! FruitLightColors()
    set background=light
    colo summerfruit256
    hi SpecialKey cterm=NONE ctermfg=grey
    hi StatusLine ctermbg=152 ctermfg=32
    hi CursorLine cterm=NONE ctermbg=7      
    hi Comment ctermfg=22
    RainbowParenthesesActivate
endfun
" }}}

" Modeline {{{
" vim: set foldlevel=1: 
" }}}
