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
MacroID=8324cd58-57ae-4c71-a243-96ff412e444d
Description=株光_刷硬幣過驗證
Enable=1
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
Global Hwnd1,當前地圖,周圍人數,負重量,血量,狀態名稱,狀態按鍵,打寶地圖

Call 大漠設定()
技能按鍵 = array(114)
技能延遲 = array(400)
//自行調整技能延遲
物品按鍵 = array(120,113,115,112)
//蝴蝶翅膀,蒼蠅翅膀,驗證卷軸,屬光券
狀態名稱 = array(1152,252)
狀態按鍵 = array(116,117)
//魔潮,掉寶糖按鍵0=不開啟
打寶地圖 = 12
//打寶地圖調試可查看打怪地區地圖ID修改
復活選項 = 1
//0=關閉復活 1=重生點 2=原地復活
PIDID_01 = BeginThread(test)
Do
	Delay 400
	dm_ret = dm.FindStr(10, 520, 255, 740,"【驗證系統】:請使用驗證卷軸進行驗證","ffb5de-000000",1.0,intX,intY)
	If intX > 0 And intY > 0 Then 
		call 驗證()
	Else 
		call 記憶體()
		If 血量 < 1 Then 
			TracePrint "Call復活"
			Call 復活(復活選項)
		ElseIf 負重量 >= 90 And 當前地圖 <> 16 Then
			TracePrint "負重回家"
			call 按鍵(物品按鍵(0), 1, 250)
		ElseIf 負重量 >= 90 And 當前地圖 = 16 Then
			TracePrint "存放物品"
			call 找NPC(501,374,920,683,"卡普服務","卡普拉")
			call 按鍵("40,13", 0, 250)
			Call 存倉("硬幣", "ffffde-000000", 0.75)
			call 關閉倉庫()
		ElseIf 當前地圖 = 16 Then
			TracePrint "回去打寶"
			call 按鍵(物品按鍵(3)&",13,13,40,40,13,13,13", 0, 250)
		ElseIf 當前地圖 = 打寶地圖 Then 
			If 周圍人數 > 5 Then 
				For i = 0 to UBOUND(技能按鍵)
					dm.KeyPress 技能按鍵(i)
					Delay 技能延遲(i)
				Next
				dm.KeyPress 物品按鍵(1)
			Else
				dm.KeyPress 物品按鍵(1)
			End If
		End If
	End If
Loop

//自動輔助
Sub test()
set dm = createobject("dm.dmsoft")
dm_ret = dm.BindWindow(Hwnd1, "gdi", "dx2", "dx", 4)
arr1 = 狀態名稱
arr2 = 狀態按鍵
Delay 100
    Do
		If 當前地圖 = 打寶地圖 Then 
			For i = 0 to UBOUND(arr1)
				If arr2(i) <> 0 Then 
					call 狀態(arr1(i), arr2(i))
				End If
			Next
			Delay 2000
		End If
    Loop
End Sub

Function 狀態(狀態ID,按鍵)
do
	buffid = Plugin.Memory.Find32Bit(Hwnd1, 狀態ID, &H01108064, &H011080A6, 4)
	If buffid = 0 Then 
		dm.KeyPress 按鍵
		TracePrint "補狀態: " & 狀態ID & "按鍵: " & 按鍵
	End If
loop Until buffid <> 0
End Function

Function 驗證()
	Call 按鍵(物品按鍵(2), 11, 20)
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
			Call 按鍵(13, 2, 100)
		End If
	End If
End Function

Function 找NPC(iX1,iY1,iX2,iY2,名稱,名稱2)
	NPC = int(Plugin.Memory.Read32Bit(Hwnd1, &H00EB78B0))
	MENU = int(Plugin.Memory.Read32Bit(Hwnd1, &H00EB78B4))
	do While NPC = 0 And MENU = 0
		dm_ret = dm.FindStr(iX1, iY1, iX2, iY2, 名稱, "ffffff-000000", 1, intX, intY)
		If intX > 0 And intY > 0 Then 
			dm.MoveTo intX+25, intY+25
			Delay 1000
			dm_ret = dm.FindStr(intX, intY, intX + 140, intY + 140, 名稱2, "94bdf7-000000", 1, intX, intY)
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
		NPC = int(Plugin.Memory.Read32Bit(Hwnd1, &H00EB78B0))
		MENU = int(Plugin.Memory.Read32Bit(Hwnd1, &H00EB78B4))
		TracePrint NPC&"/"&MENU
	Loop
End Function

