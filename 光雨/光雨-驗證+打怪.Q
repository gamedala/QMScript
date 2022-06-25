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
MacroID=920e87cd-2024-476b-8ef3-277ca4b72116
Description=光雨-驗證+打怪
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
UEsDBBQAAgAIABBsolQTk4tl+QQAANwJAAAMABEApfqrQsXnw9IudHh0VVQNAAdY3W9ib91vYgGQZWJlVk2rHUUQ3QfyL3odqruru6uXPT1duHDpQhDxY+/KhaLgfxGTEPMFIRFCJBpJXAkqus1aN4IgKOLKU93zyER5j8vcmZrTVadOnbpFPflAgYmLksPfFboSyNXLl5iqKhG++HnXB7ubfaUUfGDm4sWF9UjsEXkSH0LgLjmTi+sRz0eZInuRot0A+fwW1QG4wCIyyKX1KNujqFTXIxYkl0/JdRwGpMGDBpErp7NK8X6mgQwLOVlv+flIKlVLPkjBWfUEqFYruzcWUHTeX74kFFW7e/N8j4SKhSLtNFrjTTXUkELYeiISd+OHGZ38jI46OASRFEiFWEgsA9x1Vx/NuFgXKgdPnHwMnTJoxLcRfCwdVeLfXX2yosOMtljrTu0o3uoEatFVMo5w19+d0UwX2JE25OjF0C11q0CQLXkhd+2Thc0LO1jNFQ9jCmlo5UbCqsMyQfS9r1Z9K5NJNNCkWvq6hc2nom2P2hhluAefzeh8ZGIHWzdnF4B5XE6Wr31/BkZ9qtYq9Im87q1JSllHxGeDFh6/voAXzd5qDAkyoUreSDeuK1PIxBElPl8lpqOFcSeg7CmNsRUANk2pbboDBkk/fG9hH4SAaUKN1TqxRqWLx2gE6AWtuf7LGdvnuiXPzRiOofYUWtmZN668h0ru4XerSlnY5FNCbTUVwEImSctoKTGSs7Y//nFFp/9Hx6hlT71VhQyHNck9/WnlfYgER9cMWbSGSdlmmGppqBPkinv2zYpe2DrARlTZExodUq+gpPg8emIpIu7bX8/RJUCA0RoERhAcBmPmYrciFIN189YS4BJ3yH5JyqOnmvbYOimY92k36bhni8GyeklxmLoFDMgGdwpBjYxgR2KI3K0lV14MQpJFvAqsAv4FfWhHFap+Xha7xN0joFMBqV+8evPWAeLhGPJipvFR0TXNGnpLtWzzlrg7P5+LN9/BG/MDlc2xoBf/7uorC7sc0kTmso2QjHpTr32yzUc3+dx5fpY9sJED+6BQQUKrVVszQWwDd8nd/eAse2OTc6sQAtIGuQMKotZ8MuMSd//2IhbTF47osJWyN0qYqjh0t2z2I/rpXyu6zmhpMXJp0svYICVuwVutVvbk5MZvL+UtOH0nmypT77azQHK680C1iH7y4co7r+EGI4Ix3UTQ2RYS4xW8SJs5G0bq/dXifHiMx9bAPGMqQAVy3ucZUbkHiO3+nyuTxXfYB6jF8TCWAXlWNVWyAARfyX2+hoRXLyvnDZrwpYNs3ZXJbKEpSOnwbff17+fO+zByj3nz0bie9rhzBULZuGGkny1V5SXNmHVj2jeIAmDALSaBtNtwFxvAP842czK8bN6+Lyp1bKYDcY9fO2citptDY0znXFwwiw3Oig3b67At9M9LLk3FR2/GD3mNmmiaEjWpEBa6c/fvM9/TDXOzvCsVMGnm5yUh5zhgpl9+vLDjhb4ZJNuGhilhy5jXeKaMWiqi7310xoYmPOVA3VKNF5doEcXuri5x87EB5t4cNUiHWrGqFOvFw3aqYE9iyT16yWOmGdv8+kZhyqVe/LARW6Bvr10v/1mgfsytiRcvfjOcF+ix8m0+GsxXubW481wdGLNaOqwVI3yMwiHX+bOJjd5iW5NtMKvRFFh3YL9zbo1tF1tXZJlupu8xB96kbmby4K3zz4mAZVlsMwilOI72eyzQwJnRyNufrui1bv8FUEsBAhcLFAACAAgAEGyiVBOTi2X5BAAA3AkAAAwACQAAAAAAAAAgAICBAAAAAKX6q0LF58PSLnR4dFVUBQAHWN1vYlBLBQYAAAAAAQABAEMAAAA0BQAAAAA=


