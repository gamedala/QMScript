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
MacroID=ea81006b-2d95-47a1-8934-4ede3b595fff
Description=曙光驗證測試
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
Global verify,過程
//移除字 = array("你","你","打","死","就","可","以","出","去","了")
Call 大漠設定()
過程 = 1

	Call 找NPC(0, 0, 1024, 768, "【驗證人員】", "驗證人員")
Do
	If 過程 = 1
		Call 移動座標(49, 9, 1)
		Delay 1000
		Call 移動座標(39, 9, 1)
		Delay 1000
		Call 移動座標(29, 9, 1)
		Delay 1000
		Call 移動座標(19, 9, 1)
		Delay 1000
		Call 移動座標(29, 9, 1)
		Delay 1000
		Call 移動座標(39, 9, 1)
		Delay 1000
		Call 移動座標(49, 9, 1)
		Delay 1000
		Call 移動座標(64, 4, 1)
		Delay 1000
	End If
Loop

Sub 獲取驗證()
	If 過程 = 1
		Call 驗證()
	Else 
		Delay 1000
	End If
End Sub

Function 驗證()
Dim verify
	dm_ret = dm.FindStr(0, 0, 1024, 768,"【驗證人員】","000000-000000",1.0,intX,intY)
	If intX > 0 And intY > 0 Then 
		TracePrint "找到: 【驗證人員】"
			文字 = dm.Ocr(intX - 7, intY + 18, intX +190 , intY + 30,"000000-000000",1.0)
			TracePrint "找到: " & 文字
			n = Len(文字)
			i = 1
			For n
				y = Mid(文字, i, 1)
				If y <> "請" And y <> "你" And y <> "打" And y <> "死" And y <> "就" And y <> "可" And y <> "以" And y <> "出" And y <> "去" And y <> "了" Then
					verify = verify & y
				End If
				i = i+1
			Next
			TracePrint "驗證碼: " & verify
			過程 = 2
		End If
End Function

Function 移動座標(移動_X, 移動_Y, 偏移)
//dm.Moveto X, Y
	Do
		現在_X = int(Plugin.Memory.Read32Bit(Hwnd1, &H00E7EA58))
		現在_Y = int(Plugin.Memory.Read32Bit(Hwnd1, &H00E7EA5C))
		偏移_X = int((偏移 * 2 + 1) * rnd - 偏移)
		偏移_Y = int((偏移 * 2 + 1) * rnd - 偏移)
		數值_X = ( 移動_X + 偏移_X ) - 現在_X
		數值_Y = ( 移動_Y + 偏移_Y ) - 現在_Y
        If 數值_X > 0 Then
            X_移動 = 25
        ElseIf 數值_X < 0 Then
            X_移動 = -25
        Else 
            X_移動 = 0
        End If
        If 數值_Y > 0 Then
            Y_移動 = -25
        ElseIf 數值_Y < 0 Then
            Y_移動 = 25
        Else 
            Y_移動 = 0
        End If
		dm.GetCursorPos x, y
		dm.Moveto x + X_移動, y + Y_移動
	Loop Until (移動_X - 偏移 <= 現在_X And 移動_X + 偏移 >= 現在_X) And (移動_Y - 偏移 <= 現在_Y And 移動_Y + 偏移 >= 現在_Y)
	dm.LeftClick 
	TracePrint "滑鼠X:" & x + X_移動 & " 滑鼠Y:" & y + Y_移動 & "移動X:" & 移動_X & " 移動Y:" & 移動_Y
	
	Do
		現在_X = int(Plugin.Memory.Read32Bit(Hwnd1, &H010F07A8))
		現在_Y = int(Plugin.Memory.Read32Bit(Hwnd1, &H010F07AC))
		Delay 500
		If 現在_X = now_X And 現在_Y = now_Y Then 
			Call 移動座標(移動_X, 移動_Y, 偏移)
		End If
		now_X = 現在_X
		now_Y = 現在_Y
		TracePrint "檢測目前X:" & 現在_X & " 目前Y:" & 現在_Y
	Loop Until (移動_X - 偏移 <= 現在_X And 移動_X + 偏移 >= 現在_X) And (移動_Y - 偏移 <= 現在_Y And 移動_Y + 偏移 >= 現在_Y)
End Function

Function 找NPC(iX1,iY1,iX2,iY2,名稱,名稱2)
	dm_ret = dm.FindStr(iX1, iY1, iX2, iY2, 名稱, "000000-000000", 1.0, intX, intY)
	If intX > 0 And intY > 0 Then 
		dm.MoveTo intX+25, intY+30
		Delay 1000
		dm_ret = dm.FindStr(intX, intY, intX + 140, intY + 140, 名稱2, "94bdf7-000000", 1.0, intX, intY)
		If intX > 0 And intY > 0 Then 
			dm.LeftClick
			Delay 1000
		Else
			TracePrint "[ERROR] 找不到:" & 名稱2
			Delay 1000
		End If
	Else
		TracePrint "[ERROR] 找不到:" & 名稱
		Delay 1000
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
