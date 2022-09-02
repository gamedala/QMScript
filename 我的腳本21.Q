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
MacroID=5082edbc-1108-44e2-ae2e-ef20695ae7f4
Description=我的腳本2
Enable=1
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
Call set_dm
Delay 100

Do
dm.WheelDown
Delay 1000
Loop

sub set_dm()
	Set dm = createobject("dm.dmsoft")
//    base_path = dm.GetBasePath()&"露比"
//    dm_ret = dm.SetPath(base_path)
//    dm_ret = dm.SetDict(0, "字典.txt")
    Hwnd = Plugin.Window.MousePoint()
    dm_ret = dm.BindWindow(Hwnd, "gdi", "dx2", "dx", 4)
	TracePrint "dm_ret - " & dm_ret

End sub

Sub OnThreadExit()
    dm.UnBindWindow 
End Sub
