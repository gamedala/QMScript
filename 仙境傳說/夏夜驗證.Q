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
MacroID=1c84daef-41b8-4e01-bfa8-3cdda8b20984
Description=夏夜驗證
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
Dim Hwnd, verify, 對話開關
Do
    Key=WaitKey()    
    If Key = 120 Then 
        BeginThread 驗證系統
    End If
Loop
Sub 驗證系統()
	
	//對話開關 自動Enter結束對話
	//00F80558對話視窗 00F8055C選單
	對話開關 = 0
	Call 大漠()
	Delay 100
	//主要迴圈
	Do
		//dm_ret = dm.FindStr(7, 676, 230, 701, "驗證啟動", "efc600-000000", 1.0, intX, intY)
		dm_ret = dm.FindStr(7, 676, 230, 701, "123456", "ffffff-000000", 1.0, intX, intY)
		//找到"驗證啟動"
		If intX > 0 And intY > 0 Then 
			Call 驗證()
		Else 
			對話視窗 = int(Plugin.Memory.Read32Bit(Hwnd, &H00F80558))
			//遇到異常對話Enter結束 AND 是否開啟對話自動Enter
			If 對話視窗 > 0 AND 對話開關 <> 0 Then 
				dm.KeyPress 13
			End If
		End If
		Delay 1000
	Loop
End Sub

Function 驗證()
	//解除綁定後綁定完全後台
	call 綁定(4)
//重置 verify
	verify = ""
//驗證
	Do
		對話視窗 = int(Plugin.Memory.Read32Bit(Hwnd, &H00F80558))
		//是否有對話視窗
		If 對話視窗 > 0 Then 
			dm_ret = dm.FindStr(0, 0, 1024, 768, "會員功能", "003163-000000", 0.95, intX, intY)
			//找到"會員功能"且 verify = ""
			If intX > 0 And intY > 0 AND verify = "" Then 
				TracePrint "找到: 會員功能"
				dm.KeyPress 13
				Delay 500
			Else 
				dm_ret = dm.FindStr(0, 0, 1024, 768, "掛驗證", "ff0000-000000", 0.95, intX, intY)
				//找到選單"掛驗證"且 verify = ""
				If intX > 0 And intY > 0 AND verify = "" Then 
					TracePrint "找到選單: 掛驗證"
					dm.KeyPress 13
					Delay 500
				Else
					dm_ret = dm.FindStr(0, 0, 1024, 768, "掛驗證", "003163-000000", 0.95, intX, intY)
					//找到對話"掛驗證"
					If intX > 0 And intY > 0 Then 
						TracePrint "找到對話: 掛驗證"
						//如果 verify = "" 才點Enter
						If verify = "" Then 
							dm.KeyPress 13
						End If
						Delay 500
						文字 = dm.Ocr(intX, intY + 18, intX + 200, intY + 37, "0000ff-000000", 0.95)
						//找到指定顏色"0000ff-000000"文字
						If 文字 <> "" Then
							TracePrint "找到驗證碼: " & 文字
							//文字解答後返回 verify
							Call 解答(文字, 0)
							Delay 250
							輸入視窗 = int(Plugin.Memory.Read32Bit(Hwnd, &H00F8067C))
							If 輸入視窗 > 0 Then 
								//自動拆解輸入 verify 之值
								call 解答(verify,1)
								dm.KeyPress 13
								Delay 50
								dm.KeyPress 13
								Delay 50
								//解除綁定後綁定後台抓圖
								call 綁定(0)
								Delay 10000
								Exit Do
							End If
						End If
					End If
				End If
			End If
		Else 
			TracePrint "點擊: 座標 846,89"
			//找不到對話視窗持續點擊至對話視窗
			dm.MoveTo 846,89
			dm.LeftClick 
			Delay 250
		End If
	Loop
	TracePrint "結束驗證迴圈"
End Function

Function 綁定(ResetWindow)
	dm_ret = dm.ForceUnBindWindow(Hwnd)
	Delay 100
	TracePrint "解除綁定: " & dm_ret
	If ResetWindow = 0 Then 
		dm_ret = dm.BindWindow(Hwnd, "gdi", "windows", "windows", 0)
	ElseIf ResetWindow = 4 Then
		dm_ret = dm.BindWindow(Hwnd, "gdi", "dx2", "dx", 4)
	End If
	Delay 100
	TracePrint "綁定: " & dm_ret
End Function

Function 解答(GGAns, GGtype)
	If GGtype = 0 Then
		verify = ""
	End If
	n = Len(GGAns)
	i = 1
	For n
		y = Mid(GGAns, i, 1)
		m = Asc(y)
		If m >0 And m<>32 And y <> "=" And y <> "?" Then
			If GGtype = 0 Then
				verify = verify & y
				TracePrint "紀錄值: " & y
			Else
				dm.KeyPress 96 + y
				TracePrint "輸入值: " & y
				delay 50
			End IF
		End If
		i = i+1
	Next
	If GGtype = 0 Then
		verify = Eval(verify)
		TracePrint "驗證: " & verify
	End If
End Function

Function 大漠()
	set dm = createobject("dm.dmsoft")
	base_path = dm.GetBasePath()
	dm_ret = dm.SetPath(base_path)
	dm_ret = dm.SetDict(0, "夏夜.txt")
	//滑鼠指定視窗
	//Hwnd = Plugin.Window.MousePoint()
    Hwnd = Plugin.Window.Find(0, "Ragnarok")
    //Hwnd = Plugin.Window.Find(0, "【初心RO】Q群:16582011|??2?微BT|新?全新?置福利多多等你??荒|www.cxro.love ")
	dm_ret = dm.BindWindow(Hwnd, "gdi", "windows", "windows", 0)
	//MsgBox "句柄:" & Hwnd & "綁定: " & dm_ret
	TracePrint "句柄:" & Hwnd & "綁定: " & dm_ret
End Function

Sub OnThreadExit()
	dm.UnBindWindow 
	TracePrint "[腳本停止]大漠解除綁定窗口: " & Hwnd
	if 提示視窗 = 1 Then
		MsgBox "[腳本停止]大漠解除綁定窗口: " & Hwnd
	End If
End Sub
