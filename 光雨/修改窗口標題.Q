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
MacroID=bb89c5a2-d915-4068-8b01-4ab450555e1e
Description=修改窗口標題
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
HwndEx = Plugin.Window.Search("Ragnarok")
dim MyArray
MyArray = Split(HwndEx, "|")
If UBound(MyArray)>=0 Then
    i=0
    For UBound(MyArray)
        帳號 = Plugin.Memory.ReadString(MyArray(i), &H01151430, 10)
        Call Plugin.Window.SetText(MyArray(i),帳號)
        i=i+1
    Next
End If
