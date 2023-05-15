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
MacroID=bd6340cf-3483-4e7c-b9ed-6106b303f0b3
Description=星星附魔
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
Call 大漠()
Delay 500
//是否要開啟指定附魔 0關閉 1開啟
指定附魔 = 1
三四洞 = array(310696, 310701)
附魔名稱 = array("勇氣之星Lv.1","勇氣之星Lv.2","勇氣之星Lv.3","勇氣之星Lv.4","勇氣之星Lv.5","射手之星Lv.1","射手之星Lv.2","射手之星Lv.3","射手之星Lv.4","射手之星Lv.5","尖銳之星Lv.1","尖銳之星Lv.2","尖銳之星Lv.3","尖銳之星Lv.4","尖銳之星Lv.5","咒語之星Lv.1","咒語之星Lv.2","咒語之星Lv.3","咒語之星Lv.4","咒語之星Lv.5","速度之星Lv.1","速度之星Lv.2","速度之星Lv.3","速度之星Lv.4","速度之星Lv.5","生命之星Lv.1","生命之星Lv.2","生命之星Lv.3","生命之星Lv.4","生命之星Lv.5","精神之星Lv.1","精神之星Lv.2","精神之星Lv.3","精神之星Lv.4","精神之星Lv.5")
Do
	右飾品 = int(Plugin.Memory.Read32Bit(Hwnd, &H011CD2E0))'右飾品
	第三洞 = int(Plugin.Memory.Read32Bit(Hwnd, &H011CD2A8))'右飾品
	第四洞 = int(Plugin.Memory.Read32Bit(Hwnd, &H011CD2AC))'右飾品
	對話視窗 = int(Plugin.Memory.Read32Bit(Hwnd, &H00F80558))
	If 第四洞 > 0 AND 第三洞 > 0 Then 
		TracePrint "第三洞:" & 附魔名稱(第三洞-310692) & "," & "第四洞:" & 附魔名稱(第四洞-310692)
	ElseIf 第三洞 > 0 Then
		TracePrint "第三洞:" & 附魔名稱(第三洞-310692)	
	End If
	If 對話視窗 > 0 Then '對話中選擇
		If 第四洞 > 0 AND 第三洞 > 0 Then '第二三四洞有附魔
			If 指定附魔 = 1 and (第四洞 = 三四洞(0) AND 第三洞 = 三四洞(1)) Then '第二三洞非指定重新附魔
				EndScript
			Else
				dm_ret = dm.FindStr(0, 0, 1024, 768, "重置附魔", "000000-000000", 1.0, intX1, intY1)
				If intX1 > 0 And intY1 > 0 Then 
					dm_ret = dm.FindStr(intX1 - 6, intY1 + 18, intX1 + 48, intY1 + 31, "重置需求", "000000-000000", 0.95, intX2, intY2)
				End If
			End If
		End If
		
		If ((intX1 > 0 And intY1 > 0) AND (intX2 = -1 And intY2 = -1)) Then 
			dm.KeyPress 40
			Delay 50 '會誤判請提高延遲
		End If
		
		dm.KeyPress 13
	Else '非對話點NPC
		If 右飾品 > 0 Then 
			dm_ret = dm.FindStr(0, 0, 1024, 768, "星星印章附魔|印章附魔", "000000-000000", 1.0, intX, intY)
			dm.MoveTo intX + 25, intY + 30
			dm.LeftClick 
		Else 
			dm.KeyPress 112 'F1重新裝備
		End If
	End If
	Delay 200
Loop

Function 大漠()
	set dm = createobject("dm.dmsoft")
	base_path = dm.GetBasePath()
	dm_ret = dm.SetPath(base_path)
	dm_ret = dm.SetDict(0, "光與精煉.txt")
	Hwnd = Plugin.Window.MousePoint()
	dm_ret = dm.BindWindow(Hwnd,"gdi","dx2","dx",4)
End Function
