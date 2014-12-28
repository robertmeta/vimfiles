# Bluedrake Color Palette


Bluedrake is a carefully designed palette of 16 colors composed of 8 base colors
and 8 accent colors. The colors in the bluedrake palette were chosen using the
perceptually-based HCL (Hue-Chroma-Luminance) color space, which is a
transformation of the [CIELUV](https://en.wikipedia.org/wiki/CIELUV) color space
(see [here](http://www.r-project.org/conferences/DSC-2003/Proceedings/Ihaka.pdf)
and
[here](https://www.sciencedirect.com/science/article/pii/S0167947308005549?np=y)
for details). The 8 accent colors were chosen so that no color stands out
compared to another color, that is, each accent color has consistent chroma and
luminance values but variable hues. This means that different syntax groups
are distinguished based on the location of the color on the color wheel
rather than how bright the color is. In addition, the accent colors are
equally spaced on the color wheel, meaning adjacent colors have equal contrast.
The 8 base colors are a sequential color palette with all colors having the same
hue (same as the blue accent hue). This sequential palette makes it
easy to switch between light and dark color themes while using the same accent
color palette.


![Color Palette](/screenshots/palette.jpg)
![Light Theme](/screenshots/screen.jpg)



# Features
  - Light and dark themes that use the same 16 color palette
  - Equally visible accent colors
  - Base color palette with consistent hue
  - GUI and terminal compatible (see Installation for more info)
  - Built-in Vim [Airline](https://github.com/bling/vim-airline) theme



# Installation
Unless you have a preferred installation method, I recommend installing
[pathogen](https://github.com/tpope/vim-pathogen) and then simply run:

    cd ~/.vim/bundle
    git clone git://github.com/michaelmalick/vim-colors-bluedrake.git

Then add the following lines to your `.vimrc` file for the dark theme:

    syntax enable
    set background=dark
    colorscheme bluedrake

or the following lines for the light theme:

    syntax enable
    set background=light
    colorscheme bluedrake

### Terminal Users
If you are using vim in a terminal (i.e., not a GUI like gvim or macvim) you
should also install a bluedrake terminal theme, otherwise bluedrake will default
to the 16 color palette set by your terminal. Themes for the Mac terminal.app
and iterm2 are available in the `/terminals` directory. If you are using a
different terminal, please consider setting the colors to the specs listing in
the Colors section. If you are in a terminal that does not allow you to set the
colors, there is an option to use only the 256 color palette. To make bluedrake
only use the 256 palette put the following line in your `.vimrc` file before the
`colorscheme bluedrake` line:

    let g:bluedrake_256=1



# Options
If you want to toggle between the light and dark themes add the following lines
to your `.vimrc` file:

    function! ColorSchemeToggle()
        if &background=="dark"
            let &background="light"
        else
            let &background="dark"
        endif
        exe "colorscheme bluedrake"
    endfunction
    nnoremap <silent> <F1> :call ColorSchemeToggle()<CR>

If you are like me and prefer a light color theme in the GUI and a dark theme in
the terminal add the following lines to your `.vimrc` file:

    if has('gui_running')
        set background=light
    else
        set background=dark
    endif



# Colors
Listed below are the color specs for the bluedrake palette:


|Name    | Term      | 16 | Hex     | 256 | H   | C     | L     | R   | G   | B  |
|--------|-----------|----|---------|-----|-----|-------|-------|-----|-----|----|
|red     | red       | 1  | #d75a69 | 167 | 7   | 90    | 55    | 215 | 90  | 105|
|orange  | brgreen   | 10 | #b67800 | 136 | 52  | 90    | 55    | 182 | 120 | 0  |
|yellow  | yellow    | 3  | #768f00 | 100 | 97  | 90    | 55    | 118 | 143 | 0  |
|green   | green     | 2  | #009e3c | 28  | 142 | 90    | 55    | 0   | 158 | 60 |
|cyan    | cyan      | 6  | #00a39a | 37  | 187 | 90    | 55    | 0   | 163 | 154|
|blue    | blue      | 4  | #0094d4 | 32  | 232 | 90    | 55    | 0   | 148 | 212|
|purple  | brmagenta | 13 | #976ce2 | 99  | 277 | 90    | 55    | 151 | 108 | 226|
|magenta | magenta   | 5  | #d74bb9 | 170 | 322 | 90    | 55    | 215 | 75  | 185|
|base00  | black     | 0  | #002d49 | 235 | 232 | 30.00 | 15.00 | 0   | 45  | 73 |
|base01  | brblack   | 8  | #003951 | 236 | 232 | 28.46 | 21.31 | 0   | 57  | 81 |
|base10  | bryellow  | 11 | #2f5468 | 24  | 232 | 25.38 | 40.23 | 47  | 84  | 104|
|base11  | brblue    | 12 | #b4c3cf | 110 | 232 | 14.62 | 71.77 | 180 | 195 | 207|
|base20  | brred     | 9  | #577284 | 242 | 232 | 22.31 | 46.54 | 87  | 114 | 132|
|base21  | brcyan    | 14 | #8ea2b0 | 247 | 232 | 17.69 | 65.46 | 142 | 162 | 176|
|base30  | white     | 7  | #dae6f0 | 253 | 232 | 11.54 | 90.70 | 218 | 230 | 240|
|base31  | brwhite   | 15 | #edf8ff | 254 | 232 | 10.00 | 97.00 | 237 | 248 | 255|


Table Notes:

  1. Term = the terminal name mapped to the color, br stands for bright
  2. 16 = color code for the 16 base terminal colors the color is mapped to
  3. 256 = the 256 color code the color is mapped to
  4. H C L = hue chroma luminance
  5. R G B = red green blue



# License 
The bluedrake color palette is [MIT/X11](http://opensource.org/licenses/MIT)
licensed. Copyright (c) 2014 Michael Malick
