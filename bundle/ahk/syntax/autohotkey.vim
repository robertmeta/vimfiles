" Vim syntax file

" Language:   Autohotkey from www.autohotkey.com
" Maintainer:   Jose Quesada (quesada AT gmail DOT com)
" based on previous versions:
" savage - kallen19918 AT earthlink DOT net
" Nikolai Weibull <now@bitwi.se>

" best used with pspad.vim colors scheme

"Usage:
"1) Copy this file into your $VIM/syntax directory.
"2) Add this line to filetype.vim:
"au BufNewFile,BufRead *.ahk setf ahk



" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" add the ; for ahk comments to work well (wrap and continue)
set comments=s1:/*,mb:*,ex:*/,:;

" !,^,+,&,<,>
sy case ignore

sy keyword ahkKeyword A ahk_exe ahk_id ahk_pid ahk_class ahk_group ahk_parent true false

" this is a great hack by savage. The problem is that it colors whatever you are
" writing in ahkFunction color, and then it turns normal when you leave. Very
" distracting. The solution is less elegant: list all posible ahk commands,
" which we do next.

" sy match ahkFunction "^\s*\w\{1,},"
" sy match ahkFunction "\w\{1,}," contained
" sy match ahkFunction "^\s*\w\{1,}\s*$" contains=ahkStatement
" sy match ahkFunction "\w\{1,}\s*$" contained
syn keyword ahkFunction
    \ Abs ACos Asc ASin ATan AutoTrim BlockInput Break Catch Ceil Chr
    \ Click ClipboardTimeout ClipWait CommentFlag ComObjActive ComObjArray ComObjConnect ComObjCreate ComObjEnwrap ComObjError ComObjFlags
    \ ComObjGet ComObjMissing ComObjParameter ComObjQuery ComObjType ComObjUnwrap ComObjValue Continue Control ControlClick ControlFocus
    \ ControlGet ControlGetFocus ControlGetPos ControlGetText ControlMove ControlSend ControlSendRaw ControlSetText CoordMode Cos Critical
    \ DetectHiddenText DetectHiddenWindows DllCall Drive DriveGet DriveSpaceFree Edit Else EnvAdd EnvDiv EnvGet
    \ EnvMult EnvSet EnvSub EnvUpdate ErrorStdOut EscapeChar Exit ExitApp Exp FileAppend FileCopy
    \ FileCopyDir FileCreateDir FileCreateShortcut FileDelete FileEncoding FileExist FileGetAttrib FileGetShortcut FileGetSize FileGetTime FileGetVersion
    \ FileInstall FileMove FileMoveDir FileOpen FileRead FileReadLine FileRecycle FileRecycleEmpty FileRemoveDir FileSelectFile FileSelectFolder
    \ FileSetAttrib FileSetTime Finally Floor For Format FormatTime Func GetKeyName GetKeySC GetKeyState
    \ GetKeyVK Gosub Goto GroupActivate GroupAdd GroupClose GroupDeactivate Gui GuiControl GuiControlGet Hotkey
    \ HotkeyInterval HotkeyModifierTimeout Hotstring IfEqual IfExist IfGreater IfGreaterOrEqual IfInString IfLess
    \ IfLessOrEqual IfMsgBox IfNotEqual IfNotInString IfTimeout IfWinActive IfWinExist IfWinNotActive IfWinNotExist ImageSearch Include
    \ IniDelete IniRead IniWrite Input InputBox InputLevel InstallKeybdHook InstallMouseHook InStr IsByRef IsFunc
    \ IsLabel IsObject KeyHistory KeyWait ListHotkeys ListLines ListVars Ln Log LTrim
    \ MaxHotkeysPerInterval MaxMem MaxThreads MaxThreadsBuffer MaxThreadsPerHotkey Menu MenuMaskKey Mod MouseClick MouseClickDrag MouseGetPos
    \ MouseMove MsgBox NoEnv NoTrayIcon numget NumGet numput NumPut OnExit OnMessage OutputDebug
    \ Pause Persistent PixelGetColor PixelSearch PostMessage Process Progress Random RegDelete RegExMatch RegExReplace
    \ RegisterCallback RegRead RegWrite Reload Return Round Run RunAs RunWait Send SendEvent
    \ SendInput SendLevel SendMessage SendMode SendPlay SendRaw SetBatchLines SetCapslockState SetControlDelay SetDefaultMouseSpeed SetEnv
    \ SetFormat SetKeyDelay SetMouseDelay SetNumlockState SetNumScrollCapsLockState SetRegView SetScrollLockState SetStoreCapslockMode SetTimer SetTitleMatchMode SetWinDelay
    \ SetWorkingDir Shutdown Sin SingleInstance Sleep Sort SoundBeep SoundGet SoundGetWaveVolume SoundPlay SoundSet
    \ SoundSetWaveVolume SplashImage SplashTextOff SplashTextOn SplitPath Sqrt StatusBarGetText StatusBarWait StrGet StringCaseSense StringGetPos
    \ StringLeft StringLen StringLower StringMid StringReplace StringRight StringSplit StringTrimLeft StringTrimRight StringUpper StrLen
    \ StrPut SubStr Suspend SysGet Tan Thread Throw ToolTip Transform TrayTip Trim
    \ Try Until UrlDownloadToFile URLDownloadToFile UseHook VarSetCapacity Warn While-loop WinActivate
    \ WinActivateBottom WinActivateForce WinActive WinClose WinExist WinGet WinGetActiveStats WinGetActiveTitle WinGetClass WinGetPos
    \ WinGetText WinGetTitle WinHide WinKill WinMaximize WinMenuSelectItem WinMinimize WinMinimizeAll WinMinimizeAllUndo WinMove WinRestore
    \ WinSet WinSetTitle WinShow WinWait WinWaitActive WinWaitClose WinWaitNotActive ScriptName

