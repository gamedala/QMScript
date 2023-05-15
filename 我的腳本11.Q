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
MacroID=b25d85c2-ee8e-431f-934c-e4b056ec8896
Description=我的腳本1
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

Set dm = createobject("dm.dmsoft")

//主窗口 = dm.EnumWindow(0, "訂製自動打怪驗證", "#32770", 1 + 2 + 4 + 8 + 16)
//影藏 = dm.EnumWindow(主窗口, "", "AfxWnd100s", 2 + 4 + 8 + 16)
//開始窗口 = dm.EnumWindow(主窗口, "", "#32770", 2 + 4 + 8 + 16)
//開始 = dm.EnumWindow(開始窗口, "開始使用>>", "Button", 1 + 2 + 4 + 8 + 16)
//Call Plugin.Bkgnd.LeftClick(開始, 0, 0)
//Call Plugin.Window.Hide(影藏)

主窗口 = dm.EnumWindow(0, "提示通知", "#32770", 1 + 2 + 4 + 8 + 16)
影藏 = dm.EnumWindow(主窗口, "", "AfxWnd100s", 2 + 4 + 8 + 16)
開始窗口 = dm.EnumWindow(主窗口, "", "#32770", 2 + 4 + 8 + 16)
開始 = dm.EnumWindow(開始窗口, "開始使用>>", "Button", 1 + 2 + 4 + 8 + 16)
Call Plugin.Bkgnd.LeftClick(開始, 0, 0)
Call Plugin.Window.Hide(影藏)