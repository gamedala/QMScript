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
Description=Åª¨úini
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
	HP«öÁä = Plugin.File.readINI("addrandomoptionnametable", i, "C:\dm\¥ú«B\addrandomoptionnametable.ini")
	If HP«öÁä<>""  Then 
		TracePrint i&HP«öÁä
		
	End If
Next