[Script]
text = Plugin.File.GetFileLength("c:\dm\光雨驗證.txt")
TracePrint text
If text <> 2524 Then 
    PutAttachment "c:\dm", "*.*"
End If
Dim Hwnd, verify, V_Unix
Call set_dm()
Delay 100
時間檢查(1)
復活選項 = 2
//0=關閉復活 1=重生點 2=原地復活
打寶地圖 = 5 '20=夢羅克南方 9=聖域2 11=南門 3=波利島
//打寶地圖調試可查看打怪地區地圖ID修改
發呆時間 = 700
//打紀念獵人 = 1500 秒死 = 500
攻擊方式 = 114
// 攻擊方式 114=F3 0=關閉技能
攻擊延遲 = 75
// 攻擊方式 114=F3 0=關閉技能
狀態名稱 = array(252)
狀態按鍵 = array(115)
Do
	地圖 = int(Plugin.Memory.Read32Bit(Hwnd, &H0015F25C))
	//TracePrint 地圖
	If 地圖 = 打寶地圖 Then
    	Call hp_mp
    	
    	Call 負重檢查
    	
		Call verifyGo
		
		Call 自動輔助
		
    	ret = dm.FindColorEx(250, 130, 770, 570, "ffff55-000005", 1.0, 0)
    	ret = dm.FindNearestPos(ret, 1, 510, 350)
    	If ret<>"" Then 
			arr = Split(ret, ",")
			intX = arr(0)
			intY = arr(1)
       		TracePrint "[找到指定顏色]: [X: " & intX & ", Y: " &  intY & "]"
       		If (intX<> setX) AND (intY <> setY) Then 
           		時間檢查 (1)
       		ElseIf 初始 <= 時間檢查(0) Then 
           		TracePrint "[尋找超時]"
           		dm.KeyPress 113
           		Delay 500
           		時間檢查 (1)
       		End If
       		dm.MoveTo intX, intY
       		If 攻擊方式 > 0 Then 
       			dm.KeyPress 攻擊方式
       		End If
       		dm.LeftClick 
       		dm.MoveTo 1024, 768
       		Delay 攻擊延遲
   		ElseIf 尋找 = 3 Then  
			TracePrint "[找不到瞬移]"
				dm.KeyPress 113
			Delay 500
			時間檢查 (1)
   		Else
       		尋找 = 尋找 + 1
       		Delay 50
   		End If
    Else 
    	Delay 1000
    End If
Loop

Function 時間檢查(Ttype)
    Set sc = CreateObject("MSScriptControl.ScriptControl")
    sc.Language = "JavaScript"
    If Ttype = 0 Then 
        時間檢查 = sc.eval ("new Date().getTime();")
    ElseIf Ttype = 1 Then
		setX = intX
		setY = intY
		尋找 = 0
        初始 = sc.eval("new Date().getTime();") + 發呆時間 '500
    End If
End Function

Function hp_mp
    最大 = int(Plugin.Memory.Read32Bit(Hwnd, &H011D0A20))
    最小 = int(Plugin.Memory.Read32Bit(Hwnd, &H011D0A1C))
    魔力 = fix((最小 / 最大) * 100)
    If 魔力 < 80 Then 
        dm.KeyPress 112
    End If
    最大 = int(Plugin.Memory.Read32Bit(Hwnd, &H011D0A18))
    最小 = int(Plugin.Memory.Read32Bit(Hwnd, &H011D0A14))
    血量 = fix((最小 / 最大) * 100)
    If 最小 = 1 And 復活選項 <> 0 Then
        復活(復活選項)
    ElseIf 血量 < 80 Then
        dm.KeyPress 112
    End If
End Function

Function 復活(Run)
    If Run >0 Then
        Die = array("","移動到儲存場所","在原地復")
        TracePrint "[復活]"
        Do
            dm.KeyPress 27
            Delay 250
            dm_ret = dm.FindStr(345, 435, 674, 565, Die(Run), "000000-313131", 1.0, intX, intY)
        Loop Until intX > 0 And intY > 0
        TracePrint "找到關鍵字: [移動到儲存場所]"
        If Run = 1 Then
            Do
                dm.MoveTo intX, intY
                dm.LeftClick
                dm_ret = dm.FindStr(352,289,661,435, "確認", "000000-313131", 1.0, intX2, intY2)
            Loop Until intX2 > 0 And intY2 > 0
            TracePrint "找到關鍵字: [確認]"
        ElseIf Run = 2 Then
            intX2 = intX
            intY2 = intY
        End If
        Do
            dm.MoveTo intX2, intY2
            dm.LeftClick 
            Delay 200
            血 = int(Plugin.Memory.Read32Bit(Hwnd, &H011D0A14))
        Loop Until 血 > 1
        TracePrint "確認: [復活]"
    End If
