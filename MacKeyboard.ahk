;-----------------------------------------
; Mac keyboard to Windows Key Mappings
;=========================================

; --------------------------------------------------------------
; NOTES
; --------------------------------------------------------------
; ! = ALT  
; ^ = CTRL
; + = SHIFT
; # = WIN
;
; Debug action snippet: MsgBox You pressed Control-A while Notepad is active.

#InstallKeybdHook
#SingleInstance force
SetTitleMatchMode 2
SendMode Input

; --------------------------------------------------------------
; media/function keys all mapped to the right option key
; --------------------------------------------------------------

RAlt & F7::SendInput {Media_Prev}
RAlt & F8::SendInput {Media_Play_Pause}
RAlt & F9::SendInput {Media_Next}
F10::SendInput {Volume_Mute}
F11::SendInput {Volume_Down}
F12::SendInput {Volume_Up}

; swap left command/windows key with left alt
; LWin::LAlt
; LAlt::Return ; add a semicolon in front of this line if you want to disable the windows key
LWin::Return

; Eject Key
;F20::SendInput {Insert} ; F20 doesn't show up on AHK anymore, see #3

; F13-15, standard windows mapping
F13::SendInput {PrintScreen}
F14::SendInput {ScrollLock}
F15::SendInput {Pause}

;F16-19 custom app launchers, see http://www.autohotkey.com/docs/Tutorial.htm for usage info
;F16::Run http://twitter.com
;F17::Run http://tumblr.com
;F18::Run http://www.reddit.com
;F19::Run https://facebook.com

; --------------------------------------------------------------
; OS X system shortcuts
; --------------------------------------------------------------

; Make Ctrl + S work with cmd (windows) key
LWin & s::Send ^{s}

; Selecting
LWin & a::Send ^a
; Copying
LWin & c::Send ^c

; Pasting
LWin & v::Send ^v

; Cutting
LWin & x::Send ^x

; Opening
LWin & o::Send ^o

; Finding
LWin & f::Send ^f
LWin & g::Send {F3}

; Undo
LWin & z::Send ^z

; Redo
LWin & y::Send ^y

; New tab
LWin & t::Send ^t

; close tab
LWin & w::Send ^w

; new doc
LWin & n::Send ^n

; Close windows (cmd + q to Alt + F4)
LWin & q::Send !{F4}

; minimize windows
LWin & m::WinMinimize,a

; zoom
LAlt & SC01B::Send ^{+}
LAlt & -::Send ^{-}

;^e::Send {End}
;^a::Send {Home}

;LWin & LButton::Send {Ctrl Down}{Click}{Ctrl Up}
LWin & LButton::Send ^{Click}

; REMAPS CTRL-LEFT-CLICK TO CMD AND REPLICATES OSX CTRL-CLICK RIGHT-CLICK
;LWIN & LBUTTON::send {ctrl down}{LButton}{ctrl up}
;RWIN & LBUTTON::send {ctrl down}{LButton}{ctrl up}
;CTRL & LBUTTON::send {RButton}

LWin & r::SendInput #r

; Remap Windows + Tab to Alt + Tab.
;Lwin & Tab::AltTab
;Lalt & Tab::Send !{Tab}
;Lwin & Tab::Send #{Tab}

; SUPPORT FOR BROWSER BEHAVIOR
#+n::^+n

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Cmd-Tab ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
$Tab::
vAltTabTickCount := A_TickCount
if WinActive("ahk_class TaskSwitcherWnd")
	SendInput, {Tab}
else if GetKeyState("LAlt", "P") {
	SendInput, {Alt Down}{Tab}
	SetTimer, AltTabSendTab, 50
} else 
    SendInput, {Tab}
return

AltTabSendTab:
if GetKeyState("Tab", "P") 
	vAltTabTickCount := A_TickCount
if WinActive("ahk_class TaskSwitcherWnd")
&& !(A_TickCount - vAltTabTickCount > 400)
	return
SendInput, {Alt Up}
SetTimer, AltTabSendTab, Off
return  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; switch keyboard layout
!^Space::SendInput {Ctrl UP}{LShift DOWN}

; --------------------------------------------------------------
; OS X keyboard mappings for special chars
; --------------------------------------------------------------
							
; Map Alt + L to @@
;LAlt & l::SendInput {@}

; Map Alt + N to ©
LAlt & g::SendInput {©}

; Map Alt + o to ø
LAlt & o::SendInput {ø}

; Map Alt + 5 to [
RAlt & 5::SendInput {[}
LAlt & 5::SendInput {{} 

; Map Alt + 6 to ]
RAlt & 6::SendInput {]}
LAlt & 6::SendInput {}}
RAlt & )::SendInput {]}
LAlt & )::SendInput {}}   

; Map Alt + E to €
LAlt & e::SendInput {€}

; Map Alt + - to –
;LAlt & -::SendInput {–}

; Map Alt + 8 to {
LAlt & 8::SendInput {{}

; Map Alt + 9 to }
LAlt & 9::SendInput {}}

; Map Alt + R to ®
;LAlt & r::SendInput {®}

; Map Alt + 7 to |
LAlt & 7::SendInput {|}
LAlt & l::SendInput {|}

; Map Alt + Maj + L  ## dont work open language menu...
;!+l::SendInput {|}

; Map Alt + W to ∑
LAlt & w::SendInput {∑}

; Map Alt + N to ~
LAlt & n::SendInput {~}{Space}

; Map Alt + 3 to #
LAlt & 3::SendInput {#}

#if getKeyState("LAlt")
Shift & 6::Send {^}{Space}
Shift & 7::SendInput {\}
; Shift & {:}::SendInput {\}
; select next language and open language bar...
Shift & /::SendInput {\}

#if

; --------------------------------------------------------------
; Custom mappings for special chars
; --------------------------------------------------------------

;#ö::SendInput {[} 
;#ä::SendInput {]} 

;^ö::SendInput {{} 
;^ä::SendInput {}} 

; alt-delete deletes previous word
LAlt & BS::Send {LShift down}{LCtrl down}{Left}{LShift Up}{Lctrl up}{Backspace}
^
; Navigation of smaller chunks (skip word)
LAlt & Left::Send {ctrl down}{Left}{ctrl up}
LAlt & Right::Send {ctrl down}{Right}{ctrl up}

; Navigation using of bigger chunks (Skip to start/end of line)
#Left::Send {Home}
#Right::Send {End}
#Up::Send {PgUp}
#Down::Send {PgDown}

; Selection (uses a combination of the above with shift)
^+Left::Send {shift down}{Home}}{shift up}
^+Right::Send {shift down}{End}}{shift up}
^+Up::Send {Lctrl down}{shift down}{Home}}{shift up}{Lctrl up}
^+Down::Send {Lctrl down}{shift down}{End}}{shift up}{Lctrl up}

; Start Menu
LWin & Space::Send #s

; Do not open start menu on Windows key or go to menu
;#~LAlt Up::Send {Blind}{vk07}
;#~LWin Up:: return

; Swap upper left key : ²³ and @#
vkDE::SendInput {@}
+vkDE::SendInput {#}

; Cmd+Backspace to delete files
LWin & Backspace::Send {Delete}


; --------------------------------------------------------------
; Application specific
; --------------------------------------------------------------

; Google Chrome
#IfWinActive, ahk_class Chrome_WidgetWin_1

; Show Web Developer Tools with cmd + alt + i
#!i::Send {F12}

; Show source code with cmd + alt + u
#!u::Send ^u

#IfWinActive


