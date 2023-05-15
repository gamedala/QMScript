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
MacroID=0e90ab62-192e-4897-8a56-43852b2809d5
Description=chrome
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
// 瀏覽器的路徑
path = "C:\Users\BOB\AppData\Local\Google\Chrome\Application\chrome.exe"
// 啟動瀏覽器
If Plugin.chrome.launch(path, "--user-data-dir=c:\user_data") = False Then 
    MsgBox "啟動失敗"
    ExitScript
End If
// 獲取啟動瀏覽器後的默認標籤
id = Plugin.chrome.get_ids()
If id = "" Then 
    TracePrint "獲取標籤id失敗"
    ExitScript
End If
// 跳轉到地址
Call Plugin.chrome.load(id, "http://www.vrbrothers.com/cn/wqm/demo/pages/Demo-ComplexForm.aspx")
// 等待載入完成
Do 
    Delay 2000
    TracePrint "..."
Loop While Plugin.chrome.is_loading(id)
username = "用戶名"
// 用戶名
Call Plugin.chrome.exec_js(id, "document.querySelector('#ctl00_mainContent_tbUsername').value='" & username & "';")
// 密碼
Call Plugin.chrome.exec_js(id, "document.querySelector('#ctl00_mainContent_tbPassword').value='password';")
// EMail地址
Call Plugin.chrome.exec_js(id, "document.querySelector('#ctl00_mainContent_tbEMail').value='abc@123.com';")
// 性別，$字符是CSS選擇器的特殊字符，所以需要用反斜桿轉義
Call Plugin.chrome.exec_js(id, "document.querySelectorAll('[name=ctl00\\$mainContent\\$rblGender')[0].checked=true;")
// 省份城市，聯動下拉列表需要觸發change事件
change_event = "var ev = document.createEvent('HTMLEvents');" & _
"ev.initEvent('change', false, true);"
Call Plugin.chrome.exec_js(id, "document.querySelector('#ctl00_mainContent_ddlProvince').selectedIndex=1;")
Call Plugin.chrome.exec_js(id, change_event & "document.querySelector('#ctl00_mainContent_ddlProvince').dispatchEvent(ev);")
Call Plugin.chrome.exec_js(id, "document.querySelector('#ctl00_mainContent_ddlCity').selectedIndex=2;")
Call Plugin.chrome.exec_js(id, change_event & "document.querySelector('#ctl00_mainContent_ddlCity').dispatchEvent(ev);")
// 求職意向
Call Plugin.chrome.exec_js(id, "document.querySelector('#ctl00_mainContent_lbObjectives').options[0].selected=false;")
Call Plugin.chrome.exec_js(id, "document.querySelector('#ctl00_mainContent_lbObjectives').options[1].selected=true;")
Call Plugin.chrome.exec_js(id, "document.querySelector('#ctl00_mainContent_lbObjectives').options[2].selected=true;")
// 愛好
Call Plugin.chrome.exec_js(id, "document.querySelector('#ctl00_mainContent_cblHobies_0').checked=true;")
Call Plugin.chrome.exec_js(id, "document.querySelector('#ctl00_mainContent_cblHobies_1').checked=true;")
// 自我評價
Call Plugin.chrome.exec_js(id, "document.querySelector('#ctl00_mainContent_tbSelfAssement').value='aaaaa\nbbbbb\nccccc';")
// 我已閱讀並接受註冊協議
Call Plugin.chrome.exec_js(id, "document.querySelector('#ctl00_mainContent_cbAcceptTerms').checked=true;")
MsgBox "表單填寫完成，點擊確定繼續"
// 提交
Call Plugin.chrome.exec_js(id, "document.querySelector('#ctl00_mainContent_btnSubmit').click();")
Do
    Delay 1000
    TracePrint "..."
Loop While Plugin.chrome.is_loading(id)
// 獲取結果
rows_len = CInt(Plugin.chrome.exec_js(id, "document.querySelector('table').rows.length"))
For i = 0 To rows_len - 1
    str = ""
    cells_len = CInt(Plugin.chrome.exec_js(id, "document.querySelector('table').rows[" & i & "].cells.length"))
    For j = 0 To cells_len - 1
        str = str & Plugin.chrome.exec_js(id, "document.querySelector('table').rows[" & i & "].cells[" & j & "].innerText")
        str = str & " "
    Next
    TracePrint str
Next
MsgBox "腳本執行完畢"
Call Plugin.chrome.quit()
