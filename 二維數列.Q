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
MacroID=2e4cf233-f7f4-4a29-b089-41ec9cac4709
Description=二維數列
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
Dim abc
abc = array(array(1, 2, 3), array(4, 5, 6), array(7, 8, 9))
For i = 0 To 2
	For s = 0 To 2
		TracePrint "變量" & abc(i)(s)
	Next
Next

Dim 組(3,3)
組(0,0) = 9:組(0,1) = 8:組(0,2) = 7:組(1,0) = 6:組(1,1) = 5:組(1,2) = 4:組(2,0) = 3:組(2,1) = 2:組(2,2) = 1
For i = 0 To 2
	For s = 0 To 2
		TracePrint "變量" & 組(i,s)
	Next
Next