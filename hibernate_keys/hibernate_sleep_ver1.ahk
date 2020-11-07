#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

!+z::
Sleep 100 ; Alt-shift-z
DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 0) ; DLL call to hibernate
Return

!+x::
Sleep 100 ; Alt-shift-x
DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0) ; DLL call to sleep

Return
