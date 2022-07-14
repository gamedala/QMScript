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
MacroID=2d6ff077-138e-476d-b58c-244a898af5de
Description=RO肅︹干﹀
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

﹀秖 = 80
干﹀X = int((128 / 100) * ﹀秖)
Do
	IfColor 干﹀X+811,79,"635A5A",0 Then
    	TracePrint "倒и干﹀"
	Else    
    	TracePrint "临ぃ惠璶干﹀"
	End If
	Delay 500
loop
Call Plugin.Window.SetText(Hwnd,"AJJL")
