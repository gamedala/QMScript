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
MacroID=f9487806-e5cd-4795-b6c1-ff8e881af94a
Description=¥ú«B-«C»ÉÄ_½c
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
UEsDBBQAAgAIALZWolTCO7kuxgEAADsDAAAMABEAq0O7ycRfvWMudHh0VVQNAAdHuG9iqLhvYg+ob2JVkrGqEDEQRXvBv0j9mExmNpPOyW7mA0RrCz/B0t8RFLR7IMLDQn0IKv6OtTfJK7RZwu7J3Tv3jsbwVsZwYi3Ol6r7FXHgqWKWvt4nuqGbo6acHz/KR+uaxWsEFW6nstdLpEuTixulT78WrbZoMpogUSM9y4imWnuoiscpROn2+6a3NufcvYnWAcT7EDrK6aQaHUdLd6823f7XFiqUT6KIJgYPyuRC6e2TRZdNH92h49604kjzqswrY923dPt7T0lbW8gMPDueOTzD8bw6zCjD9/tz0bJ9H0LgAupdVC+AWoaDbqYG+v7Fv9qMyNpRoQ0bGQ76iZw9yjKFKX9sumxamnku0dlEDFZLYJDD109Af365MzkWHVGV2eFl0h4RzP2M0z2uzJS+/Fx0zYseVCp67nVPh/andI9+kqSPT/81DSWVw1u9FLXP3BAMOYKhMk3fftjCoPmB5l7rhfaQMJq/YLlfD/S3P5tuixaZ1XHmOpBkm+hcEQQzVxEjPttOdDnx+RGmbS5VReFco2XTSlZGoXT3egey41t18ewY6zLDZsLvTDIZ3lJ683zRrA8rZTln7J3SOtYYTZjNroN8iqR3fRcvy/lfUEsBAhcLFAACAAgAtlaiVMI7uS7GAQAAOwMAAAwACQAAAAAAAAAgAICBAAAAAKtDu8nEX71jLnR4dFVUBQAHR7hvYlBLBQYAAAAAAQABAEMAAAABAgAAAAA=


[Script]
If Plugin.File.GetFileLength("c:\dm\«C»ÉÄ_½c.txt") = 0 Then 
    PutAttachment "c:\dm", "*.*"
End If
Call ¤jºz()
Delay 100
Do
	dm_ret = dm.FindStr(0, 150, 1024, 768, "«C»ÉÄ_½c", "000000-000000", 1.0, intX, intY)
	If dm_ret = 0 Then 
		TracePrint "«C»ÉÄ_½c" & dm_ret
		dm.MoveTo intX, intY
		dm.LeftDown
		dm.MoveTo intX + 300, intY + 140
		dm.LeftUp 
		Delay 20
		dm.KeyPress 13
	Else
		dm_ret = dm.FindStr(0, 0, 1024, 768, "³ÍÂÄ¸Ë³Æ»s§@", "ffffff-000000", 1.0, intX, intY)
		If dm_ret = 0 Then
			TracePrint "³ÍÂÄ¸Ë³Æ»s§@" & dm_ret
			dm.MoveTo intX + 25, intY + 30
			dm.LeftClick 
		End If
	End If
	
	dm_ret = dm.FindStr(0, 200, 1024, 768, "Ãö³¬|½T»{|ÁÊ¶R|¤U¨B", "000000-313131", 1.0, intX, intY)
	If intX > 0 Then 
		TracePrint "«C»ÉÄ_½c" & intX
		dm.MoveTo intX, intY
		dm.LeftClick 
		dm.KeyPress 13
	End If
	Delay 10
Loop

Function ¤jºz()
	set dm = createobject("dm.dmsoft")
	base_path = dm.GetBasePath()
	dm_ret = dm.SetPath(base_path)
	dm_ret = dm.SetDict(0, "«C»ÉÄ_½c.txt")
	Hwnd = Plugin.Window.Find(0, "Ragnarok")
	dm_ret = dm.BindWindow(Hwnd,"gdi","dx2","dx",4)
End Function
