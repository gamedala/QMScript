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
MacroID=0f959e17-4de7-441a-8695-2deed707ccca
Description=編碼修改
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
'TracePrint AlterCharset("我的字串","GB231",ToCharset)
'call WriteToFile("C:\config.txt", "我的字串")

' accept a string and convert it to Bytes array in the selected Charset
Function StringToBytes(Str,Charset)
  Dim Stream : Set Stream = CreateObject("ADODB.Stream")
  Stream.Type = adTypeText
  Stream.Charset = Charset
  Stream.Open
  Stream.WriteText Str
  Stream.Flush
  Stream.Position = 0
  ' rewind stream and read Bytes
  Stream.Type = adTypeBinary
  StringToBytes= Stream.Read
  Stream.Close
  Set Stream = Nothing
End Function

' accept Bytes array and convert it to a string using the selected charset
Function BytesToString(Bytes, Charset)
  Dim Stream : Set Stream = CreateObject("ADODB.Stream")
  Stream.Charset = Charset
  Stream.Type = adTypeBinary
  Stream.Open
  Stream.Write Bytes
  Stream.Flush
  Stream.Position = 0
  ' rewind stream and read text
  Stream.Type = adTypeText
  BytesToString= Stream.ReadText
  Stream.Close
  Set Stream = Nothing
End Function

' This will alter charset of a string from 1-byte charset(as windows-1252)
' to another 1-byte charset(as windows-1251)
Function AlterCharset(Str, FromCharset, ToCharset)
  Dim Bytes
  Bytes = StringToBytes(Str, FromCharset)
  AlterCharset = BytesToString(Bytes, ToCharset)
End Function


Function WriteToFile(Types, Message)
	Dim Stm1
	Set Stm1 = CreateObject("ADODB.Stream")
	Stm1.Type = 2
	Stm1.Open
	Stm1.Charset = "UTF-8"
	'Stm1.Charset = "Unicode"
	Stm1.Position = Stm1.Size
	Stm1.WriteText Message
	Stm1.SaveToFile Types, 2
	TracePrint Stm1.ReadText
	Stm1.Close
	Set Stm1 = nothing
End Function

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