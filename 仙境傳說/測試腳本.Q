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
MacroID=186d9e08-777a-4bd1-a1f9-c388a15215af
Description=´ú¸Õ¸}¥»
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
Hwnd = Plugin.Window.Find(0, "10393321_F")

Do
	Call Plugin.Bkgnd.KeyPress(Hwnd, 13)
	Delay 500
Loop