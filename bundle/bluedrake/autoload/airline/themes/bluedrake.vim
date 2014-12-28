let g:airline#themes#bluedrake#palette = {}

function! airline#themes#bluedrake#refresh()
""""""""""""""""""""""""""""""""""""""""""""""""
" Options
""""""""""""""""""""""""""""""""""""""""""""""""
  let s:background = get(g:, 'airline_bluedrake_bg', &background)
  let s:ansi_colors = get(g:, 'bluedrake_termcolors', 16) != 256 && &t_Co >= 16 ? 1 : 0
  let s:tty = &t_Co == 8

""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""""""""""""""""""""
  let s:base00 = {'t': s:ansi_colors ? '0' : (s:tty ? '0' : 235), 'g': '#002d49'}
  let s:base01 = {'t': s:ansi_colors ? 8 : (s:tty ? '0' : 236), 'g': '#003951'}
  let s:base10 = {'t': s:ansi_colors ? 11 : (s:tty ? '0' : 24), 'g': '#2f5468'}
  let s:base11 = {'t': s:ansi_colors ? 12 : (s:tty ? '7' : 110), 'g': '#b4c3cf'}
  let s:base20 = {'t': s:ansi_colors ? 9 : (s:tty ? '7' : 242), 'g': '#577284'}
  let s:base21 = {'t': s:ansi_colors ? 14 : (s:tty ? '7' : 247), 'g': '#8ea2b0'}
  let s:base30 = {'t': s:ansi_colors ? 7 : (s:tty ? '7' : 253), 'g': '#dae6f0'}
  let s:base31 = {'t': s:ansi_colors ? 15 : (s:tty ? '7' : 254), 'g': '#edf8ff'}

  let s:blue    = {'t': s:ansi_colors ? 4 : (s:tty ? '4' : 32 ), 'g': '#0094d4'}
  let s:red     = {'t': s:ansi_colors ? 1 : (s:tty ? '1' : 167), 'g': '#d75a69'}
  let s:orange  = {'t': s:ansi_colors ? 10 : (s:tty ? '1' : 136), 'g': '#b67800'}
  let s:yellow  = {'t': s:ansi_colors ? 3 : (s:tty ? '3' : 100), 'g': '#768f00'}
  let s:green   = {'t': s:ansi_colors ? 2 : (s:tty ? '2' : 28), 'g': '#009e3c'}
  let s:cyan    = {'t': s:ansi_colors ? 6 : (s:tty ? '6' : 37), 'g': '#00a39a'}
  let s:purple  = {'t': s:ansi_colors ? 13 : (s:tty ? '5' : 99), 'g': '#976ce2'}
  let s:magenta = {'t': s:ansi_colors ? 5 : (s:tty ? '5' : 170), 'g': '#d74bb9'}

if s:background=="dark"
    let s:baseback0  = s:base00
    let s:baseback1  = s:base01
    let s:basecolor0 = s:base10
    let s:basecolor1 = s:base11
    let s:basecolor2 = s:base20
    let s:basecolor3 = s:base21
    let s:basefore0  = s:base30
    let s:basefore1  = s:base31
endif

if s:background=="light"
    let s:baseback0  = s:base31
    let s:baseback1  = s:base30
    let s:basecolor0 = s:base11
    let s:basecolor1 = s:base10
    let s:basecolor2 = s:base21
    let s:basecolor3 = s:base20
    let s:basefore0  = s:base00
    let s:basefore1  = s:base01
endif






""""""""""""""""""""""""""""""""""""""""""""""""
" Simple mappings
""""""""""""""""""""""""""""""""""""""""""""""""
" Normal mode
let s:N1 = [s:baseback1, s:basecolor1, '']
let s:N2 = [s:basecolor1, s:basecolor0, '']
let s:N3 = [s:basecolor1, s:baseback1, '']
let s:NF = [s:orange, s:N3[1], '']
let s:NW = [s:base31, s:orange, '']
let s:NM = [s:base21, s:N3[1], '']
let s:NMi = [s:base30, s:N3[1], '']

" Insert mode
let s:I1 = [s:N1[0], s:green, '']
let s:I2 = s:N2
let s:I3 = s:N3
let s:IF = s:NF
let s:IM = s:NM

" Visual mode
let s:V1 = [s:N1[0], s:purple, '']
let s:V2 = s:N2
let s:V3 = s:N3
let s:VF = s:NF
let s:VM = s:NM

" Replace mode
let s:R1 = [s:N1[0], s:red, '']
let s:R2 = s:N2
let s:R3 = s:N3
let s:RM = s:NM
let s:RF = s:NF

" Inactive
let s:IA = [s:basecolor0, s:baseback1, '']



