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
MacroID=9de26ef4-aab2-48f9-88e9-fe88b44162d2
Description=檢查兩點之間
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
Sub RealMove(x1,y1)
    Dim x, y, sudu
    sudu = 10//每次移動的速度
    dm.GetCursorPos 真是移動當前x, 真是移動當前y
    If x1 = 真是移動當前x Then 
        For y = 真是移動當前y To y1 Step sgn(y1 - 真是移動當前y)*sudu
            比對 x1, y
        Next
    ElseIf y1 = 真是移動當前y Then
        For x = 真是移動當前x To x1 Step sgn(x1 - 真是移動當前x)*sudu
            比對 x, y1
        Next
    ElseIf Abs(真是移動當前x - x1) > Abs(真是移動當前y - y1) Then
        For x = 真是移動當前x To x1 Step sgn(x1 - 真是移動當前x)*sudu
            比對 x, ((y1 - 真是移動當前y) / (x1 - 真是移動當前x)) * x + (y1 - (y1 - 真是移動當前y) / (x1 - 真是移動當前x) * x1)
        Next
    Else 
        For y = 真是移動當前y To y1 Step sgn(y1 - 真是移動當前y)*sudu
            比對 (y - (y1 - (y1 - 真是移動當前y) / (x1 - 真是移動當前x) * x1)) / ((y1 - 真是移動當前y) / (x1 - 真是移動當前x)), y
        Next
    End If
End Sub

Function 比對(x,y)
	color = dm.GetColor(x,y)
	If color = "212121" OR color = "5a5a5a" Then
		MessageBox "找到"
	End If
End Function
