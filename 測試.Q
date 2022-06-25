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
MacroID=78b9db52-df23-45db-bd24-51cb6b6247a4
Description=ด๚ธี
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
Dim arr
arr=array(array(11,12,13,14),array(21,22,23,24),array(31,32,33,34),array(41,42,43,44))
For i = 0 To UBOUND(arr)
	For j = 0 To UBOUND(arr(i))
		TracePrint arr(i)(j)
	Next
Next