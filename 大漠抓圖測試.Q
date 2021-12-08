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
MacroID=45eac42d-9612-4458-a006-e975d9472d43
Description=大漠抓圖測試
Enable=0
AutoRun=0
[Repeat]
Type=1
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Attachment]
UEsDBBQAAgAIAEabdFPFn7LuCgQAABYIAAAMABEArtel87rrxkYuYm1wVVQNAAfrS5lh+EyZYXdMmWG1VU1oXFUUPrNSqBGzsHGXpCsXKc4qLXcTO8FuzKSr6mxsoRPvpnRmIWJDkyLUajYzHqZ/JDJKRBtJkyhSDxmdkqREGEjT4iIg3Ilth7S2FNwK3Vy/+874fEnNRvBx3pvz7v3eud/57rlnMtm9z1N09eN+FXca94u4U/RKNH7vOXrmak7R/CiN5+hsjgrZYEmnnKdqIRgcjBzL0JEDweDAMKIARLhxPjj4BOMDfTR8gApDNP52CgYngKPX0okwglcAFKamgOqpVGuK/CNe977cb72XZe8H+uxrvQE8lqGNB1zO22s5wlRuyr35MtUcv7THwvGb7KProfdnP2Al3PiQuovi2GQqToPcrxpg3qt5vF49ijjO734VSlL/iIrDVP/RdnZYyIW76YUMNyum5f1xy5AOduQgYQSfWCss4hwDk0pRel9YFEwUUy8ihBgi7zi5EDtPZDpfCAC8GisAMAsMmRpMCwJ7KI/9Ko/Q6rJN77OID/vtclgXmNf3B6q6X+szprYYeIKzE6uOsEkPs/KZxebeFOXDbJyIEoaBHlYGH/igBNMIbPCQEBCeFcwm+fR0WQxDz8GKsyGqgM/xQSrlaTpPcze5VgkrIQ3n8MtJ5Q+dEYizfMMiS+RumbFEUp+LTd/ZYQY7yDd5t82CUof67B/X2nta9z5i0d445N5zmJUS0ocjUT54QGT8KkaFwq6Bz+rnpn457AJZ1qkd+sSf4MnIPkIBH1aN1k730o76wUTnySAdkIMV6ekKTK5kKKLvdR9DfOjzd4WEvPZb0I7rB4FifHyl35egT/QV8gcf1QFaKhh3utcm9wtF9ayMPUVB+iAW64M4Wp8YsUhUAu2rb/1zdsBZ60TFQHYAIPehLrq4yF4Cg2T91E7S5Ka/ULHD/dv4qLwqnoqMTUe5zr1DrXvtfC07lIeyStZPaE0HQ2ToAyat6rb6mbvvC0Om2E9f1NEujB7A+HydWvTde2nykjmWsY+m2tpueb+6JANHefUMQVsAcr00t8KFrEH9rP9s0ZcyewJJYdv9BgNQv2TGs3x+SQBA2W98ZxpfMoKMVJ02TDSckaogI/hogxND5Fu71jN6YOmE1f68sWYLWftwxuzArDzw1YLBeb+ep9k12VqxIIxVrsxIHHl2DRj6aZSWavxLmcY+llqD/e1t697FeTln50+n0IG1RaMbf/8ujc1IsnUD8PTbcOQf/2rnR622mjsT1PjdlfJG/whufRoMZb/1DZU+k40LoaFdv+0hiPvBVCcYGMwq5u40VaclfHg6BL/zCS3UBBzg3yoH+7NhdtNn0/nmZODz5OtAKWnKAQ6mAIgxuqiuHmNiWDLOk69SMMRXg/90oT0CVvVz/2IYVz7/iy2k/pv9BVBLAQIXCxQAAgAIAEabdFPFn7LuCgQAABYIAAAMAAkAAAAAAAAAIACAgQAAAACu16XzuuvGRi5ibXBVVAUAB+tLmWFQSwUGAAAAAAEAAQBDAAAARQQAAAAA


[Script]
Call 大漠設定()
Call 窗口綁定()
Do

dm_ret = dm.FindStr(225,43,920,345,"每日副本","ffffff-000000",1.0,intX,intY)
dm.MoveTo intX,intY

Loop

Function 大漠設定()
	set dm = createobject("dm.dmsoft")
	base_path = dm.GetBasePath()
	dm_ret = dm.SetPath(base_path)
	dm_ret = dm.SetDict(0,"pass.txt")
	//pass.txt字典讀取
End Function

Function 窗口綁定()
	Hwnd1 = Plugin.Window.MousePoint()
	dm_ret = dm.BindWindow(hwnd1,"gdi","dx2","windows",4)
	//大漠綁定視窗
End Function
