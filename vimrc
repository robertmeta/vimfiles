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
Helptag " Help for plugins
" }}}

" DRY helpers {{{
let s:running_windows=has("win16") || has("win32") || has("win64")
let s:colorful_term=(&term  =~ "xterm") || (&term  =~ "screen")
" }}}

" Loading Settings {{{
let g:skip_loading_mswin=1 " Just in case :)
filetype plugin indent on " if you are going to steal something from my vimrc, this should be it
syntax on " syntax highlighting on

syntax sync minlines=100 " helps to avoid syntax highlighting bugs
" }}}

" Mappings {{{
let mapleader = "\<space>"

" folding / unfolding outer layer
nnoremap <leader>z :%foldc<cr>
nnoremap <leader>Z :%foldo<cr>
" Scrolling
" Window control
nnoremap <leader>k <C-b>
nnoremap <leader>j <C-f>
nnoremap <leader>o <C-W>o
nnoremap <leader>w <C-W>w
nnoremap <leader>W <C-W>W
nnoremap <leader>w <esc>:SyntasticCheck<cr>
nnoremap <leader>q <esc>:close<cr>
nnoremap <leader>" :split<cr>
nnoremap <leader>% :vsplit<cr>
" Arrow control
nnoremap <left> :NERDTreeToggle<cr>
nnoremap - :NERDTreeFind<cr>
nnoremap <right> :TagbarToggle<cr>
nnoremap <up> <C-f>
nnoremap <down> <C-b>
nnoremap <C-down> :cnext<cr>zvzz
nnoremap <C-up> :cprev<cr>zvzz
nnoremap <S-down> :lnext<cr>zvzz
nnoremap <S-up> :lprev<cr>zvzz
" page facing view: side-by-side view of same buffer scrollbound
nnoremap <leader>vs :<C-u>let @z=&so<cr>:set so=0 noscb<cr>:bo vs<cr>Ljzt:setl scb<cr><C-w>p:setl scb<cr>:let &so=@z<cr>
" Make bindings work better with new wrapping
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" CtrlP Mappings
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>p :CtrlPMixed<cr>
nnoremap <leader>t :CtrlPTag<cr>
nnoremap <leader>T :CtrlPBufTag<cr>
" Indent / Outdent
vnoremap < <gv
vnoremap > >gv
" Vimux
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vx :VimuxInterruptRunner<CR>
map <Leader>r :VimuxRunLastCommand<CR>
" EasyMotion
" nmap <Leader>f <Plug>(easymotion-overwin-f)
" nmap <Leader>s <Plug>(easymotion-overwin-f2)
" nmap <Leader>l <Plug>(easymotion-overwin-line)
" nmap <Leader>w <Plug>(easymotion-overwin-w)
" }}}

" Basics Settings {{{
set backspace=indent,eol,start " make backspace a more flexible
set breakindent " this is just awesome (best patch in a long time)
set cmdheight=2 " Gets rid of all the press enter to continue
set completeopt=longest,menuone " complete menu
set complete=.,w,b,u,t " complete options
set cursorline " cursor line
set diffopt=filler,iwhite " filler and whitespace
set expandtab " no real tabs please!
set exrc " source .vimrc _vimrc .exrc _exrc files in local tree (deepest found rules all)
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
set hlsearch " do highlight searched for phrases
set ignorecase " case insensitive by default
set incsearch " BUT do highlight as you type you search phrase
set infercase " case inferred by default
set laststatus=2 " always show the status line
set lazyredraw " do not redraw while running macros
set linebreak " break on words not mid-word
set linespace=0 " don't insert any extra pixel lines betweens rows
set modeline " I have started using modelines (risky business!)
set modelines=5 " Search for 5 lines for modelines
set noautoread " nope
set noautowriteall " nope
set noautowrite " nope
set nocursorcolumn " disable global cursor column
set noerrorbells " don't be noisy
set noexrc " don't use local version of .(g)vimrc, .exrc
set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)
set nolist " going to try seeing the broken again
set nomore " Scroll away, no pausing
set nonumber " no line numbers
set norelativenumber " no thank you
set nospell " nope nope nope
set nostartofline " leave my cursor where it was
set notimeout " better timeout handling
set novisualbell " don't be noisy
set numberwidth=5 " We are good up to 99999 lines
set omnifunc=syntaxcomplete#Complete
set report=0 " tell us when anything is changed via :
set ruler " Always show current positions along the bottom
set scrolljump=5 " If you hit bottom or top, jump 5
set scrolloff=5 " Keep focus on middle of screen when possible
set secure " but lets not go crazy
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
set shiftwidth=4 " auto-indent amount when using cindent, >>, << and stuff like that
set showbreak=+++\  " this is how we show breaks (this comment is broken in vim, dafaq)
set showcmd " Show the commands
set showmatch " do show matching things
set showmode " default but just in case
set sidescroll=5 " If you hit edge, jump 5
set sidescrolloff=5 " Keep 5 lines at the size
set smartcase " Smart case enabled
set softtabstop=4 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
set splitbelow " new splits are down
set splitright " new vsplits are to the right
set switchbuf=useopen " when working with quickfix use new splits
set synmaxcol=500 " Don't try to highlight lines longer than X characters.
set tabstop=8 " real tabs should be 8, and they will show with set list on
set textwidth=0 " No autowrapping
set notitle " don't mess with the title on exit
set ttimeoutlen=10 " 10ms timeout
set ttimeout " time out on key codes
set ttyfast " Assume a fast terminal
set t_vb= " seriously, shhhh, don't be noisy
set viminfo+=! " Store upper-case registers in viminfo
set virtualedit=block " block mode, yey (onemore is evil)
set wrap " Going to try to love it, again
" }}}

