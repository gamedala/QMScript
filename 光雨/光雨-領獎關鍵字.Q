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
MacroID=86dbef20-cdb3-457e-bccd-f73589cade1e
Description=光雨-領獎關鍵字
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
UEsDBBQAAgAIAORzpFRuVFfkbwIAAAgaAAAJABEAVUlQYWNrYWdlVVQNAAdGjnJiRo5yYkaOcmLtV8tOGzEUPc47PAJ5kBa6ySeULapYgECqREEigQUSi5QGCTUk1SSV2gVSf6XrrrrJGvUH2iVL+gdZZUeG64wnMaghY3uQC8qJbpzMzJ1jX19fH0fh4c/v7PX3nyt/cQ/riKLvppGQrjFhAywCEfG/77quf9md4knhhiwm5jBJbZyMz3mKbIYsTTYr7ven4Xp22EeTPm2UsIUGtQ6+QgVFyhj/XWzCs98OL37Fj65YlH5fxr1rB3iL19BHCoz5/JEJvH4r39tEBTsGPZgR/Ati7ajyVyjen1DDLqo4p1YVOarC8nwG9YuJ1l/Xj2FT/P/YbjrnBssP3H/VwJ/BDKb+ttHtdkN5zzEVv56Gn27dGdU/9frDpFrJd50q3qOu2YcMIozrk6TQnkF8IlL9O8QZWmS6PVgk/jmMdG8Qn6jEv0+sVXzAHsWhrrj3ivrPEvC0WlD+mMRfIf4vtO8bzD9TnX/5vLBJ6qNO5mj2pKCRf3Fp/CP+DZqHE3xU5x/ombRC/BP35v/EMP7z8PR6UP7kIG89HFHmOZR/NfrWXH/K8U9J49+h2KtH/e74M+J9QfnTEv828TfM4q88fr5W3wzzj+vPVQN+NuTPjXnmIf1pG71/x2zQx3flUrnaaJXKNefsdIz/xud2u9nQ5/f89eP/1PWLjfPHrKiBHDb0x5yogRxh6I+X4PtA8Pozj3D1xzLU9EcG4eqPPLUvFMa/ALv6g+99vv60oT+yCFd/8PEUFeKfk/h/9Dotk/ObKUzPPzz3Vsg6ZGsa/rbrr+n+Z4ow9CeP/5JC/uVhV38WEK7+fCXWdFD+JdjVn7xW+PrzFlBLAQIXCxQAAgAIAORzpFRuVFfkbwIAAAgaAAAJAAkAAAAAAAAAAAAAgAAAAABVSVBhY2thZ2VVVAUAB0aOcmJQSwUGAAAAAAEAAQBAAAAApwIAAAAA


[Script]
Dimenv Hwnd1, logs, ends
logs = 0
ends = 0
Hwnd = Plugin.Window.Search("多開領獎")//搜索標題指定句柄  
MyArray = Split(Hwnd, "|")//分割字串
If UBound(MyArray) >= 0 Then
	For i = 0 To UBound(MyArray) - 1
		Hwnd1 = Clng(MyArray(i))
		BeginThread 仙境傳說
		Delay 100
	Next  
End If

Sub 仙境傳說()
	句柄 = Hwnd1
    關鍵字 = "6666"
	//0=關閉 1=開啟
	提示視窗 = 1
    Call 大漠()
    Delay 100
	TracePrint "[" & 句柄 & "] 領獎腳本開始!"
    Do
    	地圖 = int(Plugin.Memory.Read32Bit(句柄, &H0015F25C))
		//地圖 = int(Plugin.Memory.Read32Bit(句柄, &H0015F258))
    	dm_ret = dm.FindStr(7, 676, 230, 701, 關鍵字, "ffcece-000000", 1.0, intX, intY)
    	If intX > 0 And intY > 0 And 地圖 = 16 Then 
			TracePrint "[" & 句柄 & "] 開始領獎!"
    		血 = int(Plugin.Memory.Read32Bit(句柄, &H011D0A14))
    		If 血 = 1 Then 
    			Delay int(10* rnd)*100
    			復活(2)
    		End If
			do
				Delay 500
				地圖 = int(Plugin.Memory.Read32Bit(句柄, &H0015F25C))
    			//地圖 = int(Plugin.Memory.Read32Bit(句柄, &H0015F258))
				對話視窗 = Plugin.Memory.Read32Bit(句柄, &H00F80558)
				TracePrint "[" & 句柄 & "] 領獎loop!" & 對話視窗
				If 對話視窗 > 0 Then
					dm.KeyPress 13
				else
					dm.MoveTo 500, 350
					dm.LeftClick
				End If
			Loop Until 對話視窗 = 0 AND 地圖 <> 16
			TracePrint "[" & 句柄 & "] 結束領獎!" & " 地圖: "&地圖
		End If
		Delay 1000
    Loop
End Sub

Function 復活(Run)
	If Run >0 Then
		Die = array("","移動到儲存場所","在原地復")
		Do
			dm.KeyPress 27
			Delay 250
			dm_ret = dm.FindStr(345, 435, 674, 565, Die(Run), "000000-313131", 1.0, intX, intY)
		Loop Until intX > 0 And intY > 0
		TracePrint "找到關鍵字: [移動到儲存場所]"
		If Run = 1 Then
			Do
				dm.MoveTo intX, intY
    			dm.LeftClick
				dm_ret = dm.FindStr(352,289,661,435, "確認", "000000-313131", 1.0, intX2, intY2)
			Loop Until intX2 > 0 And intY2 > 0
			TracePrint "找到關鍵字: [確認]"
		ElseIf Run = 2 Then
			intX2 = intX
			intY2 = intY
		End If
		Do
			dm.MoveTo intX2, intY2
    		dm.LeftClick 
    		Delay 200
			血 = int(Plugin.Memory.Read32Bit(句柄, &H011D0A14))
		Loop Until 血 > 1
		TracePrint "確認: [復活]"
	End If
End Function


Function 大漠()
	set dm = createobject("dm.dmsoft")
	base_path = dm.GetBasePath()//獲取dll路徑
	dm_ret = dm.SetPath(base_path)//全局路徑
	dm_ret = dm.SetDict(0,"光雨.txt")//設定字庫
	dm_ret = dm.BindWindow(句柄,"gdi","dx2","windows",4)//綁定窗口
	TracePrint "綁定視窗:" & 句柄 & "仙境傳說綁定是否成功:" & dm_ret
	If 提示視窗 = 1 AND logs=0 Then 
		logs = logs +1
		MsgBox "綁定視窗:" & 句柄 & "仙境傳說綁定是否成功:" & dm_ret
	End If
End Function

Sub OnThreadExit()
	dm.UnBindWindow 
	TracePrint "[腳本停止]大漠解除綁定窗口: " & 句柄
	If 提示視窗 = 1 AND ends=0 Then 
		ends = ends +1
		MsgBox "[腳本停止]大漠解除綁定窗口: " & 句柄
	End If
End Sub
