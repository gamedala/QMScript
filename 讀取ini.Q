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
MacroID=9385624f-ac49-46ba-9f5f-d56475787b80
Description=Ū��ini
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

For i = 1 To 600
	HP���� = Plugin.File.readINI("addrandomoptionnametable", i, "C:\dm\���B\addrandomoptionnametable.ini")
	If HP����<>""  Then 
		TracePrint i&HP����
		
	End If
Next