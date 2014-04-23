# VimCompletesMe

A super simple, super minimal, super light-weight tab-completion plugin for Vim.


Without configuration, the Tab key will, depending on the context, offer:

* Vim's local keyword completion
  ([Ctrl-X_Ctrl-N](http://vimhelp.appspot.com/insert.txt.html#i_CTRL-X_CTRL-N))
* File path completion when typing a path
  ([Ctrl-X_Ctrl-F](http://vimhelp.appspot.com/insert.txt.html#i_CTRL-X_CTRL-F))
* Omni-completion after typing a period.
  ([Ctrl-X_Ctrl-O](http://vimhelp.appspot.com/insert.txt.html#i_CTRL-X_CTRL-O))

VimCompletesMe offers a `b:vcm_tab_complete` variable to set the following type of
completions:

* Dictionary words
  ([Ctrl-X_Ctrl-K](http://vimhelp.appspot.com/insert.txt.html#i_CTRL-X_CTRL-K))
* User-defined completion
  ([Ctrl-X_Ctrl-U](http://vimhelp.appspot.com/insert.txt.html#i_CTRL-X_CTRL-U))
* Tags
  ([Ctrl-X_Ctrl-\]](http://vimhelp.appspot.com/insert.txt.html#i_CTRL-X_CTRL-]))
* Vim command line
  ([Ctrl-X_Ctrl-V](http://vimhelp.appspot.com/insert.txt.html#i_CTRL-X_CTRL-V))
* Omni completion
  ([Ctrl-X_Ctrl-O](http://vimhelp.appspot.com/insert.txt.html#i_CTRL-X_CTRL-O))

You can set the `b:vcm_tab_complete` variable interactively, or in an
autocommand:

    autocmd FileType text,markdown let b:vcm_tab_complete = 'dict'

Striving for minimalism, this plugin weighs under 70 lines of code.


## Installation

1. **Pathogen:**

        cd ~/.vim/bundle
        git clone https://github.com/ajh17/VimCompletesMe.git

2. **Vundle:**

    Add the following to your ~/.vimrc:

        Bundle 'ajh17/VimCompletesMe'

    Then execute `:BundleInstall` after restarting Vim.

3. **Manual (Not recommended):**

        git clone https://github.com/ajh17/VimCompletesMe.git
        cd VimCompletesMe
        mv plugin/* ~/.vim/plugin/
        mv doc/* ~/.vim/doc/

    Once the help tags have been generated, you can read the manual with
    `:help VimCompletesMe`.

## Thanks
* [bairui](https://github.com/dahu) for helping me with this plugin, and for
  the kickass name.
* You for using it!

## License
Copyright (c) Akshay Hegde. Distributed under the same terms as Vim itself. See
`:help license`
