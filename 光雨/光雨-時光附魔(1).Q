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
MacroID=134846dd-0571-49e9-82cf-154ea695f2e4
Description=光雨-時光附魔
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
二三洞 = array(29081,29689)
Do
	頭上 = int(Plugin.Memory.Read32Bit(Hwnd, &H011CD768))
	第二洞 = int(Plugin.Memory.Read32Bit(Hwnd, &H011CD72C))
	第三洞 = int(Plugin.Memory.Read32Bit(Hwnd, &H011CD730))
	第四洞 = int(Plugin.Memory.Read32Bit(Hwnd, &H011CD734))
	對話視窗 = int(Plugin.Memory.Read32Bit(Hwnd, &H00F80558))
	
	If 對話視窗 > 0 Then '對話中選擇
		If 第二洞 > 0 AND 第三洞 > 0 Then '第二三四洞有附魔
			If 指定附魔 = 1 and (第二洞 = 二三洞(0) AND 第三洞 = 二三洞(1)) Then '第二三洞非指定重新附魔
				EndScript
			Else
				dm_ret = dm.FindStr(0, 0, 1024, 768, "我想把附魔初始化", "000000-000000", 1.0, intX1, intY1)
			End If
		else
			dm_ret = dm.FindStr(0, 0, 1024, 768, "開始吧", "000000-000000", 1.0, intX1, intY1)
			dm_ret = dm.FindStr(0, 0, 1024, 768, "高級模式", "000000-000000", 1.0, intX2, intY2)
		End If
		
		If (intX1 > 0 And intY1 > 0) OR (intX2 > 0 And intY2 > 0) Then 
			dm.KeyPress 40
			Delay 50 '會誤判請提高延遲
		End If
		
		dm.KeyPress 13
	Else '非對話點NPC
		If 頭上 > 0 Then 
			dm_ret = dm.FindStr(0, 0, 1024, 768, "時空頭附魔", "ffffff-000000", 1.0, intX, intY)
			dm.MoveTo intX + 25, intY + 25
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
