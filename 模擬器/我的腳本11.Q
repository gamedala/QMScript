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
MacroID=98eb60df-4320-4a23-9cf2-032a425ff75f
Description=我的腳本1
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

[Attachment]
UEsDBBQAAgAIAGaL2VT9o94ItgQAADQLAAAIABEApfSwyC5ibXBVVA0AB4dFt2KFR7di7UO3Yq2WaU8bRxiAST+mP6BVlX5IKlVEaQ41EiIEJYAhBgzG+D52fazBYDB2oFAUSgGlWFCVHKVAQVwJtIGAU0igYGNjJ2B8g0KRWiFCqxwUgymHjQ8IkjuOqaEGwpXRM6PR7Ow8mpmdnTci/tP3A96kIJADQT4O8jGQjwR8+KZ98WjAluQOcL8dNiaUePFjCHOKhT1HjvqEHhu86yt+7OhIZ/OYMSg48mQ2N7qhukhS++2dW3k5STHvxsGHETrm8yweBdSlzc2jfX2qtqbyIsZVbjQm6hwXRg7rYCZGpTNRd2rFamXniFTaUVtbU1rKomJIiej9Dr29gxQbUVrI6+ttNhplRo0UtHCoeCI+/sCj+zt4MLfka9HgQKfJJFcPPgQtVPyVlCQBqKQmC8jEaA4TPqwDQp0CpXFIBZA9auVDkb5HNFqQWJySnU2lUS8d3MFAXRDnpmnUA15H291KBjbc1ykzXVRWlj02pqurK2Eyw4h49L4dqVQmhPqsQ9Ki0wx5HVVlBQiZuLkfmRSq0cjM5pfj4795ZkaN3p8jmUjOgLDKfrnP4Vk6rP8oWZlMrVbudq86nc9lslYYJgh4or06OGRCfg4d7POwUT6i6Qfcb6olXgrc2rviRu7oU7Xb7V5ZcenUKlESIZObvCcHi4grKxHq9b0+h/6JND+LT0VHChGhrytCxDIwp6vLS51Oh8vlstvtkxN/1N0uEkKJuzvA0vs5AOr+h9fzuXTceSzqRALqOIw9m8oIQwhBKYyosVGTw+EADmCaej7Z1nj7qzR8OsR4654zOX5rBRjW9g08aZf23u3uqu/uapTLWh4rJR2SH6+JKAVf8i0Wi9fx+vXq4rxF0dWSl0ZkE+N3dHCpdD6MUinbTUa5cajfi0Gj0GplXnQ6GTiYXmS9LQT06U7JT1arFWjc/6Ul62J1ZTGbEL7j+aBEn3xwv9JkkBvUig00Gxi162gHZbkiJEfImZp6abUtO1yrXpZX16aWre0PGjmky0k02jYOOja2rDhDIWvd7PDN6X9olJ7zER8ESqvNZnOseLG6Vufd7tnVlf5BGZ8dnwpxtvmXMLDB9VXf7MVh0D72ap5NjC/ZXZsdgLm1tWd//X49NY6GDt7mv4uQL0tqvx/u7QF3xlOl3KRXrKNTbHVAiSGgXFy2W50uq8O15HAtOJ1e/rHNm82jFAp2G0caB0Hg0OYfxKaeX3d1gJ0fMWmX7E4gACza7DMWyzqzUyqVRMAi7HgPCnik7wozHv1coxuSbuvwCipuicF+eAWABevy9PS02WyemJjwzBITtst9jsddgGgbX6HPoR/o++VeHUwIq7hZPDc3t9XR3VT1hYBHQV/cU8zg2Z5EDDUiEJBECSsp5hdeg6CoD1hxnmtmeWUeYHPMgzQ7OzM2avScZQYOjgnJYCJ7jUv8EHFTBbDHAeoLthmfY9igrikXCxEsLTZ037HPViixZxoaCixzejD63zN/gpZcAUSIPAPh0AeMrzaTmZyREHW+vr7g1aveFy8UPd338q4iLFw4l4Q7VAy3GULICVAaDK3t7TeS2AksDIiPeO8gTtwMPe4KmRwCwxEUUtxBYgZPOvbekaPySdxHN8/+C1BLAQIXCxQAAgAIAGaL2VT9o94ItgQAADQLAAAIAAkAAAAAAAAAIACAgQAAAACl9LDILmJtcFVUBQAHh0W3YlBLBQYAAAAAAQABAD8AAADtBAAAAAA=


[Script]
'獅子城(0)歡喜城(1)雪山礦村(2)樂園鎮(3)
任務城鎮 = 0
'簡單(0)普通(1)困難(2)
任務難度 = 0
'上至下由左至右0~N
任務選項 = 4

Do
	Call 確認委託
	Delay 1000
Loop

Sub 確認委託
	'確認有無接委託
	FindPic 472,391,546,456,"Attachment:\任務.bmp",0.8,intX,intY
	If intX > 0 And intY > 0 Then 
		
	Else 
		
	End If
End Sub
