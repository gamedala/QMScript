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
MacroID=b6c0bb74-be5c-4b57-b5ce-bdbcb6b0ac3f
Description=Proxifier自動選擇IP登入
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

[Attachment]
UEsDBBQAAgAIAKSKsFRwfBvQPgEAACQCAAAJABEAbG9naW4udHh0VVQNAAf+h4JiR4djZH6CgmJFUU/qFjEM3X/w3aLrj5c2aTLLTpusXHoHEUQPIB7IC4gigkcz0xF+syrJ+5c3zIg4KlX1zjhi9REiHH6KjGHlz/uCF15dCtHzMa5lH6cBB5StVo2DTBTWvKH8/rrR0jY63r7yLhf6IqCQPR9oaDEjzlxBJ9SggOcQK+NEUMzyZWsRuBAnJSFzbTFvh7WGrjQvsLewzUb5cFPYCh3PRy5c0+akKB/vM6xUvAVLewVNtG2/R+lgGffzLUS6ve+NcB1T2Maxop3OgMX1HDmVOoZuWI7Lj283vWcPmtErwNnzDA/HlHUFNkSHTxVdwysPtp6VNmhHpvz+6f8l2ArGYmfW0kKJo1JoZrfa9nmkoy7xsS/tvTKXX/Omi90Bro6mVEu8q/sMydMlRlNmuzTCzdZqh3v+2PL3Z6GLbrzp/wBQSwECFwsUAAIACACkirBUcHwb0D4BAAAkAgAACQAJAAAAAAAAACAAgIEAAAAAbG9naW4udHh0VVQFAAf+h4JiUEsFBgAAAAABAAEAQAAAAHYBAAAAAA==


[Script]
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Integer 
Private Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" (ByVal hWndParent As Long, ByVal hWndChildAfter As Long, ByVal lpszClass As String, ByVal lpszWindow As String) As Long
Private Declare Function GetDesktopWindow Lib "user32" () As Long
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal Hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
text = Plugin.File.GetFileLength("c:\dm\光雨\login.txt")
If text <> 548 Then 
	TracePrint "沒有附件釋放附件login.txt"
   	PutAttachment "c:\dm\光雨", "login.txt"
Else 
	TracePrint "已經有附件login.txt"
End If
	
Global 登入數量
登入數量 = 0
 ' ========== 設置修改 ==========
遊戲路徑 = "Q:\RO\LightRain0309\"
登入IP數量 = 3 ' 假設有 211 213 215 217 219 221 223 請填寫7
共有幾組帳號 = 5 ' 有幾組帳號填多少
 ' ========== 設置修改 ==========
start = Plugin.Sys.GetTime()
Do
	Call IP驗證器
	For 3
		If 登入數量 < 共有幾組帳號 Then 
			zmRunApp 遊戲路徑 & "LightRain-RO.exe"
			Do
				Hwnd = FindWindow(0, "Ragnarok")
				If Hwnd <> Hwnd2 Then 
					Hwnd2 = Hwnd
					Delay 500
					Exit Do
				End If
			Loop
			線程ID = BeginThread(login)
		Else 
			call 時間計算(start,"主程序")
			Exit do
		End If
		Delay 500
		登入數量 = 登入數量 + 1
	Next
	Call 檢查登入
	Call 開啟Proxification_Rules()
	Delay 500
	call 上下移動IP("down",登入IP數量-1)
Loop

Sub login()
	第幾 = 登入數量
	start = Plugin.Sys.GetTime()
	 ' ========== 帳號設置修改 ==========
	帳號 = array("hns123455", "hns123456", "hns123457", "hns123458", "hns123459")
	密碼 = array("123456", "123456","123456","123456","123456")
	腳色位置 = array(0, 0, 0, 0, 0)
	 ' ========== 帳號設置修改 ==========
	charX = array(100, 260, 420, 580, 740, 100, 260, 420, 580, 740, 100, 260, 420, 580, 740)
	charY = array(150, 150, 150, 150, 150, 350, 350, 350, 350, 350, 550, 550, 550, 550, 550)
	Call set_dm
	TracePrint 第幾
	Call Plugin.Window.Move(Hwnd, 100 + 50 * 第幾, 100 + 30 * 第幾)
	dm.LockInput 1
	Delay 200
	do
		dm_ret = dm.FindStr(550,560,660,610, "確認", "000000-313131", 1.0, intX, intY)
		If dm_ret = 0 Then 
			TracePrint "[ " & 第幾 & " ] 點確認"
			'dm.Moveto intX + 10, intY + 5
			dm.KeyPress 13
			dm.Moveto 1024, 768
		Else 
			dm_ret = dm.FindStr(575,541,645,568, "Login", "ffffff-000000", 1.0, intX, intY)
			If dm_ret = 0 Then
				TracePrint "[ " & 第幾 & " ] 開始登入"
				dm.KeyPress 9 
				'Call 分離(帳號(第幾))
				dm.SendString2 hwnd,帳號(第幾)
				dm.KeyPress 9
				'call 分離(密碼(第幾))
				dm.SendString2 hwnd,密碼(第幾)
				dm.KeyPress 13
			Else 
				dm_ret = dm.FindStr(872,530,952,558, "開始遊戲", "ffffff-000000", 1.0, intX, intY)
				If dm_ret = 0 Then 
					TracePrint "[ " & 第幾 & " ] 選擇腳色"
					dm.Moveto charX(腳色位置(第幾)), charY(腳色位置(第幾))
					dm.LeftClick 
					dm.Moveto 1024, 768
					dm.KeyPress 13
				Else 
					call 時間計算(start,第幾)
					TracePrint "[ " & 第幾 & " ] 登入成功"
					Call Plugin.Window.SetText(Hwnd,帳號(第幾))
					dm_ret = dm.UnBindWindow()' 解除綁定
					Exit Do
				End If
			End If
		End If
		Delay 1000
	Loop
	線程ID = GetThreadID()
	StopThread 線程ID
