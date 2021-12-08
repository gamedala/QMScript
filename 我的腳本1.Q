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
MacroID=0bbdaef3-247f-4bd5-9f1d-98829c8c4d71
Description=我的腳本1
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

Call 存倉("硬幣", "ffffde-000000", 0.75)

Function 存倉(物品, 顏色, 相似度)
	Do
		dm_ret = dm.FindStr(0, 0, 1024, 768, "物品欄", "000000-000000", 1, intX, intY)
		If intX > 0 And intY > 0 Then 
			Do 
				dm_ret = dm.FindStr(intX, intY, intX + 262, intY + 48, 物品, 顏色, 相似度, intX2, intY2)
				If intX2 > 0 And intY2 > 0 Then 
					dm.MoveTo intX2 + 12, intY2 + 20
					dm.KeyDown 18
					dm.RightClick
					dm.KeyUp 18
				End If
			Loop Until intX2 < 0 And intY2 < 0
		Else 
			dm.KeyDown 18
			dm.KeyPress 69
			dm.KeyUp 18
		End If
	Loop Until intX2 < 0 And intY2 < 0
End Function

Function 按鍵迴圈(按鍵, 次數, 延遲)
	For 次數
		dm.KeyPress 按鍵
		Delay 延遲
	Next
End Function

TracePrint "地圖:" & now_map & " 負重:" & 負重量 & " HP:" & HP

Function 大漠設定()
	set dm = createobject("dm.dmsoft")
	base_path = dm.GetBasePath()
	dm_ret = dm.SetPath(base_path)
	dm_ret = dm.SetDict(0,"pass.txt")
	Hwnd1 = Plugin.Window.MousePoint()
	dm_ret = dm.BindWindow(Hwnd1,"gdi","dx2","dx",4)
End Function
