#Requires AutoHotkey v2.0

Persistent ; (Interception hotkeys do not stop AHK from exiting, so use this)
#include Lib\AutoHotInterception.ahk


; Mac Remapper
; The mac 2008 keyboard has command and alt swapped so AHKInterceptor can fix that
; god bless chatgpt for actually explaining this
AHI := AutoHotInterception()
id1 := AHI.GetKeyboardId(0x05AC, 0x0204, 1)
cm1 := AHI.CreateContextManager(id1)
return

#HotIf cm1.IsActive
LWin::LAlt
LAlt::LWin
#HotIf
