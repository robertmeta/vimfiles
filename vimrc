" Information {{{
"         This is my personal .vimrc, I don't recommend you copy it, just
"         use the pieces you want (and understand!).        When you copy a
"         .vimrc in its entirety, weird and unexpected things can happen!
"
"         If you find an obvious mistake hit me up at:
"                 https://www.robertmelton.com/contact-me/
"
"         source: https://github.com/robertmeta/vimfiles
" }}}

" Baseline {{{
        set encoding=utf-8
        scriptencoding utf-8
" }}}

" Helpers {{{
        let s:running_windows=has('win16') || has('win32') || has('win64')
        let s:colorful_term=(&term=~?'xterm') || (&term=~?'screen')
" }}}

" Loading Settings {{{
        let g:skip_loading_mswin=1 " Just in case :)
        filetype plugin indent on " if you are going to steal something from my vimrc, this should be it
        syntax enable " syntax highlighting on
" }}}

" Mappings {{{
        let g:mapleader="\<space>"

        " Scrolling/Line movement
        nnoremap gj j
        nnoremap gk k
        nnoremap j gj
        nnoremap k gk

        " Clear highlight
        nnoremap <silent> <backspace> :noh<cr>:QuickhlManualReset<cr>

        " Autocomplete
        inoremap <silent> ;f <c-x><c-f>
        inoremap <silent> ;i <c-x><c-i>
        inoremap <silent> ;l <c-x><c-l>
        inoremap <silent> ;n <c-x><c-n>
        inoremap <silent> ;o <c-x><c-o>
        inoremap <silent> ;p <c-x><c-p>
        inoremap <silent> ;t <c-x><c-]>
        inoremap <silent> ;u <c-x><c-u>
        inoremap <f5> <c-r>=strftime("%c")<cr>

        " Make @ . work on selected text
        xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
        vnoremap . :norm.<CR>

        " Vertical split and scrollbind
        nnoremap <leader>vs :<C-u>let @z=&so<cr>:set so=0 noscb<cr>:bo vs<cr>Ljzt:setl scb<cr><C-w>p:setl scb<cr>:let &so=@z<cr>

        " Search
        nmap <leader>s <Plug>(quickhl-manual-this)
        xmap <leader>s <Plug>(quickhl-manual-this)
        nnoremap <leader>S :QuickhlManualAdd<space>
        let g:quickhl_manual_colors=['gui=bold ctermfg=16 ctermbg=153 guifg=#ffffff guibg=#0a7383', 'gui=bold ctermfg=black ctermbg=2 guibg=#4070a0 guifg=#ffffff', 'gui=bold ctermfg=black ctermbg=3 guibg=#40a070 guifg=#ffffff', 'gui=bold ctermfg=7 ctermbg=4 guibg=#70a040 guifg=#ffffff', 'gui=bold ctermfg=black ctermbg=5 guibg=#0070e0 guifg=#ffffff', 'gui=bold ctermfg=black ctermbg=6 guibg=#007020 guifg=#ffffff', 'gui=bold ctermfg=7 ctermbg=21 guibg=#d4a00d guifg=#ffffff', 'gui=bold ctermfg=7 ctermbg=22 guibg=#06287e guifg=#ffffff', 'gui=bold ctermfg=black ctermbg=45 guibg=#5b3674 guifg=#ffffff', 'gui=bold ctermfg=7 ctermbg=16 guibg=#4c8f2f guifg=#ffffff', 'gui=bold ctermfg=black ctermbg=50 guibg=#1060a0 guifg=#ffffff', 'gui=bold ctermfg=7 ctermbg=56 guibg=#a0b0c0 guifg=black', 'gui=bold ctermfg=black ctermbg=1 guibg=#a07040 guifg=#ffffff']

        " Arrow mappings
        nmap <silent> <left> <esc>:lprev<cr>
        nmap <silent> <right> <esc>:lnext<cr>
        nmap <silent> <up> <esc>:cprev<cr>
        nmap <silent> <down> <esc>:cnext<cr>

        " Mappings
        nnoremap <f5> "=strftime("%c")<cr>P
        nnoremap <leader>A :argadd **/*
        nnoremap <leader>a :argadd <c-r>=fnameescape(expand('%:p:h'))<cr>/*<C-d>
        nnoremap <leader>b :b <C-d>
        nnoremap <leader>B :ls<cr>:b<space>
        nnoremap <leader>c <esc>:close<cr>
        nnoremap <leader>e :e <c-r>=fnameescape(expand('%:p:h'))<cr>/*<C-d>
        nnoremap <leader>f :find *
        nnoremap <leader>G :grep <c-r><c-w><cr>
        nnoremap <leader>g :grep<space>
        nnoremap <leader>i :Ilist<space>
        nnoremap <leader>L :lgrep <c-r><c-w><cr>
        nnoremap <leader>l :lgrep<space>
        nnoremap <leader>m :make<cr>
        nnoremap <leader>o <c-w>o
        nnoremap <leader>p :find *
        nnoremap <leader>q :b#<cr>
        nnoremap <leader>r :let cmds = input('command: ') \| call system('tmux send-keys -t +1 "' . cmds . '" Enter')<cr>
        nnoremap <leader>R :call system('tmux split -v -p 20\; last-pane')<cr>
        nnoremap <leader>" :split<cr>
        nnoremap <leader>t :ltag<space>/ \| lop<left><left><left><left><left><left>
        nnoremap <leader>% :vsplit<cr>
        nnoremap <leader>w <c-w>w
        nnoremap <leader>W <c-w>W
        nnoremap <leader>x :TxSigInt!<cr>
        nnoremap <leader>z :call ToggleFolds()<cr>
        nnoremap Y y$

        " quick command helpers
        cnoremap %% <c-r>=fnameescape(expand('%'))<cr>
        cnoremap :: <c-r>=fnameescape(expand('%:p:h'))<cr>/
        cnoremap <c-r><c-l> <c-r>=getline('.')<cr>
" }}}

" Basic Settings {{{
        set backspace=indent,eol,start " make backspace a more flexible
        set backupdir=~/.vim/backup/,~/vimfiles/backup/ " where to put backup files
        set backup " make backup files
        set belloff=all " no noises!
        set breakindent " this is just awesome (best patch in a long time)
        set cmdheight=2 " Gets rid of all the press enter to continue
        set completeopt=menu,menuone,noselect,noinsert
        set complete=.,w,b,u,U,i,t " complete options
        set conceallevel=0 " Don't hide from me!
        set diffopt=vertical,filler,iwhite " filler and whitespace
        set directory=~/.vim/temp/,~/vimfiles/temp/ " directory to place swap files in
        set expandtab " no real tabs please!
        set exrc " source .vimrc _vimrc .exrc _exrc files in local tree (deepest found rules all)
        set fileencoding=utf-8 " UTF-8
        set fileformats=unix,dos,mac " support all three, in this order
        set foldclose=all " Open folds if you leave them in any way
        set foldcolumn=1 " I can see fold fine thank you
        set foldenable " Turn on folding by default
        set foldlevel=0 " Autofold everything by default
        set foldmethod=syntax " Fold on the syntax
        set foldnestmax=1 " I only like to fold outer functions
        set foldopen=all " Open folds if you touch them in any way
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
        set list " show listchars
        set listchars=tab:\ \ ,extends:›,precedes:‹,nbsp:‡,trail:•
        set modeline " I have started using modelines (risky business!)
        set modelines=5 " Search for 5 lines for modelines
        set noautoread " nope
        set noautowrite " nope
        set noautowriteall " nope
        set nocursorcolumn " no cursor column
        set pastetoggle=<F12> " maybe I can remember F12
        set nocursorline " no cursor line highlight
        set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)
        set nomore " Scroll away, no pausing
        set nonumber " no line numbers
        set norelativenumber " no relative line numbers
        set nospell " nope nope nope
        set notimeout " better timeout handling
        set novisualbell " don't be noisy
        set numberwidth=5 " We are good up to 99999 lines
        set omnifunc=syntaxcomplete#Complete
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
        set synmaxcol=2500 " Don't try to highlight lines longer than X characters, made larger for long strings (consistent background highlight)
        set tabstop=8 " real tabs should be 8, and they will show with set list on
        set tags=./tags;,tags; " interesting!
        set textwidth=0 " No autowrapping
        set title " mess with the title
        set titlestring= " no title string
        set ttimeoutlen=10 " 10ms timeout
        set ttimeout " time out on key codes
        set ttyfast " Assume a fast terminal
        set t_vb= " seriously, shhhh, don't be noisy
        set undodir=~/.vim/undo/,~/vimfiles/undo/ " where to put undo files
        set undofile " persistent undo (between saves)
        set undolevels=1000 " persistent undo
        set undoreload=10000 " to undo forced reload with :e!
        set virtualedit=block " block mode, yey (onemore is evil)
        set wrap " wrap forever!
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
        set wildignore+=**/vendor " Ignore vendor directory
        if s:running_windows
                set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*,*\\bin\\*,*\\pkg\\*,*\\vendor\\*
        else
                set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/bin/*,*/pkg/*,*/vendor/*
        endif
        set wildmode=list:longest " turn on wild mode full match only
" }}}

" VimInfo {{{
        set viminfo=!,h,'500 " include uppercase registers, disable hlsearch while loading viminfo, remember marks for last 500 files
        set viminfo+=<10000 " remember up to 10000 lines in each register
        set viminfo+=s1000 " remember up to 1MB in each register
        set viminfo+=/1000 " remember last 1000 search patterns
        set viminfo+=:1000 " remember last 1000 commands
" }}}

" FormatOptions {{{
        set formatoptions=q " allow gq to work on comment
        set formatoptions+=r " enter extends comments
        set formatoptions+=n " format numbered lists using 'formatlistpat'
        set formatoptions+=1 " don't break after one letter word
        set formatoptions+=j " remove comment when joining lines
" }}}

" ShowMess {{{
        set shortmess=a " use every short text trick
        set shortmess+=O " file read message overwrites subsequent
        set shortmess+=s " no search hit bottom crap
        set shortmess+=t " truncate file message
        set shortmess+=T " truncate messages in the middle
        set shortmess+=I " no intro message
        set shortmess+=c " no ins-completion messages
" }}}

" StatusLine {{{
        set statusline=%{PasteForStatusline()} " paste status
        set statusline+=[%{getcwd()}] " working directory
        set statusline+=[%f] " full path to file 
        set statusline+=%m " modified?
        set statusline+=%r " read only?
        set statusline+=%{fugitive#statusline()} " fugitive status
        set statusline+=%= " right align
        set statusline+=%y " file type
        set statusline+=[%P] " percentage through file
        set statusline+=[%l:%c] " line number : column number
        set statusline+=%{gutentags#statusline('[Generating\ Tags...]')} " Lets me know if generating tags
        set statusline+=[%{mode()}] " current mode
" }}}

" CpOptions {{{
        set cpoptions=a " read updates alternative file name
        set cpoptions+=A " write updates alternative file name
        set cpoptions+=B " backslash has no special meaning in mappings
        set cpoptions+=d " ./tags means relative to cwd not file
        set cpoptions+=e " automatically add CR to the last line when using :@r
        set cpoptions+=f " read command updates current file name 
        set cpoptions+=F " write command updates current file name 
        set cpoptions+=P " write command updates current file name on append
        set cpoptions+=q " when joining lines, leave the cursor between joined lines
        set cpoptions+=t " search pattern for tag command is remember for n command
" }}}

" WhichWrap {{{
        set whichwrap=b " <bs> normal and visual
        set whichwrap+=s " <space> normal and visual
        set whichwrap+=h " normal and visual (not recommended)
        set whichwrap+=l " normal and visual (not recommended)
        set whichwrap+=< " <left> normal and visual
        set whichwrap+=> " <right> normal and visual
        set whichwrap+=~ " normal
        set whichwrap+=[ " insert and replace
        set whichwrap+=] " insert and replace
" }}}

" AutoCommands {{{
        augroup general
                " Clear!
                au!
                " Resize windows automagically
                au VimResized * :wincmd =
                " Things that use two spaces rather than four
                au BufRead,BufNewFile *.rb,*.rhtml setlocal sw=2 sts=2 " ruby likes two
                au BufRead,BufNewFile *.yaml setlocal sw=2 sts=2 " ruby likes two
                au BufRead,BufNewFile *.go setlocal syntax=go ft=go noexpandtab sw=8 sts=8 omnifunc=go#complete#Complete foldmethod=syntax
                au BufRead,BufNewFile *.go nnoremap <buffer> gd :GoDef<cr>
                au BufRead,BufNewFile *.go nnoremap <buffer> gD :GoDoc<cr>
                au BufRead,BufNewFile *.go nnoremap <buffer> gi :GoInfo<cr>
                au BufRead,BufNewFile *.go nnoremap <buffer> gr :GoRename<cr>
                au BufRead,BufNewFile *.go nnoremap <buffer> gt :GoTest<cr>
                au BufRead,BufNewFile *.go nnoremap <buffer> ga :GoAlternate!<cr>
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
        augroup end
" }}}

" GUI {{{
        if has('gui_running')
                set guioptions=cm " use simple dialogs rather than pop-ups & show menu
                if s:running_windows
                        set guifont=Hack,Consolas
                endif
        endif
" }}}

" Mousing {{{
        if has('mouse')
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
" }}}

" Adapt for executables {{{
        if executable('ag')
                set grepprg=ag\ --nogroup\ --nocolor
        endif
        if executable('pt')
                set grepprg=pt\ --nogroup\ --nocolor\ --ignore-case
        endif
        if executable('rg')
                set grepprg=rg\ --vimgrep\ --no-heading
        endif
        if executable('ctags-exuberant')
                let g:gutentags_ctags_executable='ctags-exuberant'
        endif
" }}}

" Markdown {{{
        let g:vim_markdown_folding_disabled=0
        let g:vim_markdown_frontmatter=1
" }}}

" Vim-go {{{
        let g:go_autodetect_gopath=1
        let g:go_auto_type_info=0
        let g:go_bin_path=$HOME.'/go/bin'
        let g:go_def_mapping_enabled=1
        let g:go_def_mode='guru'
        let g:go_def_reuse_buffer=1
        let g:go_doc_command='godoc'
        let g:go_fmt_autosave=1
        let g:go_fmt_command='goimports'
        let g:go_fmt_experimental=1
        let g:go_highlight_array_whitespace_error=1
        let g:go_highlight_build_constraints=1
        let g:go_highlight_chan_whitespace_error=1
        let g:go_highlight_extra_types=1
        let g:go_highlight_fields=1
        let g:go_highlight_format_strings=1
        let g:go_highlight_functions=1
        let g:go_highlight_generate_tags=1
        let g:go_highlight_methods=1
        let g:go_highlight_operators=1
        let g:go_highlight_space_tab_error=1
        let g:go_highlight_string_spellcheck=1
        let g:go_highlight_trailing_whitespace_error=1
        let g:go_highlight_types=1
        let g:go_info_mode='guru'
        let g:go_jump_to_error=0
        let g:go_template_autocreate=0
        let g:go_textobj_enabled=1
" }}}

" Netrw {{{
        let g:netrw_altfile=1
        let g:netrw_banner=0
        let g:netrw_cursor=0
        let g:netrw_keepdir=1
        let g:netrw_liststyle=1
        let g:netrw_sizestyle='H'
        let g:netrw_winsize='30'
" }}}

" HTML {{{
        let g:html_indent_script1='inc'
        let g:html_indent_style1='inc'
        let g:html_indent_inctags='html,body,head,tbody,p,li,dd,dt,h1,h2,h3,h4,h5,h6,blockquote,section'
        let g:html_wrong_comments=1
" }}}

" Mucomplete {{{
        let g:mucomplete#enable_auto_at_startup=0
" }}}

" Nofrils {{{
        let g:nofrils_strbackgrounds=0 " to turn off highlighted string backgrounds
        let g:nofrils_heavycomments=0 " bright comments off
        let g:nofrils_heavylinenumbers=0 " heavy line numbers off
        if s:running_windows
                colo nofrils-acme
        else " MacOSX/Linux
                if executable('date')
                        " EST is -5 from UTC so
                        " EST 19:00 to 7:00 is 01:00 to 
                        let s:curhour=system('date -u +%H')
                        if s:curhour <# 12
                                colo nofrils-dark
                        elseif s:curhour ># 22
                                colo nofrils-dark
                        else
                                colo nofrils-acme
                        endif
                else
                        colo nofrils-acme
                endif
        endif
" }}}

" Functions {{{
        function! ExecuteMacroOverVisualRange()
                echo '@'.getcmdline()
                execute ":'<,'>normal @".nr2char(getchar())
        endfunction

        function! ToggleFolds()
                if !exists('b:myfolded')
                        let b:myfolded=0
                endif

                if b:myfolded ># 0
                        execute('%foldo')
                        let b:myfolded=0
                else
                        execute('%foldc')
                        let b:myfolded=1
                endif
        endfunction

        function! StripTrailingWhitespace()
                if !&binary && &filetype !=? 'diff'
                        " This is fragile due to depending on settings
                        normal mz
                        normal Hmy
                        %s/\s\+$//e
                        normal 'yz<cr>
                        normal `z
                endif
        endfunction
        command! StripTrailingWhitespace :call StripTrailingWhitespace()

        function! PasteForStatusline()
                let l:paste_status=&paste
                if l:paste_status == 1
                        return '[PASTE]'
                else
                        return ''
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

        " Thanks romainl
        if executable('nc') && executable('tr') && executable('cat')
                command! -range=% TB <line1>,<line2>w !nc termbin.com 9999 | tr -d '\n' | cat
        endif

        function! Redir(cmd)
                if a:cmd =~? '^!'
                        execute "let g:output = system('" . substitute(a:cmd, '^!', '', '') . "')"
                else
                        redir => g:output
                        execute a:cmd
                        redir END
                endif
                vnew
                setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
                call setline(1, split(g:output, "\n"))
        endfunction
        command! -nargs=1 Redir silent call Redir(<f-args>)

        function! BreakHere()
                " This is fragile due to depending on settings
                s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
                call histdel('/', -1)
        endfunction
        command! BreakHere :call BreakHere()

        let s:hidden_all = 0
        function! ToggleHiddenAll()
                if s:hidden_all == 0
                        let s:hidden_all = 1
                        set noshowmode
                        set noruler
                        set laststatus=0
                        set noshowcmd
                        set cmdheight=1
                else
                        let s:hidden_all = 0
                        set showmode
                        set ruler
                        set laststatus=2
                        set showcmd
                        set cmdheight=2
                endif
        endfunction

        nnoremap <S-h> :call ToggleHiddenAll()
        call ToggleHiddenAll()
" }}}

" vim: foldmethod=marker:foldlevel=0:sw=8:
