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
MacroID=1d4ef1b7-70e1-4c88-88b7-0c4f50560a90
Description=UI紀錄日誌
Enable=1
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
UEsDBBQAAgAIAAx/rla2ti/EcAQAAAgyAAAJABEAVUlQYWNrYWdlVVQNAAe2BGFktgRhZLYEYWTtWktPU00Yfk4LUqACRaiKt6Kf9yveTYyJGElI0O+L7efCRJOqVYmlmIIG/4Bb/4Ab1y6MC/du3LjRrTvdmPgH3El95lzsgBDPOzN4RHnJ2ylN5zxzeW/PTNMI5N3b3IenLwY+Yp6cQRqzjXas0j7zQvWlB0iF/882Go3o48aKLCv5Sm0J91DtdSu1jdpOzVA7qKupndQstSvYenRTc9Q11F5qHzVP7aeuDZ83u7K8v71cwiT/plHAedTY1vEQEsnTYqJneT/78uD9J6cevffSfPsqG3z0P0ZxCOaSgedF+Pmf4H5vNTmHEsYsRtDBCBjhtxrgl7je91DBRZQxwVYqvUj588+FsTduv5awjfz0T9AVkcvIZH3Cwv2g+g9Z9PdgJ7b9beXl09efbeYvcNkl6W8ad5rxLzWn5ou7Z1GsVFmnjOuoGo6hi/GvM6xT4uKntPh3GeOYopqOoMdg/mkN/xJRy7iJf7kOVWHujeJ/NnxmXPwWDb9E/BnmfYv996Tzb9X2/xyrjyq1bjiSPgP8Vdr8m/jD3IcbuCvH9+vlbsH6t83b/xuW66/q84wAP4OghtflKp3iC5aftCWM/2XhNffT0oVioViuTRWKlfr4rSXC3/7smlX/K4w8dcafCl9NRMXf/tCn4tpfu2b/Y/Q9udfNtf+e8Hlx8TsW9P8ix3GH6yDLhuvo/xEHjovfqeGfZfV/z88BdWqNY5BloTzn346Al8fFz2r4I5x7zS7+iPOfilenv8+/yux7m2NQ614zif9i/K45+1/m+k9zDGodhv19iDJB0zYWl10G+adbwx/2nx/4Xxy8BezP60Pz3C1Onx4N3zZ+2NaftjI2PjU9PDlj29+4hF/u/KVEy5/2a18T6/Pjj9j/cpr9/Uf8GaJXWYWbSJcBfu8c/1fnP+YMrgOep/jEbur6xb60xOc/O4T+r/JVVDclwf9UvMqE713wvy1sNyN+/uuHU/7nFYTrn4db/jeA4Mw9Lv5auOd/2wX4+n1REvxvHdzyvw1stwnmvx5u+d8g240C/AH8yP9MxTb/50J9w6j40aB/0vkznTC+Lf90wP/E8X8D3PK/f0Kfjou/EU75n7cTigfEx98Et/xPPW+rAH8zkuV/Kl9H/G+U2GrNpwzxswb4BQRnwEqKfu0ZxOAK/UAqvQb4g3DK/8T4WzV8W2lYJgBb/rnn5R2r/qXxiUrdtr/FBVDS/DGwufv0wNovs79tmM+/DlvEn+b9+75FHW7p798l81f5Krr/SIJ/qVo9+l2XC/6ldm9IEAt2wC3/OsL2pAB/J5zyL+xXcUiAvwvJ3r/NJn1op9uiZfz/RG9+rOyZCf25Qf9UwvNPmj+44t+nBPa/G075t3eA7XEB/h645d9H2R4U4O9Fk38nwb/2wS3/OhHOKS7+frjlX9L5H4BT/uX/evCYYP4HkSz/UuON+Jft+YFt/fkbpaK/UkZ961PR5wHtvyrub8J/hzT7H6XHTRpyDyUm97+H4Y7/hjYswnctNvjfAFBLAQIXCxQAAgAIAAx/rla2ti/EcAQAAAgyAAAJAAkAAAAAAAAAAAAAgAAAAABVSVBhY2thZ2VVVAUAB7YEYWRQSwUGAAAAAAEAAQBAAAAAqAQAAAAA


[Script]
//自動列表最末後一列
Event Form1.Timer1.Timer
	Call Plugin.Bkgnd.KeyPress(Form1.ListBox1.Hwnd, 35) 
End Event

//紀錄文字函式
Sub 紀錄日誌(紀錄文字)
	Form1.ListBox1.list = Form1.ListBox1.list & "|" & 紀錄文字
	
End Sub

//腳本
For a=1 to 50
	//執行腳本
	Call 紀錄日誌(a&"開啟執行腳本")
	Delay 100
Next
