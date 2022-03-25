[General]
SyntaxVersion=2
BeginHotkey=36
BeginHotkeyMod=8
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=35
StopHotkeyMod=8
RunOnce=0
EnableWindow=
MacroID=8bf8f839-2cf7-4a28-8cf0-7cd1976eb1c1
Description=©Û
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
Hwnd = Plugin.Window.MousePoint()
Rem ©Û¤ý
XY=Plugin.Color.FindMutiColor(0,0,1920,1080,"31FF31","1|0|31FF31,2|0|31FF31,6|0|31FF31,7|0|31FF31,8|0|31FF31,-1|1|31FF31,3|1|31FF31,5|1|31FF31,9|1|31FF31,-1|2|31FF31,3|2|31FF31,5|2|31FF31,9|2|31FF31,2|3|31FF31,8|3|31FF31,2|4|31FF31,8|4|31FF31,1|5|31FF31,7|5|31FF31,1|6|31FF31,7|6|31FF31,1|8|31FF31,7|8|31FF31",1)
ZB = InStr(XY,"|")
X = Clng(Left(XY, ZB - 1)) : Y = Clng(Right(XY, Len(XY) - ZB))
If x > 0 and y > 0 Then
Call Plugin.Media.Beep(988, 200)
    Delay 300
Else
    Call Plugin.Bkgnd.KeyPress(Hwnd, 118)
    Delay 155
    End If
Goto ©Û¤ý
