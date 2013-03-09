This is just my personal .vim directory and the files I use.

You can likely copy it wholesale and it will work, but it isn't recommended,
as I make lots of changes for personal needs that differ the convensional
best pratices.

That said, if you are going to use it, remember to symlink the .vimrc

Windows: mklink %HOME%\.vimrc %HOME%\vimfiles\.vimrc

Remember to make a link in your home directory to the ```.vimrc``` file, as follows:

#### Linux ####

ln -s ~/.vim/.vimrc ~/.vimrc

#### Windows (as an administrative user) ####

mklink %HOME%\\.vimrc %HOME%\vimfiles\\.vimrc
