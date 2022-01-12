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
MacroID=67b9b3b2-1afe-4fd1-a217-7f8fd1d36fc0
Description=自動採集
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
Call 大漠設定()
Delay 100

Do
    dm_ret = dm.FindStr(775, 310, 820, 335, "園藝", "F1EFEE-0F1011", 1.0, intX, intY)
    dm.MoveTo intX,intY
    If intX > 0 And intY > 0 Then 
    	TracePrint "採集"
        dm.MoveTo intX, intY
        dm.LeftClick
    End If
    dm_ret = dm.FindStr(615, 485, 670, 515, "確定", "e5d4c7-1A2B38", 1.0, intX, intY)
    dm.MoveTo intX,intY
    If intX > 0 And intY > 0 Then 
        s = dm.Ocr(570,330,700,360,"ffffff-000000",1.0)
        答案 = Eval(s)
    	TracePrint "驗證:" & 答案
        dm.MoveTo intX, intY - 100
        dm.LeftClick
        n = Len(答案)
        i = 1
        For n
            y = int(Mid(答案, i, 1))
            Call 數字鍵盤(y)
            i = i+1
        Next
        dm.MoveTo intX,intY
        dm.LeftClick
        Delay 100
        dm.LeftClick
    End If
    Delay 500

Loop

Function 數字鍵盤(數字)
    Select Case 數字
    Case 0
        dm.MoveTo 990,475
    Case 1
        dm.MoveTo 830,405
    Case 2
        dm.MoveTo 900,405
    Case 3
        dm.MoveTo 970,405
    Case 4
        dm.MoveTo 830,475
    Case 5
        dm.MoveTo 900,475
    Case 6
        dm.MoveTo 970,475
    Case 7
        dm.MoveTo 830,545
    Case 8
        dm.MoveTo 900,545
    Case 9
        dm.MoveTo 970,545
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
