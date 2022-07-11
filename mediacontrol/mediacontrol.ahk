#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance

^!l:: 
SoundSet +3 ;increase volume
return

^!k:: 
SoundSet -3  ;decrease volume
return

;Ctrl-alt-g
^!g:: ; To skip a spotify song forward
Send {Media_Prev}
return

^!h:: ; To skip a spotify song forward
Send {Media_Play_Pause}
return

^!j:: ; To skip a spotify song forward
Send {Media_Next}
return
