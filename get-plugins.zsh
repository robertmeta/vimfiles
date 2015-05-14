rm -rf bundle
mkdir -p bundle

# Themes {{{
git clone https://github.com/jonathanfilip/vim-lucius bundle/lucius && rm -rf bundle/lucius/.git
# }}}

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

# Rainbow Parens
git clone https://github.com/kien/rainbow_parentheses.vim bundle/rainbow_parentheses && rm -rf bundle/rainbow_parentheses/.git

# With Wildfire you can quickly select the closest text object among a group of
# candidates. By default candidates are `i'`, `i"`, `i)`, `i]`, `i}`, `ip` and `it`.
git clone https://github.com/gcmt/wildfire.vim bundle/wildfire && rm -rf bundle/wildfire/.git

# This plugin is a front for the_silver_searcher: ag. Ag can be used as a
# replacement for ack. This plugin will allow you to run ag from vim, and shows
# the results in a split window.
git clone https://github.com/rking/ag.vim bundle/ag && rm -rf bundle/ag/.git

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

# Makes netrw less dumb
git clone https://github.com/tpope/vim-vinegar bundle/vinegar && rm -rf bundle/vinegar/.git

# Supertab is a vim plugin which allows you to use <Tab> for all your insert completion needs (:help ins-completion).
git clone https://github.com/ajh17/VimCompletesMe.git bundle/vimcompletesme && rm -rf bundle/vimcompletesme/.git

# Targets.vim adds various |text-objects| to give you more targets to operate
# on. It expands on the idea of simple commands like `di'` (delete inside the
# single quotes around the cursor) to give you more opportunities to craft
# powerful commands that can be repeated reliably. Another major goal is to
# handle all corner cases correctly.
git clone https://github.com/wellle/targets.vim bundle/targets && rm -rf bundle/targets/.git

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

# This plugin provides syntax and supporting functionality for the Rust
# filetype.
git clone https://github.com/rust-lang/rust.vim bundle/rust && rm -rf bundle/rust/.git

# Racer (rust autocomplete) support
git clone https://github.com/phildawes/racer bundle/racer && rm -rf bundle/racer/.git # Unstable and annoying

# Improved Html5 support
git clone https://github.com/othree/html5.vim bundle/html5 && rm -rf bundle/html5/.git

# JS / Json / Angular / etc
git clone https://github.com/leshill/vim-json bundle/json && rm -rf bundle/json/.git
git clone https://github.com/othree/javascript-libraries-syntax.vim bundle/javascriptlibsyntax && rm -rf bundle/javascriptlibsyntax/.git
git clone https://github.com/pangloss/vim-javascript bundle/javascript && rm -rf bundle/javascript/.git

# Autohotkey
git clone https://github.com/vim-scripts/autohotkey-ahk bundle/ahk && rm -rf bundle/ahk/.git

# TOML
git clone https://github.com/cespare/vim-toml bundle/toml && rm -rf bundle/toml/.git

# Sneak is a minimalist, versatile Vim motion plugin that jumps to any location specified by two characters. 
# It works with multiple lines, operators (including repeat . and surround), keymaps, visual mode, 
# unicode ("multibyte"), and macros.
git clone https://github.com/justinmk/vim-sneak bundle/sneak && rm -rf bundle/sneak/.git

# Modeline {{{
# vim: set foldlevel=1: 
# }}}
