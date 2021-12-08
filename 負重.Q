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
MacroID=d6b49472-7494-48ac-b196-aa5a716a8b9b
Description=負重
Enable=0
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
Hwnd1 = Plugin.Window.MousePoint()

Do
	weeee = Plugin.Memory.Read32Bit(Hwnd1, &H011040B8)
	If Val_inst >= 6900 Then 
		Call Plugin.Bkgnd.KeyPress(Hwnd1, 112)
		EndScript
	Else 
		Call Plugin.Msg.Tips("負重" & weeee & "檢測完成!")
		Delay 5000
	End If
Loop
