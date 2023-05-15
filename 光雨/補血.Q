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
MacroID=072bbb80-4988-43a2-bf65-131d58488b85
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
HPぶぶ = 80
干﹀龄 = 112
do
	程﹀ = int(Plugin.Memory.Read32Bit(琡, &H011D0A18))
	﹀ = int(Plugin.Memory.Read32Bit(琡, &H011D0A14))
	﹀秖 = fix((﹀ / 程﹀) * 100)
	if ﹀秖 < HPぶぶ Then
		dm.Keydown 干﹀龄
		dm.Keyup 干﹀龄
		TracePrint "干﹀:" & ﹀秖
	End If
	
loop

Function 簔()
    set dm = createobject("dm.dmsoft")
    base_path = dm.GetBasePath()
    dm_ret = dm.SetPath(base_path)
    '琡 = Plugin.Window.MousePoint()
    琡 = Plugin.Window.Find(0, "Ragnarok")
    TracePrint "竕﹚跌怠:" & 琡
    dm_ret = dm.BindWindow(琡, "gdi", "dx2", "dx", 4)
    TracePrint "挂肚弧竕﹚琌Θ:" & dm_ret
End Function
