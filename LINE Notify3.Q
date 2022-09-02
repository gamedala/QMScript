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
MacroID=8cca2799-5e61-4913-9bbb-8116a64f0dc5
Description=LINE Notify
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
Dim key
key = "Z8NSmX4Tpz3kxW7is09KF0wVWWPUQTpLOW2hxLmKAn9"
//img = Plugin.File.ReadFileEx("C:\dm\img.txt")
imageFile = Plugin.File.ReadFileEx("C:\dm\圖片.txt")
	TracePrint imageFile
訊息("信息測試")

Sub 訊息(文字訊息)
	Set http = Createobject("WinHttp.WinHttpRequest.5.1")
	http.open "POST","https://notify-api.line.me/api/notify", False
	http.setrequestheader "content-type", "application/x-www-form-urlencoded"
	http.setrequestheader "Authorization", "Bearer " & key
	//http.send "message=" & 文字訊息
	//http.send "message=" & 文字訊息 &"&imageFullsize=https://i.imgur.com/v5KOVVH.png&imageThumbnail=https://i.imgur.com/v5KOVVH.png"
	http.send "message=" & 文字訊息 & "&imageFile=C:\dm\未命名.png"
	TracePrint BIG5(http.responsebody)
	set http = Nothing
End Sub


Function BIG5(text)
	set objStream = Createobject("Adodb.Stream")
	with objStream
		.Type = 1
		.Mode = 3
		.Open
		.Write text
		.Position = 0
		.Type = 2
		.Charset = "UTF-8"
		BIG5 = .ReadText
		.Close
	End with
End Function
