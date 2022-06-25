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
MacroID=9cc6674b-489f-4fc9-bfeb-d00fa97a84cb
Description=關閉按鍵精靈-熱點
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
Sub OnScriptLoad()
Delay 3000
Hwnd = Plugin.Window.SearchEx(0,"按鍵精靈 - 熱點",0)
Hwnd = Split(Hwnd, "|")//分割字串
TracePrint Hwnd
	//Hwnd = Plugin.Window.Find(0, "  按鍵精靈 - 熱點")
	If Hwnd(0) > 0 Then
		HwndEx = Plugin.Window.FindEx(Hwnd(0), 0, 0, 0)
		TracePrint HwndEx
		Call Plugin.Bkgnd.KeyPress(HwndEx, 27)
	End If
End Sub
