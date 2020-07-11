#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance

^l:: 
SoundSet +3 ;increase volume
return

^k:: 
SoundSet -3  ;decrease volume
return

;does not work with split tabs
Control_Spotify(option) {
#IfWinExist, ahk_class MozillaWindowClass
    WinGet, original_window, ID, A
    WinActivate ahk_class MozillaWindowClass ;activate mozilla firefox
    WinMaximize ahk_class MozillaWindowClass

    ;Get original Tab colour
    PixelSearch tabx, taby, 0, 2, 1700, 22, 0xFAF9F9 , 3, Fast

    ;get original mouse position
    MouseGetPos, CurrentX, CurrentY
    PixelGetColor, color, %CurrentX%, %CurrentY%
    ;MsgBox The color at the current cursor position is %color% at %CurrentX% %CurrentY%.

    ;Colors based on whether tab is selected
    colors := "0x61D010,0x63D710" ; parse based on comma symbol
    Loop, Parse, colors, `, {
        
        ;PixelSearch, OutputVarX, OutputVarY, X1, Y1, X2, Y2, ColorID , Variation, Mode
        PixelSearch px, py, 0, 0, 1918, 400, %A_LoopField% , 3, Fast
        if ErrorLevel {
            ; too many tabs open
            MouseMove, 1726,8
            MouseClick,Left
            Sleep, 300 ; Important to let Firefox Load Panel!

            ;click to show all firefox tabs 
            PixelSearch newx, newy, 1280, 13, 1460, 1000,0x63D710, 9, Fast
            if ErrorLevel {
                MsgBox Unable to find Tab

            }
            else {
                MouseMove, %newx%, %newy% ; move to new tab
                Sleep, 40
                MouseClick, Left
                MouseMove %option%, 1024
                MouseClick,Left
            }
            

        }
        else { ; Find the color
            MouseMove, %px%, %py% ; move mouse to color coordinates
            Sleep, 40
            MouseClick, Left
            MouseClick, Left
            MouseMove %option%, 1024
            MouseClick,Left

            

            ;Go back to original config
            MouseMove tabx, taby
            MouseClick, Left

            ;WinMaximize ahk_id %original_window%
            MouseMove, %CurrentX%, %CurrentY%

            WinActivate ahk_id %original_window% ;activate mozilla firefox
            ;WinMaximize ahk_id %original_window%
            
        }   
        
        return

    }

; forward 1013
; backward 920
; pause 970

;Ctrl-g
^g:: ; To skip a spotify song forward
Control_Spotify(1013)
return

^h:: ; To skip a spotify song forward
Control_Spotify(970)
return

^j:: ; To skip a spotify song forward
Control_Spotify(920)
return
