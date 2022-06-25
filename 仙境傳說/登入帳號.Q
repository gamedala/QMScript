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
MacroID=61f07624-c3a4-4efa-861a-7d1b86c191d1
Description=登入帳號
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
Global 次數
次數 = 0

Do
    Key=WaitKey()    
    If Key = 120 Then 
		Call 大漠()
		Delay 100
        call 登入
        TracePrint "指定視窗"
    End If
    Delay 1000
Loop

Function 登入()
    帳號 = array("10393326","10393327","10393328")
	密碼 = array("103933", "103933", "103933")
	//0=關閉 1=開啟
	提示視窗 = 1
    關鍵字 = "6666"
    Do
    	dm_ret = dm.FindStr(0, 0, 1024, 768, "光雨仙境", "0042bd-000000", 1.0, intX, intY)
    	If intX > 0 And intY > 0 Then 
    		dm.KeyPress 13
    		Delay 200
    		dm_ret = dm.FindStr(0, 0, 1024, 768, "光雨仙境", "000000-000000", 1.0, intX, intY)
    		If intX > 0 And intY > 0 Then 
    			dm.SendString2 句柄, 密碼(次數)
    			Delay 100
    			dm.KeyPress 9
    			Delay 100
    			dm.SendString2 句柄,帳號(次數)
    			次數 = 次數 + 1
    			dm.UnBindWindow
    		End If
    	End If
    Loop
End Function

Function 大漠()
    set dm = createobject("dm.dmsoft")
    base_path = dm.GetBasePath()
    dm_ret = dm.SetPath(base_path)
	dm_ret = dm.SetDict(0,"C:\dm\光雨.txt")
    句柄 = Plugin.Window.MousePoint()
    dm_ret = dm.BindWindow(句柄, "gdi", "dx2", "dx", 4)
	TracePrint "綁定視窗:" & 句柄 & "仙境傳說綁定是否成功:" & dm_ret
	if 提示視窗 = 1 Then
		MsgBox "綁定視窗:" & 句柄 & "仙境傳說綁定是否成功:" & dm_ret
	End If
End Function

Sub OnThreadExit()
	dm.UnBindWindow 
	TracePrint "[腳本停止]大漠解除綁定窗口: " & 句柄
	if 提示視窗 = 1 Then
		MsgBox "[腳本停止]大漠解除綁定窗口: " & 句柄
	End If
End Sub
