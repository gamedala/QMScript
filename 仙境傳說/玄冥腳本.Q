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
MacroID=1afdbdc5-cc00-4ba4-b891-fd3015ffa5d4
Description=玄冥腳本
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=1
QUI=Form1
[Relative]
SetupOCXFile=
[Comment]

[UIPackage]
UEsDBBQAAgAIAISrg1SWb2EReAIAAAgaAAAJABEAVUlQYWNrYWdlVVQNAAdyEUpichFKYnIRSmLtV89LG0EU/ia/oyZqjNbaS6696V0KNagUtAWTliK0kGoKYkxkbUHBQ/+VXjwG2r+gh97rRfCo/0FOuTXbN9lZMwZTd2a2TCP5wssku/v2m3lv5s03UXg4/zV99fXbwjX68AxRdNw0EtI1JqyLKSAi/ndc1/UvuyMMFX6TxUQOk9TGyXjOU2RjZGmycXG/MwrXg8MWGvT5hAJWUafWwQlUMEczxn8Xu+fZq5+nzffrlyxKv3/EvWuv8QKL0EcKjPn8kXt4/Va+V0QZGwY9GBP8k2LtqPKXKd6HqOIlKjigVhU5qsJyPoP6xUTrr+t/YSP8/1hrOAcGyw/cf8nAn8EMpv620Wq1QnnPOyp+bQ0/3brTq3/q9YdJtZLvOhV8QE2zD1lEGNcnSaE9g/hEpPr3Bns4ItPtwRTxT6Cne4P4RCX+LWKtYBevKA41xb1X1H+WgKfVgvLHJP4y8R/Tvm+Qf6aaf/m8UCT1USNzNHuS15h/cWn8Pf4VysMO9tX5u3omrRD/RF/+dwzjn4Gn14PyJ7vz1sM2zTyH5l+VvjXXn3L8U9L4Nyj26lG/Pf6seF9Q/rTEv0b8dbP4K4+fr9Xlm/nH9eeSAT+74c8NeOZv+tM22nfHrNvHzVKhVKkfFUpVZ+/jAP91p/H5cKVxrMvv++tmYNj1i43zx7ioARw29MeEqAEcYeiPefB9IHj9ySBc/fEYavoji3D1xwy1jxTGPwm7+oPvfUnx24b+mEa4+oOPZ04h/jmJ//vF2dvmpckJzgym55+nZM/5eKiQftHwt11/Tfc/U4ShPxeonVWYfzOwqz/zCFd/PhFrOij/LOzqT14rfP35B1BLAQIXCxQAAgAIAISrg1SWb2EReAIAAAgaAAAJAAkAAAAAAAAAAAAAgAAAAABVSVBhY2thZ2VVVAUAB3IRSmJQSwUGAAAAAAEAAQBAAAAAsAIAAAAA


[Script]
//啟動“test1”執行緒，並返回PIDID2編號
//PIDID_1=BeginThread(test_1)
//啟動“test2”執行緒，並返回PIDID2編號
//PIDID_2=BeginThread(test_2)
//啟動“test3”執行緒，並返回PIDID3編號
PIDID_3=BeginThread(test_3)
//當前視窗句柄
Hwnd1 = Plugin.Window.MousePoint()
//當前Val_now=地圖編號 春風=10D8CF8 密語=00F33FE4
Val_now = Plugin.Memory.Read32Bit(Hwnd1, &H01017EE4)

//迴圈檢查地圖
//	Event Form1.Button1.Click
//		Form1.GroupBox1.Value = 50
//	End Event
Do
	//當前Val=地圖編號
	Val = Plugin.Memory.Read32Bit(Hwnd1, &H01017EE4)
//	MessageBox Val
	//Val 不等於 Val_now

	If Val <> Val_now Then
		PauseThread  PIDID_1//終止腳本
		PauseThread  PIDID_2//終止腳本
		Call Plugin.Media.Beep(988, 200) //蜂鳴一秒
	ElseIf Val = Val_now Then
		ContinueThread PIDID_1//繼續腳本
		ContinueThread PIDID_2//繼續腳本
	End If
	Delay 200
Loop

//自動技能
Sub test_1() //test執行緒
	Hwnd1 = Plugin.Window.MousePoint() //當前視窗句柄
	Do //迴圈
		Call Plugin.Bkgnd.KeyPress(Hwnd1, 116) //後台按鍵
		Delay 250 //延遲
		Call Plugin.Bkgnd.KeyPress(Hwnd1, 113) //後台按鍵
		Delay 250 //延遲
	Loop
End Sub

//自動輔助
Sub test_2() //test執行緒
	Hwnd1 = Plugin.Window.MousePoint() //當前視窗句柄
	Do //迴圈
		Call Plugin.Bkgnd.KeyPress(Hwnd1, 113) //後台按鍵
		Delay 240000 //延遲
	Loop
End Sub

//1:1自動蜂鳴
Sub test_3() //test執行緒
	Hwnd1 = Plugin.Window.MousePoint() //當前視窗句柄
	Do //迴圈
		Val = Plugin.Memory.Read32Bit(Hwnd1, &H00E73DFC)
		If Val > 0 Then 
			Call Plugin.Media.Beep(988, 100) //蜂鳴一秒
			Delay 100
		End If
	Loop
End Sub
