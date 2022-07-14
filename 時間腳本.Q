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
Do
	時間戳 = DateDiff("s", "1970/01/01 00:00:00", Now) - 28800
	Call 毫秒
	If 時間戳 <> 時間 Then 
		時間 = 時間戳
		TracePrint 時間戳
	End If
	If mstime <> mstime2 Then 
		mstime2 = mstime
		TracePrint mstime - (時間戳*1000)
	End If
	Delay 100
Loop

Sub 毫秒()
	Set sc = CreateObject("MSScriptControl.ScriptControl")
	sc.Language = "JavaScript"
	mstime = sc.eval ("new Date().getTime();")
End Sub

