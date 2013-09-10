This is just my personal .vim directory and the files I use.

You can likely copy it wholesale and it will work, but it isn't recommended.

Pick and choose what you need, and if you just want a sensible baseline, use 
https://github.com/tpope/vim-sensible it is designed to be exactly that!

If you do use it, remember to make a link in your home directory to 
the ```.vimrc``` file, as follows:


#### Linux ####

ln -s ~/.vim/.vimrc ~/.vimrc


#### Windows (as an administrative user) ####

mklink %HOME%\\.vimrc %HOME%\vimfiles\\.vimrc


#### Won't really work until you run ####

to init: git submodule update --init
or to update: git submodule foreach git pull