" these are user-defined functions, in dark green
sy match ahkNewFunction "\s*\w\{1,}(.*)"
sy match ahkNewFunctionParams "(\@<=.*)\@=" containedin=ahkNewFunction

sy match ahkEscape "`." containedin=ahkFunction,ahkLabel,ahkVariable,ahkNewFunctionParams

sy match ahkVariable "%.\{-}%" containedin=ahkNewFunctionParams
sy match ahkVariable "%.\{-}%"
sy match ahkKey "[!#^+]\{1,4}`\=.\n" contains=ahkEscape
sy match ahkKey "[!#^+]\{0,4}{.\{-}}"

sy match ahkDirective "^#[a-zA-Z]\{2,\}"

sy match ahkLabel "^\w\+:\s*$"
sy match ahkLabel "^[^,]\+:\{2\}\(\w\+,\)\="  contains=ahkFunction
sy match ahkLabel "^[^,]\+:\{2\}\w\+\s*$" contains=ahkFunction
sy match ahkLabel "^:.\+:.*::"
sy keyword ahkLabel return containedin=ahkFunction

sy match ahkStatement "^\s*if\w*\(,\)\="
sy keyword ahkStatement If Else Loop Loop, exitapp containedin=ahkFunction

sy match ahkComment "`\@<!;.*" contains=NONE
sy match ahkComment "\/\*\_.\{-}\*\/" contains=NONE

