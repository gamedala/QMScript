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
MacroID=12c16f65-b164-46e8-843d-0d2c1e52fedc
Description=丁代刚
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

//竒筁代刚15睝琌程,常⊿ノ
Declare Sub Sleep Lib "kernel32.dll" (ByVal Milliseconds As Integer)
//Private Declare Sub Sleep Lib "kernel32" Alias s "Sleep" " (ByVal dwhilliseconds As Long)
//Private Declare PtrSafe Sub Sleep Lib "kernel32" " (Byval dwhilliseconds As Long)
//iPrivate Declare Sub sleep Lib "kerel32" (Byval dwhilliseconds As Long)
//狦璶蔼弘,ゴ秨
Private Declare Function GetTickCount Lib "kernel32.dll" () As Long
Private Declare Function timeBeginPeriod Lib "winmm.dll" (ByVal uPeriod As Long) As Long
Private Declare Function timeEndPeriod Lib "winmm.dll" (ByVal uPeriod As Long) As Long

call Delay1()
//call sleep1()


Sub Delay1
	Call timeBeginPeriod(1)
	t2 = GetTickCount()
	For i = 1 To 100
		KeyDown "Space", 1
		KeyUp "Space", 1
		Delay 1
	Next
	k2 = GetTickCount() - t2
	TracePrint "1花キА弘(Delay):" & (k2 / 100) & "ms"
	
	KeyPress "Enter", 1
	
	t2 = GetTickCount()
	For i = 1 To 100
		KeyDown "Space", 1
		KeyUp "Space", 1
		sleep(1)
	Next
	k2 = GetTickCount() - t2
	TracePrint "1花キА弘(Delay):" & (k2 / 100) & "ms"
	Call timeEndPeriod(1)
End Sub


Sub sleep1
	Call timeBeginPeriod(1)
	t2 = GetTickCount()
	For i = 1 To 100
		sleep(1)
	Next
	k2 = GetTickCount() - t2
	TracePrint "1花キА弘(Sleep):" & (k2 / 100) & "ms"
	
	t2 = GetTickCount()
	For i = 1 To 100
		sleep(2)
	Next
	k2 = GetTickCount() - t2
	TracePrint "2花キА弘(Sleep):" & (k2 / 100) & "ms"
	
	t2 = GetTickCount()
	For i = 1 To 100
		sleep(3)
	Next
	k2 = GetTickCount() - t2
	TracePrint "3花キА弘(Sleep):" & (k2 / 100) & "ms"
	
	t2 = GetTickCount()
	For i = 1 To 100
		sleep(5)
	Next
	k2 = GetTickCount() - t2
	TracePrint "5花キА弘(Sleep):" & (k2 / 100) & "ms"
	
	t2 = GetTickCount()
	For i = 1 To 100
		sleep(10)
	Next
	k2 = GetTickCount() - t2
	TracePrint "10花キА弘(Sleep):" & (k2 / 100) & "ms"
	
	t2 = GetTickCount()
	For i = 1 To 100
		sleep(15)
	Next
	k2 = GetTickCount() - t2
	TracePrint "15花キА弘(Sleep):" & (k2 / 100) & "ms"
	
	t2 = GetTickCount()
	For i = 1 To 100
		sleep(20)
	Next
	k2 = GetTickCount() - t2
	TracePrint "20花キА弘(Sleep):" & (k2 / 100) & "ms"
	Call timeEndPeriod(1)
End Sub
