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
MacroID=822811b1-a876-4a8c-8ee8-b93b4aae97f4
Description=sleep
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
Declare Sub Sleep Lib "kernel32" (ByVal Milliseconds As Long)
'Declare Sub Sleep Lib "kernel32" (ByVal Milliseconds As Integer)

TracePrint "°±¤î"
sleep(5000)
TracePrint "¶}©l"