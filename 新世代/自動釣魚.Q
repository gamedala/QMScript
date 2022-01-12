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
MacroID=838b8073-3a4e-494e-bb32-b22217f8618d
Description=¦Û°Ê³¨³½
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
set dm = createobject("dm.dmsoft")
base_path = dm.GetBasePath()
dm_ret = dm.SetPath(base_path)
//dm_ret = dm.SetDict(0, "pass.txt")

¼ÒÀÀ¾¹ = Plugin.Window.MousePoint()
TracePrint ¼ÒÀÀ¾¹

dm_ret = dm.BindWindow(¼ÒÀÀ¾¹,"gdi","windows","windows",0)
TracePrint dm_ret

Do
    dm_ret = dm.FindColor(1058, 486,1060, 487,"f9e9e0-000000",1,4,intX,intY)
    If intX >= 0 And intY >= 0  Then 
        dm.KeyPress 32
        TracePrint "³¨³½"
        fish = 1
    End If
    dm_ret = dm.FindColor(1058, 486,1060, 487,"d4f287-000000",0.95,4,intX,intY)
    If intX >= 0 And intY >= 0  Then 
        dm.KeyPress 32
        TracePrint "©Ô¬ñ"
        fish = 0
    End If
    Delay 500
Loop