Function 存倉(物品, 顏色, 相似度)
	倉庫 = int(Plugin.Memory.Read32Bit(Hwnd1, &H00EB7948))
	//Rem 重新開始
	If 倉庫 <> 0 Then
		Do
			dm_ret = dm.FindStr(0, 0, 1024, 768, "物品欄", "000000-000000", 1, intX, intY)
			If intX > 0 And intY > 0 Then 
				Do 
					dm_ret = dm.FindStr(intX+20, intY+15, intX + 250, intY + 175, 物品, 顏色, 相似度, intX2, intY2)
					If intX2 > 0 And intY2 > 0 Then 
						dm.MoveTo intX2 + 12, intY2 + 20
						dm.KeyDown 18
						dm.RightClick
						dm.KeyUp 18
						delay 100
					End If
				Loop Until intX2 < 0 And intY2 < 0
				TracePrint "物品: [" & 物品 & "] 存放完成"
			Else 
				dm.KeyDown 18
				dm.KeyPress 69
				dm.KeyUp 18
				//Goto 重新開始
			End If
		Loop Until intX > 0 And intY > 0
	Else
		TracePrint "[Error] 倉庫未開啟無法存放"
		Delay 1000
	End If
End Function

Function 關閉倉庫()
	倉庫 = int(Plugin.Memory.Read32Bit(Hwnd1, &H00EB7948))
	If 倉庫 > 0 Then
		dm_ret = dm.FindStr(373, 111, 676, 595, "關閉", "000000-000000", 1, intX3, intY3)
		If intX3 > 0 And intY3 > 0 Then 
			dm.MoveTo intX3, intY3
			dm.LeftClick 
			TracePrint "關閉倉庫"
		End If
	Else
		TracePrint "[ERROR] 找不到倉庫關閉"
		Delay 1000
	End If
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
		Delay 1000
		TracePrint "確認: [復活]"
	End If
End Function


Function 滑鼠(左右, 類型, 次數, 延遲)
	For 次數
		TracePrint "按:" & 左右 & "類型:" & 類型 & "次數:" & 次數 & "延遲:" & 延遲
		If 左右 = "左" Then 
			If 類型 = 0 Then 
				dm.LeftClick
			ElseIf 類型 = 1 Then
				dm.LeftDown
			ElseIf 類型 = 2 Then
				dm.LeftUp
			End If
		ElseIf 左右 = "右" Then 
			If 類型 = 0 Then 
				dm.RightClick
			ElseIf 類型 = 1 Then
				dm.RightDown
			ElseIf 類型 = 2 Then
				dm.RightUp
			End If
		End If
		Delay 延遲
	Next
End Function

Function 按鍵(按鍵組,次數,延遲)
	If 次數 > 0 Then 
		Key = 按鍵組
		For (次數-1)
			按鍵組 = 按鍵組&","&Key
		Next
	End If
	Dim arr
	arr = Split(","&按鍵組, ",")
	If UBOUND(arr) > 1 or ( UBOUND(arr) > 0 and 次數 > 0 ) Then 
		For i = 1 to UBOUND(arr)
			TracePrint "按:" & arr(i) & "次數:" & i & "延遲:" & 延遲
			dm.KeyPress arr(i)
			If arr(i) = 40 Then
				Delay 50
			Else
				Delay 延遲
			End If
			
		Next
	End If
End Function

Function 記憶體()
	當前地圖 = int(Plugin.Memory.Read32Bit(Hwnd1, &H0015F258))
	周圍人數 = int(Plugin.Memory.Read32Bit(Hwnd1, &H00E78FF0))
	最大負重 = int(Plugin.Memory.Read32Bit(Hwnd1, &H011040B4))
	負重 = int(Plugin.Memory.Read32Bit(Hwnd1, &H011040B8))
	最大血 = int(Plugin.Memory.Read32Bit(Hwnd1, &H01107BF0))
	血 = int(Plugin.Memory.Read32Bit(Hwnd1, &H01107BEC))
	負重量 = fix((負重 / 最大負重) * 100)
	血量 = fix((血 / 最大血) * 100)
	//TracePrint "地圖:" & 當前地圖 & " 負重:" & 負重量 & " 血量:" & 血量
End Function

Function 大漠設定()
	set dm = createobject("dm.dmsoft")
	base_path = dm.GetBasePath()
	dm_ret = dm.SetPath(base_path)
	dm_ret = dm.SetDict(0,"pass.txt")
	Hwnd1 = Plugin.Window.MousePoint()
	dm_ret = dm.BindWindow(Hwnd1,"gdi","dx2","dx",4)
End Function
