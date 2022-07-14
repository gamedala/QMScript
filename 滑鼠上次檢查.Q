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
MacroID=bb507f0d-47ba-4f65-9a30-93abee337fd0
Description=滑鼠上次檢查
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
	If GetLastClick() = 32769 Then 
    	Call 毫秒()
    	TracePrint "按住左鍵" & mstime - 上次按鍵
    	If mstime - 上次按鍵 < 800 Then 
    		TracePrint "-------------------執行腳本"
    		上次按鍵 = 0
    	Else 
    		上次按鍵 = mstime
    	End If
    	
  	End If
  	Delay 50
Loop
Sub 毫秒()
	Set sc = CreateObject("MSScriptControl.ScriptControl")
	sc.Language = "JavaScript"
	mstime = sc.eval ("new Date().getTime();")
End Sub
