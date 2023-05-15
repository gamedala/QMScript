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
MacroID=1e296bfc-1bf2-4304-8650-a1003f3d0141
Description=自動刮刮樂
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
Call set_dm
Set sc = CreateObject("MSScriptControl.ScriptControl")
sc.Language = "JavaScript"
時間檢查 = sc.eval("new Date().getTime();")
Delay 100
Do
	當前時間 = sc.eval("new Date().getTime();")
	If 當前時間 + 10000 >= 冷卻時間 and 當前時間 >= 使用時間 Then 
    	dm.KeyDown 112
    	dm.KeyUp 112
    	使用時間 = sc.eval("new Date().getTime();") + 1000
    	TracePrint "使用時間=" & (使用時間 - sc.eval("new Date().getTime();"))/1000
    	Delay 100
    	s = dm.Ocr(240, 707, 265, 720, "b5ffb5-000000", 0.9)
    	If s <> "" Then 
    		If int(s) > 0 Then 
        		冷卻時間 = sc.eval("new Date().getTime();") + (s * 60000)
    			TracePrint "冷卻時間=" & (冷卻時間 - sc.eval("new Date().getTime();"))/1000
    		End If
    	End If
	End If
Loop

Function set_dm()
    Set dm = createobject("dm.dmsoft")
    base_path = dm.GetBasePath() + "光雨"
    dm_ret = dm.SetPath(base_path)
    dm_ret = dm.SetDict(0, "驗證.txt")
    Hwnd = Plugin.Window.Find(0, "LoueitRoVer001 | Gepard Shield 3.0 (^-_-^)")
    dm_ret = dm.BindWindow(Hwnd, "gdi", "dx2", "dx", 4)
    TracePrint "Hwnd:" & Hwnd & " dm_ret:" & dm_ret
End Function
