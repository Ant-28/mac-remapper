#Mac Remapper

This remaps the Mac 2008 keyboard's Left Option and Left Command keys, to match Win and Alt on Windows.

![Mac Keyboard](images/mac_keyboard.jpg)

(Image source: [Xah Lee](http://xahlee.info/kbd/apple_keyboard_history.html))

Command serves as super/Windows on Windows and option serves as alt, which is flipped. To fix this, you can use `mac_remapper.ahk`.


# Requirements & Installation
First, install [AutoHotKey](https://www.autohotkey.com/). <br> Then, install the [AutoHotInterception Driver](https://github.com/evilC/AutoHotInterception).

Now, you have to check your hardware ID using `Monitor.ahk` (source: AutoHotInterception Repo).

![AHInterception Monitor](Images/monitor.png)

Pull this repo.

Click on each of the IDs (ONE AT A TIME! Click more than once and it can crash your device) and type on your keyboard until you get signals from the desired keyboard (for me, this was ID7). Note down the VID and PID.

Once you have this, modify `mac_remapper.ahk` and modify this line: <br>
`id1 := AHI.GetKeyboardId(<VID>, <PID>, 1)` <br>
With your VID and PID.

Finally, set `mac_remapper.ahk` to run on startup and you're good to go!

