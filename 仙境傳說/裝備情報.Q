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
MacroID=dd33a1b3-29ac-492c-a540-3a7c492dcb12
Description=裝備情報
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
Dim 裝備(19, 5), 位址
MsgBox "滑鼠指向窗口,F8=他人裝備, F9=自己裝備"
Key=WaitKey()
If key = 119 Then 
	位址 = array(18669640, 18669872, 18667784, 18668016, 18668944, 18668712, 18668248, 18669176, 18668480, 18669408, 18672424, 18672656, 18672888, 18673120, 18673352, 18673584, 18673816, 18674048, 18674280, 18674512) '他人裝備
ElseIf key = 120 Then
	'位址 = array(18667320, 18667552, 18665464, 18665696, 18666624, 18666392, 18665928, 18666856, 18666160, 18667088, 18670104, 18670336, 18670568, 18670800, 18671032, 18671264, 18671496, 18671728, 18671960, 18672192) '自己裝備
	位址 = array(18164608, 18164840, 18162752, 18163680, 18163216, 18164144, 18162984, 18163912, 18163448, 18164376, 18169248, 18169480, 18167392, 18168320, 18167856, 18168784, 18167624, 18168552, 18168088, 18169016) '自己裝備
End If
位址位置 = array("頭上", "頭中", "頭下", "右手", "左手", "衣服", "披肩", "鞋子", "右裝飾", "左裝飾", "時-頭下", "時-右手", "時-披肩", "時-右裝飾", "時-衣服", "時-左手", "時-鞋子", "時-左飾品", "時-頭上", "時-頭中")
Call 提取裝備()
Function 提取裝備()
	Hwnd1 = Plugin.Window.MousePoint()
    For i=0 to 19
        物品 = "&H0" & Hex(位址(i))
        精煉 = "&H0" & Hex(位址(i)+52)
        一洞 = "&H0" & Hex(位址(i)-16)
        二洞 = "&H0" & Hex(位址(i)-12)
        三洞 = "&H0" & Hex(位址(i)-8)
        四洞 = "&H0" & Hex(位址(i)-4)
        裝備(i,0) = Plugin.Memory.ReadString(Hwnd1, 物品, 10)
        裝備(i,1) = int(Plugin.Memory.Read32Bit(Hwnd1, 精煉))
        裝備(i,2) = int(Plugin.Memory.Read32Bit(Hwnd1, 一洞))
        裝備(i,3) = int(Plugin.Memory.Read32Bit(Hwnd1, 二洞))
        裝備(i,4) = int(Plugin.Memory.Read32Bit(Hwnd1, 三洞))
        裝備(i,5) = int(Plugin.Memory.Read32Bit(Hwnd1, 四洞))
        TracePrint 位址位置(i) & ":" & 裝備(i, 0) & " 精煉:" & 裝備(i, 1) & " 一洞:" & 裝備(i, 2) & " 二洞:" & 裝備(i, 3) & " 三洞:" & 裝備(i, 4) & " 四洞:" & 裝備(i, 5)
        TracePrint 位址位置(i) & ": @item2 " & 裝備(i, 0) & " 1 1 " & 裝備(i, 1) & " 0 " & 裝備(i, 2) & " " & 裝備(i, 3) & " " & 裝備(i, 4) & " " & 裝備(i, 5)
    Next
End Function
