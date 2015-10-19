# sprinkles

Sprinkles is a low-key vim colorscheme with an adjustable color palette, which
allows you to easily match it with your terminal's theme.

## Screenshots

Sprinkles with the default light color palette:

![lightshot](http://i.imgur.com/e2paA1V.png "lightshot")

Sprinkles with a custom dark color palette:

![darkshot](http://i.imgur.com/Im7I4Jb.png "darkshot")

## Installation

Sprinkles can be installed in the same way as most other vim plugins and
colorscheme. If you don't know how to install vim plugins, I recommend
installing sprinkles using [pathogen][1]. Once pathogen is set up, just clone
this repo into your bundle directory:

    git clone https://github.com/alexjgriffin/sprinkles ~/.vim/bundle/sprinkles

## Design & Motivation

I had tremendous difficulty getting my terminal vim colorscheme to match my
GUI colorscheme, even with themes which provided a matching terminal theme.
The approach taken by many other colorschemes is to emulate the GUI theme using
the terminal's 256-color palette, with the result that my terminal vim did not
exactly match my GUI **or** my terminal theme.

Sprinkles tackles this problem by restricting terminal colors to the user-set
colors 0-7. A configuration option is available to set the GUI color palette
to match your terminal theme. Sprinkles should look good on any reasonably
themed terminal, which specifically means:

  * The colors are all easily visible on the default background. Common
    offenders include the default themes for the linux console and putty.
  * The colors roughly correspond to the standard colors on 16-color
    terminals. For example, color 0 is black, color 1 is red, etc. This
    includes most terminal themes in the wild, but excludes crazy palettes
    like solarized or base16.

It shouldn't matter whether you use a light or dark theme. Some color palettes
which break these rules may look good by accident.

In addition, sprinkles aims to look a bit less busy than other colorschemes.

## Configuration

You can define a custom color palette for sprinkles to use, with the caveats
described above. Just define the variable `g:sprinkles_palette` in your vimrc:

    let g:sprinkles_palette = {
      \'text':       '#c5c5c5',
      \'background': '#161616',
      \'black':      '#161616',  'dark_grey':      '#4a4a4a',
      \'red':        '#a65353',  'bright_red':     '#cc6666',
      \'green':      '#909653',  'bright_green':   '#b5bd68',
      \'yellow':     '#bd9c5a',  'bright_yellow':  '#f0c674',
      \'blue':       '#5f788c',  'bright_blue':    '#81a2be',
      \'magenta':    '#816b87',  'bright_magenta': '#b294bb',
      \'cyan':       '#668c88',  'bright_cyan':    '#8abeb7',
      \'white':      '#c5c5c5',  'bright_white':   '#f7f7f7',
      \}
    colorscheme sprinkles

[1]: https://github.com/tpope/vim-pathogen
