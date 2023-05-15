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
MacroID=234e594d-3a1e-4c88-9954-402265c378eb
Description=¸Á»ï
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
Do
	For 5
    	Call Plugin.Media.Beep(988, 100)//¸Á»ï¤@¬í	
    	'Delay 100
	Next
	Delay 500
Loop