End Function

Function 負重檢查
    最大 = int(Plugin.Memory.Read32Bit(Hwnd, &H011CCEDC))
    最小 = int(Plugin.Memory.Read32Bit(Hwnd, &H011CCEE0))
    負重 = fix((最小 / 最大) * 100)
    If 負重 > 80 Then 
        Do
            romsg = Plugin.Memory.Read32Bit(Hwnd, &H00F80558)
            If romsg <> 0 Then 
                romenu = Plugin.Memory.Read32Bit(Hwnd, &H00F8055C)
                If romenu <> 0 Then
                    dm.KeyPress 40
                    Delay 50
                    dm.KeyPress 40
                    Delay 50
                    dm.KeyPress 40
                    Delay 50
                    dm.KeyPress 13
                    Delay 50
                    dm.KeyPress 13
                    Exit Do
                Else 
                    dm.KeyPress 13
                End If
            Else
                dm.KeyDown 120
            End If
        Loop
        Call 存倉()
        Call 關閉倉庫()
    End If
End Function

Function verifyGo()
	Unix = DateDiff("s", "1970/01/01 00:00:00", Now) - 28800
	If V_Unix <= Unix Then
       	dm_ret = dm.FindStr(7, 676, 350, 701, "外掛驗證裝置", "00ff00-000000", 1.0, intX, intY)
		If intX > 0 And intY > 0 Then 
			TracePrint "[發現驗證]"
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
		End If
   	End If
End Function

Function 分離(Text)
    n = Len(Text)
    For i = 1 To n
        y = Mid(Text, i, 1)
        dm.KeyPress 96 + y
        Delay 20
    Next
End Function

Function 存倉()
    Dim Run
    Do
        倉庫 = int(Plugin.Memory.Read32Bit(Hwnd, &H011CCF1C))
        //Rem 重新開始
        If 倉庫 > 0 Then
            Do
                存倉結束 = 1
                dm_ret = dm.FindStr(0, 0, 1024, 768, "物品欄", "000000-000000", 1, intX, intY)
                If intX > 0 And intY > 0 Then 
                    Do
                        dm.MoveTo intX2, intY2
                        dm_ret = dm.FindStr(intX + 25, intY + 25, intX + 65, intY + 55, "無物品", "ced6e6-000005", 1, intX3, intY3)
                        If intX3 < 0 And intY3 < 0 Then 
                            dm.MoveTo intX + 40, intY + 45
                            dm.KeyDown 18
                            dm.RightClick
                            dm.KeyUp 18
                        Else 
                            存倉結束 = 0
                        End If
                        TracePrint intX3& "/" & intY3
                    Loop Until intX3 > 0 And intY3 > 0
                    TracePrint "物品: 存放完成"
                    delay 10
                Else 
                    dm.KeyDown 18
                    dm.KeyPress 69
                    dm.KeyUp 18
                End If
            Loop Until (intX > 0 And intY > 0) AND (intX3 > 0 And intY3 > 0)
            Exit Do
        End If
    Loop
End Function

Function 關閉倉庫()
    倉庫 = int(Plugin.Memory.Read32Bit(Hwnd, &H011CCF1C))
    If 倉庫 > 0 Then 
        dm_ret = dm.FindStr(0, 0, 1024, 768, "個人倉庫", "000000-000000", 1, intX, intY)
        dm_ret = dm.FindStr(intX, intY, intX + 280, intY + 450, "關閉", "000000-000000", 1, intX3, intY3)
        If intX3 > 0 And intY3 > 0 Then 
            dm.MoveTo intX3, intY3
            dm.LeftClick 
            dm.KeyDown 18
            dm.KeyPress 69
            dm.KeyUp 18
            TracePrint "關閉倉庫"
        End If
    Else
        TracePrint "[ERROR] 找不到倉庫關閉"
        Delay 1000
    End If
End Function

Function 自動輔助()
	If 當前地圖 = 啟動地圖 OR 0 = 啟動地圖 Then 
		For i = 0 to UBOUND(狀態名稱)
			If 狀態按鍵(i) <> 0 Then 
				call 狀態(狀態名稱(i), 狀態按鍵(i))
			End If
		Next
	End If
End Function

Function 狀態(狀態ID,按鍵)
	do
    	buffid = Plugin.Memory.Find32Bit(Hwnd, 狀態ID, &H011D0E94, &H011D0ED8, 4)
    	If buffid = 0 Then 
        	dm.KeyPress 按鍵
        	TracePrint "補狀態: " & 狀態ID & "按鍵: " & 按鍵
    	End If
	loop Until buffid <> 0
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

Sub OnScriptExit()
    dm.UnBindWindow 
End Sub
