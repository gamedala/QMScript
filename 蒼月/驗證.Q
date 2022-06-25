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
MacroID=74898c99-11a0-4e43-a249-824076f39d77
Description=驗證
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
UEsDBBQAAgAIAGoFnFTTdtYiLAIAADYEAAAMABEAu2Gk68Xnw9IudHh0VVQNAAdJ42li+PhpYgGQZWJlU0GKFUEM3Q/MLWo9JKmkKrWs7q6cQRA37r2Cl3FmcCu4GIQRRV0JKq5d6zVMqr7QIP/z+V15/fLeS6oaAhIQA1eD5J8buCFI7fqKoZkB+APOU6Q4LdhACImZK2qiVdIoAYIiEfGupUDKq8SzVCAzqlbbg5DPb0EbTkesqgOSrFKJUjZoq8Tq4spJ3O7NnGnwgAGQ6qlXrYhThiuskHS9hbOkDVqIJ63eq50ILbxyerqIckK8vlLIZnt6dj4DhRpQly2jd97MqJEQbbsAaHr9faIFJzrbYCJVITAFVtBQ4Kfp9t3E5bZYmRBYMNMOxWP0p0GY6+4u/ZtuPyw0TXRgYzptd/Ph01mrLcveIt0/n2iGf9wZNteIGuwhPRyoqwVUSHcvFzcvbgrPzYtZSIY17qBsNkKJo9+8X/6Wkhm0s2kL+bbRhlKtH9k6u4309tVEl4uSaBzTnFNwzsvfmfLdtzOx+zOLUfmcAO3oXUWKjey/3Xfh8ckiXjFjeCTxNYEGGKFH1o2BCnB2i7+WRbmMMB/gLIfIGFt1wm4ifbPDaVz0w4vFfQnEkwb32GIS66rsin41yPfFR3P/+8yNpW2C3CPhTG0X6vVg3rjxQQ3Sw9flUhc3oIh7a1Kd1tdErI4uwi4uxv74Y6Hlf3TOVg/ZezNfwxFDSp9+Lt2XJfHWrfha9O43ZZsws9rdp4er6fPHhV7cNjyNbHqID5pkbx5JxTJ2Ya2q6cufM/ovUEsBAhcLFAACAAgAagWcVNN21iIsAgAANgQAAAwACQAAAAAAAAAgAICBAAAAALthpOvF58PSLnR4dFVUBQAHSeNpYlBLBQYAAAAAAQABAEMAAABnAgAAAAA=


[Script]
DimEnv Hwnd, 補血魔按鍵, 補血魔, 狀態編號, 狀態按鍵, 啟動地圖
Dim verify, V_Unix, 技能按鍵, 技能延遲
Call set_dm()
Delay 100
物品按鍵 = array(113) '蒼蠅翅膀按鍵
順移延遲 = 200 '使用蒼蠅翅膀後延遲
驗證按鍵 = 119 '119 =F8
驗證延遲 = 3600 '3600(1Hr) = 60 * 60
技能按鍵 = array(114) '技能按鍵
技能延遲 = array(200) '施放後延遲
補血魔按鍵 = array(112, 112) '112 =F1
補血魔 = array(90, 90) '低於 90 % 補血 0 = 關閉
開啟輔助 = 0 ' 0 = 關閉 , 任何數 = 開啟
狀態編號 = array(695) '輔助ID
狀態按鍵 = array(115) '輔助按鍵
啟動地圖 = 50 '輔助按鍵 使用地圖
獲取記憶體 = 0 '取得 地圖 狀態 編號 0 = 關閉
If Plugin.File.GetFileLength("c:\dm\蒼月驗證.txt") = 0 Then 
	PutAttachment "c:\dm", "*.*"
End If
BeginThread Hindsight

Do
	If 獲取記憶體 <> 0 Then
		call tipram 
	End If
	If int(Plugin.Memory.Read32Bit(Hwnd, &H0110C0E8)) = 啟動地圖 Then 
    	Unix = DateDiff("s", "1970/01/01 00:00:00", Now) - 28800
    	if V_Unix <= Unix Then
        	dm_ret = dm.FindStr(5, 718, 355, 738, "外掛驗證裝置", "00ff00-000000", 1.0, intX, intY)
        	If intX > 0 And intY > 0 Then 
            	TracePrint "發現驗證"
            	Call verifyGo()
        	End If
    	End If
    	
		For i = 0 to UBOUND(技能按鍵)
			dm.KeyPress 技能按鍵(i)
			Delay 技能延遲(i)
		Next
		dm.KeyPress 物品按鍵(0)
		Delay 順移延遲
	End If
