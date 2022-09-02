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
MacroID=94ec135e-a56f-4bdc-aec9-31980ee89862
Description=FB
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
Do
FindPic 4897,118,5029,157,"C:\dm\fb\msg1.bmp",0.9,intX,intY
If intX > 0 And intY > 0 Then 
	TracePrint "找到了"
	MoveTo intX, intY
	LeftClick 1
	MoveTo 0, 0
Else 
	TracePrint "找不到指定圖片1"
End If
Delay 500
FindPic 4897,118,5029,157,"C:\dm\fb\msg2.bmp",0.9,intX,intY
If intX > 0 And intY > 0 Then 
	TracePrint "找到了"
	MoveTo intX, intY
	LeftClick 1
	MoveTo 0, 0
Else 
	TracePrint "找不到指定圖片2"
End If
Loop