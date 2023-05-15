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
Description=執行時間測試
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

//經過測試15毫是最低了,在低都沒用了
Declare Sub Sleep Lib "kernel32.dll" (ByVal Milliseconds As Integer)
//Private Declare Sub Sleep Lib "kernel32" Alias s "Sleep" " (ByVal dwhilliseconds As Long)
//Private Declare PtrSafe Sub Sleep Lib "kernel32" " (Byval dwhilliseconds As Long)
//iPrivate Declare Sub sleep Lib "kerel32" (Byval dwhilliseconds As Long)
//如果要高精度,以下三個打開
Private Declare Function GetTickCount Lib "kernel32.dll" () As Long
Private Declare Function timeBeginPeriod Lib "winmm.dll" (ByVal uPeriod As Long) As Long
Private Declare Function timeEndPeriod Lib "winmm.dll" (ByVal uPeriod As Long) As Long

'call Delay1()
call sleep1()


Sub Delay1
	Call timeBeginPeriod(1)
	t2 = GetTickCount()
	For i = 1 To 100
		KeyDown "Space", 1
		KeyUp "Space", 1
		Delay 1
	Next
	k2 = GetTickCount() - t2
	TracePrint "1豪秒平均精度(Delay):" & (k2 / 100) & "ms"
	
	KeyPress "Enter", 1
	
	t2 = GetTickCount()
	For i = 1 To 100
		KeyDown "Space", 1
		KeyUp "Space", 1
		sleep(1)
	Next
	k2 = GetTickCount() - t2
	TracePrint "1豪秒平均精度(Delay):" & (k2 / 100) & "ms"
	Call timeEndPeriod(1)
End Sub


Sub sleep1
	Call timeBeginPeriod(1)
	t2 = GetTickCount()
	For i = 1 To 100
		sleep(1)
	Next
	k2 = GetTickCount() - t2
	TracePrint "1豪秒平均精度(Sleep):" & (k2 / 100) & "ms"
	
	t2 = GetTickCount()
	For i = 1 To 100
		sleep(2)
	Next
	k2 = GetTickCount() - t2
	TracePrint "2豪秒平均精度(Sleep):" & (k2 / 100) & "ms"
	
	t2 = GetTickCount()
	For i = 1 To 100
		sleep(3)
	Next
	k2 = GetTickCount() - t2
	TracePrint "3豪秒平均精度(Sleep):" & (k2 / 100) & "ms"
	
	t2 = GetTickCount()
	For i = 1 To 100
		sleep(5)
	Next
	k2 = GetTickCount() - t2
	TracePrint "5豪秒平均精度(Sleep):" & (k2 / 100) & "ms"
	
	t2 = GetTickCount()
	For i = 1 To 100
		sleep(10)
	Next
	k2 = GetTickCount() - t2
	TracePrint "10豪秒平均精度(Sleep):" & (k2 / 100) & "ms"
	
	t2 = GetTickCount()
	For i = 1 To 100
		sleep(15)
	Next
	k2 = GetTickCount() - t2
	TracePrint "15豪秒平均精度(Sleep):" & (k2 / 100) & "ms"
	
	t2 = GetTickCount()
	For i = 1 To 100
		sleep(20)
	Next
	k2 = GetTickCount() - t2
	TracePrint "20豪秒平均精度(Sleep):" & (k2 / 100) & "ms"
	Call timeEndPeriod(1)
End Sub
