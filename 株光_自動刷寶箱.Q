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
MacroID=48224ce0-b6a3-4e34-b9c1-e1f7677086d3
Description=株光_自動刷寶箱
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
Global Hwnd1, Start, 驗證卷軸, 技能
Hwnd1 = Plugin.Window.MousePoint()
Start = 0
//------ 設定以下
Npc = array(553, 382)
Npc2 = array(532, 270)
對話延遲 = 300
等待延遲 = 3500
//等待隊友到 0=不等待
尋找隨機延遲 = 3
驗證卷軸 = 115
屬光券 = 112
技能 = 113
Map = 27
//副本地圖
//------ 設定以上

Call 大漠設定()
PID=BeginThread(驗證技能)
Do
	now_map = int(Plugin.Memory.Read32Bit(Hwnd1, &H0015F258))
	now_map_X = int(Plugin.Memory.Read32Bit(Hwnd1, &H010F07A8))
	now_map_Y = int(Plugin.Memory.Read32Bit(Hwnd1, &H010F07AC))
	Npc_Msg = int(Plugin.Memory.Read32Bit(Hwnd1, &H00EB78B0))
	最大血 = int(Plugin.Memory.Read32Bit(Hwnd1, &H01107BF0))
	血 = int(Plugin.Memory.Read32Bit(Hwnd1, &H01107BEC))
	血量 = fix((血 / 最大血) * 100)

	If Npc_Msg > 0 Then 
		TracePrint "卡窗 Enter"
		call 按鍵(13,1,對話延遲)
	End If
	
	If 血量 = 0 Then 
		Call Plugin.Msg.Tips(HP & "您已死亡!")
		Delay 1000
	ElseIf now_map = 16 And now_map_X = 216 And now_map_Y = 209 Then
		TracePrint "創建或銷毀副本"
		dm_ret = dm.FindStr(225,43,920,345,"一般副本","ffffff-000000",0.9,intX,intY)
		If intX > 0 And intY > 0 Then 
			dm.MoveTo intX + 25, intY + 25
			Delay 對話延遲
			dm_ret = dm.FindStr(225,43,920,345,"副本傳送員|副|本|傳|送|員","94bdf7-000000",1.0,intX,intY)
			If intX > 0 And intY > 0 Then 
				Start = 0
				Val_inst = Plugin.Memory.Read32Bit(Hwnd1, &H01107FD0)
				call 副本資訊(Val_inst)
			End If
		End If
	ElseIf now_map = 16 And now_map_X = 217 And now_map_Y = 276 Then
		TracePrint "屬光券回副本"
		call 按鍵(屬光券&",13,13,13",0,對話延遲)
	ElseIf now_map = Map Then
		If now_map_X = 35 And now_map_Y = 57 Then
			TracePrint "副本開始"
			If Start = 0 Then 
				Delay 等待延遲
				dm.MoveTo Npc(0), Npc(1)
				Delay 對話延遲
				dm_ret = dm.FindStr(473,292,628,526,"巨鱷寶箱","94bdf7-000000",1.0,intX,intY)
				If intX > 0 And intY > 0 Then 
					dm.RightClick
					Delay 對話延遲
					Call 按鍵(13,1,對話延遲)
					Start = Start + 1
					TracePrint "階段: " & Start
				End If
			End If
		ElseIf now_map_X = 98 And now_map_Y = 80 Then
			//TracePrint "尋找: [寶箱沼鱷]"
			If Start = 1 Then
				Start = Start + 1
				TracePrint "階段: " & Start
			ElseIf Start >= 2 And Start < 7 Then
				dm.MoveTo Npc2(0), Npc2(1)
				Delay 對話延遲
				dm_ret = dm.FindStr(349,140,701,490,"寶箱沼鱷","94bdf7-000000",1.0,intX,intY)
				If intX > 0 And intY > 0 Then 
					If Start <> 7 Then
						尋找延遲 = fix(((尋找隨機延遲 * rnd)+0.5)*1000)
						TracePrint "尋找寶箱沼鱷延遲:"& 尋找延遲
						Delay 尋找延遲
					End If
					dm.RightClick
					Start = Start + 1
					TracePrint "階段: " & Start
				End If
			Else 
				//Do
					dm.MoveTo Npc2(0), Npc2(1)
					Delay 對話延遲
					dm_ret = dm.FindStr(349,140,701,490,"寶箱","94bdf7-000000",1.0,intX,intY)
					If intX > 0 And intY > 0 Then 
						dm.RightClick
						Start = Start + 1
						TracePrint "階段: " & Start
					End If
				//Loop Until intX > 0 And intY > 0
			End If
		End If
	ElseIf now_map <> Map And now_map <> 16 Then
		TracePrint 地圖 & "進錯副本離開" & now_map
		Start = 0
		call 按鍵(屬光券&",13,13,13",0,對話延遲)
	End If
	Delay 1000
