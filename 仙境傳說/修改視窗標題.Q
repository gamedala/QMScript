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
MacroID=3bb873b1-c7c1-4115-a219-73003289602b
Description=修改視窗標題
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
修改標題名稱 = "多開領獎"
Do
    key = GetLastKey()
    Hwnd = Plugin.Window.MousePoint()
    If key = 120 Then 
        Call Plugin.Window.SetText(Hwnd, 修改標題名稱)
    ElseIf key = 119 then
        Call Plugin.Window.SetText(Hwnd, "Ragnarok")
    End If
Loop
