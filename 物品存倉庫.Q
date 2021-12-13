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
MacroID=0cab8d26-2167-422a-9f17-dbac4bedcdf1
Description=物品存倉庫
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
set dm = createobject("dm.dmsoft")
base_path = dm.GetBasePath()
dm_ret = dm.SetPath(base_path)
dm_ret = dm.SetDict(0,"pass.txt")
Hwnd1 = Plugin.Window.MousePoint()
dm_ret = dm.BindWindow(Hwnd1,"gdi","dx2","dx",4)

Call 存倉()

Function 存倉()
    Dim Run
    倉庫 = int(Plugin.Memory.Read32Bit(Hwnd1, &H00EB7948))
    種類 = array("消------品","裝備","其它")
    //Rem 重新開始
    If 倉庫 <> 0 Then
        Do
            dm_ret = dm.FindStr(0, 0, 1024, 768, "物品欄", "000000-000000", 1, intX, intY)
            If intX > 0 And intY > 0 Then 
                Do
                    dm_ret = dm.FindStr(intX - 12, intY + 20, intX + 1 , intY + 145, 種類(Run), "000000-313131", 1, intX2, intY2)
                    If intX2 > 0 And intY2 > 0 Then 
                        dm.MoveTo intX2, intY2
                        dm.LeftClick
                        Do
                        	dm.MoveTo intX2, intY2
                            dm_ret = dm.FindStr(intX + 25, intY + 25, intX + 65, intY + 55, "無物品", "ced6e6-000001", 1, intX3, intY3)
                            If intX3 < 0 And intY3 < 0 Then 
								dm.MoveTo intX + 40, intY + 45
                                dm.KeyDown 18
                                dm.RightClick
                                dm.KeyUp 18
                            End If
                            TracePrint intX3& "/" & intY3
                        Loop Until intX3 > 0 And intY3 > 0
                        TracePrint "物品: [" & 種類(Run) & "] 存放完成"
                        Run = Run + 1
                        delay 10
                    End If
                Loop Until Run > 2
            Else 
                dm.KeyDown 18
                dm.KeyPress 69
                dm.KeyUp 18
                //Goto 重新開始
            End If
        Loop Until  intX > 0 And intY > 0
    Else
        TracePrint "[Error] 倉庫未開啟無法存放"
        Delay 1000
    End If
End Function
