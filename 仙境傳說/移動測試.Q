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
MacroID=211b33e4-3ea0-47e4-9889-4636f9cb0e19
Description=移動測試
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
set dm = createobject("dm.dmsoft")
base_path = dm.GetBasePath()
dm_ret = dm.SetPath(base_path)
Hwnd1 = Plugin.Window.MousePoint()
dm_ret = dm.BindWindow(hwnd1, "gdi", "dx2", "windows", 4)
X = 500
Y = 400

Do
Call 移動座標(31, 63, 2)
Call 移動座標(45, 51, 2)
Call 移動座標(61, 50, 2)
Call 移動座標(67, 54, 2)
Call 移動座標(73, 64, 2)
Loop

Function 移動座標(移動_X, 移動_Y, 偏移)
dm.Moveto X, Y
	Do
		現在_X = int(Plugin.Memory.Read32Bit(Hwnd1, &H00F41EA0))
		現在_Y = int(Plugin.Memory.Read32Bit(Hwnd1, &H00F41EA4))
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
		現在_X = int(Plugin.Memory.Read32Bit(Hwnd1, &H011B95B0))
		現在_Y = int(Plugin.Memory.Read32Bit(Hwnd1, &H011B95B4))
		Delay 500
		If 現在_X = now_X And 現在_Y = now_Y Then 
			Call 移動座標(移動_X, 移動_Y, 偏移)
		End If
		now_X = 現在_X
		now_Y = 現在_Y
		TracePrint "檢測目前X:" & 現在_X & " 目前Y:" & 現在_Y
	Loop Until (移動_X - 偏移 <= 現在_X And 移動_X + 偏移 >= 現在_X) And (移動_Y - 偏移 <= 現在_Y And 移動_Y + 偏移 >= 現在_Y)
End Function

Function 確定座標(目標_X, 目標_Y, 當前_X, 當前_Y)
	If 目標_X > 當前_X And 目標_Y > 當前_Y Then 
		
	ElseIf 目標_X > 當前_X And 目標_Y < 當前_Y Then 
		
	ElseIf 目標_X < 當前_X And 目標_Y < 當前_Y Then
	
	ElseIf 目標_X < 當前_X And 目標_Y > 當前_Y Then
	
	
	ElseIf 目標_X > 當前_X And 目標_Y < 當前_Y  Then
	
	ElseIf 目標_X < 當前_X And 目標_Y < 當前_Y  Then
	
	ElseIf 目標_Y > 當前_Y Then
	
	ElseIf 目標_Y < 當前_Y Then
	 
	End If
	
End Function
