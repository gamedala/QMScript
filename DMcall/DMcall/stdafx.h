
// stdafx.h : 標準系統包含文件的包含文件，
// 或是經常使用但不常更改的
// 特定於項目的包含文件

#pragma once

#ifndef VC_EXTRALEAN
#define VC_EXTRALEAN            // 從 Windows 頭中排除極少使用的資料
#endif


#define _ATL_CSTRING_EXPLICIT_CONSTRUCTORS      // 某些 CString 構造函數將是顯式的

// 關閉 MFC 對某些常見但經常可放心忽略的警告消息的隱藏
#define _AFX_ALL_WARNINGS

#include <afxwin.h>         // MFC 核心組件和標準組件
#include <afxext.h>         // MFC 擴展


#include <afxdisp.h>        // MFC 自動化類



#ifndef _AFX_NO_OLE_SUPPORT
#include <afxdtctl.h>           // MFC 對 Internet Explorer 4 公共控件的支持
#endif
#ifndef _AFX_NO_AFXCMN_SUPPORT
#include <afxcmn.h>             // MFC 對 Windows 公共控件的支持
#endif // _AFX_NO_AFXCMN_SUPPORT

#include <afxcontrolbars.h>     // 功能區和控件條的 MFC 支持









#ifdef _UNICODE
#if defined _M_IX86
#pragma comment(linker,"/manifestdependency:\"type='win32' name='Microsoft.Windows.Common-Controls' version='6.0.0.0' processorArchitecture='x86' publicKeyToken='6595b64144ccf1df' language='*'\"")
#elif defined _M_X64
#pragma comment(linker,"/manifestdependency:\"type='win32' name='Microsoft.Windows.Common-Controls' version='6.0.0.0' processorArchitecture='amd64' publicKeyToken='6595b64144ccf1df' language='*'\"")
#else
#pragma comment(linker,"/manifestdependency:\"type='win32' name='Microsoft.Windows.Common-Controls' version='6.0.0.0' processorArchitecture='*' publicKeyToken='6595b64144ccf1df' language='*'\"")
#endif
#endif


