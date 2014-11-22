Version: 1.0.5  
Last Change: 2014 Aug 11

虹
=

Niji (Rainbow) is yet another rainbow parentheses plugin for Vim. It’s good for
Common Lisp, Scheme and Clojure — with two colour schemes — out-of-the-box.
Just install, and you’re good to go. The filetypes, matching characters and
colours Niji uses are completely configurable (See `:help niji-configuration`
for details).

Screenshot
----------

![vim-niji highlighting some Clojure.](http://cl.ly/image/2F02041i2h0g/vim-niji.png)

Niji highlighting the parentheses of some Clojure code [from the Leiningen project](https://github.com/technomancy/leiningen/blob/master/src/leiningen/new.clj).
The `colorscheme` is [Ethan Schoonover's Solarized](http://ethanschoonover.com/solarized)
and the keyword highlighting is provided by [the static runtime files](https://github.com/guns/vim-clojure-static) from [Meikel Brandmeyer's VimClojure](http://www.vim.org/scripts/script.php?script_id=2501)

Installation
------------

### Vundle

If you don’t already have a preferred manager, I recommend installing
[Vundle](http://github.com/gmarik/Vundle.vim). Once done, add the declaration for
Niji to your `.vimrc`:

```vim
Plugin 'amdt/vim-niji'
```

And install:

```vim
:PluginInstall
```

### Pathogen

If you’re using Tim Pope’s wonderful
[Pathogen](http://github.com/tpope/vim-pathogen), simply extract the archive
to `$HOME/.vim/bundle` or better yet, clone the Git repository. In a UNIX
shell, for example:

```Shell
cd ~/.vim/bundle
git clone git://github.com/amdt/vim-niji.git
```

### Other

`Vimball` and manual installation methods are described in `doc/niji.txt`.

Credit Where It’s Due
---------------------

Whilst not a fork, Niji builds upon the work of various rainbow parantheses
plugins, starting with
[RainbowParenthsis.vim](http://www.vim.org/scripts/script.php?script_id=1230)
by John Gilmore,
[rainbow_parenthsis.vim](http://www.vim.org/scripts/script.php?script_id=1561)
by Martin Krischik and Luc Hermitte, and
[rainbow_parentheses.vim](https://github.com/kien/rainbow_parentheses.vim) by
‘kien’. The figure below shows the rough history and project pages for these
plugins.

Niji also takes its default colour scheme from the Lisp syntax file provided
in distributions of Vim and written by Dr. Charles E. Campbell, Jr.

```
     ‘Niji’ by Alastair Touw
o    May 6, 2013.
|    (http://github.com/amdt/vim-niji)
|\
| |  ‘rainbow_parentheses.vim’ by ‘kien’
o |  October 12, 2011.
| |  (https://github.com/kien/rainbow_parentheses.vim)
| |
| o  ‘Lisp.vim’ by Dr. Charles E. Campbell, Jr.
|    November 16, 2010.
|
|    ‘rainbow_parenthsis.vim’ by Martin Krischik & Luc Hermitte
o    May 25, 2006.
|    (http://www.vim.org/scripts/script.php?script_id=1561)
|
|    ‘RainbowParenthsis.vim’ by John Gilmore
o    March 5, 2005.
     (http://www.vim.org/scripts/script.php?script_id=1230)
```

License
-------

Niji is released under the same terms as Vim itself. See `:help license` if
you have Vim installed, or online at [Vim's Sourceforge project page](http://vimdoc.sourceforge.net/htmldoc/uganda.html#license).