End Sub

Sub 開啟Proxification_Rules
	Do
		Hwnd = Plugin.Window.Find(0, "Proxifier")
		If Hwnd = 0 Then 
			MsgBox "找不到Proxifier,請先把窗口打開"
		Else
			HwndEx = Plugin.Window.FindEx(Hwnd, 0, 0, "Standard")
			Call Plugin.Bkgnd.LeftClick(HwndEx, 50, 5)
			Exit Do
		End If
	Loop
End Sub

Sub 上下移動IP(類型,次數)
	Hwnd2 = Plugin.Window.Find(0, "Proxification Rules")
	HwndEx2 = Plugin.Window.FindEx(Hwnd2, 0, "msctls_updown32", "")
	For 次數
		If 類型 = "up" Then 
			Call Plugin.Bkgnd.LeftClick(HwndEx2,10,10)
		Else 
			Call Plugin.Bkgnd.LeftClick(HwndEx2,10,40)
		End If
		Delay 100
	Next
	HwndEx2 = Plugin.Window.FindEx(Hwnd2, 0, "Button", "OK")
	Call Plugin.Bkgnd.LeftClick(HwndEx2,10,10)
	
End Sub

Sub IP驗證器()
	zmRunApp 遊戲路徑 & "IP認證器.exe"
	Do
		Hwnd = FindWindow(0, "login")
		確定Hwnd = FindWindowEx(Hwnd, 0, 0, "確定")
		If Hwnd > 0 and 確定Hwnd > 0 Then 
			Delay 200
			Call Plugin.Bkgnd.KeyPress(Hwnd, 13)
			Exit Do
		End If
		Delay 200
	Loop
	
End Sub

Sub zmRunApp(路徑)
    Dim p, DirPath, FileName
    p = InStrRev(路徑, "\")
    DirPath = Left(路徑, p)
    FileName = Right(路徑, Len(路徑) - p)
    ShellExecute GetDesktopWindow, "open", FileName, vbNullString, DirPath, 5
End Sub

Function 分離(Text)
    n = Len(Text)
    For i = 1 To n
        y = Mid(Text, i, 1)
        dm.KeyPressChar y
        Delay 10
    Next
End Function

Sub 檢查登入
	Do
		Hwnd = FindWindow(0, "Ragnarok")
		Delay 200
	Loop While Hwnd <> 0
End Sub

Sub 時間計算(時間,標題)
	現在 = Plugin.Sys.GetTime()
	時間 = (現在 - 時間)
	xs = int(時間 / 1000 / 60 / 60)
	fz = int(時間 / 1000 / 60) - xs * 60
	m = Clng(時間 / 1000) - fz * 60 - xs * 60 * 60
	nm = Clng(時間 - fz * 60 - xs * 60 * 60) - m * 1000
	TracePrint "[ " & 標題 & " ]" & xs & " :" & fz & " :" & m & "." & nm
End Sub

Function set_dm()
	Set dm = createobject("dm.dmsoft")
    base_path = dm.GetBasePath()
    dm_ret = dm.SetPath(base_path & "光雨")
    dm_ret = dm.SetDict(0, "login.txt")
    Hwnd = Plugin.Window.Find(0, "Ragnarok")
    dm_ret = dm.BindWindow(Hwnd, "gdi", "dx2", "dx", 4)
    TracePrint "Hwnd:" & Hwnd & " dm_ret:" & dm_ret
End Function