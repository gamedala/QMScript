[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=1800edc6-3b29-4532-944d-3baf8b5c257a
Description=Proxifier
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
Hwnd = Plugin.Window.Find(0, "Proxifier")
TracePrint "Menu" & Hwnd
HwndEx = Plugin.Window.FindEx(Hwnd, 0, 0, "Menu Bar")
TracePrint HwndEx
//Call Plugin.Bkgnd.KeyPress(8916066, 39)
//Call Plugin.Bkgnd.KeyPress(8916066, 39)
Hwnd2 = Plugin.Window.Find(0, "Proxification Rules")
TracePrint "Menu2" & Hwnd2
HwndEx2 = Plugin.Window.FindEx(Hwnd2, 0, "msctls_updown32", "")
TracePrint HwndEx2
HwndEx3 = Plugin.Window.FindEx(Hwnd2, 0, "SysListView32", "")
TracePrint HwndEx3
HwndEx4 = Plugin.Window.FindEx(HwndEx3, 0, "ComboBox", "")
TracePrint HwndEx4


Call Plugin.Bkgnd.KeyPress(HwndEx4, 13)

Call Plugin.Bkgnd.KeyPress(HwndEx4, 40)