Loop

Sub Hindsight()
	set dm = createobject("dm.dmsoft")
	dm_ret = dm.BindWindow(Hwnd, "gdi", "dx2", "dx", 4)
	arr1 = 狀態編號
	arr2 = 狀態按鍵
	arr3 = 補血魔按鍵
	arr4 = 補血魔
	Delay 100
	Do
		Call HP
		If int(Plugin.Memory.Read32Bit(Hwnd, &H0110C0E8)) = 啟動地圖 Then 
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

Function verifyGo()
    TracePrint "開始驗證"
    verify = ""
    Do
        romsg = Plugin.Memory.Read32Bit(Hwnd, &H00EC0708)
        romenu = Plugin.Memory.Read32Bit(Hwnd, &H00EC070C)
        If romenu <> 0 OR romsg <> 0 Then 
            dm_ret = dm.FindStr(0, 0, 1024, 768, "驗證碼", "000000-000000", 0.95, intX, intY)
            If intX > 0 And intY > 0 AND verify = "" Then 
                verify = dm.Ocr(intX + 53, intY, intX + 103, intY + 10, "0000ff-000000", 1.0)
                If verify <> "" Then 
                    Delay 500
                    //Call Plugin.Bkgnd.SendString(Hwnd, verify)
                    Call list_mid(verify)
                    TracePrint "驗證碼輸入:" & verify
                    Do
                    	dm.KeyPress 13
                    	Delay 100
                    	romsg = Plugin.Memory.Read32Bit(Hwnd, &H00EC0708)
                    Loop While romsg > 0
                    V_Unix = DateDiff("s", "1970/01/01 00:00:00", Now) - (28800-驗證延遲)
                    TracePrint "驗證完成"
                    Exit Do
                End If
            End If
            dm.KeyPress 13
            Delay 500
        Else 
            dm.KeyPress 驗證按鍵
            Delay 500
        End If
    Loop
End Function

Function 狀態(ID,Key)
	do
		buffid = Plugin.Memory.Find32Bit(Hwnd, ID, &H01110FB4, &H01111000, 4)
		If buffid = 0 Then 
			dm.KeyPress Key
			TracePrint "補狀態: " & ID & "按鍵: " & Key
		End If
	loop Until buffid <> 0
End Function

Function HP()
	If arr4(0) <> 0 Then 
		M = int(Plugin.Memory.Read32Bit(Hwnd, &H01110B38))
		N = int(Plugin.Memory.Read32Bit(Hwnd, &H01110B34))
		HP = fix((N / M) * 100)
		if HP < arr4(0) Then
			dm.KeyPress arr3(0)
		End If
	End If
	If arr4(1) <> 0 Then 
		M = int(Plugin.Memory.Read32Bit(Hwnd, &H01110B40))
		N = int(Plugin.Memory.Read32Bit(Hwnd, &H01110B3C))
		MP = fix((N / M) * 100)
		if MP < arr4(1) Then
			dm.KeyPress arr3(1)
		End If
	End If
End Function

Function list_mid(Text)
    n = Len(Text)
    For i = 1 To n
        y = Mid(Text, i, 1)
        dm.KeyPress 96 + y
        Delay 20
    Next
End Function

Function tipram()
	數值 = array( 17895348, 17895352, 17895356, 17895360, 17895364, 17895368, 17895372, 17895376, 17895380, 17895384, 17895388, 17895392, 17895396, 17895400, 17895404, 17895408, 17895412, 17895416, 17895420, 17895424 )
    TracePrint "地圖編號: " & int(Plugin.Memory.Read32Bit(Hwnd, &H0110C874))
    For i = 0 To UBOUND(數值)
    	位址 = "&H0" & Hex(數值(i))
        TracePrint "狀態[" & i & "] " & int(Plugin.Memory.Read32Bit(Hwnd, 位址))
    Next
End Function

Function set_dm()
    set dm = createobject("dm.dmsoft")
    base_path = dm.GetBasePath()
    dm_ret = dm.SetPath(base_path)
    dm_ret = dm.SetDict(0, "蒼月驗證.txt")
    Hwnd = Plugin.Window.Find(0, "Ragnarok")
    dm_ret = dm.BindWindow(Hwnd, "gdi", "dx2", "dx", 4)
End Function

Sub OnThreadExit()
    dm.UnBindWindow 
End Sub