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
Description=補血
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
Dimenv 句柄, 當前地圖, 啟動地圖, 負重量, 血量, 狀態名稱, 狀態按鍵
call 大漠()
delay 100
//血量少於幾%補血
HP少於多少 = 90
補血按鍵 = 112
//輔助按鍵
//狀態ID查看用調適請看下方
狀態名稱 = array(337)
狀態按鍵 = array(114)
//同上查找地圖ID
啟動地圖 = 0
//PIDID_01 = BeginThread(自動輔助)
//PIDID_01 = BeginThread(記憶體)
do
	最大血 = int(Plugin.Memory.Read32Bit(句柄, &H01144148))
	血 = int(Plugin.Memory.Read32Bit(句柄, &H01144144))
	血量 = fix((血 / 最大血) * 100)
	if 血量 < HP少於多少 Then
		dm.KeyPress 補血按鍵
	End If
	delay 50
loop

Sub 自動輔助()
	set dm = createobject("dm.dmsoft")
	dm_ret = dm.BindWindow(句柄, "gdi", "dx2", "dx", 4)
	arr1 = 狀態名稱
	arr2 = 狀態按鍵
	Delay 100
	Do
		If 當前地圖 = 啟動地圖 OR 0 = 啟動地圖 Then 
			For i = 0 to UBOUND(arr1)
				If arr2(i) <> 0 Then 
					call 狀態(arr1(i), arr2(i))
				End If
			Next
			Delay 2000
		End If
		Delay 100
	Loop
End Sub

Function 狀態(狀態ID,按鍵)
	do
    	buffid = Plugin.Memory.Find32Bit(句柄, 狀態ID, &H01110FB4, &H01110FF8, 4)
    	If buffid = 0 Then 
        	dm.KeyPress 按鍵
        	TracePrint "補狀態: " & 狀態ID & "按鍵: " & 按鍵
    	End If
	loop Until buffid <> 0
End Function

Function 大漠()
    set dm = createobject("dm.dmsoft")
    base_path = dm.GetBasePath()
    dm_ret = dm.SetPath(base_path)
    句柄 = Plugin.Window.MousePoint()
    TracePrint "綁定視窗:" & 句柄
    dm_ret = dm.BindWindow(句柄, "gdi", "dx2", "dx", 4)
    TracePrint "仙境傳說綁定是否成功:" & dm_ret
End Function
