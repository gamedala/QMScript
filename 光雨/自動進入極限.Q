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
Description=自動進入極限
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
UEsDBBQAAgAIAMglLVZNAfOXjgQAAAgyAAAJABEAVUlQYWNrYWdlVVQNAAcs4sBjLOLAYyziwGPtWltvVFUU/s5M76VX26G0WAeQUq7lUlQMMdpGoklFQuslJpIMMNDCdEqmRdFfQxNejE/GSHwg8KRPGolvvuk/6APpGx2/fS7MnqYNZ+297QbT1azZ7XT2+fZea6/Ld85kEcnjP3r+Xv5h8B+sk3eQxVq1FU3ae0GsoXQDmfjvtWq1mrxd3ZaXSp5SG2IfNnNspCqft1DbqK3UdmoHdQe1M3I9uqg91FeovdQ+ao7aT90ZX29t27wvvFzEAn+WkMf7KHOs4BtIJMcTk1wreM5n705+vvrryF9Blr+/2xG99wk+xHGYSwuCIMHPPQc3GfX/TWIGUxYraGMGTPAbDfBnaO9bKOI8CpjnKJVeZML998S5N+28hnhM4vT/pNuSXs4tVOYtwg9q/gmL+QHsxHa+b1lZWXFynS/ZjK0azDPNO7X8l6nr+dL6LMmVquoUcBklwzV0Mv+1x71KWvyMlv8+xRwWqaYr6DbYf1bDv0jUAq7iY9qhJKy9Sf7fEV8zLX6Dhj9D/Dus+xb+D6T71/nCJLuPErViuJI+A/xGbf81/An64QpuyvGh+uYugf2b1vn/iqX9VSvVIsBvRtTDK/mCJ6/C81fkq2n89cd7Sovfou1/iraXW71+/93x9dLit27o/2muY5Z2kGXDAfo/4UBp8ds0/PfY/d0Kc0CFWuYaZFkox/23IuJlafHbNXzf0uwZf3Vjm4VtxUfT+elCeTE/XazMXfuP8Pd/f8nr/HM8+2W7/COuf6penX12/kusvte5BhV3ZZP8L8bvqIv/AuNviWtQdpgI4zCpBLXcsLmMGtSfTg1/Irx+lH/T4G2Qf4I+1O67pZnTBb3+z3H3qvcxQQ/zj9j+3Rr+BeLfIXqJXZiJdBrg99T5X/F/cwZD/h+ofvIgddcmn9kK/i/Zv6pVTXgxZOL20tJC2Xa+uf9edv75843vvv7xt3ufPZj9afmeQZHywf9Uv5TUfRf87zWOw0jf//TBL//rh1v+l0d0zz0tfg5++d9ORDVQiQ/+NwC3/G+I4z6B/XfBLf/bw3G3AH8QNf4nuGW8odj2n8OxPR6GvpCL7/yb9Yxvy19c8P/98ZlKe/6G4Jb/vx7HdFr83XDL/w9wHBHgvwq3/F9db68Af1jD98H/VL1O+J+P/j+v7f986Pt52r5kzL8U7qjA/ns0/A+I95Ux+4v8L93/Xri7/zN2f9Zq/vgju/lDyzNW86cKl4sl2/kWD8B8848LPG9Fxt4iX68anMFBg/jbh/X8+6RF/qk9fz+yyWe2gn+/JYh/Va8an+Wfredfql4n/N8F/1LeOyHY/wic8q/gFMe3BfgH4JZ/HeV4SIA/Cr/866B2/mzlweNf/rR5/m/LH2z5yxNE9bA3A/xuMD8Dv2LLP3zw70Nwy7+PcXxDEH+H4ZZ/j3McE+AfgdPnr+L8fxRu+debsU3T4h+DU/4Vnr8zAvwxuOVf6tuDpwX4x+GXf6l8fdZR/vH9/HRb7MTH89eT0PufKO4WGYWFkIvI1jBggH+qLv5vE2+B2WcO35r1/2L8cbj9/oUUX5d/AVBLAQIXCxQAAgAIAMglLVZNAfOXjgQAAAgyAAAJAAkAAAAAAAAAAAAAgAAAAABVSVBhY2thZ2VVVAUAByziwGNQSwUGAAAAAAEAAQBAAAAAxgQAAAAA


[Script]
Sub 綁定窗口
	Hwnd = Plugin.Window.Find(0, "Ragnarok")
	Call 大漠()
	Delay 100
	Do
		If "prontera" = dm.ReadString(hwnd, "011513C0", 0, 15) and Plugin.Memory.Read32Bit(Hwnd, &H0115621C) > 0 Then 
		Form1.Caption.Click = hwnd
			dm_ret = dm.FindStr(213, 72, 864, 600, "極限道館", "000000-000000", 1.0, intX, intY)
			If intX > 0 Then 
				dm.MoveTo intX + 25, intY + 45
				dm.LeftClick 
				Do While Plugin.Memory.Read32Bit(Hwnd, &H00F05990) > 0
					dm.Keydown 13
					dm.Keyup 13
					Delay 100
				Loop
			End If
		Else
			Delay 4000
		End If
		Delay 1000
	Loop
End Sub

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
End Sub

Event Form1.Button1.Click
	BeginThread 綁定窗口
End Event
