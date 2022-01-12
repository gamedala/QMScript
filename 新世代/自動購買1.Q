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
MacroID=25b7afe2-9e16-49c2-b844-b1455abc6864
Description=自動購買
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
Do
    Key=WaitKey()    
    If Key = 120 Then 
        BeginThread 購買
        TracePrint "指定視窗"
    End If
Loop

Sub 購買()
	Call 大漠設定()
	Delay 100
    Do
        Key=WaitKey()
        If Key = 97  Then 
            數量設定 = 15
            TracePrint "小鍵盤按鍵1"
        ElseIf Key = 98  Then 
            數量設定 = 20
            TracePrint "小鍵盤按鍵2"
        ElseIf Key = 99 Then
            數量設定 = 30
            TracePrint "小鍵盤按鍵3"
        ElseIf Key = 100 Then
            數量設定 = 40
            TracePrint "小鍵盤按鍵4"
        ElseIf Key = 101 Then
            數量設定 = 50
            TracePrint "小鍵盤按鍵5"
        Else
            數量設定 = 0
        End If
        模擬器2 = Plugin.Window.MousePoint()
        TracePrint 模擬器 & "-" & 模擬器2
        
        If 模擬器2 = 模擬器 And 數量設定 > 0 Then 
            s = dm.Ocr(566, 232, 618, 257, "e5d4c7-1A2B38", 1.0)
            TracePrint "目前數量:" & s
            需求 = 數量設定 - s
            TracePrint "需求數量:" & 需求
            dm.MoveTo 553,455
            dm.LeftClick 
            Delay 200
            n = Len(需求)
            i = 1
            For n
                y = int(Mid(需求, i, 1))
                Call 數字鍵盤(y)
                i = i+1
            Next
            dm.MoveTo 600,600
            dm.LeftClick 
            Delay 100
            dm.LeftClick
        End If
        Delay 500
    Loop
End Sub

Function 數字鍵盤(數字)
    Select Case 數字
    Case 0
        dm.MoveTo 1030,355
    Case 1
        dm.MoveTo 820,285
    Case 2
        dm.MoveTo 890,285
    Case 3
        dm.MoveTo 960,285
    Case 4
        dm.MoveTo 820,355
    Case 5
        dm.MoveTo 890,355
    Case 6
        dm.MoveTo 960,355
    Case 7
        dm.MoveTo 820,425
    Case 8
        dm.MoveTo 890,425
    Case 9
        dm.MoveTo 960,425
    End Select
    dm.LeftClick 
    TracePrint "點擊:" & 數字
    Delay 200
End Function

Function 大漠設定()
    set dm = createobject("dm.dmsoft")
    base_path = dm.GetBasePath()
    dm_ret = dm.SetPath(base_path)
    dm_ret = dm.SetDict(0,"新世代.txt")
    模擬器 = Plugin.Window.MousePoint()
    TracePrint 模擬器
    dm_ret = dm.BindWindow(模擬器,"gdi","windows","windows",0)
    TracePrint dm_ret
End Function
