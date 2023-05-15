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
MacroID=076ec164-2cb7-440a-ba8f-57b38dad5bf0
Description=登入帳號腳色
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
Call set_dm
call login("10393326","103933",0)
Sub login(帳號, 密碼, 腳色位置)
	Dim charX, charY
	do
		dm_ret = dm.FindStr(551, 544, 649, 575, "確認", "000000-313131", 1.0, intX, intY)
		If dm_ret = 0 Then 
			dm.Moveto intX, intY
			dm.LeftClick
			dm.Moveto 1024, 768
		Else 
			dm_ret = dm.FindStr(567, 515, 637, 544, "Login", "ffffff-000000", 1.0, intX, intY)
			If dm_ret = 0 Then
				dm.KeyPress 9 
				call 分離(帳號)
				dm.KeyPress 9
				call 分離(密碼)
				dm.KeyPress 13
			Else 
				dm_ret = dm.FindStr(865, 510, 954, 535, "開始遊戲", "ffffff-000000", 1.0, intX, intY)
				If dm_ret = 0 Then 
					charX = array(100, 260, 420, 580, 740, 100, 260, 420, 580, 740, 100, 260, 420, 580, 740)
					charY = array(150, 150, 150, 150, 150, 350, 350, 350, 350, 350, 550, 550, 550, 550, 550)
					dm.Moveto charX(腳色位置), charY(腳色位置)
					dm.LeftClick 
					dm.Moveto 1024, 768
					dm.KeyPress 13
				Else 
					Exit Do
				End If
			End If
		End If
		Delay 1000
	Loop
End Sub

Function 分離(Text)
    n = Len(Text)
    For i = 1 To n
        y = Mid(Text, i, 1)
        dm.KeyPressChar y
        Delay 20
    Next
End Function

Function set_dm
	Set dm = createobject("dm.dmsoft")
    base_path = dm.GetBasePath()
    dm_ret = dm.SetPath(base_path)
    dm_ret = dm.SetDict(0, "login.txt")
    Hwnd = Plugin.Window.Find(0, "Ragnarok")
    dm_ret = dm.BindWindow(Hwnd, "gdi", "dx2", "dx", 4)
    TracePrint "Hwnd:" & Hwnd & " dm_ret:" & dm_ret
End Function