sy keyword ahkBuiltinVariable
    \ A_AhkPath A_AhkVersion A_AppData A_AppDataCommon A_AutoTrim A_BatchLines A_CaretX A_CaretY A_ComputerName A_ControlDelay A_Cursor
    \ A_DD A_DDD A_DDDD A_DefaultMouseSpeed A_Desktop A_DesktopCommon A_DetectHiddenText A_DetectHiddenWindows A_EndChar A_EventInfo A_ExitReason
    \ A_FormatFloat A_FormatInteger A_Gui A_GuiControl A_GuiControlEvent A_GuiEvent A_GuiHeight A_GuiWidth A_GuiX A_GuiY A_Hour
    \ A_IconFile A_IconHidden A_IconNumber A_IconTip A_Index A_IPAddress1 A_IPAddress2 A_IPAddress3 A_IPAddress4 A_IsAdmin A_IsCompiled
    \ A_IsCritical A_IsPaused A_IsSuspended A_KeyDelay A_Language A_LastError A_LineFile A_LineNumber A_LoopField A_LoopFileName A_LoopFileName, etc.
    \ A_LoopReadLine A_LoopRegName A_LoopRegName, etc. A_Min A_MM A_MMM A_MMMM A_MouseDelay A_MSec A_MyDocuments A_Now
    \ A_NowUTC A_OSType A_OSVersion A_PriorHotkey A_ProgramFiles A_Programs A_ProgramsCommon A_ScreenHeight A_ScreenWidth A_ScriptDir A_ScriptFullPath
    \ A_ScriptName A_Sec A_Space A_StartMenu A_StartMenuCommon A_Startup A_StartupCommon A_STringCaseSense A_StringCaseSense A_Tab A_Temp
    \ A_ThisFunc A_thisFunc A_ThisHotkey A_thisLabel A_ThisLabel A_ThisMenu A_ThisMenuItem A_ThisMenuItemPos A_TickCount A_TimeIdle A_TimeIdlePhysical
    \ A_TimeSincePriorHotkey A_TimeSinceThisHotkey A_TitleMatchMode A_TitleMatchModeSpeed A_UserName A_WDay A_WinDelay A_WinDir A_WorkingDir A_YDay A_YWeek
    \ A_YYYY Clipboard ClipboardAll ComSpec ErrorLevel ProgramFiles
    \ LButton RButton MButton WheelDown WheelUp WheelLeft WheelRight XButton1 XButton2 Space Tab
    \ Enter Return Escape Esc Backspace BS Delete Del Insert Ins Home
    \ End PgUp PgDn Up Down Left Right ScrollLock CapsLock NumLock Numpad0
    \ Numpad1 Numpad2 Numpad3 Numpad4 Numpad5 Numpad6 Numpad7 Numpad8 Numpad9 NumpadDot NumpadDiv
    \ NumpadMult NumpadAdd NumpadSub NumpadEnter F1 F2 F3 F4 F5 F6 F7
    \ F8 F9 F10 F11 F12 F13 F14 F15 F16 F17 F18
    \ F19 F20 F21 F22 F23 F24 LWin RWin Control Ctrl Alt
    \ Shift LControl LCtrl RControl LShift RShift LAlt RAlt PrintScreen CtrlBreak Pause
    \ Break Help Sleep Browser_Back Browser_Forward Browser_Refresh Browser_Stop Browser_Search Browser_Favorites Browser_Home Volume_Mute
    \ Volume_Down Volume_Up Media_Next Media_Prev Media_Stop Media_Play_Pause Launch_Mail Launch_Media Launch_App1 Launch_App2 Joystick
    \ Joy1 Joy2 Joy3 Joy4 Joy5 Joy6 Joy7 Joy8 Joy9 Joy10 Joy11
    \ Joy12 Joy13 Joy14 Joy15 Joy16 Joy17 Joy18 Joy19 Joy20 Joy21 Joy22
    \ Joy23 Joy24 Joy25 Joy26 Joy27 Joy28 Joy29 Joy30 Joy31 Joy32 

sy match ahkBuiltinVariable
    \ contained
    \ display
    \ '%\d\+%'

syn region ahkString
    \ display
    \ oneline
    \ matchgroup=autohotkeyStringDelimiter
    \ start=+"+
    \ end=+"+
    \ contains=ahkEscape

" relative
syn keyword ahkRelative
    \ Pixel Mouse Screen Relative RGB

" Continuation sections:
syn keyword ahkContinuation
    \ LTrim RTrim Join

" Priority of processes
syn keyword ahkPriority
    \ Low BelowNormal Normal AboveNormal High Realtime

" Keywords inside the WinTitle parameter of various commands:
syn keyword ahkWinTitle
    \ ahk_id ahk_pid ahk_class ahk_group

" Used with SetFormat and/or -if Var is [not] type- & BETWEEN/IN
"syn keyword ahkSetFormatFamily
"	\ Between Contains In Is Integer Float Number Digit Xdigit Alpha Upper Lower Alnum Time Date

" Expression keywords:
syn keyword ahkLogicOperators
    \ Not Or And

" Used with Drive/DriveGet and/or WinGet/WinSet:
syn keyword ahkWingetFamily
    \ AlwaysOnTop Topmost Top Bottom Transparent TransColor Redraw Region ID IDLast ProcessName
    \ MinMax ControlList Count List Capacity StatusCD Eject Lock Unlock Label FileSystem Label
    \ SetLabel Serial Type Status

" For functions:
syn keyword ahkScopes
	\ static global local ByRef

" Time units for use with addition and subtraction:
syn keyword ahkTimeUnits
	\ Seconds Minutes Hours Days

" For use with the Loop command:
syn keyword ahkLoop
	\ Read Parse

" A_ExitReason
syn keyword ahkExitReasons
	\ Logoff Close Error Single

" Keywords used with the "menu" command:
syn keyword ahkMenuCommand
	\ Tray Add Rename Check UnCheck ToggleCheck Enable Disable ToggleEnable
	\ Default NoDefault Standard NoStandard Color Delete DeleteAll Icon NoIcon Tip
	\ Click Show MainWindow NoMainWindow UseErrorLevel

