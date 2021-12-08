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
MacroID=6d79ef76-243b-4945-b630-ddb98cb29553
Description=株光_自動釣漁
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
UEsDBBQAAgAIABZfbVNj8inKGQEAAO4iAAAJABEAZmlzaDQuYm1wVVQNAAcLqI9hDKiPYS+kj2HtmUEOAiEMRcvanQvjwpWZhSfwAO69gAfyTHMpvYFBAlEZB0hFOhTSn3YWkpDC49shczrf92B1NHkweTW5Malga38fzfh65fKlYXeTYBVTJhdRJYWYzEcklgx//z0msjHVsXhMEkCk59B0jPCuOhBJJtqK//reT85zfu3qH0yYm8RWiDo4MBVmTvOkw4JgotSjOSauPEyReiocFqBbfr8+QZpEh5TGQm2VTpkgj7KOq6JVemaSaRI0Eyqr9Mgku5PgmZBapVsmn0McfEEpxITkNiD9JKJaJinBpAmr/Iql4M1ncSac7/HZXaXgzHllx2pAMGEebmVE//dEM6ejfSb9hcdEsPABMsg3LUZAZkz8ERGPb78SfALgCVBLAwQUAAIACACEdXlTIz3hNhYBAADuIgAACQARAGZpc2gxLmJtcFVUDQAHUqGfYYChn2G7o49h7ZnLDcIwDIbDEogzJyZgAO4swEDMxFSsUKKWRyIS203qxI5s/anUWn3En93G6uX6PLrZzn6c/Lj7sfdj5w7z8cfbH9tkEqZw72bWyVJMUh5TO8Xx/x6zwHTHEjAxIMKwAEwWU/BF/G2TXtgKrlmlT1RdKZPmC7N1a8IlZXKJg1ryFvE1ubAoYZIKmENnBjwk/PzoiXzTV8Ikn8eurEiqmTCWigYma18vxFSu9zJFYGQmyBKkmglXqYzIhJjENUxYS2VYJngSb8GEpRtQz6Q8iUf+nnTDQk5ix8OEq2WuY9Kyj6cDWdmfZPr3Tv0JMDsCE+Gi9CdYH9+hSADpZzKeAiaGRRKQyf5piQHyxyT0mMn492uSpBdQSwECFwsUAAIACAAWX21TY/IpyhkBAADuIgAACQAJAAAAAAAAACAAgIEAAAAAZmlzaDQuYm1wVVQFAAcLqI9hUEsBAhcLFAACAAgAhHV5UyM94TYWAQAA7iIAAAkACQAAAAAAAAAgAICBUQEAAGZpc2gxLmJtcFVUBQAHUqGfYVBLBQYAAAAAAgACAIAAAACfAgAAAAA=


[Script]
//失效請調整視野距離

//當前視窗句柄
Hwnd1 = Plugin.Window.MousePoint()
//解析視窗位置
Call 大漠設定()
Call 窗口綁定()

Do	
	numl = Plugin.Memory.Read32Bit(Hwnd1, &H01104464)
	If numl <> 136 Then 
		Call 買釣竿()
	Else 
		Call 尋找點擊()
	End If
Loop

Function 買釣竿()
	Call Plugin.Media.Beep(988, 200) //蜂鳴一秒
	dm.MoveTo 512, 90
	dm.LeftClick 
	//dm.RightClick
	Delay 100
	dm.KeyPress 13
	Delay 100
	dm.KeyPress 13
	Delay 100
	dm.KeyPress 114
	Delay 100
End Function

Function 尋找點擊()
	dm_ret = dm.FindStr(602,554,905,693,"中獎點擊","ffffff-000000",1.0,intX,intY)
	If intX > 0 And intY > 0 Then 
		dm.MoveTo intX, intY+80
		dm.LeftClick
		//dm.RightClick
	End If
End Function

Function 大漠設定()
	set dm = createobject("dm.dmsoft")
	base_path = dm.GetBasePath()
	dm_ret = dm.SetPath(base_path)
	dm_ret = dm.SetDict(0,"pass.txt")
	//pass.txt字典讀取
End Function

Function 窗口綁定()
	Hwnd1 = Plugin.Window.MousePoint()
	dm_ret = dm.BindWindow(Hwnd1,"gdi","dx2","windows",4)
	//大漠綁定視窗
End Function

//	dm_ret = dm.FindStr(10, 520, 350, 740, "請馬上進行驗證", "ffb5de-000000", 1.0, intX, intY)
//	If intX >= 0 and intY >= 0 Then 
//		dm.KeyPress 13
//		Delay 100
//		dm.KeyPress 13
//		Delay 100
//		Call Plugin.Bkgnd.SendString(Hwnd1, "@fish")
//		dm.KeyPress 13
//		Delay 100
//		verify = dm.Ocr(10, 680, 180, 700, "b5ffb5-000000", 1.0)
//		Call Plugin.Msg.Tips("驗證提示: " & verify)
//		n = Len(verify)
//		i = 1
//		verify2 = "" 
//		For n
//			y = Mid(verify, i, 1)
//			m = Asc(y)
//			If m >0 And m<>32 Then
//				verify2 = verify2 & y
//			End If
//			i = i+1
//		Next
//		verify = Eval(verify2)
//		Call Plugin.Msg.Tips("驗證提示: " & verify)
//		For 10
//			i = i+1
//			Call Plugin.Bkgnd.SendString(Hwnd1, i)
//			dm.KeyPress 13
//			Delay 100
//		Next
//		dm.MoveTo 512, 90
//		dm.RightClick
//		Delay 350
//		dm.KeyPress 40
//		Delay 350
//		dm.KeyPress 13
//		Delay 350
//		Call Plugin.Bkgnd.SendString(Hwnd1, verify)
//		Delay 350
//		dm.KeyPress 13
//		Delay 350
//		dm.KeyPress 13
//	End If
