[General]
SyntaxVersion=2
BeginHotkey=122
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=5bf7d379-02f5-477a-b04b-a83a7fce6edb
Description=株光_自動跟隨副本2
Enable=0
AutoRun=0
[Repeat]
Type=1
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
call 大漠設定()
復活選項 = 1
//0=關閉復活 1=重生點 2=原地復活
Do
	now_map = Plugin.Memory.Read32Bit(Hwnd1, &H0015F258)
	If now_map = 16 Then 
		now_map_X = Plugin.Memory.Read32Bit(Hwnd1, &H010F07A8)
		now_map_Y = Plugin.Memory.Read32Bit(Hwnd1, &H010F07AC)
		最大血 = int(Plugin.Memory.Read32Bit(Hwnd1, &H01107BF0))
		血 = int(Plugin.Memory.Read32Bit(Hwnd1, &H01107BEC))
		血量 = fix((血 / 最大血) * 100)
		If 血量 < 1 Then 
			Delay 2000
			Call Plugin.Msg.Tips("血量:"&血量 &" 最大血:"& 最大血 &" 血:"& 血)
			TracePrint "血量:"&血量 &" 最大血:"& 最大血 &" 血:"& 血
			Call 復活(1)
		ElseIf now_map_X <> 216 And now_map_Y <> 209 Then 
			//屬光券回到副本區
			call 按鍵(112,1,300)
			call 按鍵(13,3,300)
		Else
			down = -1
			Val_inst = Plugin.Memory.Read32Bit(Hwnd1, &H01107FD0)
			Call 副本資訊(Val_inst)
			
			Npc_Msg = Plugin.Memory.Read32Bit(Hwnd1, &H00EB78B0)
			If Npc_Msg > 0 Then 
				call 按鍵(13,1,300)
			End If
			
			If down > - 1  Then 
				dm_ret = dm.FindStr(176,89,821,293,inst,"ffffff-000000",0.9,intX,intY)
				If intX > 0 And intY > 0 Then 
					dm.MoveTo intX + 25, intY + 50
					dm_ret = dm.FindStr(176,89,821,293,npc,"94bdf7-000000", 1, intX, intY)
					If intX > 0 And intY > 0 Then 
						//dm.LeftClick 
						dm.RightClick
						call 按鍵(40,down,50)
						Call 按鍵(13, 2, 300)
					End If
				End If
			End If
			
		End If
	End If
	Delay 1000
Loop

Function 副本資訊(Val_inst)
	If Val_inst = 2780228778 Then
		inst_name = "初階道館"
		down = 0
		inst = "一般副本"
		npc = "副本傳送員"
	ElseIf Val_inst = 4004661672 Then
		inst_name = "沉船寶藏"
		down = 1
		inst = "一般副本"
		npc = "副本傳送員"
	ElseIf Val_inst = 1471307954 Then
		inst_name = "深淵醫院"
		down = 2
		inst = "一般副本"
		npc = "副本傳送員"
	ElseIf Val_inst = 1218739907 Then
		inst_name = "獸人寶藏"
		down = 3
		inst = "一般副本"
		npc = "副本傳送員"
	ElseIf Val_inst = 3349806254 Then
		inst_name = "海怪寶藏"
		down = 4
		inst = "一般副本"
		npc = "副本傳送員"
	ElseIf Val_inst = 3953438386 Then
		inst_name = "皎月湖畔"
		down = 5
		inst = "一般副本"
		npc = "副本傳送員"
	ElseIf Val_inst = 1958760879 Then
		inst_name = "烏龜寶藏"
		down = 6
		inst = "一般副本"
		npc = "副本傳送員"
	ElseIf Val_inst = 1103063210 Then
		inst_name = "沼澤鱷嚎"
		down = 7
		inst = "一般副本"
		npc = "副本傳送員"
	ElseIf Val_inst = 1269331392 Then
		inst_name = "優沛寶藏"
		down = 8
		inst = "一般副本"
		npc = "副本傳送員"
	ElseIf Val_inst = 1789245371 Then
		inst_name = "遠古金字塔"
		down = 9
		inst = "一般副本"
		npc = "副本傳送員"
	ElseIf Val_inst = 1288100537 Then
		inst_name = "夢魘修道院"
		down = 10
		inst = "一般副本"
		npc = "副本傳送員"
	ElseIf Val_inst = 1397968706 Then
		inst_name = "BOSS狩獵館"
		down = 0
		inst = "每日副本"
		npc = "每日副本"
	ElseIf Val_inst = 123456789 Then
		inst_name = "十三星宮"
		down = 0
		inst = "每周副本"
		npc = "每周副本員"
	Else
		//MsgBox "副本ID: " & Val_inst
	End If
	TracePrint "尋找:" & inst & "尋找:" & npc & "Val_inst:" & Val_inst
End Function

Function 復活(Run)
	If Run >0 Then
		Die = array("","移動到儲存場所","在原地復")
		Do
			dm.KeyPress 27
			Delay 250
			dm_ret = dm.FindStr(345, 435, 674, 565, Die(Run), "000000-313131", 1.0, intX, intY)
		Loop Until intX > 0 And intY > 0
		TracePrint "找到關鍵字: [移動到儲存場所]"
		If Run = 1 Then
			Do
				dm.MoveTo intX, intY
    			Call 滑鼠("左", 0, 1, 250)
				dm_ret = dm.FindStr(352,289,661,435, "確認", "000000-313131", 1.0, intX2, intY2)
			Loop Until intX2 > 0 And intY2 > 0
			TracePrint "找到關鍵字: [確認]"
		ElseIf Run = 2 Then
			intX2 = intX
			intY2 = intY
		End If
		Do
			dm.MoveTo intX2, intY2
    		Call 滑鼠("左", 0, 1, 250)
			血 = int(Plugin.Memory.Read32Bit(Hwnd1, &H01107BEC))
		Loop Until 血 > 1
		TracePrint "確認: [復活]"
	End If
	Delay 1000
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

Function 滑鼠(左右建, 類型, 次數, 延遲)
	For i = 1 To 次數
		If 左右 = 左 Then 
			If 類型 = 0 Then 
				dm.LeftClick
			ElseIf 類型 = 1 Then
				dm.LeftDown
			ElseIf 類型 = 2 Then
				dm.LeftUp
			End If
		ElseIf 左右 = 右 Then 
			If 類型 = 0 Then 
				dm.RightClick
			ElseIf 類型 = 1 Then
				dm.RightDown
			ElseIf 類型 = 2 Then
				dm.RightUp
			End If
		End If
		Delay 延遲
		TracePrint "按:" & 左右建 & "類型:" & 類型 & "次數:" & 次數 & "延遲:" & 延遲
	Next
End Function

Function 大漠設定()
	set dm = createobject("dm.dmsoft")
	base_path = dm.GetBasePath()
	dm_ret = dm.SetPath(base_path)
	dm_ret = dm.SetDict(0,"pass.txt")
	Hwnd1 = Plugin.Window.MousePoint()
	dm_ret = dm.BindWindow(Hwnd1,"gdi","dx2","windows",4)
End Function
