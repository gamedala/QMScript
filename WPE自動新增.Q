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
MacroID=2c5710da-a9f2-4b49-b7ba-385e5c736ab7
Description=WPE自動新增
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
UEsDBBQAAgAIAIhyW1Wzn/IqXAAAAJQFAAAIABEAt3O8Vy5ibXBVVA0AB6STWmMFlFpjpJNaY3PybWNlAAMzINYAYjEgFgFiRgYJsHgAVB4Z/P//fwFlAGzG48ePP5ALRoAZDIQAcWb8xw1GzRg1gwGrVorTGEQQzQCy3EFxfqFHviUbgM0AARkmBq4HqWXCqpcAUEsDBBQAAgAIAOByW1Wf79ZKwQAAAIQLAAAMABEAq8qlXbzGtnEuYm1wVVQNAAdklFpj9JdaY2SUWmNz8i3jZgADMyDWAGIDIBYBYkYGCbC4A1QeGXz48GHBggWPaQb+//9PknqIezIzM//TAEDck0k0oI97FhAH6OaeD0SAgXUPJN0OEvcgZyWC7kHLfWiCAxJfyM5A5qKxiXcPMQB/fOFyA3nuIbLkwZ9+0EKJEvdQpfyhonuoVf5QK/1Qkp4xbae6e0jN73QIH5LKQ8zSZmDLH6qXz5SXP9R1D3nlDy0A2eUP7QDx5Q8EfBhkAJRtZJgYuXqPTpuoJgcAUEsDBBQAAgAIAM56W1VcqWVxgAAAAMQMAAAGABEAT0suYm1wVVQNAAdPolpjW6JaY0+iWmNz8t3GwwAGZkCsAcSmQCwCxIwMEmDxBqg8Msgc3IBhwSAGIPc9fvz4w6AEo+4bdd/Qdx+8nMIqgiZFb/ehOQuTTbbjqOA+TLvRnEWJ42juPgodN+LDj/JQpLn7Br58IZh/B2/5N1jcRzsw6j5quW9wAqj7QECGiYFL/PLW1++1AFBLAQIXCxQAAgAIAIhyW1Wzn/IqXAAAAJQFAAAIAAkAAAAAAAAAIACAgQAAAAC3c7xXLmJtcFVUBQAHpJNaY1BLAQIXCxQAAgAIAOByW1Wf79ZKwQAAAIQLAAAMAAkAAAAAAAAAIACAgZMAAACryqVdvMa2cS5ibXBVVAUAB2SUWmNQSwECFwsUAAIACADOeltVXKllcYAAAADEDAAABgAJAAAAAAAAACAAgIGPAQAAT0suYm1wVVQFAAdPolpjUEsFBgAAAAADAAMAvwAAAEQCAAAAAA==


[Script]
封包大小 = "7"
NPC起始 = 230
NPC終止 = 255
動作 = 0
FindPic 0,0,1920,1080,"Attachment:\新增.bmp",0.8,intX1,intY1
If intX1 > 0 And intY1 > 0 Then 
	Do
		If 動作 = 0 Then 
			MoveTo intX1 + 10, intY1 + 5
			LeftClick 1
			TracePrint "找找不到"
			FindPic 0,0,1920,1080,"Attachment:\封包數量.bmp",0.9,intX,intY
			If intX > 0 And intY > 0 Then 
				MoveTo intX+10, intY+10
				LeftClick 2
				KeyPress  封包大小, 1
				動作 = 1
			End If
		Else 
			If NPC終止 < NPC起始 Then 
				Exit Do
			End If
			TracePrint "找找不到"
			MoveTo intX + 30, intY - 154
			LeftClick 1
			NPCHex = Hex(NPC起始)
			NPC起始 = NPC起始 + 1
			text = "9000" & NPCHex & "41A00601"
			TracePrint text
			Textsize = Len(text)
			s = 0
			For Textsize
				s = s + 1
				KeyPress  Mid(text,s,1), 1
				TracePrint Mid(text, s, 1)& "--" & s
				Delay 20
			Next
			FindPic 0, 0, 1920, 1080, "Attachment:\OK.bmp", 0.9, intX, intY
			If intX > 0 And intY > 0 Then 
				MoveTo intX - 30, intY + 5
				LeftClick 1
			End if
			動作 = 0
		End If
		Delay 1000
	Loop
Else
	TracePrint "找找不到"
End If
