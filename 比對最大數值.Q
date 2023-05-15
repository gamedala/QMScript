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
MacroID=928f5be7-3e1b-4277-a096-6d45556ca6bb
Description=比對最大數值
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
Dim Text, ans(9), arr(9)

Text = "153"
n = Len(Text)
For i = 1 To n
	For s = 1 To n
		y = Mid(Text, s, 1)
		If i <> s Then 
			 arr(i) = arr(i) & y
		End If 
	Next
	TracePrint arr(i) 
Next

arrs = UBound(arr)
For i = 1 To arrs
	For s = i+1 To arrs
		If arr(i) > arr(s) Then 
			arr(s) = 0
		Else 
			arr(i) = 0
		End If
	Next
Next

For i = 1 To arrs
	If arr(i) > 0 Then 
		TracePrint "答案: " & arr(i)
	End If
Next