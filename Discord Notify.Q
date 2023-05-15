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
MacroID=f8db0eea-56cf-459e-8e5a-e187095f8906
Description=Discord Notify
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=1
QUI=Form1
[Relative]
SetupOCXFile=
[Comment]

[UIPackage]
UEsDBBQAAgAIAAaerlYt8zfR5AMAAAgmAAAJABEAVUlQYWNrYWdlVVQNAAcDO2FkAzthZAM7YWTtWFtPE0EUPttyaQuWFqFchXJXeMFLoiTGhBKJhHKRLlRJNKlYhbBd6rZI8Qf4P3j2yQd+gs/66ps++gdINJF6ZjtLpwTCzsyWtQmnOUxbOvvNnOt844WSfPsa/nHwufsnnJJH4IXjoh8amO8UqqaEADz083GxWLS+Ll5JTclf1DrqQ+LretRGVD+qDzWAeg21CbUZNVhyPbSghum84ysz1qyswA6+8hCFx6DjaMA+8EgEI8Z6lnLBb5d/r/55/vG74gUaWCirMAeTIC4+UBQL33MBrjWy/5sBFeISKwhQ/AjNHV58Fe2dhTQsQgoyOPJKK3hM/DCtvXbn1dHRyt//Va+kujK7Y2Qk0g/I/NsS8xWQE9n5snJ48OWXzP45UrYq80XrTrn+eSrOfHZ9ZtVK0nVS8Ao0wTUEsf410XZiF9/D1L812IIcqugKQgL79zL4K4iagtewhHbQOHuvVf+b6TPt4tcx+CriF7DvS/hf4d1/PeP/GTx9aKiG4EraBPAbmP2X8WPohw3Y5sc3z8stHPZvPOX/DUn7k/O5jwPfB6UzPCsvMCmOoPak0WX8o7NtbralhUQ0kdJz0UTa2HpTJfyRTy+l5q9j5TGw/qTxr4iQ+ttOc8pu/PmZ+I9j7vFnXWX8h+jz7OIHzsz/BK5jE+3A1w07Mf+vA6nD9vGbGPxpPP1nzR5goOq4Br4uFMH9+6HEy+3iNzP4s7h3Xa7+cPc/Uq8enuxfw+77FtdA7K6L1H9u/GCF/1No/zyugdghZvrB6gTl2Dhfbgr0nxYGP2Y+v5R/dvDOiD+lDcr3bnbmhBh82fohe/6UlTk9u5uP7RRE52+n96Xwa52/qBj5efPsKxJ9Zv3hzr8wE3/LiF9AdA1P4SISFMBvrch/cv8jzuAC6EELu+uc31zG/c8I2K//pF/56Hs3+B+pV1763gn+149jH8f+28FR/qdEcRzlwI+As/yvG8cODvwOcJf/daJOnOSfNP/jjr8ucJb/9eA4xGH/bnCW/w3g2MuB3wNl/rf+YDGReXZPzX64u11I3t/KTU7Nz07urSWTy6tP1Wx8KXlnsxDPzE/rU1ANkT0/vDNrCMAU8lcRK7rdf70u4zvA/7jzrxec5X/DtKbYxb8BzvK/W0B4gH38PnCW/43hOMiB3w/u8r8ouMv/BoA9f6aw/+dgj/IwXmkVwB9k8BdgFy1A+GccVec+g5D7TxLPExz+H2Lw3b6/cltk+e/44abU/J4D1dX9L5pxn8Es0ITvH3jjf5iJvyeI91749qNU/8aB7/5j5FT928AczF0i/x1l8EnXMUxkjd4+Vb/+jTH4/wBQSwECFwsUAAIACAAGnq5WLfM30eQDAAAIJgAACQAJAAAAAAAAAAAAAIAAAAAAVUlQYWNrYWdlVVQFAAcDO2FkUEsFBgAAAAABAAEAQAAAABwEAAAAAA==


[Script]
For i = 1 To 1
訊息("<@191923465761193993>  ```你家火燒房子,跟你說一下,帳號被密語```")	
Next

Sub 訊息(文字訊息)
	key = Form1.key.Text
	Set http = Createobject("WinHttp.WinHttpRequest.5.1")
	http.open "POST","https://discord.com/api/webhooks/975317056301989919/jONaukH_iyF40G6Y4s6UX0jhk5ZXT4DJjnyGceSGa6ZcJFiGYibWdSHItLKUXb9HiDLZ", False
	http.setrequestheader "content-type", "application/x-www-form-urlencoded"
	http.send "content=" & 文字訊息
	set http = Nothing
End Sub
