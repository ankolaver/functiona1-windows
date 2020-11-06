#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


^+z:: ;Ctrl-shift-z as it does not interferre with others
Send #r ;Windows-r
Sleep, 200
SendInput cmd
Send {Enter}
Sleep, 200
SendInput shutdown /h ;hibernate computer
Send {Enter}
