rm -rf bundle
mkdir -p bundle

# Themes
git clone https://github.com/ciaranm/inkpot bundle/inkpot && rm -rf bundle/inkpot/.git
git clone https://github.com/freeo/vim-kalisi bundle/kalisi && rm -rf bundle/kalisi/.git
git clone https://github.com/junegunn/seoul256.vim bundle/seoul256 && rm -rf bundle/seoul256/.git
git clone https://github.com/romainl/Apprentice bundle/apprentice && rm -rf bundle/apprentice/.git
git clone https://github.com/romainl/Disciple bundle/disciple && rm -rf bundle/disciple/.git
git clone https://github.com/tomasr/molokai bundle/molokai && rm -rf bundle/molokai/.git
git clone https://github.com/tpope/vim-vividchalk bundle/vividchalk && rm -rf bundle/vividchalk/.git
git clone https://github.com/jonathanfilip/vim-lucius bundle/lucius && rm -rf bundle/lucius/.git
git clone https://github.com/ludovicchabant/vim-gutentags bundle/gutentags && rm -rf bundle/gutentags/.git

# Go 
git clone https://github.com/fatih/vim-go bundle/vim-go && rm -rf bundle/vim-go/.git

# Tmux
git clone https://github.com/tpope/vim-dispatch bundle/dispatch && rm -rf bundle/dispatch/.git

# Rainbow Parens
git clone https://github.com/kien/rainbow_parentheses.vim bundle/rainbow_parentheses && rm -rf bundle/rainbow_parentheses/.git

# General
git clone https://github.com/gcmt/wildfire.vim bundle/wildfire && rm -rf bundle/wildfire/.git
git clone https://github.com/krisajenkins/vim-pipe bundle/vimpipe && rm -rf bundle/vimpipe/.git
git clone https://github.com/rking/ag.vim bundle/ag && rm -rf bundle/ag/.git
git clone https://github.com/tpope/vim-abolish bundle/abolish && rm -rf bundle/abolish/.git
git clone https://github.com/tpope/vim-commentary bundle/commentary && rm -rf bundle/commentary/.git
git clone https://github.com/tpope/vim-eunuch bundle/eunuch && rm -rf bundle/eunuch/.git
git clone https://github.com/tpope/vim-fugitive bundle/fugitive && rm -rf bundle/fugitive/.git
git clone https://github.com/tpope/vim-repeat bundle/repeat && rm -rf bundle/repeat/.git
git clone https://github.com/tpope/vim-scriptease bundle/scriptease && rm -rf bundle/scriptease/.git
git clone https://github.com/tpope/vim-sensible bundle/sensible && rm -rf bundle/sensible/.git
git clone https://github.com/tpope/vim-surround bundle/surround && rm -rf bundle/surround/.git
git clone https://github.com/tpope/vim-unimpaired bundle/unimpaired && rm -rf bundle/unimpaired/.git
git clone https://github.com/tpope/vim-vinegar bundle/vinegar && rm -rf bundle/vinegar/.git

# Improved motions
git clone https://github.com/ervandew/supertab bundle/supertab && rm -rf bundle/supertab/.git
git clone https://github.com/wellle/targets.vim bundle/targets && rm -rf bundle/targets/.git
git clone https://github.com/Lokaltog/vim-easymotion bundle/easymotion && rm -rf bundle/easymotion/.git

# Visual
git clone https://github.com/kien/ctrlp.vim bundle/ctrlp && rm -rf bundle/ctrlp/.git
git clone https://github.com/majutsushi/tagbar bundle/tagbar && rm -rf bundle/tagbar/.git
git clone https://github.com/scrooloose/nerdtree bundle/nerdtree && rm -rf bundle/nerdtree/.git
git clone https://github.com/scrooloose/syntastic bundle/syntastic && rm -rf bundle/syntastic/.git

# PowerShell
git clone https://github.com/PProvost/vim-ps1 bundle/ps1 && rm -rf bundle/ps1/.git

# Html5
git clone https://github.com/othree/html5.vim bundle/html5 && rm -rf bundle/html5/.git

# JS / Json / Angular
git clone https://github.com/leshill/vim-json bundle/json && rm -rf bundle/json/.git
git clone https://github.com/othree/javascript-libraries-syntax.vim bundle/javascriptlibsyntax && rm -rf bundle/javascriptlibsyntax/.git
git clone https://github.com/pangloss/vim-javascript bundle/javascript && rm -rf bundle/javascript/.git
