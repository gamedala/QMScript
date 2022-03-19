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
MacroID=84ba418a-d971-4c28-9cde-e61c84c78b82
Description=光雨_自動猜數字
Enable=1
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
DimEnv 數字A,數字B,輸入AB,猜測,取得猜測,重設
BeginThread 仙境傳說
BeginThread 黑窗

Sub 仙境傳說()
    Call 大漠()
    Delay 100
    Do
		對話視窗 = Plugin.Memory.Read32Bit(模擬器, &H00F80558)
		If 對話視窗 > 0 Then 
    		//4.找到"猜出正確答案的"
			dm_ret = dm.FindStr(0, 0, 1024, 768, "猜出正確答案的", "000000-000000", 1.0, intX, intY)
			If intX > 0 And intY > 0 Then 
				重設 = 1
				Delay 100
				TracePrint "找到:猜出正確答案的"
			End If
			//1.找到"Input"
			dm_ret = dm.FindStr(0, 0, 1024, 768, "Input", "000000-000000", 0.95, intX, intY)
			If intX > 0 And intY > 0 Then 
				取得猜測 = 1
				Delay 100
    			dm.KeyPress 8
    			Delay 50
    			Call Plugin.Bkgnd.SendString(模擬器, 猜測)
    			dm.KeyPress 13
    			TracePrint "輸入:" & 猜測
			End If
			//2.找到"很可惜答錯了"
    		dm_ret = dm.FindStr(0, 0, 1024, 768, "很可惜答錯了", "000000-000000", 0.95, intX, intY)
    		If intX > 0 And intY > 0 And 取得猜測 = 0 Then 
    			數字A = dm.Ocr(intX + 92, intY +18, intX + 108 , intY + 28,"ff3152-000000",0.95)
    			數字B = dm.Ocr(intX + 80, intY +36, intX + 96 , intY + 46,"ff3152-000000",0.95)
				TracePrint "數字A:" & 數字A & "數字B:" & 數字B
				輸入AB = 1
    		End If
    		//3.找到"得分模式"
			dm_ret = dm.FindStr(0, 0, 1024, 768, "得分模式", "000000-000000", 1.0, intX, intY)
			If intX > 0 And intY > 0 Then 
				dm.KeyPress 40
				Delay 25
				dm.KeyPress 40
				Delay 25
				TracePrint "找到:得分模式"
			End If
			//不管怎樣都給我來一點
			dm.KeyPress 13
			TracePrint "enter"
			Delay 100
		Else 
			TracePrint "重設"
			重設 = 1
			Delay 100
			dm_ret = dm.FindStr(0, 0, 1024, 768, "猜數字遊戲", "000000-000000", 0.95, intX, intY)
			If intX > 0 And intY > 0 Then 
				dm.MoveTo intX + 25, intY + 50
				dm.LeftClick
			End If
		End If

    Loop
End Sub

Sub 黑窗()
    Call 大漠2()
    Delay 100
    Do
        
        //取得猜測
        If 取得猜測 = 1 Then 
    		猜測 = dm.Ocr(94,429,147,465, "cccccc-000000", 1.0)
    		TracePrint "猜測:" & 猜測
    		取得猜測 = 0
    	//End If
    	
    	//重設
        ElseIf 重設 = 1 Then 
			dm.KeyPress 99
			dm.KeyPress 13
			dm.KeyPress 96
			dm.KeyPress 13
			dm.KeyPress 89
			dm.KeyPress 13
    		TracePrint "重新設定"
    		重設 = 0
    	//End If
    	
    	//輸入AB
        ElseIf 輸入AB = 1 Then 
    		If 數字A = 0 Then 
    			dm.KeyPress 96
    			dm.KeyPress 13
    			TracePrint "A: 0"
    		ElseIf 數字A = 1 Then
    			dm.KeyPress 97
    			dm.KeyPress 13
    			TracePrint "A: 1"
    		elseIf 數字A = 2 Then 
    			dm.KeyPress 98
    			dm.KeyPress 13
    			TracePrint "A: 2"
    		End If
    		If 數字B = 0 Then 
    			dm.KeyPress 96
    			dm.KeyPress 13
    			TracePrint "B: 0"
    		ElseIf 數字B = 1 Then
    			dm.KeyPress 97
    			dm.KeyPress 13
    			TracePrint "B: 1"
    		elseIf 數字B = 2 Then 
    			dm.KeyPress 98
    			dm.KeyPress 13
    			TracePrint "B: 2"
    		elseIf 數字B = 3 Then 
    			dm.KeyPress 99
    			dm.KeyPress 13
    			TracePrint "B: 3"
    		End If
    		輸入AB = 0
        End If
    	Delay 50
    Loop
End Sub

Function 大漠()
    set dm = createobject("dm.dmsoft")
    base_path = dm.GetBasePath()
    dm_ret = dm.SetPath(base_path)
	dm_ret = dm.SetDict(0,"123.txt")
    模擬器 = Plugin.Window.MousePoint()
    TracePrint "綁定視窗:" & 模擬器
    dm_ret = dm.BindWindow(模擬器, "gdi", "dx2", "dx", 4)
    TracePrint "仙境傳說綁定是否成功:" & dm_ret
End Function

Function 大漠2()
    set dm = createobject("dm.dmsoft")
    base_path = dm.GetBasePath()
    dm_ret = dm.SetPath(base_path)
	dm_ret = dm.SetDict(0,"123.txt")
	模擬器 = Plugin.Window.Find(0, "C:\Users\BOB\Desktop\123.exe")
    TracePrint "綁定視窗:" & 模擬器
    dm_ret = dm.BindWindow(模擬器,"gdi","windows","windows",0)
    TracePrint "黑窗綁定是否成功:" & dm_ret
End Function
