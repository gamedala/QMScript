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
MacroID=fe688b2a-1e4f-4540-bcd2-8cde83917de1
Description=株光_自動餵寵
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
Hwnd1 = Plugin.Window.MousePoint()

Do
	//now_map=地圖編號 地圖=H0015F258 副本種類=H01107FD0 副本資訊=H01107FBC
	now_pet = Plugin.Memory.Read32Bit(Hwnd1, &H01103A10)
	If now_pet < 90 Then 
		//Call Plugin.Bkgnd.KeyPress(Hwnd1, 117)
		Call Plugin.Msg.Tips( now_pet & "要餵食寵物囉!!")
	Else 
		Call Plugin.Msg.Tips( now_pet & "還沒有到餵食時間!")
	End If
	Delay 30000
Loop
