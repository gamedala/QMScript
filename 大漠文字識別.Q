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
MacroID=d82824e3-e8ea-44bd-aed7-1885acff1222
Description=大漠文字識別
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

[Attachment]
UEsDBBQAAgAIAOqUc1PLX9iVlAAAAF4BAAALABEAZG1fc29mdC50eHRVVA0AB0nvl2Eb+pdhQe6XYW2PUQrEIAxE/wveYr7LRK21nyLmLru32ptuVApuWQgSxpeZRFWrNDLj8wJ37nJBxG2ZoYqqmv5edQb7IQu9zSwPIRMLuNxmUuyqkEtbMttk02QPHINt9OXBLi3ipFOnf1M9fWbqBsS15I/h07bv8xH+NhA/8uwE1TJCkO9V5tV8lFHVbkZY3Bsl92D+KZwTjBC67QtQSwMEFAACAAgAOKBzUwxbwky0AAAAbQEAAAgAEQBwYXNzLnR4dFVUDQAHqAKYYZMGmWFqAZhhTZAxDgMhDAT7k+4XrhIlWRsHL/UJ/v+kGFCk65AHzy442hiAQVTwxltN2nlUbfiamruHUmwjTgQF1cz8Yq2QspEvVFFcyRjXFPp9C62nzpxkh3w3qhOVgbaRc0DqQrme6MqwNHXv6IDELStCddXIhgHh3tKF2NBmeWNkVrsJl64MgtMszy1UifPgzsrpa02L6Kx9YWbXHH/25fwonIdzPnZAiTzK49+sZvxQqMEcHvke3OJ/UEsBAhcLFAACAAgA6pRzU8tf2JWUAAAAXgEAAAsACQAAAAAAAAAgAICBAAAAAGRtX3NvZnQudHh0VVQFAAdJ75dhUEsBAhcLFAACAAgAOKBzUwxbwky0AAAAbQEAAAgACQAAAAAAAAAgAICBzgAAAHBhc3MudHh0VVQFAAeoAphhUEsFBgAAAAACAAIAgQAAALkBAAAAAA==


[Script]
PID_1=BeginThread(asd)
//Global 驗證,驗證1,驗證2
驗證 = 10240
驗證1 = 10240
驗證2 = 10240

Sub asd
驗證 = 10240
	set dm = createobject("dm.dmsoft")
	base_path = dm.GetBasePath()
	dm_ret = dm.SetPath(base_path)
	dm_ret = dm.SetDict(0, "pass.txt")
	dm_ret = dm.FindStr(2076, 404, 2283, 456, "=?", "000000-000000", 1.0, intX, intY)
	//MessageBox intX & "/" & intY
	If intX >= 0 And intY >= 0 Then 
		s = dm.Ocr(intX-130,intY-7,intX,intY+7,"000000-000000",1.0)
		//dm_ret = dm.FindStr(intX-70,intY,intX,intY+15,"驗證","ffb5de-000000",1.0,intX,intY)
		MessageBox s
		Call 移除中文(s,驗證)
		s = Eval(z)
		MessageBox s
		//MessageBox s
	End If	
End Sub


Function 移除中文(message,驗證2)
	MsgBox 驗證 & "/" & 驗證1 & "/" & 驗證2
	n = Len(message)
	i = 1
	For n
		y = Mid(message, i, 1)
		m = Asc(y)
		If m >0 and m<>32 Then
			z = z & y
		End If
		i = i+1
	Next
End Function




//Call 大漠設定()
//Call 窗口綁定()
//驗證卷軸 = 115
//技能按鍵 = 114
//蒼蠅翅膀 = 113
//技能延遲 = 1000
//Do
//	Delay 500 
//	dm_ret = dm.FindPic(10, 520, 255, 740, "C:\dm\ban.bmp", "000000", 0.8, 0, intX, intY)
//	If intX > 0 And intY > 0 Then 
//		Call 驗證(intX + 70, intY + 30, intX + 130, intY + 45)
//	Else 
//		now_npc = Plugin.Memory.Read32Bit(Hwnd1, &H00E78FF0)
//		If now_npc > 9 Then 
//			dm.KeyPress 技能按鍵
//			Delay 技能延遲
//			dm.KeyPress 蒼蠅翅膀
//		Else
//			dm.KeyPress 蒼蠅翅膀
//		End If
//	End If
//Loop
//
//Function 使用迴圈(A,B)
//	For B
//		dm.KeyPress A
//		Delay 20
//	Next
//End Function
//
//
//Function 驗證()
//	dm.KeyPress 驗證卷軸
//	call 使用迴圈(驗證卷軸, 10)
//	dm_ret = dm.FindPic(0,0,1024,768,"C:\dm\msg.bmp","000000",0.9,0,intX,intY)
//	If intX > 0 And intY > 0 Then 
//		Delay 500
//		verify = dm.Ocr(intX + 70, intY + 30, intX + 130, intY + 45,"000000-000000",1.0)
//		verify = Eval(verify)
//		Call Plugin.Bkgnd.SendString(Hwnd1, verify)
//		Call Plugin.Msg.Tips("驗證提示: " & verify)
//		dm.KeyPress 13
//	End If		
//End Function
//
//Function 大漠設定()
//	set dm = createobject("dm.dmsoft")
//	base_path = dm.GetBasePath()
//	dm_ret = dm.SetPath(base_path)
//	dm_ret = dm.SetDict(0,"pass.txt")
//	//pass.txt字典讀取
//End Function
//
//Function 窗口綁定()
//	Hwnd1 = Plugin.Window.MousePoint()
//	dm_ret = dm.BindWindow(hwnd1,"gdi","dx2","windows",4)
//	//大漠綁定視窗
//End Function
