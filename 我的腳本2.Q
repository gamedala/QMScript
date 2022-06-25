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
MacroID=02497fb7-619e-4cac-b512-b21aa6165a78
Description=我的腳本2
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
//獲得遊戲窗口句柄和位置尺寸等信息以便使用後台操作
hw=Plugin.Window.mousepoint()
clintrect = Plugin.Window.GetClientRect(hw)
Call Plugin.Window.Size(hw, 550, 400)
rect=split(clintrect,"|",-1,1)
xoffset=cint(rect(0))
yoffset=cint(rect(1))
xwinsize=cint(rect(2))
ywinsize = cint(rect(3))
TracePrint xwinsize & ywinsize
If xwinsize<>550 or ywinsize<>400 Then
    Call messagebox("請將鼠標放在遊戲窗口內啟動腳本。")
    Goto QMScript_end
End If 

UserVar fillredscale=14 "補血百分比"
xcenter=49: ycenter=46: colorred="0000FF": r=32
ang=(3.1415926*fillredscale/100)
xred=cint(xcenter-r*sin(ang))
yred=cint(ycenter+r*cos(ang))
xbar=209: ybar=25: colorbar="000000"
xmap1=420 :ymap1=20 :xmap2=530 :ymap2=100: coloranimy="0019A6": colorme="008C0D"
xmapcenter=475: ymapcenter=60
xhead=47: yhead=33: colorhead="000000"
Rem start
MoveTo xoffset+xwinsize/2,yoffset+ywinsize/2
timestart=now
Rem 尋找敵人
ret=Plugin.BkgndColor.FindCenterColor(hw,xmap1+2,ymap1+2,xmap2-2,ymap2-2,coloranimy)
If ret="-1|-1" Then
    Call 人物移動
Else 
    zuobiao=split(ret,"|",-1,1)
    x1=zuobiao(0)
    y1=zuobiao(1)
    xanimy=xwinsize/2+7+(x1-xmapcenter)*5
    yanimy=ywinsize/2+(y1-ymapcenter)*5
    Call 戰鬥
End If 
color1=Plugin.BkgndColor.GetPixelColor(hw,xhead,yhead)
If color1<>clng("&H" & colorhead) Then
    Goto QMScript_end
End If 
Goto 尋找敵人
Rem QMScript_end
howlong=datediff("n",timestart,now)
Call MessageBox("鶴羽工具：遊戲結束。你共掛機約 " & howlong & " 分鐘時間。")
EndScript 
Sub 戰鬥
    Call Plugin.Bkgnd.MoveTo(hw,xanimy,yanimy)
    Delay 50
    Call Plugin.Bkgnd.LeftClick(hw,xanimy,yanimy)
    Delay 50
    Call Plugin.Bkgnd.MoveTo(hw,xwinsize/2,ywinsize/2)
    time1=now
    Rem 等待怪物血條出現
    color1=Plugin.BkgndColor.GetPixelColor(hw,xbar,ybar)
    If color1<>clng("&H" & colorbar) Then
        If datediff("s",time1,now)<3 Then
            Call 檢查血量
            Delay 20
            Goto 等待怪物血條出現
        Else 
            Goto 戰鬥結束
        End If 
    End If 
    killanimy=killanimy+1
    Rem 等待戰鬥結束
    Call 檢查血量
    color1=Plugin.BkgndColor.GetPixelColor(hw,xbar,ybar)
    If color1=clng("&H" & colorbar) Then
        Delay 20
        Goto 等待戰鬥結束
    End If 
    killanimy=killanimy+1
    Delay 500
    Rem 戰鬥結束
    Call 檢查血量
End Sub 
//
Sub 檢查血量
    color1=Plugin.BkgndColor.GetPixelColor(hw,xred,yred)
    If color1<>clng("&H" & colorred) Then
        KeyPress 49,1
        redbt=redbt-1
        Delay 500
    End If 
End Sub 
//
Sub 人物移動
    Call Plugin.Bkgnd.MoveTo(hw, xmove, ymove)
    TracePrint xmove & "--" & ymove
    Delay 100
    Call Plugin.Bkgnd.LeftClick(hw,xmove,ymove)
    Delay 1000
    Call Plugin.Bkgnd.MoveTo(hw,xwinsize/2,ywinsize/2)
    Delay 2000
End Sub
