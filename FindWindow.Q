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
MacroID=321edf49-f3d5-4e79-a829-4cd4a9c48e86
Description=FindWindow
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
Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Integer 
Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" (ByVal hWndParent As Long, ByVal hWndChildAfter As Long, ByVal lpszClass As String, ByVal lpszWindow As String) As Long

'TracePrint FindWindow(0, "Ragnarok") '標題

'TracePrint FindWindow("Ragnarok", 0)'類名

Hwnd = FindWindow(0, "未命名 - 記事本")'標題

TracePrint FindWindowEx(Hwnd, 0, "NotepadTextBox", 0) '父窗口,子窗口,類名,標題名
