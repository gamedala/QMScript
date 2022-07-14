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
MacroID=928099d2-094b-4914-8921-aab8178974a8
Description=и竲セ2
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
//set dm = createobject("dm.dmsoft")
//base_path = dm.GetBasePath()
//dm_ret = dm.SetPath(base_path)
//dm_ret = dm.SetDict(0, "瓜喷靡.txt")
//
//dm_ret = dm.FindStr(3004,215,3281,367, "瓜2", "ffffff-303030", 0.75, intX, intY)
//TracePrint intX & " , " & intY
//
//MoveTo intX, intY
//
Do
Call Plugin.TURING.Pixel_FromScreen(3004,215,3281,367)
Call Plugin.TURING.Filter_Outline()
Call Plugin.TURING.Filter_Binaryzation("1-215")
计秖 = Plugin.TURING.Incise_ConnectedArea(True, "55-60", "55-60")
'call Plugin.TURING.Pixel_Preview()
For i = 0 To 计秖//才箇凝
    Call Plugin.TURING.Incise_Preview(i)
Next

计沮 = Split(Plugin.TURING.Incise_GetCharData(), "|")
Delay 100
Loop While 计秖 = -1
For i = 0 To 计秖
    才 = Split(计沮(i), ",")
    TracePrint "オ" & 才(0)
    toX = 才(0)
    TracePrint "" & 才(1)
    TracePrint "糴" & 才(2)
    TracePrint "蔼" & 才(3)
Next

MoveTo 3020, 400
LeftDown 1
//Do
//TracePrint moveX
//	moveX = moveX +2
//	MoveTo 3020 + moveX, 400
//	Delay 1
//Loop While moveX + 3020 < toX + 3030
MoveTo 3030+toX,400
LeftUp 1
