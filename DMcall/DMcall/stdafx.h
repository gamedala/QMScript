
// stdafx.h : �зǨt�Υ]�t��󪺥]�t���A
// �άO�g�`�ϥΦ����`��諸
// �S�w�󶵥ت��]�t���

#pragma once

#ifndef VC_EXTRALEAN
#define VC_EXTRALEAN            // �q Windows �Y���ư����֨ϥΪ����
#endif


#define _ATL_CSTRING_EXPLICIT_CONSTRUCTORS      // �Y�� CString �c�y��ƱN�O�㦡��

// ���� MFC ��Y�Ǳ`�����g�`�i��ߩ�����ĵ�i����������
#define _AFX_ALL_WARNINGS

#include <afxwin.h>         // MFC �֤߲ե�M�зǲե�
#include <afxext.h>         // MFC �X�i


#include <afxdisp.h>        // MFC �۰ʤ���



#ifndef _AFX_NO_OLE_SUPPORT
#include <afxdtctl.h>           // MFC �� Internet Explorer 4 ���@���󪺤��
#endif
#ifndef _AFX_NO_AFXCMN_SUPPORT
#include <afxcmn.h>             // MFC �� Windows ���@���󪺤��
#endif // _AFX_NO_AFXCMN_SUPPORT

#include <afxcontrolbars.h>     // �\��ϩM������� MFC ���









#ifdef _UNICODE
#if defined _M_IX86
#pragma comment(linker,"/manifestdependency:\"type='win32' name='Microsoft.Windows.Common-Controls' version='6.0.0.0' processorArchitecture='x86' publicKeyToken='6595b64144ccf1df' language='*'\"")
#elif defined _M_X64
#pragma comment(linker,"/manifestdependency:\"type='win32' name='Microsoft.Windows.Common-Controls' version='6.0.0.0' processorArchitecture='amd64' publicKeyToken='6595b64144ccf1df' language='*'\"")
#else
#pragma comment(linker,"/manifestdependency:\"type='win32' name='Microsoft.Windows.Common-Controls' version='6.0.0.0' processorArchitecture='*' publicKeyToken='6595b64144ccf1df' language='*'\"")
#endif
#endif