""""""""""""""""""""""""""""""""""""""""""""""""
"   Actual mappings
" WARNING: Don't modify this section unless necessary.
""""""""""""""""""""""""""""""""""""""""""""""""
  let s:NFa = [s:NF[0].g, s:NF[1].g, s:NF[0].t, s:NF[1].t, s:NF[2]]
  let s:IFa = [s:IF[0].g, s:IF[1].g, s:IF[0].t, s:IF[1].t, s:IF[2]]
  let s:VFa = [s:VF[0].g, s:VF[1].g, s:VF[0].t, s:VF[1].t, s:VF[2]]
  let s:RFa = [s:RF[0].g, s:RF[1].g, s:RF[0].t, s:RF[1].t, s:RF[2]]

  let g:airline#themes#bluedrake#palette.accents = {
        \ 'red': s:NFa,
        \ }

  let g:airline#themes#bluedrake#palette.inactive = airline#themes#generate_color_map(
        \ [s:IA[0].g, s:IA[1].g, s:IA[0].t, s:IA[1].t, s:IA[2]],
        \ [s:IA[0].g, s:IA[1].g, s:IA[0].t, s:IA[1].t, s:IA[2]],
        \ [s:IA[0].g, s:IA[1].g, s:IA[0].t, s:IA[1].t, s:IA[2]])
  let g:airline#themes#bluedrake#palette.inactive_modified = {
        \ 'airline_c': [s:NM[0].g, '', s:NM[0].t, '', s:NM[2]]}

  let g:airline#themes#bluedrake#palette.normal = airline#themes#generate_color_map(
        \ [s:N1[0].g, s:N1[1].g, s:N1[0].t, s:N1[1].t, s:N1[2]],
        \ [s:N2[0].g, s:N2[1].g, s:N2[0].t, s:N2[1].t, s:N2[2]],
        \ [s:N3[0].g, s:N3[1].g, s:N3[0].t, s:N3[1].t, s:N3[2]])

  let g:airline#themes#bluedrake#palette.normal.airline_warning = [
        \ s:NW[0].g, s:NW[1].g, s:NW[0].t, s:NW[1].t, s:NW[2]]

  let g:airline#themes#bluedrake#palette.normal_modified = {
        \ 'airline_c': [s:NM[0].g, s:NM[1].g,
        \ s:NM[0].t, s:NM[1].t, s:NM[2]]}

  let g:airline#themes#bluedrake#palette.normal_modified.airline_warning =
        \ g:airline#themes#bluedrake#palette.normal.airline_warning

  let g:airline#themes#bluedrake#palette.insert = airline#themes#generate_color_map(
        \ [s:I1[0].g, s:I1[1].g, s:I1[0].t, s:I1[1].t, s:I1[2]],
        \ [s:I2[0].g, s:I2[1].g, s:I2[0].t, s:I2[1].t, s:I2[2]],
        \ [s:I3[0].g, s:I3[1].g, s:I3[0].t, s:I3[1].t, s:I3[2]])

  let g:airline#themes#bluedrake#palette.insert.airline_warning =
        \ g:airline#themes#bluedrake#palette.normal.airline_warning

  let g:airline#themes#bluedrake#palette.insert_modified = {
        \ 'airline_c': [s:IM[0].g, s:IM[1].g,
        \ s:IM[0].t, s:IM[1].t, s:IM[2]]}

  let g:airline#themes#bluedrake#palette.insert_modified.airline_warning =
        \ g:airline#themes#bluedrake#palette.normal.airline_warning

  let g:airline#themes#bluedrake#palette.visual = airline#themes#generate_color_map(
        \ [s:V1[0].g, s:V1[1].g, s:V1[0].t, s:V1[1].t, s:V1[2]],
        \ [s:V2[0].g, s:V2[1].g, s:V2[0].t, s:V2[1].t, s:V2[2]],
        \ [s:V3[0].g, s:V3[1].g, s:V3[0].t, s:V3[1].t, s:V3[2]])

  let g:airline#themes#bluedrake#palette.visual.airline_warning =
        \ g:airline#themes#bluedrake#palette.normal.airline_warning

  let g:airline#themes#bluedrake#palette.visual_modified = {
        \ 'airline_c': [s:VM[0].g, s:VM[1].g,
        \ s:VM[0].t, s:VM[1].t, s:VM[2]]}

  let g:airline#themes#bluedrake#palette.visual_modified.airline_warning =
        \ g:airline#themes#bluedrake#palette.normal.airline_warning

  let g:airline#themes#bluedrake#palette.replace = airline#themes#generate_color_map(
        \ [s:R1[0].g, s:R1[1].g, s:R1[0].t, s:R1[1].t, s:R1[2]],
        \ [s:R2[0].g, s:R2[1].g, s:R2[0].t, s:R2[1].t, s:R2[2]],
        \ [s:R3[0].g, s:R3[1].g, s:R3[0].t, s:R3[1].t, s:R3[2]])

  let g:airline#themes#bluedrake#palette.replace.airline_warning =
        \ g:airline#themes#bluedrake#palette.normal.airline_warning

  let g:airline#themes#bluedrake#palette.replace_modified = {
        \ 'airline_c': [s:RM[0].g, s:RM[1].g,
        \ s:RM[0].t, s:RM[1].t, s:RM[2]]}

  let g:airline#themes#bluedrake#palette.replace_modified.airline_warning =
        \ g:airline#themes#bluedrake#palette.normal.airline_warning

  let g:airline#themes#bluedrake#palette.tabline = {}

  let g:airline#themes#bluedrake#palette.tabline.airline_tab = [
        \ s:I2[0].g, s:I2[1].g, s:I2[0].t, s:I2[1].t, s:I2[2]]

  let g:airline#themes#bluedrake#palette.tabline.airline_tabtype = [
        \ s:N2[0].g, s:N2[1].g, s:N2[0].t, s:N2[1].t, s:N2[2]]
endfunction

call airline#themes#bluedrake#refresh()
