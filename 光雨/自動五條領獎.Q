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
MacroID=e2d1f1e1-ea6a-4596-842d-87edee291b57
Description=自動五條領獎
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
UEsDBBQAAgAIAMoWO1aPe2r2fwMAAAgmAAAJABEAVUlQYWNrYWdlVVQNAAfNPNNjzTzTY80802PtWE1PU0EUPa/lo+WjtAKVL7GAKDslcWGMMaFEogkigerCREOFKsRSSFsN/gv/AmtWbnDpT9CtO/0HXbGTeuZ1Hp0SiG/mPXw06SW3E9o3c+beO3PvPS+Mmvz4nvi1/2XkN07JQ4RxXI2iQ/nOkmpLHAjJ/4+r1arzdbUlTSV/qG0yhp0c26ki5hFqFzVK7ab2UnuosVro0UdNyHnHLTc2raxgh39lpPAIBY5FfIKOJHlinLWsfz28Nvf56+xPKwx5sCjP8QR3YC4RWJaDHzrnmcq9Gq6Dr/42jwwWPeygS+In5d3Rxc/Q37vIYQlZbHPUlSsI2fgJmXvdzmuTo3N/L4u25P/Kwk5x28P1g5g/62G+BW/idX7QUqlUfFnnFZPfkcE807xTz3+hhp7PbcycXCmqThZvkDfcQ4z5r1v2Km7xQ0r+e4EtlKimO4gb2B9W8FeImsUGntEPec3a6+T/HrmmW/w2BT9D/D3WfQ/xt3TtV/nCPLuPPLVouJMBA/x2xf46fppxWMd7fXyIvrlPw/8dp+K/7tH/ojePaOB3otbDC3nJk1fk+cvx0/T+DUqb3OJHFPsX6Xt9rzfaH5frucWPnhn/Ve5jk37Qy4ZDjH+/fQ/d43cp+HPs/nbtHFCkFrgHvSyUpP1R1HiZW/xuBT9o6QwY/+hsn9ltxdPV1Gq2UEqt5opbby8If/rgdaDzF3j2C97yj3b9E/Xqwcn5z7P6vuMexL0rmOR/bfzehvuf5f0rcw/CD2n7HjqVoJ4bzpcZg/oTU/DT9vq1/OsG74z8Yw2g/t7NzZw+qPV/i9aL3scE3c4/2v6PK/jLxN8jep5dmInEDPATDfEX/N+cwZD/n+APn/fQ2sXzfx37Ra3qwOWQ9Idyeafgdb55/Jqdfx4cHZa88O8g+J/ol5y67wf/u85xHO77nwEEy/8G4S//S3G8qmF/EsHyP7FXh/8Hwf+G4C//G+U4peH/YfjL/yY4jmngj6DO/7yK1/dX/XI/h9T7BvODzr/Nzl/84P/TMoZuz98o/OX/N+Sddos/Bn/5/y2ONzXwr8Ff/i/Wm9TAH1fwg+B/ol47/C+I/j+l2L9kx36bvs8b8y+BO6Ph/wkF/zHxPhqzv1r8de2fhH/vf24fbnqaf/ebt/mj+xm0xFyWed5yvHslfm4YnMERg/s3BX/fP+ri+y3NjP8XUEsBAhcLFAACAAgAyhY7Vo97avZ/AwAACCYAAAkACQAAAAAAAAAAAACAAAAAAFVJUGFja2FnZVVUBQAHzTzTY1BLBQYAAAAAAQABAEAAAAC3AwAAAAA=


[Script]
Sub 綁定窗口()
	Hwnd = Plugin.Window.Find(0, "Ragnarok")
	If Hwnd > 0 Then 
    	Call 大漠()
    	Delay 100
		TracePrint "[" & 句柄 & "] 領獎腳本開始!"
    	Do
			' 當在地圖origin03
    		If "origin02" = dm.ReadString(hwnd, "011513C0", 0, 15) Then 
    			' 抓取提示過關
    			dm_ret = dm.FindStr(6,706,298,737, "好啦恭喜你們也成為強咒術師", "ffff00-000000|ffffff-000000", 1.0, intX, intY)
    			If intX > 0 Then 
    				' 血量少於2直接復活
    				If int(Plugin.Memory.Read32Bit(Hwnd, &H01155E14)) <= 2 Then 
    					Delay int(10* rnd)*100
    					復活 (2)
    				Else 
    					' 找尋NPC
    					dm_ret = dm.FindColor(204, 165, 500, 529, "ffff55-000000", 1.0, 0, intX2, intY2)
    					If intX2 > 0 Then 
    						dm.moveto intX2, intY2
    						dm.LeftDown 
    						dm.LeftUp
    						Delay 100
    					End If
    					Do
    						dm.KeyDown 13
    						dm.KeyUp 13
    						Delay 50
    					Loop While int(Plugin.Memory.Read32Bit(Hwnd, &H00F05990)) > 0
    				End If
    			End If
    		End If
			Delay 1000
    	Loop
	End If
End Sub

Function 復活(Run)
	If Run >0 Then
		Die = array("","移動到儲存場所","在原地復活")
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
		Do Until int(Plugin.Memory.Read32Bit(Hwnd, &H01155E14)) > 1
			dm.MoveTo intX2, intY2
    		dm.LeftClick 
    		Delay 200
		Loop
		TracePrint "確認: [復活]"
	End If
End Function


Function 大漠()
	set dm = createobject("dm.dmsoft")
	base_path = dm.GetBasePath() & "光雨"
	dm_ret = dm.SetPath(base_path)//全局路徑
	dm_ret = dm.SetDict(0,"關鍵字.txt")//設定字庫
	dm_ret = dm.BindWindow(Hwnd, "gdi", "dx2", "windows", 4)//綁定窗口
	MsgBox "綁定窗口:"&Hwnd&" 是否成功:"&dm_ret
End Function

Sub OnThreadExit()
	dm.UnBindWindow 
	TracePrint "[腳本停止]大漠解除綁定窗口: " & 句柄
End Sub

Event Form1.Button1.Click
	BeginThread 綁定窗口
End Event