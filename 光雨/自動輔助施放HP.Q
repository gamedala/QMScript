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
MacroID=8ef7b764-aaaa-43d8-85c0-1086111313b6
Description=光雨-自動輔助施放HP
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
Dimenv Hwnds, 編號, 啟動地圖, 地圖, 復活選項, 狀態名稱, 狀態按鍵, 狀態名稱2, 狀態按鍵2
啟動地圖 = 10
復活選項 = 2
狀態名稱 = array(1)
狀態按鍵 = array(1)
狀態名稱2 = array(1)
狀態按鍵2 = array(1)
Hwnd = Plugin.Window.Search("Ragnarok")
MyArray = Split(Hwnd, "|")
If UBound(MyArray) >= 0 Then
	For i = 0 To UBound(MyArray) - 1
		Hwnds = Clng(MyArray(i))
		編號 = i + 1
		Call Plugin.Window.SetText(Hwnds, "仙境傳說-" & 編號)
		線程1 = BeginThread(自動技能)
		Delay 100
		線程2 = BeginThread(自動輔助)
		Delay 100
        Call Plugin.File.WriteINI("技能線程", "仙境傳說-" & 編號, 線程1, "C:\dm\記錄.ini")
        Call Plugin.File.WriteINI("輔助線程", "仙境傳說-" & 編號, 線程2, "C:\dm\記錄.ini")
		Delay 100
	Next  
End If

Sub 自動技能()
	call set_dm()
	Delay 100
	Do
		call hp_mp
		地圖 = int(Plugin.Memory.Read32Bit(Hwnd, &H0015F25C))
		If 地圖 = 啟動地圖 Then
			dm.KeyPress 按鍵
		End If
		Delay 20
	Loop
End Sub

Sub 自動輔助()
	call set_dm()
	Delay 100
	AID = int(Plugin.Memory.Read32Bit(Hwnd, &H011CCDFC))
	TracePrint "仙境傳說-" & ID & " AID: " & AID
	If AID = 2000000 Then
		arr1 = 狀態名稱2
		arr2 = 狀態按鍵2
	Else 
		arr1 = 狀態名稱
		arr2 = 狀態按鍵
	End If
	Do
		If 地圖 = 啟動地圖 OR 0 = 啟動地圖 Then 
			For i = 0 to UBOUND(arr1)
				If arr2(i) <> 0 Then 
					call 狀態(arr1(i), arr2(i))
				End If
			Next
			Delay 2000
		End If
		Delay 100
	Loop
End Sub

Function 狀態(狀態ID,按鍵)
	do
    	buffid = Plugin.Memory.Find32Bit(Hwnd, 狀態ID, &H011D0E94, &H011D0EE0, 4)
    	If buffid = 0 Then 
        	dm.KeyPress 按鍵
        	TracePrint "補狀態: " & 狀態ID & "按鍵: " & 按鍵
    	End If
	loop Until buffid <> 0
End Function

Function hp_mp
    最大 = int(Plugin.Memory.Read32Bit(Hwnd, &H011D0A20))
    最小 = int(Plugin.Memory.Read32Bit(Hwnd, &H011D0A1C))
    魔力 = fix((最小 / 最大) * 100)
    If 魔力 < 80 Then 
        dm.KeyPress 112
    End If
    最大 = int(Plugin.Memory.Read32Bit(Hwnd, &H011D0A18))
    最小 = int(Plugin.Memory.Read32Bit(Hwnd, &H011D0A14))
    血量 = fix((最小 / 最大) * 100)
    If 最小 = 1 And 復活選項 <> 0 Then 
    	暫停線程ID = Plugin.File.readINI("線程ID", "仙境傳說-" & i, "C:\記錄.ini")
    	PauseThread 暫停線程ID
        復活(復活選項)
    ElseIf 血量 < 80 Then
        dm.KeyPress 112
    End If
End Function

Function 復活(Run)
    If Run >0 Then
        Die = array("","移動到儲存場所","在原地復")
        TracePrint "[復活]"
        Do
            dm.KeyPress 27
            Delay 250
            dm_ret = dm.FindStr(345, 435, 674, 565, Die(Run), "000000-313131", 1.0, intX, intY)
        Loop Until intX > 0 And intY > 0
        TracePrint "找到關鍵字: [移動到儲存場所]"
        If Run = 1 Then
            Do
                dm.MoveTo intX, intY
                dm.LeftClick
                dm_ret = dm.FindStr(352,289,661,435, "確認", "000000-313131", 1.0, intX2, intY2)
            Loop Until intX2 > 0 And intY2 > 0
            TracePrint "找到關鍵字: [確認]"
        ElseIf Run = 2 Then
            intX2 = intX
            intY2 = intY
        End If
        Do
            dm.MoveTo intX2, intY2
            dm.LeftClick 
            Delay 200
            血 = int(Plugin.Memory.Read32Bit(Hwnd, &H011D0A14))
        Loop Until 血 > 1
        TracePrint "確認: [復活]"
        ContinueThread 暫停線程ID
    End If
End Function

Function set_dm
	Hwnd = Hwnds
	ID = 編號
    set dm = createobject("dm.dmsoft")
    dm_ret = dm.BindWindow(Hwnd, "gdi", "dx2", "dx", 4)
    TracePrint "Hwnd:" & Hwnd & " dm_ret:" & dm_ret
End Function

Sub OnThreadExit()
	call Plugin.Window.SetText(Hwnd, "Ragnarok")
    dm.UnBindWindow
End Sub
