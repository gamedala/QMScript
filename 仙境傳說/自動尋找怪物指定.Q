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
MacroID=b8cc6211-2750-4bc5-ae7c-453ddc6f051e
Description=自動尋找怪物指定
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
DimEnv Hwnd
BeginThread 尋找怪物

Sub 尋找怪物()
	瞬移 = 113
	Call 大漠()
	Delay 100
	//主要迴圈
	Do
		dm_ret = dm.FindColor(250,170,774,598,"ffff00-000000",1.0,4,intX,intY)
		If intX > 0 and intY > 0 Then 
			TracePrint intX & "找到" & intY
			dm.MoveTo intX, intY
			//dm.KeyPress 113
			dm.LeftClick 
    		While not(killmonster)
        		Delay 500
        		If killmonster Then 
            		TracePrint "KO"
        		End If
    		Wend
    		Delay 200
		Else 
			If 尋找 = 3 Then 
				dm.KeyPress 瞬移
				尋找 = 0
			End If
			尋找 = 尋找 + 1
			TracePrint "找不到" & 尋找
			Delay 100
		End If
	Loop
End Sub

Function killmonster
    If int(Plugin.Memory.Read32Bit(Hwnd, &H7B6F6200)) = 5 Then 
        killmonster = false
    Else 
        killmonster = true
    End If
End Function

Function 時間檢查
		Set sc = CreateObject("MSScriptControl.ScriptControl")
		sc.Language = "JavaScript"
		時間檢查 = sc.eval ("new Date().getTime();")
End Function

Function 大漠()
	set dm = createobject("dm.dmsoft")
	base_path = dm.GetBasePath()
	dm_ret = dm.SetPath(base_path)
	Hwnd = Plugin.Window.MousePoint() '滑鼠指定視窗
    //Hwnd = Plugin.Window.Find(0, "Ragnarok") '窗口名稱
	dm_ret = dm.BindWindow(Hwnd, "gdi", "dx2", "dx", 4)
	TracePrint "[綁定窗口] " & Hwnd & " [綁定資訊]" & dm_ret
End Function

Sub OnThreadExit()
	dm.UnBindWindow 
	TracePrint "[腳本停止]大漠解除綁定窗口[" & Hwnd & "]"
End Sub