Loop

Sub 驗證技能()
Delay 500
Call 大漠設定()
Do
	If Start = 1 Or Start = 7 Then 
		TracePrint "攻擊"
		dm_ret = dm.FindStr(10, 520, 255, 740,"【驗證系統】:請使用驗證卷軸進行驗證","ffb5de-000000",1.0,intX,intY)
		If intX > 0 And intY > 0 Then 
			Call 驗證()
		Else
			dm.KeyPress 技能
		End If
	Else
		Delay 200
	End If
Loop
End Sub

Function 驗證()
	call 按鍵(驗證卷軸, 11, 20)
	dm_ret = dm.FindPic(0, 0, 1024, 768, "C:\dm\msg.bmp", "000000", 0.9, 0, intX, intY)
	If intX > 0 And intY > 0 Then 
		dm_ret = dm.FindStr(intX, intY, intX+280, intY+180, "=?", "000000-000000", 1.0, intX, intY)
		If intX > 0 And intY > 0 Then 
			Delay 500
			verify = dm.Ocr(intX - 110, intY -7, intX , intY + 7,"000000-000000",1.0)
			n = Len(verify)
			i = 1
			verify2 = "" 
			For n
				y = Mid(verify, i, 1)
				m = Asc(y)
				If m >0 And m<>32 Then
					verify2 = verify2 & y
				End If
				i = i+1
			Next
			verify = Eval(verify2)
			Call Plugin.Bkgnd.SendString(Hwnd1, verify)
			Call Plugin.Msg.Tips("驗證提示: " & verify)
			dm.KeyPress 13
		End If
	End If
End Function

Function 副本資訊(Val_inst)
	dm.RightClick 
	Delay 對話延遲
	If Val_inst = 2780228778 Then
		選項 = 0
	ElseIf Val_inst = 4004661672 Then
		選項 = 0
	ElseIf Val_inst = 1471307954 Then
		選項 = 0
	ElseIf Val_inst = 1218739907 Then
		選項 = 0
	ElseIf Val_inst = 3349806254 Then
		選項 = 0
	ElseIf Val_inst = 3953438386 Then
		選項 = 0
	ElseIf Val_inst = 1103063210 Then
		選項 = 0
	ElseIf Val_inst = 1958760879 Then
		選項 = 0
	ElseIf Val_inst = 1269331392 Then
		選項 = 0
	ElseIf Val_inst = 1789245371 Then
		選項 = 0
	ElseIf Val_inst = 1288100537 Then
		選項 = 0
	Else
		選項 = 1
	End If
	If 選項 = 1 Then
		Call 按鍵("40,40,40,40,40,40,40,13,13,40,13",0,對話延遲)
	ElseIf 選項 = 0 Then
		Call 按鍵("13,40,40,13,13",0,對話延遲)
	End If
End Function

Function 按鍵(按鍵組,次數,延遲)
	Dim arr
	arr = Split(按鍵組, ",")
	If 次數 > 0 Then
		For i = 1 To 次數
			TracePrint "按:" & 按鍵組 & "次數:" & i & "延遲:" & 延遲
			dm.KeyPress 按鍵組
			Delay 延遲
		Next
	ElseIf UBOUND(arr) > 0 Then
		For i = 0 To UBOUND(arr)
			TracePrint "按:" & arr(i) & "次數:" & i+1 & "延遲:" & 延遲
			dm.KeyPress arr(i)
			if arr(i) = 40 Then
				Delay 30
			Else
				Delay 延遲
			End If
		Next
	End If
End Function

Function 大漠設定()
	set dm = createobject("dm.dmsoft")
	base_path = dm.GetBasePath()
	dm_ret = dm.SetPath(base_path)
	dm_ret = dm.SetDict(0,"pass.txt")
	dm_ret = dm.BindWindow(Hwnd1,"gdi","dx2","windows",4)
End Function