" Gui control types (note that Edit, Progress and Hotkey aren't included since they are already command keywords):
syn keyword ahkGUIcontrol
	\ Text Picture Pic GroupBox Button Checkbox Radio DropDownList DDL ComboBox
	\ ListBox ListView DateTime MonthCal Slider StatusBar Tab Tab2 TreeView UpDown

" ListView:
syn keyword ahkListView
	\ IconSmall Tile Report SortDesc NoSort NoSortHdr Grid Hdr AutoSize Range

" General GUI keywords:
syn keyword ahkGeneralGUI
	\ xm ym ys xs xp yp Font Resize Owner Submit NoHide Minimize Maximize Restore
	\ NoActivate NA Cancel Destroy Center Margin MaxSize MinSize OwnDialogs GuiEscape
	\ GuiClose GuiSize GuiContextMenu GuiDropFiles TabStop Section AltSubmit Wrap
	\ HScroll VScroll Border Top Bottom Buttons Expand First ImageList Lines
	\ WantCtrlA WantF2 Vis VisFirst Number Uppercase Lowercase Limit Password Multi
	\ WantReturn Group Background bold italic strike underline norm BackgroundTrans
	\ Theme Caption Delimiter MinimizeBox MaximizeBox SysMenu ToolWindow Flash
	\ Style ExStyle Check3 Checked CheckedGray ReadOnly Password Hidden Left
	\ Right Center NoTab Section Move Focus Hide Choose ChooseString Text Pos
	\ Enabled Disabled Visible LastFound LastFoundExist

" Keywords used with the Hotkey command:
syn keyword ahkHotkeyCommand
	\ AltTab ShiftAltTab AltTabMenu AltTabAndMenu AltTabMenuDismiss

" Keywords used with the Thread/Process commands
syn keyword ahkThread
	\ NoTimers Interrupt Priority WaitClose Wait Exist Close

" Keywords used with the Transform command:
syn keyword ahkTransformCommand
	\ Unicode Asc Chr Deref Mod Pow Exp Sqrt Log Ln Round Ceil Floor Abs Sin Cos Tan ASin
	\ ACos ATan BitNot BitAnd BitOr BitXOr BitShiftLeft BitShiftRight

" Keywords used with "IfMsgBox" ("continue" is not present here because it's a command too):
syn keyword ahkButtons
	\ Yes No Ok Cancel Abort Retry Ignore TryAgain

" Misc. eywords used with various commands:
syn keyword ahkOn
	\ On Off All

" Registry root keys:
syn keyword ahkRegistry
	\ HKEY_LOCAL_MACHINE HKEY_USERS HKEY_CURRENT_USER HKEY_CLASSES_ROOT HKEY_CURRENT_CONFIG
	\ HKLM HKU HKCU HKCR HKCC REG_SZ REG_EXPAND_SZ REG_MULTI_SZ REG_DWORD REG_BINARY

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
hi def link ahkKeyword Special
hi def link ahkEscape Special
hi def link ahkComment Comment
hi def link ahkStatement Conditional
hi def link ahkFunction Keyword
hi def link ahkDirective PreProc "sent keys
hi def link ahkLabel Label
hi def link ahkKey Special
hi def link ahkVariable Constant "this is anything enclosed in %%
hi def link ahkNewFunction Function
hi def link ahkBuiltinVariable Macro
hi def link ahkString String
hi def link ahkScope Type
hi def link ahkOtherCommands Typedef
hi def link ahkRelative ahkOtherCommands
hi def link ahkContinuation ahkOtherCommands
hi def link ahkPriority ahkOtherCommands
hi def link ahkWinTitle ahkOtherCommands
hi def link ahkSetFormatFamily ahkOtherCommands
hi def link ahkLogicOperators ahkOtherCommands
hi def link ahkWingetFamily ahkOtherCommands
hi def link ahkScopes ahkOtherCommands
hi def link ahkTimeUnits ahkOtherCommands
hi def link ahkLoop ahkOtherCommands
hi def link ahkExitReasons ahkOtherCommands
hi def link ahkMenuCommand ahkOtherCommands
hi def link ahkGUIcontrol ahkOtherCommands
hi def link ahkListView ahkOtherCommands
hi def link ahkGeneralGUI ahkOtherCommands
hi def link ahkHotkeyCommand ahkOtherCommands
hi def link ahkThread ahkOtherCommands
hi def link ahkTransformCommand ahkOtherCommands
hi def link ahkButtons ahkOtherCommands
hi def link ahkOn ahkOtherCommands
hi def link ahkRegistry ahkOtherCommands

sy sync fromstart
let b:current_syntax = "ahk"
