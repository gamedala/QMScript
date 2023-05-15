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
MacroID=60337e4b-3d8d-4b53-9df9-81ce7b5df5f8
Description=測試腳本
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
分離("123456789")

Function 分離(Text)
    n = Len(Text)
    TracePrint n
    For i = 1 To n
        y = Mid(Text, i, 1)
        TracePrint y
        Delay 100
    Next
End Function
