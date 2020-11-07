!+z::
Sleep 100 ; Alt-shift-z
DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 0) ; DLL call to hibernate
Return

!+x::
Sleep 100 ; Alt-shift-x
DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0) ; DLL call to sleep

Return

