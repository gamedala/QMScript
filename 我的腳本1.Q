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
MacroID=48eacb2a-cce2-40cc-af72-824fce1f5c4f
Description=我的腳本1
Enable=1
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
找圖 = 循環找圖("123.bmp|456.bmp|789.bmp")
TracePrint 找圖(0)&找圖(1)
Function 循環找圖(尋找圖片)
	路徑 = "C:\abc\pic\"
	圖片分割 = Split(尋找圖片,"|")
	For i = 0 To UBound(圖片分割)
		TracePrint 路徑&圖片分割(i)
		FindPic 0,0,1024,768,路徑&圖片分割(i),0.9,intX,intY
		If intX > 0 And intY > 0 Then 
			循環找圖 = array(intX,intY)
			Exit For
		Else 
			循環找圖 = array(123, 456)
			'Exit For
		End If
	Next
End Function