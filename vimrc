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
" Window control
nnoremap <leader>o <C-w>o
nnoremap <leader>w <C-w>w
nnoremap <leader>W <C-w>W
nnoremap <silent> <leader>c <esc>:close<cr>
nnoremap <silent> <leader>" :split<cr>
nnoremap <silent> <leader>% :vsplit<cr>
" Clear highlight
nnoremap <silent> <backspace> :noh<CR>:QuickhlManualReset<CR>

" Mappings
inoremap <silent> ;f <C-x><C-f>
inoremap <silent> ;i <C-x><C-i>
inoremap <silent> ;l <C-x><C-l>
inoremap <silent> ;n <C-x><C-n>
inoremap <silent> ;o <C-x><C-o>
inoremap <silent> ;p <C-x><C-p>
inoremap <silent> ;t <C-x><C-]>
inoremap <silent> ;u <C-x><C-u>
inoremap <F5> <C-R>=strftime("%c")<CR>

" Extra window movement
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Terminal stuff
if has('nvim')
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-l> <C-\><C-n><C-w>l
    tnoremap <Esc> <C-\><C-n>
    nnoremap <leader>e :terminal<cr>
    nnoremap <leader>E :terminal<space>
endif

" Abbreviations
iab <expr> dts strftime("%c")
iab rrm Robert R. Melton

" Search
nmap <leader>s <Plug>(quickhl-manual-this)
xmap <leader>s <Plug>(quickhl-manual-this)
nnoremap <leader>S :QuickhlManualAdd<space>
let g:quickhl_manual_colors = ['gui=bold ctermfg=16 ctermbg=153 guifg=#ffffff guibg=#0a7383', 'gui=bold ctermfg=7 ctermbg=1 guibg=#a07040 guifg=#ffffff', 'gui=bold ctermfg=7 ctermbg=2 guibg=#4070a0 guifg=#ffffff', 'gui=bold ctermfg=black ctermbg=3 guibg=#40a070 guifg=#ffffff', 'gui=bold ctermfg=7 ctermbg=4 guibg=#70a040 guifg=#ffffff', 'gui=bold ctermfg=7 ctermbg=5 guibg=#0070e0 guifg=#ffffff', 'gui=bold ctermfg=7 ctermbg=6 guibg=#007020 guifg=#ffffff', 'gui=bold ctermfg=7 ctermbg=21 guibg=#d4a00d guifg=#ffffff', 'gui=bold ctermfg=7 ctermbg=22 guibg=#06287e guifg=#ffffff', 'gui=bold ctermfg=black ctermbg=45 guibg=#5b3674 guifg=#ffffff', 'gui=bold ctermfg=7 ctermbg=16 guibg=#4c8f2f guifg=#ffffff', 'gui=bold ctermfg=black ctermbg=50 guibg=#1060a0 guifg=#ffffff', 'gui=bold ctermfg=7 ctermbg=56 guibg=#a0b0c0 guifg=black' ] 

