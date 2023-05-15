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
MacroID=4e445b07-908c-41b1-812c-315d6a2a28f9
Description=干﹀
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
call 簔()
delay 100
//﹀秖ぶ碭%干﹀
HPぶぶ = 95
干﹀龄 = 112
do
	程﹀ = int(Plugin.Memory.Read32Bit(琡, &H01145858))
	﹀ = int(Plugin.Memory.Read32Bit(琡, &H01145854))
	Val = Plugin.Memory.ReadString(琡, &H01140E00, 15)
	﹀秖 = fix((﹀ / 程﹀) * 100)
	if ﹀秖 <= HPぶぶ and Val <> "skycity" Then
		//dm.KeyPress 干﹀龄
		dm.KeyDown 干﹀龄
		dm.Keyup 干﹀龄
		delay 10
		if ﹀秖 <= 80 Then
			dm.KeyDown 113
			dm.Keyup 113
	
		End If
	End If
	delay 10
loop

Function 簔()
    set dm = createobject("dm.dmsoft")
    base_path = dm.GetBasePath()
    dm_ret = dm.SetPath(base_path)
    琡 = Plugin.Window.MousePoint()
    TracePrint "竕﹚跌怠:" & 琡
    dm_ret = dm.BindWindow(琡, "gdi", "dx2", "dx", 4)
    TracePrint "挂肚弧竕﹚琌Θ:" & dm_ret
End Function
