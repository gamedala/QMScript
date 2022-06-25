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
MacroID=b10f643c-1774-4871-b673-2dc75d5c60b1
Description=reacheeE
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
DimEnv 時間, 檢查
BeginThread 長度檢查
Delay 300
Call 大漠()
Delay 100
Do
    //找到腳
    dm_ret = dm.FindColor(20,828,33,840,"060606-000000",1,0,intX,intY)
    If intX > 0 And intY > 0 Then 
        TracePrint "檢查"
        檢查 = 1
        If 時間 > 1 Then 
        	TracePrint "按下去"&時間
        	//dm.MoveTo 380, 1200
        	//dm.LeftDown
        	dm.KeyDown 32

        	Call 時間檢查()
        	起始時間 = 目前時間
        	Do
        		Call 時間檢查()
        	Loop Until 時間 <= 目前時間-起始時間
        	TracePrint "已經按了"&目前時間-起始時間
        	時間 = 0
        	檢查 = 0
        	dm.KeyUp 32
        End If
    End If
    Delay 2000
Loop

Sub 長度檢查()
    Call 大漠()
    Delay 100
    Do
        dm_ret = dm.FindColor(49, 893,720, 894,"ffee00-505050",1.0,0,intX,intY)
        If intX > 0 And intY > 0 And 檢查 = 1 Then 
        	s = dm.Ocr(357, 1045, 426, 1086, "000000-101010", 0.9)
        	If s = "" Then 
        		s = 1
        	End If
            長度 = int((intX - 40) / s)
            時間 = int(3.14 * 長度)
            TracePrint "長度: " & 長度 & " 時間: " & 時間
        End If
        Delay 20
    loop
End Sub

Function 時間檢查()
	Set sc = CreateObject("MSScriptControl.ScriptControl")
	sc.Language = "JavaScript"
	目前時間 = sc.eval ("new Date().getTime();")
End Function

Function 大漠()
    set dm = createobject("dm.dmsoft")
    base_path = dm.GetBasePath()
    dm_ret = dm.SetPath(base_path)
	dm_ret = dm.SetDict(0,"測試.txt")
    模擬器 = Plugin.Window.MousePoint()
    TracePrint "綁定視窗:" & 模擬器
    dm_ret = dm.BindWindow(模擬器,"gdi","windows","windows",0)
    TracePrint "綁定是否成功:" & dm_ret
End Function
