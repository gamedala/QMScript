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
MacroID=8f168f6c-fe67-43d4-990f-3f0469e4e5dc
Description=關閉程序
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
For i = 1 to 2
Hwnd = Plugin.Window.Find(0, "Ragnarok")
TracePrint Hwnd
call Plugin.Window.CloseEx(Hwnd)


zmRunApp "Q:\LightRain0308\LightRain-RO.exe"
Delay 2000
Next

Private Declare Function GetDesktopWindow Lib "user32" () As Long
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal Hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

Sub zmRunApp(路徑)
    Dim p, DirPath, FileName
    p = InStrRev(路徑, "\")
    DirPath = Left(路徑, p)
    FileName = Right(路徑, Len(路徑) - p)
    ShellExecute GetDesktopWindow, "open", FileName, vbNullString, DirPath, 5
End Sub
