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
MacroID=e3a26c3d-f2ee-4846-b3a3-4308a7c3165e
Description=Excel讀取
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
//Text = Plugin.File.ReadFileEx("Q:\LightRain0308\System\iteminfo_sak.lub")
//MyArray = Split(Text, "|")
//If UBound(MyArray) >= 0 Then 
//    For y = 0 To UBound(MyArray)
//		TracePrint MyArray(y)
//    Next
//End If


Call Plugin.Office.OpenXls("C:\Users\BOB\Desktop\光雨item.xlsx")
//Call Plugin.Office.WriteXls(1, 1, 2, "?容")
For i = 99 To 110
	Text = Plugin.Office.ReadXls(1, i, 2)
	TracePrint "內容： " & Text
Next 
Call Plugin.Office.CloseXls()
