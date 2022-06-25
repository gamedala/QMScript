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
MacroID=23c188db-9e84-4e6d-b642-f07b7743f79f
Description=曲線座標
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
//用戶設置和變量定義
dim xzbz(5),yzbz(5)
UserVar ms=DropList{"百分比模式":0|"數值模式":1|"推薦模式":2}=0 "設置內容"
UserVar sz1=40 "百分比加血藍設置"
UserVar jxbfb=40 "血少於百分之幾加血"
UserVar jlbfb=40 "藍少於百分之幾加藍"
UserVar sz2=40 "數值比加血藍設置"
UserVar jxl=40 "血少於多少時加血"
UserVar zxz=40 "你的總血量是多少"
UserVar jll=40 "藍少於多少時加藍"
UserVar zlz=40 "你的總藍量是多少"
hwnd = Plugin.Window.MousePoint()
rect = Plugin.Window.GetClientRect(hwnd)
TracePrint rect
If InStrRev(rect, "534|361") = 0 Then 
    MessageBox "請將鼠標放在遊戲窗口內在啟動遊戲"
    EndScript
End If 
dw = Split(rect, "|") : dwx = dw(0) : dwy = dw(1)
If ms = 1 Then 
    jxbfb = jxl / zxz * 100
    jlbfb = jll / zlz * 100
ElseIf ms = 2 Then
    jxbfb = 40
    jlbfb = 40
End If 
ajz = array(81, 87, 65, 83, 68, 70)
ys = array("DBDBDB", "CFCFCF", "ffffff", "ffffff", "e6e6e6", "e6e6e6")
xzbz(0) = (845 - 614) / 100 * jxbfb + dwx + 64 : xzbz(1) = (845 - 614) / 100 * jlbfb + dwx + 64
yzbz(0) = dwy + 33 : yzbz(1) = dwy + 77
xzbz(2) = dwx + 82 : xzbz(3) = dwx + 170
yzbz(2) = dwy + 303 - (590 - 402) / 100 * jxbfb : yzbz(3) = dwy + 303 - (590 - 402) / 100 * jlbfb
xzbz(4) = - 67  * sin(3.1415926 * jxbfb / 100) + dwx + 382 : xzbz(5) = 67 * sin(3.1415926 * jlbfb / 100) + dwx + 386
yzbz(4) = 67 * cos(3.1415926 * jxbfb / 100) + dwy + 204 : yzbz(5) = 67 * cos(3.1415926 * jlbfb / 100) + dwy + 204
While 1=1
    i=0
    For 6
    	TracePrint "X" & xzbz(i) & "Y" & yzbz(i) & "color" & ys(i)
        IfColor xzbz(i),yzbz(i),ys(i),0 Then
            KeyPress ajz(i),1
        End If
        i=i+1
    Next
    Delay 10
Wend
TracePrint "end"