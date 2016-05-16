# You want to know what plugins I use huh?  Check out: 
# https://www.robertmelton.com/2014/05/27/vim-and-me/
rm -rf bundle
mkdir -p bundle

# Themes
git clone https://github.com/robertmeta/nofrils bundle/nofrils && rm -rf bundle/nofrils/.git
git clone https://github.com/tomasr/molokai bundle/molokai && rm -rf bundle/molokai/.git
git clone https://github.com/endel/vim-github-colorscheme bundle/githubtheme && rm -rf bundle/githubtheme/.git

# Plugins
# git clone https://github.com/ajh17/VimCompletesMe bundle/vcm && rm -rf bundle/vcm/.git
git clone https://github.com/benmills/vimux bundle/vimux && rm -rf bundle/vimux/.git
git clone https://github.com/dahu/SearchParty bundle/searchparty && rm -rf bundle/searchparty/.git
git clone https://github.com/fatih/vim-go bundle/vim-go && rm -rf bundle/vim-go/.git
git clone https://github.com/justinmk/vim-dirvish bundle/dirvish && rm -rf bundle/dirvish/.git
git clone https://github.com/justinmk/vim-sneak bundle/sneak && rm -rf bundle/sneak/.git
git clone https://github.com/ludovicchabant/vim-gutentags bundle/gutentags && rm -rf bundle/gutentags/.git
git clone https://github.com/mbbill/undotree bundle/undotree && rm -rf bundle/undotree/.git
git clone https://github.com/romainl/vim-qf bundle/qf && rm -rf bundle/qf/.git
git clone https://github.com/romainl/vim-qlist bundle/qlist && rm -rf bundle/qlist/.git
git clone https://github.com/romainl/vim-tinyMRU bundle/mru && rm -rf bundle/mru/.git
git clone https://github.com/sheerun/vim-polyglot bundle/polygot && rm -rf bundle/polygot/.git
git clone https://github.com/tommcdo/vim-lion bundle/lion && rm -rf bundle/lion/.git
git clone https://github.com/tomtom/tlib_vim bundle/tlib && rm -rf bundle/tlib/.git
git clone https://github.com/tomtom/ttags_vim bundle/ttags && rm -rf bundle/ttags/.git
git clone https://github.com/tpope/vim-abolish bundle/abolish && rm -rf bundle/abolish/.git
git clone https://github.com/tpope/vim-characterize bundle/characterize && rm -rf bundle/characterize/.git
git clone https://github.com/tpope/vim-commentary bundle/commentary && rm -rf bundle/commentary/.git
git clone https://github.com/tpope/vim-eunuch bundle/eunuch && rm -rf bundle/eunuch/.git
git clone https://github.com/tpope/vim-fugitive bundle/fugitive && rm -rf bundle/fugitive/.git
git clone https://github.com/tpope/vim-repeat.git bundle/repeat && rm -rf bundle/repeat/.git
git clone https://github.com/tpope/vim-rsi bundle/rsi && rm -rf bundle/rsi/.git
git clone https://github.com/tpope/vim-sensible bundle/sensible && rm -rf bundle/sensible/.git
git clone https://github.com/tpope/vim-surround bundle/surround && rm -rf bundle/surround/.git
git clone https://github.com/tpope/vim-unimpaired bundle/unimpaired && rm -rf bundle/unimpaired/.git
git clone https://github.com/wellle/targets.vim bundle/targets && rm -rf bundle/targets/.git
git clone https://github.com/wellle/tmux-complete.vim bundle/tmuxcomplete && rm -rf bundle/tmuxcomplete/.git
git clone https://github.com/garbas/vim-snipmate bundle/snipmate && rm -rf bundle/snipmate/.git
git clone https://github.com/MarcWeber/vim-addon-mw-utils bundle/mwutils && rm -rf bundle/mwutils/.git
git clone https://github.com/honza/vim-snippets bundle/snippets && rm -rf bundle/snippets/.git
