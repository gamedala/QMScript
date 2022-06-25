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
MacroID=80080938-4c40-4bd9-92dd-afcac129cdbb
Description=猜數字
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
Dim 數組(504, 2), a, b, randNum, remain, remain2, isOver
Call 大漠()
Delay 100
Do
	getmsg = int(Plugin.Memory.Read32Bit(句柄, &H00F80558))
	If getmsg > 0 Then
		if isOver = 0 Then
			call 初始化()
			intrun = 0
		End If
		Delay 10
		//1.找到"Input"
		dm_ret = dm.FindStr(0, 0, 1024, 768, "Input", "000000-000000", 0.95, intX, intY)
		//input = int(Plugin.Memory.Read32Bit(句柄, &H00F80518))
		If intX > 0 Then
			intrun = intrun + 1
			Call 電腦猜測()
			TracePrint "[" & intrun & "] 猜測數字: " & answerA & answerB & answerC
			dm.KeyPress 96 + answerA
			dm.KeyPress 96 + answerB
			dm.KeyPress 96 + answerC
			dm.KeyPress 13
			a = 0
			b = 0
		else
			Delay 10
			//2.找到"很可惜答錯了"
			dm_ret = dm.FindStr(0, 0, 1024, 768, "很可惜答錯了", "000000-000000", 0.95, intX, intY)
			If intX > 0 AND intY > 0 AND a + b = 0 Then
				do
					a = int(dm.Ocr(intX + 92, intY + 18, intX + 108, intY + 28, "ff3152-000000", 0.95))
					b = int(dm.Ocr(intX + 80, intY + 36, intX + 96, intY + 46, "ff3152-000000", 0.95))
					//TracePrint "數字A:" & 數字A & "數字B:" & 數字B
				loop while a > 4 AND b > 4
				TracePrint "A : " & a & "B : " & b
				Call 電腦思考()
				a = 5
				b = 5
			else
				Delay 10
				//3.找到"得分模式"
				dm_ret = dm.FindStr(0, 0, 1024, 768, "得分模式", "000000-000000", 1.0, intX, intY)
				If intX > 0 AND intY > 0 Then 
					dm.KeyPress 40
					dm.KeyPress 40
					TracePrint "找到:得分模式"
				End If
			End If
		End If
		//不管怎樣都給我來一點
		dm.KeyPress 13
	Else
		dm_ret = dm.FindStr(0, 0, 1024, 768, "猜數字遊戲", "000000-000000", 0.95, intX, intY)
		If intX > 0 AND intY > 0 Then
			isOver = 0
			dm.MoveTo intX + 25, intY + 50
			dm.LeftClick
			TracePrint "點擊NPC"
		End If
	End If
	//Delay 50
Loop

Function 初始化()
	remain = 504
	temp = 0
	For i = 123 To 987
		isOver = 1	
    	unit_1 = int(i / 1) Mod 10
    	unit_10 = int(i / 10) Mod 10
    	unit_100 = int(i / 100) Mod 10
    	If unit_1 <> unit_10 AND unit_1 <> unit_100 AND unit_10 <> unit_100 AND unit_1 <> 0 AND unit_10 <> 0 AND unit_100 <> 0 Then
        	'存放1~504數組
        	temp = temp + 1
        	數組(temp, 0) = unit_100
        	數組(temp, 1) = unit_10
        	數組(temp, 2) = unit_1
    	End If
	Next
End Function

Function 電腦猜測()
	Do
		Dim i
		Randomize
		do
			randNum = rnd() * remain
			If randNum <= remain Then 
				If remain = 1 Then 
					randNum = remain
				End If
				Exit Do
			End If
		Loop
		answerA = 數組(randNum,0)
		answerB = 數組(randNum,1)
		answerC = 數組(randNum, 2)
		If answerA > 0 AND answerB > 0 AND answerC > 0 Then 
			Exit Do
		End If 
	Loop
End Function

Function 電腦思考()
    Dim i, j, k, aa, bb
    Dim refer(3)
    remain2 = 0
    for i = 0 To 2
        refer(i) = 數組(randNum,i)
    Next
    '讀取1~504數組
    for i = 1 To remain '迴圈檢查1~504
        aa = 0
        bb = 0
        for j = 0 To 2 '比對第i個答案和亂數取的答案的是幾a幾b 
            for k = 0 To 2
                if 數組(i,j) = refer(k) Then
                    if j = k Then
                        aa = aa + 1
                    Else 
                        bb = bb + 1
                    End If
                End If
            Next
        Next
        If (aa = a AND bb = b) Then
        	remain2 = remain2 +1
            for k = 0 To 2
               	數組(remain2, k) = 數組(i, k)
           	Next
    		//TracePrint "["&i&"]: " &數組(i,0)&數組(i,1)&數組(i,2)
        End If
    Next
    remain = remain2
    //TracePrint "remain: " & remain & " remain2: " & remain2
    if remain = 0 Then//發現沒有答案符合玩家想的數字，就是玩家作弊！
        isOver = 0
    End If
End Function

Function 大漠()
    set dm = createobject("dm.dmsoft")
    base_path = dm.GetBasePath()
    dm_ret = dm.SetPath(base_path)
    dm_ret = dm.SetDict(0, "光雨.txt")
    句柄 = Plugin.Window.MousePoint()
    dm_ret = dm.BindWindow(句柄, "gdi", "dx2", "dx", 4)
    TracePrint "綁定視窗:" & 句柄 & "仙境傳說綁定是否成功:" & dm_ret
End Function
