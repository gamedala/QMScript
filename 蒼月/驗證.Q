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
Description=����
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
DimEnv Hwnd, �ɦ��]����, �ɦ��], ���A�s��, ���A����, �Ұʦa��
Dim verify, V_Unix, �ޯ����, �ޯੵ��
Call set_dm()
Delay 100
���~���� = array(113) '�a�ǯͻH����
�������� = 200 '�ϥλa�ǯͻH�᩵��
���ҫ��� = 119 '119 =F8
���ҩ��� = 3600 '3600(1Hr) = 60 * 60
�ޯ���� = array(114) '�ޯ����
�ޯੵ�� = array(200) '�I��᩵��
�ɦ��]���� = array(112, 112) '112 =F1
�ɦ��] = array(90, 90) '�C�� 90 % �ɦ� 0 = ����
�}�һ��U = 0 ' 0 = ���� , ����� = �}��
���A�s�� = array(695) '���UID
���A���� = array(115) '���U����
�Ұʦa�� = 50 '���U���� �ϥΦa��
����O���� = 0 '���o �a�� ���A �s�� 0 = ����
If Plugin.File.GetFileLength("c:\dm\�a������.txt") = 0 Then 
	PutAttachment "c:\dm", "*.*"
End If
BeginThread Hindsight

Do
	If ����O���� <> 0 Then
		call tipram 
	End If
	If int(Plugin.Memory.Read32Bit(Hwnd, &H0110C0E8)) = �Ұʦa�� Then 
    	Unix = DateDiff("s", "1970/01/01 00:00:00", Now) - 28800
    	if V_Unix <= Unix Then
        	dm_ret = dm.FindStr(5, 718, 355, 738, "�~�����Ҹ˸m", "00ff00-000000", 1.0, intX, intY)
        	If intX > 0 And intY > 0 Then 
            	TracePrint "�o�{����"
            	Call verifyGo()
        	End If
    	End If
    	
		For i = 0 to UBOUND(�ޯ����)
			dm.KeyPress �ޯ����(i)
			Delay �ޯੵ��(i)
		Next
		dm.KeyPress ���~����(0)
		Delay ��������
	End If
Loop

Sub Hindsight()
	set dm = createobject("dm.dmsoft")
	dm_ret = dm.BindWindow(Hwnd, "gdi", "dx2", "dx", 4)
	arr1 = ���A�s��
	arr2 = ���A����
	arr3 = �ɦ��]����
	arr4 = �ɦ��]
	Delay 100
	Do
		Call HP
		If int(Plugin.Memory.Read32Bit(Hwnd, &H0110C0E8)) = �Ұʦa�� Then 
			For i = 0 to UBOUND(arr1)
				If arr2(i) <> 0 Then 
					call ���A(arr1(i), arr2(i))
				End If
			Next
			Delay 2000
		End If
		Delay 100
	Loop
End Sub

Function verifyGo()
    TracePrint "�}�l����"
    verify = ""
    Do
        romsg = Plugin.Memory.Read32Bit(Hwnd, &H00EC0708)
        romenu = Plugin.Memory.Read32Bit(Hwnd, &H00EC070C)
        If romenu <> 0 OR romsg <> 0 Then 
            dm_ret = dm.FindStr(0, 0, 1024, 768, "���ҽX", "000000-000000", 0.95, intX, intY)
            If intX > 0 And intY > 0 AND verify = "" Then 
                verify = dm.Ocr(intX + 53, intY, intX + 103, intY + 10, "0000ff-000000", 1.0)
                If verify <> "" Then 
                    Delay 500
                    //Call Plugin.Bkgnd.SendString(Hwnd, verify)
                    Call list_mid(verify)
                    TracePrint "���ҽX��J:" & verify
                    Do
                    	dm.KeyPress 13
                    	Delay 100
                    	romsg = Plugin.Memory.Read32Bit(Hwnd, &H00EC0708)
                    Loop While romsg > 0
                    V_Unix = DateDiff("s", "1970/01/01 00:00:00", Now) - (28800-���ҩ���)
                    TracePrint "���ҧ���"
                    Exit Do
                End If
            End If
            dm.KeyPress 13
            Delay 500
        Else 
            dm.KeyPress ���ҫ���
            Delay 500
        End If
    Loop
End Function

Function ���A(ID,Key)
	do
		buffid = Plugin.Memory.Find32Bit(Hwnd, ID, &H01110FB4, &H01111000, 4)
		If buffid = 0 Then 
			dm.KeyPress Key
			TracePrint "�ɪ��A: " & ID & "����: " & Key
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
	�ƭ� = array( 17895348, 17895352, 17895356, 17895360, 17895364, 17895368, 17895372, 17895376, 17895380, 17895384, 17895388, 17895392, 17895396, 17895400, 17895404, 17895408, 17895412, 17895416, 17895420, 17895424 )
    TracePrint "�a�Ͻs��: " & int(Plugin.Memory.Read32Bit(Hwnd, &H0110C874))
    For i = 0 To UBOUND(�ƭ�)
    	��} = "&H0" & Hex(�ƭ�(i))
        TracePrint "���A[" & i & "] " & int(Plugin.Memory.Read32Bit(Hwnd, ��}))
    Next
End Function

Function set_dm()
    set dm = createobject("dm.dmsoft")
    base_path = dm.GetBasePath()
    dm_ret = dm.SetPath(base_path)
    dm_ret = dm.SetDict(0, "�a������.txt")
    Hwnd = Plugin.Window.Find(0, "Ragnarok")
    dm_ret = dm.BindWindow(Hwnd, "gdi", "dx2", "dx", 4)
End Function

Sub OnThreadExit()
    dm.UnBindWindow 
End Sub