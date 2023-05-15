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
MacroID=cd03d9f4-1b9f-464c-80b5-5b1202ac9ee8
Description=設定窗口大小
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
//Set dm = createobject("selenium")


set dm = createobject("dm.dmsoft")
Hwnd = Plugin.Window.MousePoint

'Call Plugin.Window.SetClientSize(Hwnd, 1920, 1080)
'Call Plugin.Window.SetClientSize(Hwnd, 1024, 768)
'Call Plugin.Window.SetClientSize(Hwnd, 800, 600)
// 全局搜索
result = dm.FindDataEx(hwnd,"00000000-FFFFFFFF","?? 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ?? ?? ?? ?? 00 00 00 00 67 8E 1E 00",4,1,0)
if len(result) = 0 then
     MessageBox "找不到"
     EndScript
end if

result = split(result,"|")
count = ubound(result)+1
MessageBox "找到"&count&"?地址"
