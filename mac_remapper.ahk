#Requires AutoHotkey v2.0

Persistent ; (Interception hotkeys do not stop AHK from exiting, so use this)
#include Lib\AutoHotInterception.ahk

InstallKeybdHook
; Mac Remapper
; The mac 2008 keyboard has command and alt swapped so AHKInterceptor can fix that
; god bless chatgpt for actually explaining this
AHI := AutoHotInterception()
;; default values if you boot up unplugged to the device
cm1 := 0
id1 := 0

;; this needs to be run in a loop upon disconnect
A_MenuMaskKey := "vkE8"
SetTimer CheckDevice, 1000 ;; making this snappy but not too snappy or it bugs out?
return

#HotIf cm1 != 0  && cm1.IsActive

#HotIf

;; chatgpt only gave me the idea of neatly changing things into functions


CheckDevice(){
    global AHI, cm1, id1, dev ; global vars
    ;; cm1 is 0 during first connection
    ;; if it isn't active then try reconnecting. forever.
    if(cm1 == 0 || !cm1.IsActive){
        ;; get device id code
        
		dev := AHI.Instance.GetDeviceId(false, 0x05AC, 0x0204, 1) ;; get new keyboard id
		;; the device has to exist
        if(dev != 0){
        ;     ;; remove old one
        ;     if(AHI._contextManagers.Has(id1)){
        ;         AHI.RemoveContextManager(id1)
        ;     }
        ;     id1 := dev
        ;     cm1 := AHI.CreateContextManager(id1)
        AHI.SubscribeKey(dev, GetKeySC("LAlt"), true, AltEvent)
        AHI.SubscribeKey(dev, GetKeySC("LWin"), true, WinEvent)
        }

        
    }
    return
}
AltEvent(state){
   
    AHI.SendKeyEvent(dev, GetKeySC("LWin"), state)
}
WinEvent(state){
   
    AHI.SendKeyEvent(dev, GetKeySC("LAlt"), state)
}