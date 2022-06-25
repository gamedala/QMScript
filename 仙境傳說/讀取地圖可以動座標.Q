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
MacroID=58ddccaf-4ce8-44c4-a4f8-37449342f86c
Description=讀取地圖可以動座標
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
Text = Plugin.File.ReadFileEx("C:\dm\prontera.txt")
dim MyArray, my_xpm(313,392)
MyArray = Split(Text, "|")
If UBound(MyArray) >= 0 Then 
    For y = UBound(MyArray) To 1 Step - 1 
		TracePrint "Y: " & y & " X: " & MyArray(lens)
    	For x = len(MyArray(lens)) To 1 Step - 1 
    		my_xpm(x, y) = Mid(MyArray(lens), x, 1)
    		//TracePrint "Y: " & y & " X: " & x & my_xpm(x, y)
        Next
    	lens = lens + 1
    Next
End If

TracePrint "座標區塊: " & my_xpm(193, 191)
TracePrint "座標區塊: " & my_xpm(195, 191)
TracePrint "座標區塊: " & my_xpm(197, 191)
TracePrint "座標區塊: " & my_xpm(193, 192)
TracePrint "座標區塊: " & my_xpm(195, 192)
TracePrint "座標區塊: " & my_xpm(197, 192)
