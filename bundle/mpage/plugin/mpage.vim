" mpage.vim
"   Author: Charles E. Campbell
"   Date:   Apr 24, 2013
"   Version: 1
" ---------------------------------------------------------------------
"  Load Once: {{{1
if &cp || exists("g:loaded_mpage")
 finish
endif
let g:loaded_mpage= "v1"
let s:keepcpo      = &cpo
set cpo&vim
"DechoRemOn

" ---------------------------------------------------------------------
"  Public Interface: {{{1
com! -bang -count=0 -nargs=?	MPage	call mpage#Pager(<bang>0,<q-args> + <count>)
com! -bang -count=1				MPN		call s:MpageNextWin(<count>,<bang>1)
com! -bang -count=1				MPP		call s:MpagePrevWin(<count>,<bang>1)
com!							MPT		call mpage#Pager(-1)

" =====================================================================
"  Functions: {{{1

" ---------------------------------------------------------------------
" mpage#Pager: {{{2
fun! mpage#Pager(...)
"  call Dfunc("mpage#Pager(...) a:0=".a:0." a:1=".a:1)

  " install maps (and save any user mappings)
  if !exists("s:mpagedict")
"   call Decho("creating s:mpagedict dictionary (initially empty)")
   let s:mpagedict  = {}
   let s:mpagecount = 0
  endif

  if a:0 > 1
   let nsplits= a:2
  else
   let nsplits= 0
  endif
"  call Decho("nsplits=".nsplits)

  if a:1 == 1
   " :MPage! : turn MultiPager off in this tab
"   call Decho("turn MultiPager off in all windows in this tab")
   echo "turning mpaging off for all windows in this tab"
   noautocmd windo if exists("w:mpage")|call s:MpageOff(bufname("%"))|endif
   call s:AutoCmdHandler()

"   call Dret("mpage#Pager : turned mpaging off for all windows in this tab")
   return

  elseif a:1 == -1
   " Toggle MultiPaging in this window

   if exists("w:mpage")
	" :MPT : turn MultiPaging off in this window
	echo "turning mpaging off in this window"
"    call Decho(" turn MultiPaging OFF for this window")
	call s:MpageOff(bufname("%"))
    call s:ReSync()

   else
	" :MPT : turn MultiPaging on in this window
"	call Decho("turn MultiPaging ON for this window")
	echo "turning mpaging on in this window"
	call s:MpageOn(bufname("%"))
    call s:ReSync()
   endif

   call s:AutoCmdHandler()
"   call Dret("mpage#Pager : toggle multipaging with current window (mpagecount=".s:mpagecount.")")
   return

  elseif nsplits == 0
   " :MPage : turn MultiPager off in all windows in this tab which display the current buffer
"   call Decho("turn MultiPager off in all windows in this tab displaying buffer<".bufname("%").">")
   let bname= bufname("%")
   noautocmd windo if exists("w:mpage") && w:mpage == bname|call s:MpageOff(bname)|endif
   call s:AutoCmdHandler()

"   call Dret("mpage#Pager : turn multipaging off all windows displaying buffer<".bufname("%")."> in this tab")
   return
  endif

  " :MPage nsplits  : turn multipaging on with given qty of nsplits
  call s:MpageOn(bufname("%"))
  call s:AutoCmdHandler()
  call s:SaveSplitSettings()
  let curwin    = winnr()
  let ivsplit   = 1
  let linestart = line("w0")
  let page      = line("w$") - line("w0") + 1
  let w:mpage   = expand("%")
  while ivsplit < nsplits
   wincmd v
   let w:mpage = expand("%")
   wincmd l
   let ivsplit = ivsplit + 1
  endwhile
  call s:RestoreSplitSettings()
  exe curwin."wincmd w"
  call s:ReSync()

"  call Dret("mpage#Pager")
endfun

" ---------------------------------------------------------------------
" s:ReSync: re-synchronize mpage windows in current tab {{{2
fun! s:ReSync()
"  call Dfunc("s:ReSync() mode<".mode().">")
  if !exists("w:mpage")
