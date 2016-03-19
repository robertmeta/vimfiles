rm -rf bundle
mkdir -p bundle

# Themes {{{
git clone https://github.com/acarapetis/vim-colors-github bundle/githubcolor && rm -rf bundle/githubcolor/.git
git clone https://github.com/ciaranm/inkpot bundle/inkpot && rm -rf bundle/inkpot/.git
git clone https://github.com/jonathanfilip/vim-lucius bundle/lucius && rm -rf bundle/lucius/.git
git clone https://github.com/junegunn/seoul256.vim bundle/seoul256 && rm -rf bundle/seoul256/.git
git clone https://github.com/NLKNguyen/papercolor-theme bundle/papercolor && rm -rf bundle/papercolor/.git
git clone https://github.com/robertmeta/nofrils bundle/nofrils && rm -rf bundle/nofrils/.git
git clone https://github.com/romainl/Apprentice bundle/apprentice && rm -rf bundle/apprentice/.git
git clone https://github.com/romainl/Disciple bundle/disciple && rm -rf bundle/disciple/.git
git clone https://github.com/tomasr/molokai bundle/molokai && rm -rf bundle/molokai/.git
git clone https://github.com/vim-scripts/summerfruit256.vim bundle/summerfruit && rm -rf bundle/summerfruit/.git
git clone https://github.com/AlessandroYorba/Sierra bundle/sierra && rm -rf bundle/sierra/.git
# }}}

# Be able to repeat many things!
git clone https://github.com/tpope/vim-repeat.git bundle/repeat && rm -rf bundle/repeat/.git

# Easymotion
git clone https://github.com/easymotion/vim-easymotion bundle/EasyMotion && rm -rf bundle/EasyMotion/.git

# Sneak
#git clone https://github.com/justinmk/vim-sneak bundle/sneak && rm -rf bundle/sneak/.git

# Lots fo better programming language support
git clone https://github.com/sheerun/vim-polyglot bundle/polygot && rm -rf bundle/polygot/.git

# This plugin is a tool for dealing with pairs of "surroundings."  Examples
# of surroundings include parentheses, quotes, and HTML tags
git clone https://github.com/tpope/vim-surround bundle/surround && rm -rf bundle/surround/.git

# Gutentags is a plugin that takes care of the much needed management of tags
# files in Vim. It will (re)generate tag files as you work while staying
# completely out of your way. It will even do its best to keep those tag files
# out of your way too. It has no dependencies and just works.
git clone https://github.com/ludovicchabant/vim-gutentags bundle/gutentags && rm -rf bundle/gutentags/.git

# Go (golang) support for Vim. vim-go installs automatically all necessary
# binaries for providing seamless Vim integration.  It comes with pre-defined
# sensible settings (like auto gofmt on save), has autocomplete, snippet
# support, improved syntax highlighting, go toolchain commands, etc... It's
# highly customizable and each individual feature can be disabled/enabled
# easily.
git clone https://github.com/fatih/vim-go bundle/vim-go && rm -rf bundle/vim-go/.git

# Easily interact with tmux from vim.
git clone https://github.com/benmills/vimux bundle/vimux && rm -rf bundle/vimux/.git
git clone https://github.com/wellle/tmux-complete.vim bundle/tmuxcomplete && rm -rf bundle/tmuxcomplete/.git

# Rainbow Parens Improved
git clone https://github.com/kien/rainbow_parentheses.vim  bundle/rainbow_parentheses && rm -rf bundle/rainbow_parentheses/.git

# Sensible
git clone https://github.com/tpope/vim-sensible bundle/sensible && rm -rf bundle/sensible/.git

# Abolish lets you quickly find, substitute, and abbreviate several variations
# of a word at once.  By default, three case variants (foo, Foo, and FOO) are
# operated on by every command.
git clone https://github.com/tpope/vim-abolish bundle/abolish && rm -rf bundle/abolish/.git

# Comment stuff out.  Then uncomment it later.  Relies on 'commentstring' to be
# correctly set, or uses b:commentary_format if it is set.
git clone https://github.com/tpope/vim-commentary bundle/commentary && rm -rf bundle/commentary/.git

# Vim sugar for the UNIX shell commands that need it the most.  Delete or rename
# a buffer and the underlying file at the same time.  Load a `find` or a
# `locate` into the quickfix list.  Sudosave/Sudoedit, etc
git clone https://github.com/tpope/vim-eunuch bundle/eunuch && rm -rf bundle/eunuch/.git

# Whenever you edit a file from a Git repository, a set of commands is defined
# that serve as a gateway to Git.
git clone https://github.com/tpope/vim-fugitive bundle/fugitive && rm -rf bundle/fugitive/.git

# This plugin provides several pairs of bracket maps. [a ]a [q ]q etc
git clone https://github.com/tpope/vim-unimpaired bundle/unimpaired && rm -rf bundle/unimpaired/.git

# NERDTree
git clone https://github.com/scrooloose/nerdtree bundle/nerdtree && rm -rf bundle/nerdtree/.git

# Vinegar makes netrw not suck as much
# git clone https://github.com/tpope/vim-vinegar bundle/vinegar && rm -rf bundle/vinegar/.git

# VimCompletesMe is a vim plugin which allows you to use <Tab> for all your insert completion needs (:help ins-completion).
git clone https://github.com/ajh17/VimCompletesMe bundle/vimcompletesme && rm -rf bundle/vimcompletesme/.git

# Targets.vim adds various |text-objects| to give you more targets to operate
# on. It expands on the idea of simple commands like `di'` (delete inside the
# single quotes around the cursor) to give you more opportunities to craft
# powerful commands that can be repeated reliably. Another major goal is to
# handle all corner cases correctly.
git clone https://github.com/wellle/targets.vim bundle/targets && rm -rf bundle/targets/.git

# FZF support
# git clone https://github.com/junegunn/fzf.vim bundle/fzf && rm -rf bundle/fzf/.git

# Full path fuzzy file, buffer, mru, tag, ... finder with an intuitive interface.
# Written in pure Vimscript for MacVim, gVim and Vim version 7.0+. Has full
# support for Vim's |regexp| as search pattern, built-in MRU files monitoring,
# project's root finder, and more.
git clone https://github.com/ctrlpvim/ctrlp.vim bundle/ctrlp && rm -rf bundle/ctrlp/.git

# Syntastic is a syntax checking plugin that runs files through external syntax
# checkers. This can be done on demand, or automatically as files are saved and
# opened.  If syntax errors are detected, the user is notified and is happy
git clone https://github.com/scrooloose/syntastic bundle/syntastic && rm -rf bundle/syntastic/.git

# This plugin provides Vim syntax, indent and filetype detection for Windows
# PowerShell scripts, modules, and XML configuration files.
git clone https://github.com/PProvost/vim-ps1 bundle/ps1 && rm -rf bundle/ps1/.git

# This plugin provides syntax and supporting functionality for the Rust filetype.
# git clone https://github.com/rust-lang/rust.vim bundle/rust && rm -rf bundle/rust/.git

# Racer (rust autocomplete) support
# git clone https://github.com/phildawes/racer bundle/racer && rm -rf bundle/racer/.git # Unstable and annoying

# Better whitespace
# git clone https://github.com/ntpeters/vim-better-whitespace bundle/whitespace && rm -rf bundle/whitespace/.git

# This plugin provides Readline (Emacs) mappings for insert and command line
# mode that try not to overlap with built-in Vim functionality.
git clone https://github.com/tpope/vim-rsi bundle/rsi && rm -rf bundle/rsi/.git

# Modeline {{{
# vim: set foldlevel=1 foldmarker={{{,}}}:
# }}}
