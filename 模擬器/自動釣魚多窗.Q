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
MacroID=149a0aca-efb3-4ac5-b1d1-345094eb07d0
Description=自動釣魚多窗
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
//DimEnv Hwnds
//Hwnd = Plugin.Window.Search("雷電模擬器")
//HwndArray = Split(Hwnd, "|")
//If UBound(HwndArray) >= 0 Then
//	For i = 0 To UBound(HwndArray) - 1
//		Hwnds = Plugin.Window.FindEx(HwndArray(i), 0, "RenderWindow", 0)
//		BeginThread 釣魚多開
//		Delay 100
//	Next  
//End If

Do
    Key=WaitKey()    
    If Key = 120 Then 
        BeginThread 釣魚多開
    ElseIf Key = 119 Then
    	Exit Do
    End If
Loop


Sub 釣魚多開()
	//模擬器 = Hwnds
	Call 大漠()
	Delay 100
    Do
        dm_ret = dm.FindColor(1058, 486,1060, 487,"f9e9e0-000000",1,4,intX,intY)
        If intX >= 0 And intY >= 0  Then 
            dm.KeyPress 32
            TracePrint 模擬器 & "釣魚"
            fish = 1
        End If
        dm_ret = dm.FindColor(1058, 486,1060, 487,"d4f287-000000",0.95,4,intX,intY)
        If intX >= 0 And intY >= 0  Then 
            dm.KeyPress 32
            TracePrint 模擬器 & "拉竿"
            fish = 0
        End If
        Delay 500
    Loop
End Sub

Function 大漠()
    set dm = createobject("dm.dmsoft")
    base_path = dm.GetBasePath()
    dm_ret = dm.SetPath(base_path)
    模擬器 = Plugin.Window.MousePoint()
    dm_ret = dm.BindWindow(模擬器,"gdi","windows","windows",0)
    TracePrint "綁定視窗:" & 模擬器 & " 綁定是否成功:" & dm_ret
End Function
