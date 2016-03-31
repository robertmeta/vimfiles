rm -rf bundle
mkdir -p bundle

# Themes
git clone https://github.com/robertmeta/nofrils bundle/nofrils && rm -rf bundle/nofrils/.git
git clone https://github.com/tomasr/molokai bundle/molokai && rm -rf bundle/molokai/.git
git clone https://github.com/vim-scripts/summerfruit256.vim bundle/summerfruit && rm -rf bundle/summerfruit/.git

# Tags filtering
git clone https://github.com/tomtom/tlib_vim bundle/tlib && rm -rf bundle/tlib/.git
git clone https://github.com/tomtom/ttags_vim bundle/ttags && rm -rf bundle/ttags/.git

# Make dlist / ilist far more useful
git clone https://github.com/romainl/vim-qlist bundle/qlist && rm -rf bundle/qlist/.git

# Improve quickfix
git clone https://github.com/romainl/vim-qf bundle/qf && rm -rf bundle/qf/.git

# Be able to repeat many things!
git clone https://github.com/tpope/vim-repeat.git bundle/repeat && rm -rf bundle/repeat/.git

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
# Autocomplete from other windows
git clone https://github.com/wellle/tmux-complete.vim bundle/tmuxcomplete && rm -rf bundle/tmuxcomplete/.git

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

# Targets.vim adds various |text-objects| to give you more targets to operate
# on. It expands on the idea of simple commands like `di'` (delete inside the
# single quotes around the cursor) to give you more opportunities to craft
# powerful commands that can be repeated reliably. Another major goal is to
# handle all corner cases correctly.
git clone https://github.com/wellle/targets.vim bundle/targets && rm -rf bundle/targets/.git

# This plugin provides Readline (Emacs) mappings for insert and command line
# mode that try not to overlap with built-in Vim functionality.
git clone https://github.com/tpope/vim-rsi bundle/rsi && rm -rf bundle/rsi/.git
