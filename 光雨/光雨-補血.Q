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
Description=���B-�ɦ�
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
Dimenv �y�`, ���e�a��, �Ұʦa��, �t���q, ��q, ���A�W��, ���A����
call �j�z()
delay 100
//��q�֩�X%�ɦ�
HP�֩�h�� = 90
�ɦ���� = 112
do
	�̤j�� = int(Plugin.Memory.Read32Bit(�y�`, &H011D0A18))
	�� = int(Plugin.Memory.Read32Bit(�y�`, &H011D0A14))
	��q = fix((�� / �̤j��) * 100)
	if ��q < HP�֩�h�� Then
		dm.KeyPress �ɦ����
	End If
	delay 50
loop

Sub �۰ʻ��U()
	set dm = createobject("dm.dmsoft")
	dm_ret = dm.BindWindow(�y�`, "gdi", "dx2", "dx", 4)
	arr1 = ���A�W��
	arr2 = ���A����
	Delay 100
	Do
		If ���e�a�� = �Ұʦa�� OR 0 = �Ұʦa�� Then 
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

Function ���A(���AID,����)
	do
    	buffid = Plugin.Memory.Find32Bit(�y�`, ���AID, &H01110FB4, &H01110FF8, 4)
    	If buffid = 0 Then 
        	dm.KeyPress ����
        	TracePrint "�ɪ��A: " & ���AID & "����: " & ����
    	End If
	loop Until buffid <> 0
End Function

Function �j�z()
    set dm = createobject("dm.dmsoft")
    base_path = dm.GetBasePath()
    dm_ret = dm.SetPath(base_path)
    �y�` = Plugin.Window.MousePoint()
    TracePrint "�j�w����:" & �y�`
    dm_ret = dm.BindWindow(�y�`, "gdi", "dx2", "dx", 4)
    TracePrint "�P�Ҷǻ��j�w�O�_���\:" & dm_ret
End Function
