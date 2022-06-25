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
MacroID=cbb1265c-12c4-4eb6-a4e6-84f1debd6066
Description=光雨-驗證
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

[Attachment]
UEsDBBQAAgAIAGoFnFTTdtYiLAIAADYEAAAMABEApfqrQsXnw9IudHh0VVQNAAdJ42li68lqYgGQZWJlU0GKFUEM3Q/MLWo9JKmkKrWs7q6cQRA37r2Cl3FmcCu4GIQRRV0JKq5d6zVMqr7QIP/z+V15/fLeS6oaAhIQA1eD5J8buCFI7fqKoZkB+APOU6Q4LdhACImZK2qiVdIoAYIiEfGupUDKq8SzVCAzqlbbg5DPb0EbTkesqgOSrFKJUjZoq8Tq4spJ3O7NnGnwgAGQ6qlXrYhThiuskHS9hbOkDVqIJ63eq50ILbxyerqIckK8vlLIZnt6dj4DhRpQly2jd97MqJEQbbsAaHr9faIFJzrbYCJVITAFVtBQ4Kfp9t3E5bZYmRBYMNMOxWP0p0GY6+4u/ZtuPyw0TXRgYzptd/Ph01mrLcveIt0/n2iGf9wZNteIGuwhPRyoqwVUSHcvFzcvbgrPzYtZSIY17qBsNkKJo9+8X/6Wkhm0s2kL+bbRhlKtH9k6u4309tVEl4uSaBzTnFNwzsvfmfLdtzOx+zOLUfmcAO3oXUWKjey/3Xfh8ckiXjFjeCTxNYEGGKFH1o2BCnB2i7+WRbmMMB/gLIfIGFt1wm4ifbPDaVz0w4vFfQnEkwb32GIS66rsin41yPfFR3P/+8yNpW2C3CPhTG0X6vVg3rjxQQ3Sw9flUhc3oIh7a1Kd1tdErI4uwi4uxv74Y6Hlf3TOVg/ZezNfwxFDSp9+Lt2XJfHWrfha9O43ZZsws9rdp4er6fPHhV7cNjyNbHqID5pkbx5JxTJ2Ya2q6cufM/ovUEsBAhcLFAACAAgAagWcVNN21iIsAgAANgQAAAwACQAAAAAAAAAgAICBAAAAAKX6q0LF58PSLnR4dFVUBQAHSeNpYlBLBQYAAAAAAQABAEMAAABnAgAAAAA=


[Script]
If Plugin.File.GetFileLength("c:\dm\光雨驗證.txt") = 0 Then 
	PutAttachment "c:\dm", "*.*"
End If
Dim Hwnd, verify, V_Unix
Call set_dm()
Delay 100
Do
    Unix = DateDiff("s", "1970/01/01 00:00:00", Now) - 28800
    if V_Unix <= Unix Then
        dm_ret = dm.FindStr(7, 676, 350, 701, "外掛驗證裝置", "00ff00-000000", 1.0, intX, intY)
        If intX > 0 And intY > 0 Then 
            TracePrint "發現驗證"
            Call verifyGo()
        End If
    End If
    Delay 1000
Loop

Function verifyGo()
    TracePrint "開始驗證"
    verify = ""
    Do
        romsg = Plugin.Memory.Read32Bit(Hwnd, &H00F80558)
        romenu = Plugin.Memory.Read32Bit(Hwnd, &H00F8055C)
        If romenu <> 0 OR romsg <> 0 Then 
            dm_ret = dm.FindStr(0, 0, 1024, 768, "驗證碼", "000000-000000", 0.95, intX, intY)
            If intX > 0 And intY > 0 AND verify = "" Then 
                verify = dm.Ocr(intX + 53, intY, intX + 103, intY + 10, "0000ff-000000", 1.0)
                If verify <> "" Then 
                    Delay 500
                    //Call Plugin.Bkgnd.SendString(Hwnd, verify)
                    Call 分離(verify)
                    TracePrint "驗證碼輸入:" & verify
                    Delay 500
                    dm.KeyPress 13
                    Delay 500
                    dm.KeyPress 13
                    TracePrint "驗證完成"
                    V_Unix = DateDiff("s", "1970/01/01 00:00:00", Now) - 25200
                    Exit Do
                End If
            End If
            dm.KeyPress 13
            Delay 500
        Else 
            dm.MoveTo 850,90
            dm.LeftClick 
            Delay 500
        End If
    Loop
End Function

Function 分離(Text)
    n = Len(Text)
    For i = 1 To n
        y = Mid(Text, i, 1)
        dm.KeyPress 96 + y
        Delay 20
    Next
End Function

Function set_dm()
    set dm = createobject("dm.dmsoft")
    base_path = dm.GetBasePath()
    dm_ret = dm.SetPath(base_path)
    dm_ret = dm.SetDict(0, "光雨驗證.txt")
    Hwnd = Plugin.Window.Find(0, "Ragnarok")
    dm_ret = dm.BindWindow(Hwnd, "gdi", "dx2", "dx", 4)
    TracePrint "Hwnd:" & Hwnd & " dm_ret:" & dm_ret
End Function

Sub OnThreadExit()
    dm.UnBindWindow 
End Sub
