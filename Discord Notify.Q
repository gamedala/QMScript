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
UEsDBBQAAgAIAACbr1Q0qYf94QMAAAgmAAAJABEAVUlQYWNrYWdlVVQNAAeAU4FigFOBYoBTgWLtWEtPWkEUPhd8AFoEq/is4rvVjX0krUnTRExNjYgPUBqTNkFLi/FypRes2H/juqsu/Aldt8tumrTLbrtwV+mZy1wZjMY7MxdvSTzkMECY+82cOa9v3FCWb1+DP48+9/6Cc/IM3HBa8kIT85tC1ZAAgIt+Py2VSubPpRupK/mL2kDPkJx1I2ozqhfVg+pDvYXagtqK6i8fPbShBum80xsz1q2swR6+ChCG56DhqMMh8EgIPcZ8lnLVn//82IplvituoI6Fsg4LMA3i4gFFMfFdV+CejYzMQQKiEivwUfwQjR1e/ATaOwdpiEEKsjjySju4DPwgzb1W5zXQ0Yzf/1VvpLYyv6dnJcIPyPz7EvMVkBPZ+bJyfPTlt8z+OUK2JvNF804l/7mqej6rZ2bmSlJ1UrAFquAa/Jj/Wmg5sYrvYvLfBuxAHlV0BQGB/bsZ/DVETcEbWEY7qJy118z/rfSZVvEbGPwE4hex7kucv8K7/0bm/Oew+1BRdcGVdAjgNzH7r+BH8By2YZcf3+iX2zjs33zu/Lcl7U/6cw8HvgfKPTwrrzAoTqD+pNlh/JOLbW6UpaV4OJ7S8uF4Wt95WyP8sU+vpeZvYubRMf+k8V1ESP7tpDFl1f+8jP9HMfb4o67a/wP0eVbxfRfGfxzXkUE78FXDboz/20DysHX8FgZ/Frv/nFEDdFQN18BXhUK4fy+UeblV/FYGfx73rsnlH+76R/LV07P9q1h93+EaiN01kfzPje+vOv8U2r+AayB2iBjnYFaCim9cLncF6k8bgx8xnl+OPyt4F/if0gGVezcrcwIMvmz+kO0/ZWVBy+0XIntF0fm76UMp/HrnLwn0/ILR+4p4n5F/uOMvyPjfCuIXEV3FLlxE/AL47VXxT+5/xBmcD0/QxO657E/XcP8zBtbzP6lXHvrZCf5H8pWbfraD/w3iOMCx/06wlf8pYRzHOfBDYC//68WxiwO/C5zlf92oU2fxJ83/uP2vB+zlf304jnDYvxfs5X9DOPZz4PdBhf9tPonFsy8fJXIfH+4Wk4938tMzi/PTBxvJ5Mr6aiIXXU4+yBSj2cVZbQZqIbL9w3sjhwDMIH8VsaLT9dftML4N/I87/vrBXv43SnOKVfw7YC//uweEB1jHHwB7+d8EjsMc+IPgLP8Lg7P8bwjY/jOF9T8PB5SH8Uq7AP4wg78E+2gBwj+jqBp3D0LuP4k/T3Gc/wiD7/T9ldMiy38njzNS8/uOEo7uP2b4fRajQBW+f+D1/1HG/14g3gfh249y/psEvvuPsXP5bxtjMH+N/HecwSdVRzeQVXr7VPv8N8Hg/wNQSwECFwsUAAIACAAAm69UNKmH/eEDAAAIJgAACQAJAAAAAAAAAAAAAIAAAAAAVUlQYWNrYWdlVVQFAAeAU4FiUEsFBgAAAAABAAEAQAAAABkEAAAAAA==


[Script]
For i = 1 To 1
訊息("<@191923465761193993> \\n ```你家火燒房子,跟你說一下,帳號被密語```")	
Next

Sub 訊息(文字訊息)
	key = Form1.key.Text
	Set http = Createobject("WinHttp.WinHttpRequest.5.1")
	http.open "POST","https://discord.com/api/webhooks/975317056301989919/jONaukH_iyF40G6Y4s6UX0jhk5ZXT4DJjnyGceSGa6ZcJFiGYibWdSHItLKUXb9HiDLZ", False
	http.setrequestheader "content-type", "application/x-www-form-urlencoded"
	http.send "content=" & 文字訊息
	set http = Nothing
End Sub
