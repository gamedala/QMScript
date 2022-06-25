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
Description=多線程範例
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
Dimenv Hwnd1		//定義環境變量（多線程需要）  
RunApp "notepad.exe"	
RunApp "notepad.exe"	  //啟動記事本測試用  
RunApp "notepad.exe"	
Delay 2000				//等待記事本工具打開  
Hwnd = Plugin.Window.Search("未命名 - 記事本") //搜索所有記事本窗口句柄  
MyArray = Split(Hwnd, "|")					//分解句柄  
If UBound(MyArray) >= 0 Then				  //判斷是否搜到句柄？  
	For i = 0 To UBound(MyArray) - 1   
		hwndEx = Clng(MyArray(i))			 //類型轉換  
		Call Plugin.Window.Move(hwndEx, i * 200 + 100, i * 200 + 100) //調整窗口位置  
		Call Plugin.Window.Active(hwndEx)	 //激活前面  
		Hwnd1 = Plugin.Window.FindEx(hwndEx, 0, "Edit", 0)			//獲取可打字的窗口句柄  
		BeginThread 線程函數					  //啟動線程  
		Delay 100							 //啟動線程需要點時間  
	Next  
End If  
  
//以下是【無限循環】防止全部腳本停止。	
Do  
TracePrint "【無限循環】防止全部腳本停止"  
	Delay 1000*30  
Loop  
  
//以下是【測試用】子程序例子	
  
Sub 線程函數()  
  Hwnd = Hwnd1  
	Set dm = createobject("dm.dmsoft")  
	dm_ret = dm.BindWindow(Hwnd,"normal","windows","windows",0)  
	TracePrint "線程綁定結果:"&dm_ret  
   For i = 0 To 20  
	dm.SendString Hwnd,i  
	  '  Call Plugin.Bkgnd.SendString(Hwnd2, i)  
		Delay 100  
		dm.KeyPress 13  
	   ' Call Plugin.Bkgnd.KeyPress(Hwnd2, 13)  
		Delay 200  
	Next  
End Sub  
  
Sub OnScriptExit()  
	// 這句只會在主線程結束時被調用到  
	dm_ret = dm.UnBindWindow()  
End Sub  