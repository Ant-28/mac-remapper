#Requires AutoHotkey v2.0

Persistent ; (Interception hotkeys do not stop AHK from exiting, so use this)
#include Lib\AutoHotInterception.ahk


; Mac Remapper
; The mac 2008 keyboard has command and alt swapped so AHKInterceptor can fix that
; god bless chatgpt for actually explaining this
AHI := AutoHotInterception()
InitDevice()
;; this needs to be run in a loop upon disconnect

SetTimer CheckDevice, 500 ;; making this snappy
return

#HotIf cm1.IsActive
LWin::LAlt
LAlt::LWin
#HotIf

;; chatgpt only gave me the idea of neatly changing things into functions
InitDevice(){
    global AHI, cm1, id1 ; global vars
    id1 := AHI.GetKeyboardId(0x05AC, 0x0204, 1)
    cm1 := AHI.CreateContextManager(id1)
}

CheckDevice(){
    global AHI, cm1, id1, dev ; global vars
    
    if(!cm1.IsActive){
        ;; get device id code
        
		dev := AHI.Instance.GetDeviceId(false, 0x05AC, 0x0204, 1) ;; get new keyboard id
		
        if(dev != 0){
            ;; remove old one
            AHI.RemoveContextManager(id1)
            id1 := dev
            cm1 := AHI.CreateContextManager(id1)
        }
    }
    return
}
