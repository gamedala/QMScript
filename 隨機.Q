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
MacroID=138b5350-54eb-4b7a-a38e-ee18276354d1
Description=繦诀
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
start=now
Randomize

Do
    For i = 0 To 2
        Call 玡т︹ゴ┣(1159,247,1533,576,"B7AF8F", i,0.8,114,113)
        Delay 60 * Rnd + 143
    Next
Loop
Sub 玡т︹ゴ┣(x1, y1, x2, y2, 肅︹, 家Α, , м, )
    FindColorEx 588,183,1020,653,肅︹,家Α,,intX,intY
    If intX > 0 And intY > 0 Then
        MoveTo intX, intY
        Delay 50 * Rnd + 133
        If 1*Rnd() = 0 Then 
        	TracePrint "a123"
        Else 
        	TracePrint "a456"
        End If
        Delay 50 * Rnd + 133
        c=c+1
    End If
    If c >= 2 or DateDiff("s",start,now)>1 Then
        c = 0
        delay 20 * Rnd + 99
        If int(2*Rnd) = 0 Then 
        	TracePrint "b123"
        Else 
        	TracePrint "b456"
        End If
        delay 250 * Rnd + 300
        start=now
    End If
End Sub
Function zmRnd(程, 程)
    zmRnd = Int((程 - 程 + 1) * Rnd() + 程)
End Function