" Arrow control
nmap <silent> <left> <esc>:lprev<cr>
nmap <silent> <right> <esc>:lnext<cr>
nmap <silent> <up> <esc>:cprev<cr>
nmap <silent> <down>  <esc>:cnext<cr>
" Random Mappings
"nmap - :Dirvish<cr>
nnoremap <leader>a :argadd <c-r>=fnameescape(expand('%:p:h'))<cr>/*<C-d>
nnoremap <leader>A :argadd **/*
nnoremap <leader>b :b <C-d>
nnoremap <leader>B :ls<cr>:b<space>
nnoremap <leader>f :find *
nnoremap <leader>F :find <c-r>=fnameescape(expand('%:p:h'))<cr>/*<C-d>
nnoremap <leader>g :grep<space>
nnoremap <leader>G :vimgrep<space>
nnoremap <leader>i :Ilist<space>
nnoremap <leader>j :QuickhlCwordToggle<cr>
"nnoremap <leader>m saved for tmuxify
nnoremap <leader>M :make<cr>
nnoremap <leader>q :b#<cr>
"nnoremap <leader>t :tag<space>
"nnoremap <leader>T :tag<space><C-d>
nnoremap <leader>t :TTags<space>*<space>*<space>.<cr>
nnoremap <leader>T :TTags<cr>
nnoremap <leader>z :call ToggleFolds()<cr>
nnoremap <F5> "=strftime("%c")<CR>P
nnoremap Y y$

" quick command helpers
cnoremap %% <c-r>=fnameescape(expand('%'))<cr>
cnoremap :: <c-r>=fnameescape(expand('%:p:h'))<cr>/
cnoremap <C-r><C-l> <C-r>=getline('.')<cr>

" Use sneak for f & t
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

"Visual mode maps
vnoremap <leader>@ :norm! @<cr>
vnoremap <leader>. :norm! .<cr>

" Basics Settings
set backspace=indent,eol,start " make backspace a more flexible
set breakindent " this is just awesome (best patch in a long time)
set cmdheight=2 " Gets rid of all the press enter to continue
set completeopt=menu,menuone,preview,noinsert
set complete=.,w,b,u,U,i,t " complete options
set diffopt=vertical,filler,iwhite " filler and whitespace
set expandtab " no real tabs please!
set exrc " source .vimrc _vimrc .exrc _exrc files in local tree (deepest found rules all)
set fileencoding=utf-8 " UTF-8
set fileformats=unix,dos,mac " support all three, in this order
set foldcolumn=2 " I can see fold fine thank you
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
set listchars=""
set listchars+=extends:⟩
set listchars+=nbsp:‡
set listchars+=precedes:⟨
set listchars+=tab:\ \ 
set listchars+=trail:•
set list " show listchars
set modeline " I have started using modelines (risky business!)
set modelines=5 " Search for 5 lines for modelines
set noautoread " nope
set noautowriteall " nope
set noautowrite " nope
set nocursorcolumn " no cursor column
set nocursorline " no cursor line
set noerrorbells " don't be noisy
set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)
set nomore " Scroll away, no pausing
set nonumber " no line numbers
set norelativenumber " no thank you
set nospell " nope nope nope
set notimeout " better timeout handling
set novisualbell " don't be noisy
set numberwidth=8 " We are good up to LOTS lines
set omnifunc=syntaxcomplete#Complete
set pastetoggle=<F10> " paste toggle of course
set path=.,** " Default path is local dir, make better with autocommands per language
set report=0 " tell us when anything is changed via :
set ruler " Always show current positions along the bottom
set scrolljump=5 " If you hit bottom or top, jump 5
set scrolloff=5 " Keep focus on middle of screen when possible
set secure " but lets not go crazy
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
set shiftwidth=4 " auto-indent amount when using cindent, >>, << and stuff like that, also does softtabstop when negative
set showbreak=›››\  " this is how we show breaks (this comment is broken in vim, dafaq)
set showcmd " Show the commands
set showmatch " do show matching things
set showmode " default but just in case
set sidescroll=5 " If you hit edge, jump 5
set sidescrolloff=5 " Keep 5 lines at the size
set smartcase " Smart case enabled
set softtabstop=-1 " when hitting tab or backspace, use shiftwidth chars
set splitbelow " split below
set splitright " split right
set startofline " do reset to start of line on events
set switchbuf=useopen " when working with quickfix use new splits
set synmaxcol=500 " Don't try to highlight lines longer than X characters.
set tabstop=8 " real tabs should be 8, and they will show with set list on
set tags=./tags;,tags; " interesting!
set textwidth=0 " No autowrapping
set title " mess with the title
set titlestring= " no title string
set ttimeoutlen=10 " 10ms timeout
set ttimeout " time out on key codes
set ttyfast " Assume a fast terminal
set t_vb= " seriously, shhhh, don't be noisy
set virtualedit=block " block mode, yey (onemore is evil)
set wrap " wrap forever!
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
set wildignore+=**/vendor " Ignore vendor directory
if s:running_windows
    set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*,*\\bin\\*,*\\pkg\\*,*\\vendor\\*,
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/bin/*,*/pkg/*,*/vendor/*
endif
set wildmode=list:longest " turn on wild mode full match only

" Various formatting / output options
set viminfo=!,h,'500,<10000,s1000,/1000,:1000
"           | | |    |      |     |     |
"           | | |    |      |     |     +-- remember last 1000 commands
"           | | |    |      |     +-- remember last 1000 search patterns
"           | | |    |      +- remember up to 1MB in each register
"           | | |    +-- remember up to 10000 lines in each register
"           | | +-- remember marks for last 500 files
"           | +-- disable hlsearch while loading viminfo
"           +-- include uppercase registers

set formatoptions=qrn1j " used to be just rq
"                 |||||
"                 ||||+-- remove comment when joining lines
"                 |||+-- don't break after one letter word
"                 ||+-- format numbered lists using 'formatlistpat'
"                 |+-- enter extends comments
"                 +-- allow gq to work on comment

set shortmess=aOstTIc " shortens messages to avoid 'press a key' prompt
"             |||||||
"             ||||||+ no ins-completion messages
"             |||||+-- no intro message
"             ||||+-- truncate messages in the middle
"             |||+-- truncate file message
"             ||+-- no Search hit bottom crap
"             |+-- file read message overwrites subsequent
"             +-- use every short text trick

set statusline=[%{getcwd()}][%f]%m%r%{fugitive#statusline()}%=%y[%P][%l:%c]%{gutentags#statusline('[Generating\ Tags...]')}
"               |            |  | | |                       | |  |   |  |  |
"               |            |  | | |                       | |  |   |  |  +-- gutentags status
"               |            |  | | |                       | |  |   |  +-- column number
"               |            |  | | |                       | |  |   +-- line number
"               |            |  | | |                       | |  +-- percentage through file
"               |            |  | | |                       | +-- file type
"               |            |  | | |                       +-- right align / left align splitter
"               |            |  | | +-- fugitive status
"               |            |  | +-- readonly status
"               |            |  +-- modified?
"               |            +-- full path to file
"               +-- working directory

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

set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
"             | | | | | | | | |
"             | | | | | | | | +-- Insert and Replace
"             | | | | | | | +-- Insert and Replace
"             | | | | | | +-- Normal
"             | | | | | +-- <Right> Normal and Visual
"             | | | | +-- <Left> Normal and Visual
"             | | | +-- Normal and Visual (not recommended)
"             | | +-- Normal and Visual (not recommended)
"             | +-- <Space> Normal and Visual
"             +-- <bs> Normal and Visual

" Additional text objects
for char in [ '_', '.', ':', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '%', '`' ]
    execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
    execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
    execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
    execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
endfor

" line text-objects
xnoremap il g_o0
omap il :<C-u>normal vil<CR>
xnoremap al $o0
omap al :<C-u>normal val<CR>

" buffer text-object
xnoremap i% GoggV
omap i% :<C-u>normal vi%<CR>

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
        au BufRead,BufNewFile *.go setlocal syntax=go ft=go noexpandtab sw=8 sts=8 omnifunc=go#complete#Complete
        au BufRead,BufNewFile *.go nnoremap <buffer> gd :GoDef<CR>
        au BufRead,BufNewFile *.go nnoremap <buffer> gD :GoDoc<CR>
        au BufRead,BufNewFile *.go nnoremap <buffer> gi :GoInfo<CR>
        au BufRead,BufNewFile *.go nnoremap <buffer> gr :GoRename<CR>
        au BufRead,BufNewFile *.go nnoremap <buffer> gt :GoTest<CR>
        au BufRead,BufNewFile *.go nnoremap <buffer> ga :GoAlternate!<CR>
        au BufRead,BufNewFile MakeFile,Makefile,makefile setlocal noexpandtab sw=8 sts=8 syntax=make
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
    augroup END
endif

" GUI
if has("gui_running")
    set guifont=Go\ Mono:h10:cANSI " My favorite font
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

" Adapt for executables
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
if executable("pt")
    set grepprg=pt\ --nogroup\ --nocolor\ --ignore-case\ --column
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
if executable("ctags-exuberant")
    let g:gutentags_ctags_executable="ctags-exuberant"
endif

" Markdown
let g:vim_markdown_folding_disabled=0
let g:vim_markdown_frontmatter=1

" Vim-go
let g:go_fmt_autosave=1
let g:go_fmt_command="goimports"
let g:go_jump_to_error=0
let g:go_fmt_experimental=1
let g:go_bin_path=$HOME."/go/bin"
let g:go_highlight_operators=1
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_types=1
let g:go_highlight_fields=1
let g:go_highlight_build_constraints=1
let g:go_highlight_generate_tags=1
let g:go_highlight_string_spellcheck=0

" Tmuxify
let g:tmuxify_custom_command='tmux split-window -d -l 10'

" Netrw
let g:netrw_altfile=1

" Sneak
let g:sneak#label=1

" Mucomplete
let g:mucomplete#enable_auto_at_startup=0

" Nofrils
let g:nofrils_strbackgrounds=0 " to turn off highlighted string backgrounds
let g:nofrils_heavycomments=0 " bright comments off
let g:nofrils_heavylinenumbers=0 " heavy line numbers off
colo nofrils-acme

" FZF
" selectly override some defaults
if executable("fzf")
    nnoremap <leader>B :Buffers<cr>
    nnoremap <leader>c :Commits<cr>
    nnoremap <leader>C :BCommits<cr>
    nnoremap <leader>f :Files<cr>
    nnoremap <leader>F :GFiles<cr>
    if executable("ag")
        nnoremap <leader>g :Ag<space>
    endif
    nnoremap <leader>h :History/<cr>
    nnoremap <leader>H :History:<cr>
    nnoremap <leader>t :Tags<cr>
    nnoremap <leader>T :BTags<cr>
endif

" Functions
function! ToggleFolds()
    if !exists("b:myfolded")
        let b:myfolded=0
    endif

    if b:myfolded ># 0
        execute("%foldo")
        let b:myfolded=0
    else
        execute("%foldc")
        let b:myfolded=1
    endif
endfunction

function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction

function! <SID>AutoMkdir() abort
    let l:dir=expand('<afile>:p:h')
    let l:file=expand('<afile>:t')
    if !isdirectory(l:dir)
        call mkdir(l:dir, 'p')
        silent execute 'bw ' . l:dir . '/' . l:file
        silent execute 'e ' . l:dir . '/' . l:file
    endif
endfunction

augroup AutoMkdir
    autocmd!
    autocmd BufWritePre,FileWritePre,BufNewFile * call <SID>AutoMkdir()
augroup END
