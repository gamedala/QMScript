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
MacroID=be19ee24-9e42-4c1a-8edb-585566ff3407
Description=時間腳本
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
時間戳 = DateDiff("s", "1970/01/01 00:00:00", Now) - 28800
TracePrint 時間戳

Set sc = CreateObject("MSScriptControl.ScriptControl")
sc.Language = "JavaScript"
time123 = sc.eval ("new Date().getTime();")
TracePrint time123
