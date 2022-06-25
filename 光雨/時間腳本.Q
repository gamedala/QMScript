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
MacroID=e1fd4632-c485-4b95-90dd-f4908ce6a744
Description=時間腳本
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
Dim 按鍵ID,初始時間戳,時間戳,重啟時間
按鍵ID = BeginThread(按鍵)
初始時間戳 = DateDiff("s", "1970/01/01 00:00:00", Now) - 28800
TracePrint "初始時間戳" & 初始時間戳

Do
    時間戳 = DateDiff("s", "1970/01/01 00:00:00", Now) - 28800
    TracePrint "時間戳"&時間戳
    重啟時間 = 10
    If 初始時間戳 + 重啟時間 < 時間戳 Then 
        初始時間戳 = DateDiff("s", "1970/01/01 00:00:00", Now) - 28800
        TracePrint 按鍵ID&"重設時間戳"&時間戳
        StopThread 按鍵ID
        按鍵ID = BeginThread(按鍵)
    End If
    Delay 1000
Loop

Sub 按鍵
    TracePrint "初始按鍵"
    Do
        Key=WaitKey()    
        If Key = 120 Then 
            TracePrint "指定視窗"
        End If
    Loop
End Sub
