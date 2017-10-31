if not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"
   ExitApp
}

SetControlDelay -1

run, C:\Program Files\AutoHotkey\installer.ahk
WinWaitActive, ahk_class AutoHotkeyGUI
Send %A_Tab%
Send %A_Tab%
Send %A_Tab%
Send %A_Tab%
Send %A_Tab%
Send %A_Tab%
Send %A_Tab%
Send {Enter}

Loop {
WinWaitActive, ahk_class #32770
ControlClick, OK, ahk_class #32770
}

return
return