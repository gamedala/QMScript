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
MacroID=8478bc89-6287-4612-b9ca-56bd5a3d1aec
Description=[手動]過驗證
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
Call 大漠設定()
驗證卷軸 = 115
call 驗證()

Function 驗證()
	dm.KeyPress 驗證卷軸
	Delay 100
	dm_ret = dm.FindStr(0, 0, 1024, 768,"【驗證系統】","000000-000000",1.0,intX,intY)
	If intX > 0 And intY > 0 Then 
		TracePrint "找到: 【驗證系統】"
		dm_ret = dm.FindStr(intX, intY, intX+280, intY+180, "=?", "000000-000000", 1.0, intX, intY)
		If intX > 0 And intY > 0 Then 
			TracePrint "找到: =?"
			Delay 500
			Dim verify
			文字 = dm.Ocr(intX - 110, intY -7, intX , intY + 7,"000000-000000",1.0)
			TracePrint "找到: " & 文字
			n = Len(文字)
			i = 1
			For n
				y = Mid(文字, i, 1)
				m = Asc(y)
				If m >0 And m<>32 And y <> "=" Then
					verify = verify & y
				End If
				i = i+1
			Next
			verify = Eval(verify)
			TracePrint "驗證碼: " & verify
			Call Plugin.Bkgnd.SendString(Hwnd1, verify)
			dm.KeyPress 13
		End If
	End If
End Function

Function 大漠設定()
	set dm = createobject("dm.dmsoft")
	base_path = dm.GetBasePath()
	dm_ret = dm.SetPath(base_path)
	dm_ret = dm.SetDict(0,"pass.txt")
	Hwnd1 = Plugin.Window.MousePoint()
	dm_ret = dm.BindWindow(Hwnd1,"gdi","dx2","dx",4)
End Function