" Clipboard, Backup and Undo {{{
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

" Various formatting / output options {{{
set formatoptions=qrn1j " used to be just rq
"                 |||||
"                 ||||+-- remove comment when joining lines
"                 |||+-- don't break after one letter word
"                 ||+-- format numbered lists using "formatlistpat"
"                 |+-- enter extends comments
"                 +-- allow gq to work on comment
"
set shortmess=aOstTI " shortens messages to avoid 'press a key' prompt
"             ||||||
"             |||||+-- no intro message
"             ||||+-- truncate messages in the middle
"             |||+-- truncate file message
"             ||+-- not "Search hit bottom" crap
"             |+-- file read message overwrites subsequent
"             +-- use every short text trick
"
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
"
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
"
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

" Autocommands {{{
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
        au BufRead,BufNewFile *.go setlocal noexpandtab ts=8 sw=8 sts=8 syntax=go ft=go foldmethod=indent foldmarker={,} " so does make
        au BufRead,BufNewFile MakeFile,Makefile,makefile setlocal noexpandtab sw=8 sts=8 syntax=make " so does make
        " Some JS awesome via romainl
        au BufRead,BufNewFile *.js nnoremap <C-]> :tjump /<c-r>=expand('<cword>')<CR><CR>
        au BufRead,BufNewFile *.js nnoremap <C-}> :ptjump /<c-r>=expand('<cword>')<CR><CR>
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
        au FileType go nmap gr <Plug>(go-rename)
        au FileType go nmap gi <Plug>(go-info)
        " au FileType go nmap gD <Plug>(go-doc)
        au FileType go nmap gt <Plug>(go-test-func)
        au FileType go nmap gT <Plug>(go-test)
        " Highlight current line
        au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
        au WinLeave * setlocal nocursorline
    augroup END
endif
" }}}

" GUI {{{
if has("gui_running")
    set guifont=Hack:h8:cANSI " My favorite font
    set guioptions=ce
    "              ||
    "              |+-- use GUI tabs, not console style tabs
    "              +-- use simple dialogs rather than pop-ups
endif
" }}}

" 256 color term tweaks {{{
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
" }}}

" Mousing {{{
if has("mouse")
    set mouse=a " use mouse everywhere
    set nomousehide " don't hide the mouse
    if !has('nvim')
          set ttymouse=xterm2
    endif
endif
" }}}

" Ag Grep {{{
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
endif
" }}}

" CtrlP {{{
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
else " MacOSX/Linux
    let g:ctrlp_cache_dir=$HOME.'/.vim/ctrlp_cache'
    let g:ctrlp_user_command='find %s -type f \( -iname "*" ! -iname "*.a" ! -iname "*.o" ! -iwholename "*.hg*"  ! -iwholename "*.git*" \)'
endif
" }}}

" Fugitive {{{
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gwrite<cr>:Gcommit<cr>
" }}}

" HTML Settings {{{
let html_number_lines=0
let html_use_css=0
let use_xhtml=0
" }}}

" Javascript {{{
let g:angular_filename_convention='camelcased'
" }}}

" Markdown {{{
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1
" }}}

" Netrw {{{
let g:netrw_altfile=1
" }}}

" Perl Settings {{{
let perl_extended_vars=1 " highlight advanced perl vars inside strings
" }}}

" Racer {{{
let g:racer_cmd=$HOME.'/projects/racer/target/release/racer'
let $RUST_SRC_PATH=$HOME.'/projects/rust/src'
" }}}

" {{{ Rainbow Plugin
let g:rainbow#max_level = 24
let g:rainbow#pairs = [['(', ')'], ['{', '}'], ['[', ']']]
" }}}

" {{{ Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_go_checkers = ['go', 'gometalinter']
let g:syntastic_mode_map = { 'mode': 'passive' }

let g:syntastic_enable_signs = 0
" }}}

" Tagbar {{{
let g:tagbar_show_linenumbers = -1
let g:tagbar_left = 1
" }}}

" Git Gutter {{{
let g:gitgutter_sign_column_always = 1
" }}}

" Signature {{{
let g:SignatureMarkTextHLDynamic = 1 " works with gitgutter
" }}}

" NERDTree {{{
let NERDChristmasTree=1
let NERDTreeCascadeOpenSingleChildDir=1
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeQuitOnOpen=1
let NERDTreeShowLineNumbers=0
let NERDTreeWinSize=50
let NERDTreeAutoDeleteBuffer=1
" " }}}

" Vim Go (vim-go) {{{
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
" }}}

" z Finally -- Theme setup {{{
let g:lucius_contrast='normal'
let g:lucius_contrast_bg='normal'
let g:lucius_style='dark'
let g:alduin_Shout_Windhelm = 1
set background=dark
colo nofrils-dark
" }}}

" Modeline {{{
" vim: set foldlevel=1:
" }}}
