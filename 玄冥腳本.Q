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
UEsDBBQAAgAIAOQEZ1ONostFSAMAAAgkAAAJABEAVUlQYWNrYWdlVVQNAAc2IIdhNiCHYTYgh2HtWFtPE0EU/rbl0nIpRaFyE+uFRBMf9N0YLRFjgpdQNMREk4qoxNKSBRN886/44ouJifwRTYzBR/wBJjzxJvWb7SydEgg7F12b9JDDlKUz35xzZs453yZRl69fBrfffx77iQNyHUns1dLoUp55UgPJAgn5916tVgsf19rSUvKb2iFj2M2xkypinqL2UNPUXmo/tY+aqYceA3LOXtuFLS1zqPJnHXncQoWjj7fQkRxPTLiWd8x3tzd/bV3+tuUl+flGqv7sIe7gCswlBc8L8RPH4Iaj+r9pzGPWYgc9Ej8n744u/jz9vYol3EMJKxx15QQSAf6gzL1R53XIMbzDcWpb4pOZqr9icf0g5l+1mO/BTmznxy07OztO1nnC5LdrMM807zTyX6Kp54saszBXiqpTwjOUDfeQYf7rlb1KVPyEkv8eYRlrVNMdZA3sTyr4c0Qt4Tnu0w9lzdob5v8+uWZU/A4Ff574G6z7FvH3dO1X+cI0u48y1TfcyZABfqdifwO/wDgs4rU+PkTfPKDh/64D8V+09L/ozVMa+N2o9/BCHvPk+Tx/S/xtev+GpU1R8VOK/bP0vb7Xm+3PyvWi4qcPjX+R+3hFP+hlwxHG/2RwD6Pj9yj4N9n9rQY5wKdWuAe9LJSj/WnUeVlU/F4FP27pjhl/93CfBW3F3WK+WKqs5YtL/vKLv4Q/9fFprPNnePYrdvlHu/6JenVt//yXWX1fcg/i3lVM8r82fn/T/S/x/q1zD8IPheAehpWgkRuOlosG9Sej4BeC9ev5NwreIfnHG0LjvVuUOQNQ6/8yrRe9jwl6kH+0/Z9V8B8Qf4PoZXZhJpIxwB9sir/g/+YMhvx/H3/0iO/8C/6vY7+oVSn8H3Lbr75ZLVQ3bOebRrDV+efm9w8Ln36Yn984+J/ol9Lyswv+d4bjJKL3P0Nwyv+8PPTy7zCc8j+McTylYX8O8fI/sdew74uD/43AKf/zxjme1/D/KNzyv7McJzTwx9Dgf7Zi+/7qEkQPSH8wkb4zmB93/m11/uKA/2vn/3G45f8X5J2Oij8Bp/zfm4Je/j8Np/w/WO+chv2TCn4c/E/U65D/OeA/2vh5uH3/oYvvWmzwbd8ftKW15Q9QSwECFwsUAAIACADkBGdTjaLLRUgDAAAIJAAACQAJAAAAAAAAAAAAAIAAAAAAVUlQYWNrYWdlVVQFAAc2IIdhUEsFBgAAAAABAAEAQAAAAIADAAAAAA==


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
