#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance Force
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
Process, Priority, , High
SetWinDelay 0

;alt-w to reload app
!w::
Reload
return

;alt-a to add active windows
!a::
CoordMode, Mouse, Screen ; Absolute screen coord
SysGet, Msize, Monitor ; Gets monitor screensize
halfx := (MsizeRight-1)//2
MAXY := MsizeBottom-1

;WinGetActiveTitle, Title
WinGet, chosen_window, ID, A
;Create a AHK Class
GroupAdd, Doublescroll, ahk_id %chosen_window%
return

#IfWinActive ahk_group Doublescroll
WheelUp::
WheelDown::
    MouseGetPos, x, y
    if (x>halfx) ; Mouse Cursor on the right half of the screen
    {
        currhky1 := A_ThisHotkey ; use most recent hotkey, alt-a
        Send {%currhky1%} 
        GroupActivate Doublescroll
            If (currhky1 = "WheelUp" || currhky1 = "WheelDown")
            MouseMove, % halfx - 350, %y% , 0  ;x,y,speed
        Send {%currhky1%} ; Uses any free ahk
        GroupActivate Doublescroll     ; Activate previous window
        MouseMove, x, y, 0       ; Restore its mouse position
    }
    else ; Mouse Cursor on the left half of the screen
    {   
        currhky2 := A_ThisHotkey ; use most recent hotkey, alt-a
        Send {%currhky2%} ; Uses any free ahk
        GroupActivate Doublescroll
            If (currhky2 = "WheelUp" || currhky2 = "WheelDown")
            MouseMove, % halfx + 350, %y% , 0  
        Send {%currhky2%} ; Uses any free ahk
        GroupActivate Doublescroll     ; Activate previous window
        MouseMove, x, y, 0       ; Restore its mouse position
        ;SplashTextOn,90,30,MultiScroll,%x%
        ;SplashTextOff
    }
    
return