"   call Dret("s:ReSync")
   return
  endif
  if mode() =~ "[\<c-v>Vv]"
   " seems that RestoreWinPosn() doesn't work right in visual mode
"   call Dret("s:ReSync")
   return
  endif
  set lz
  let eikeep    = &ei
  set ei=CursorMoved
  let swp       = SaveWinPosn(0)
  let iwin      = winnr() - 1
  let curwin    = winnr()
  let curline   = line("w0")
  let linestart = line("w0")
  let mpage     = expand("%")

  " adjust earlier windows
"  call Decho("adjust earlier windows (curwin#".winnr().")")
  while iwin >= 1
   exe iwin."wincmd w"
   if !exists("w:mpage") || expand("%") != mpage
	let iwin = iwin - 1
	continue
   endif
   let page      = line("w$") - line("w0") + 1
"   call Decho("win#".winnr()." linestart= [linestart=".linestart."]-[page=".page."]=".(linestart-page))
   let linestart = linestart - page
   if linestart < 1
	let linestart= 1
   endif
   setlocal noscb
   exe "keepj norm! ".(&scrolloff + linestart)."zt"
   let iwin = iwin - 1
  endwhile

  " adjust later windows
"  call Decho("adjust later windows (curwin#".winnr().")")
  exe curwin."wincmd w"
  let linestart = curline
  let iwin      = curwin + 1
  let prvpage   = line("w$") - line("w0") + 1
  while iwin <= winnr("$")
   exe iwin."wincmd w"
   if !exists("w:mpage") || expand("%") != mpage
	let iwin = iwin + 1
	continue
   endif
   let page   = prvpage
   let prvpage= line("w$") - line("w0") + 1
"   call Decho("win#".winnr()." linestart= [linestart=".linestart."]+[page=".page."]=".(linestart+page))
   let linestart = linestart + page
   if linestart >= line("$")
	let linestart= line("$")
   endif
   exe "keepj norm! ".(&scrolloff + linestart)."zt"
   let iwin = iwin + 1
  endwhile
  
  " restore window and position in window
  exe curwin."wincmd w"
  call RestoreWinPosn(swp)
  let &ei= eikeep
  set nolz
"  call Dret("s:ReSync")
endfun

" ---------------------------------------------------------------------
" s:ReSyncI: handles resynchronization of mpage windows during insert (but only when the line number changes) {{{2
fun! s:ReSyncI()
"  call Dfunc("s:ReSyncI()")
  if !exists("w:mpage_insertline")
   let w:mpage_insertline= line(".")
  endif
  if line(".") != w:mpage_insertline
   if exists("g:mpage_autonxtwin") && winheight(0) >= winline() && line(".") != line("$")
	norm! dd
	let curwin= winnr()
    call s:MpageNextWin(1,0)
	if curwin != winnr()
     exe "norm! \<c-y>HjO"
     call s:ReSync()
     startinsert
	endif
   endif
   let w:mpage_insertline= line(".")
   call s:ReSync()
  endif
"  call Dret("s:ReSyncI")
endfun

" ---------------------------------------------------------------------
" s:MpageNextWin: make the (qty) next MPage window the current window {{{2
"                 dowrap: whether to permit wrapping or not
fun! s:MpageNextWin(qty,dowrap)
"  "  call Dfunc("s:MpageNextWin(a:qty=".a:qty." dowrap=".dowrap.")")
  if winnr("$") == 1
"   "   call Dret("s:MpagePrevWin : only one window")
   return
  endif
  let icnt      = 0
  let wrapcount = !a:dowrap
  while icnt < a:qty
   let curwin = winnr()
"   call Decho("curwin is win#".curwin)
   let iwin   = curwin + 1
   while iwin != curwin
    if iwin > winnr("$")
	 let iwin= 1
     if wrapcount == 1
"      call Dret("s:MpageNextWin : already wrapped")
      return
     endif
	 let wrapcount = 1
     continue
    endif
	exe iwin."wincmd w"
"	call Decho("considering win#".iwin.": ".(exists("w:mpage")? "its a mpage window" : "not a mpage window"))
    if exists("w:mpage")
     break
    endif
    let iwin = iwin + 1
   endwhile
   let icnt= icnt + 1
  endwhile
"  call Dret("s:MpageNextWin")
endfun

" ---------------------------------------------------------------------
" s:MpagePrevWin: make the (qty) previous MPage window the current window {{{2
"                 dowrap: whether to permit wrapping or not
fun! s:MpagePrevWin(qty,dowrap)
"  "  call Dfunc("s:MpagePrevWin(a:qty=".a:qty." dowrap=".dowrap.")")
  if winnr("$") == 1
"   "   call Dret("s:MpagePrevWin : only one window")
   return
  endif
  let icnt      = 0
  let wrapcount = !a:dowrap
  while icnt < a:qty
   let curwin = winnr()
"   call Decho("curwin is win#".curwin)
   let iwin   = curwin - 1
   while iwin != curwin
    if iwin < 1
	 let iwin= winnr("$")
     if wrapcount == 1
"      call Dret("s:MpagePrevWin : already wrapped")
      return
     endif
	 let wrapcount = 1
     continue
    endif
	exe iwin."wincmd w"
"	call Decho("considering win#".iwin.": ".(exists("w:mpage")? "its a mpage window" : "not a mpage window"))
    if exists("w:mpage")
     break
    endif
    let iwin = iwin - 1
   endwhile
   let icnt= icnt + 1
  endwhile
"  call Dret("s:MpagePrevWin")
endfun

" ---------------------------------------------------------------------
" s:MpageDown: {{{2
fun! s:MpageDown()
"  call Dfunc("s:MpageDown()")

  norm! zR
  noautocmd windo if exists("w:mpage")|if !exists("firstwin")|let firstwin=winnr()|endif|let lastline= line("w$")|endif
"  call Decho("firstwin#".firstwin." lastline=".lastline)
  if exists("firstwin")
   exe firstwin."wincmd w"
   norm! H0
   if lastline > line("$")
	let lastline= line("$") - 1
   endif
"   call Decho("change win#".firstwin."'s first line to #".(lastline+1))
   exe (lastline + 1)
   norm! zt
   call s:ReSync()
  endif

"  call Dret("s:MpageDown")
endfun

" ---------------------------------------------------------------------
" s:MpageUp: {{{2
fun! s:MpageUp()
"  call Dfunc("s:MpageUp()")

  norm! zR
  noautocmd windo if exists("w:mpage")|if !exists("firstline")|let firstline= line("w0")|let firstwin=winnr()|endif|let lastline= line("w$")|endif
"  call Decho("firstwin#".firstwin." firstline=".firstline." lastline=".lastline)
  if exists("firstwin")
   exe firstwin."wincmd w"
   norm! H0
   let firstline= line(".") - (lastline - firstline + 1)
   if firstline <= 0
	let firstline= 1
   endif
"   call Decho("change win#".firstwin."'s first line to #".firstline)
   exe "sil! ".firstline
   norm! zt
  endif
  call s:ReSync()

"  call Dret("s:MpageUp")
endfun

" ---------------------------------------------------------------------
" s:SaveUserSettings: saves some local-to-window settings.  Multipager's modifications remain {{{2
"                     in effect until MultiPaging is turned off in the window.
"                     See s:RestoreUserSettings()
fun! s:SaveUserSettings()
"  call Dfunc("s:SaveUserSettings()")
  let s:keepfen{bufnr("%")} = &fen
  let s:keepscb{bufnr("%")} = &scb
  setl nofen noscb
"  call Dret("s:SaveUserSettings")
endfun

" ---------------------------------------------------------------------
" s:RestoreUserSettings: restores user's local-to-window settings {{{2
"                        See s:SaveUserSettings()
fun! s:RestoreUserSettings()
"  call Dfunc("s:RestoreUserSettings()")
  if exists("s:keepfen".bufnr("%"))|let &fen = s:keepfen{bufnr("%")}|unlet s:keepfen{bufnr("%")}|endif  " foldenable
  if exists("s:keepscb".bufnr("%"))|let &scb = s:keepscb{bufnr("%")}|unlet s:keepscb{bufnr("%")}|endif  " scrollbind
"  call Dret("s:RestoreUserSettings")
endfun

" ---------------------------------------------------------------------
" s:SaveSplitSettings: save user's split-oriented settings {{{2
"   These settings are changed just before MultiPager does splits
"   and are restored afterwards.
"   See s:RestoreSplitSettings()
fun! s:SaveSplitSettings()
"  call Dfunc("s:SaveSplitSettings()")
  if !exists("s:keepsb")
   let s:keepea  = &ea
   let s:keepsb  = &sb
   let s:keepspr = &spr
  endif
  setl ea nosb nospr
"  call Dret("s:SaveSplitSettings")
endfun

" ---------------------------------------------------------------------
" s:RestoreSplitSettings: restore user's split-oriented settings {{{2
"                         See s:SaveSplitSettings()
fun! s:RestoreSplitSettings()
"  call Dfunc("s:RestoreSplitSettings()")
  if exists("s:keepea") |let &ea = s:keepea |unlet s:keepea |endif  " equalalways
  if exists("s:keepsb") |let &sb = s:keepsb |unlet s:keepsb |endif  " splitbelow
  if exists("s:keepspr")|let &spr= s:keepspr|unlet s:keepspr|endif  " splitright
"  call Dret("s:RestoreSplitSettings")
endfun

" ---------------------------------------------------------------------
" s:AutoCmdHandler: {{{2
" s:mpagecount == 0: remove  MultiPage AutoCmds when s:mpagecount is ≤ 0
" s:mpagecount >  0: install MultiPage AutoCmds if currently there are no such autocmds
fun! s:AutoCmdHandler()
"  call Dfunc("s:AutoCmdHandler() s:mpagecount=",(exists("s:mpagecountcount")? s:mpagecount : "n/a"))

  if exists("s:mpagecount") && s:mpagecount > 0
   if !exists("#MPagerAutocmds")
	" install MultiPager AutoCmds
"    call Decho("install ReSync on CursorMoved events")
    augroup MPagerAutocmds
     au!
     au CursorMoved	 *	if exists("w:mpage")|call s:ReSync()|endif
     au InsertEnter	 *	if exists("w:mpage_insertline")|unlet w:mpage_insertline|endif
     au CursorMovedI *	if exists("w:mpage")|call s:ReSyncI()|endif
     au CursorHold	 *	if exists("w:mpage")|call s:ReSync()|endif
    augroup END
   endif

  elseif s:mpagecount == 0
   " remove MultiPage AutoCmds
   let s:mpagecount= 0
   if exists("#MPagerAutocmds")
    augroup MPagerAutocmds
     au!
    augroup END
    augroup! MPagerAutocmds
   endif
  endif

"  call Dret("s:AutoCmdHandler")
endfun

" ---------------------------------------------------------------------
" s:MpageOn: turns MultiPaging on for the current window {{{2
fun! s:MpageOn(bname)
"  call Dfunc("s:MpageOn(bname<".a:bname.">)")

  " enables MultiPaging by setting w:mape to the current buffer name
  " keeps track of the qty of windows under MultiPage control
  let w:mpage      = expand(a:bname)
  let s:mpagecount = s:mpagecount + 1
"  call Decho("s:mpagecount=".s:mpagecount)
"  call Decho("w:mpage     =".w:mpage)

  " keep track of how many buffers are under MultiPage control
  if !exists("s:mpagebuf".bufnr(a:bname))
   let s:mpagebuf{bufnr(a:bname)}= 1
"   call Decho("s:mpagebuf".bufnr("%")."=".s:mpagebuf{bufnr("%")}." (#1)")
   call s:SaveUserSettings()
  else
   let s:mpagebuf{bufnr(a:bname)}= s:mpagebuf{bufnr(a:bname)} + 1
   setl ea nofen noscb nosb nospr
"   call Decho("s:mpagebuf".bufnr("%")."=".s:mpagebuf{bufnr("%")}." (#2)")
  endif

  if !has_key(s:mpagedict,bufname(a:bname))
   " install MultiPager maps for buffer
   " Does this by setting up a Dictionary (s:mpagedict)
   " that maps included buffers to the number 1
"   call Decho("installing maps for buffer<".bufname("%").">")
   let s:mpagedict[bufname(a:bname)] = 1
   let sumname                       = "MPage".bufnr(a:bname)
   call SaveUserMaps("bn","<c-b>"     ,"",sumname)
   call SaveUserMaps("bn","<c-e>"     ,"",sumname)
   call SaveUserMaps("bn","<c-f>"     ,"",sumname)
   call SaveUserMaps("bn","<c-l>"     ,"",sumname)
   call SaveUserMaps("bn","<c-y>"     ,"",sumname)
   call SaveUserMaps("bn","z\<cr>"    ,"",sumname)
   call SaveUserMaps("bn","zb"        ,"",sumname)
   call SaveUserMaps("bn","zt"        ,"",sumname)
   call SaveUserMaps("bn","z-"        ,"",sumname)
   call SaveUserMaps("bn","z."        ,"",sumname)
   call SaveUserMaps("bn","zz"        ,"",sumname)
   call SaveUserMaps("bn","<PageDown>","",sumname)
   call SaveUserMaps("bn","<PageUp>"  ,"",sumname)
   noremap <silent> <buffer> <c-b>		z^
   noremap <silent> <buffer> <c-e>		<c-e>:call <SID>ReSync()<cr>
   noremap <silent> <buffer> <c-f>		z+
   noremap <silent> <buffer> <c-l>		<c-l>:call <SID>ReSync()<cr>
   noremap <silent> <buffer> <c-y>		<c-y>:call <SID>ReSync()<cr>
   noremap <silent> <buffer> z<cr>		z<cr>:call <SID>ReSync()<cr>
   noremap <silent> <buffer> zb			zb:call <SID>ReSync()<cr>
   noremap <silent> <buffer> zt			zt:call <SID>ReSync()<cr>
   noremap <silent> <buffer> z-			z-:call <SID>ReSync()<cr>
   noremap <silent> <buffer> z.			z.:call <SID>ReSync()<cr>
   noremap <silent> <buffer> zz			zz:call <SID>ReSync()<cr>
   noremap <silent> <buffer> <PageDown>	:call <SID>MpageDown()<cr>
   noremap <silent> <buffer> <PageUp>	:call <SID>MpageUp()<cr>
  endif

"  call Dret("s:MpageOn")
endfun

" ---------------------------------------------------------------------
" s:MpageOff: turns MultiPaging off for the current window {{{2
fun! s:MpageOff(bname)
"  call Dfunc("s:MpageOff(bname<".a:bname.">)")

  if exists("w:mpage")
   unlet w:mpage

   if exists("s:mpagecount")
    let s:mpagecount= s:mpagecount - 1
	if s:mpagecount < 0
	 let s:mpagecount= 0
	endif
"   else " Decho
"	call Decho("s:mpagecount didn't exist")
   endif

   let bname= bufname("%")
   if exists("s:mpagebuf".bufnr(bname))
    let s:mpagebuf{bufnr(bname)}= s:mpagebuf{bufnr(bname)} - 1
    if s:mpagebuf{bufnr(bname)} <= 0
	 " restore maps from MultiPager style to User's original
     call RestoreUserMaps("MPage".bufnr(bname))
     call s:RestoreUserSettings()
	 unlet s:mpagebuf{bufnr(a:bname)}
	endif
"   else " Decho
"	call Decho("s:mpagebuf".bufnr(bname)." didn't exist")
   endif

  endif

"  call Dret("s:MpageOff : s:mpagecount=".s:mpagecount)
endfun

" ---------------------------------------------------------------------
"  Restore: {{{1
let &cpo= s:keepcpo
unlet s:keepcpo
" vim: ts=4 fdm=marker
