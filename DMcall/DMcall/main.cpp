/*ab*/
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<time.h>
#include<stdlib.h>
/*ab*/
#include <VARIANT>
#include <iostream>
//#import "c:/dm/dm.dll" no_namespace
#include "DM\dm.tlh"
using namespace std;
/*ab*/
void prepare(void);  //準備工作之函數 
void ask(void);  //電腦問之函數 
void answer(void);  //人類答幾a幾b之函數 
void think(void);  //電腦思考之函數（其實就是從答案庫中排除不可能的答案）
void menu(void);  //選單之函數 
int answerBase[504][3];  /*答案庫，會裝入所有重複的四位數，從1234到9876,5040是因為10*9*8*7，4是因為每組答案是一個四位數*/
int isOver, restart;  //當作布林值，判斷是否遊戲結束以及是否要繼續玩
int remain, remain2;  //答案庫裡面的答案數 
int a, b;  //拿來裝使用者回答的幾a幾b
int randNum;  //裝亂數，隨機從答案庫裡面拿答案 
int answerA, answerB, answerC, intrun;
int GetA, GetB;
/****** 準備工作之函數 ******/
void prepare(void) {
	int i, tmp, unit_1, unit_10, unit_100;
	remain = 504;
	tmp = 0;	//tmp只是一個拿來計數變數 
	isOver = 1;	//判斷結束與否 
	for (i = 0; i < 1000; i++)	//這個for產生答案庫 
	{
		unit_1 = (i / 1) % 10;	//以下四行把四位數拆成四個各位數分別存到四個變數 
		unit_10 = (i / 10) % 10;
		unit_100 = (i / 100) % 10;
		if (unit_1 != unit_10 && unit_1 != unit_100 && unit_10 != unit_100 && unit_1 != 0 && unit_10 != 0 && unit_100 != 0)
		{
			answerBase[tmp][0] = unit_100;
			answerBase[tmp][1] = unit_10;
			answerBase[tmp][2] = unit_1;
			tmp++;
			//cout << "answerBase["<< tmp << "][0]" << unit_100 << "answerBase[" << tmp << "][1]" << unit_10 << "answerBase[" << tmp << "][2]" << unit_1 << endl;
		}
		if (!(i % 100)) Sleep(1);
	}
	cout << "\n重置題庫" << endl;
}
/****** 電腦問之函數 ******/
void ask(void) {
	int i;
	srand(time(0));
	while (1 == 1)
	{
		randNum = 0;
		for (i = 0; i < 3; i++)
		{
			randNum *= 10;
			randNum += rand() % 10;
		}
		if (randNum < remain) break;
	}
		answerA = answerBase[randNum][0];
		answerB = answerBase[randNum][1];
		answerC = answerBase[randNum][2];
}
void think(void) {
	int i, j, k, aa, bb;
	int refer[3];
	for (i = 0; i < 3; i++) {
		refer[i] = answerBase[randNum][i];
	}
	for (i = 0; i < remain; i++) {
		aa = bb = 0;  //填裝a值和b值，但要區別於之前的人類輸入的a值b值 
		for (j = 0; j < 3; j++) {  //以下兩個for用來比對第i個答案和亂數取的答案的是幾a幾b 
			for (k = 0; k < 3; k++) {
				if (answerBase[i][j] == refer[k]) {
					if (j == k) aa++;
					else bb++;
				}
			}
		}
		if ((aa == a) && (bb == b)) {  //把a值b值相等的答案保留下來 
			for (k = 0; k < 3; k++) {
				answerBase[remain2][k] = answerBase[i][k];
			}
			remain2++;
		}
		/*
		if (!((aa == a) && (bb == b))) {  //把a值b值相等的答案保留下來 
			for (j = i; j < remain; j++) {  //開始搬運 
				for (k = 0; k < 3; k++) {
					answerBase[j][k] = answerBase[j + 1][k];
				}
			}
			remain--;
			i--;
		}
		*/
	}
	remain = remain2;
	remain2 = 0;
	if (remain == 0) {  //發現沒有答案符合玩家想的數字，就是玩家作弊！
		isOver = 0;
	}
}
/*ab*/


Idmsoft* GetDmObject()
{
	Idmsoft* m_dm = NULL;
	bool m_bInit = false;
	//直接加載dll創建對象，避免進行註冊文件
	typedef HRESULT(_stdcall* pfnGCO)(REFCLSID, REFIID, void**);
	pfnGCO fnGCO = NULL;
	//HINSTANCE hdllInst = LoadLibrary("dm.dll");
	HINSTANCE hdllInst = LoadLibrary("c:/dm/dm.dll");
	fnGCO = (pfnGCO)GetProcAddress(hdllInst, "DllGetClassObject");
	if (fnGCO != 0)
	{
		IClassFactory* pcf = NULL;
		HRESULT hr = (fnGCO)(__uuidof(dmsoft), IID_IClassFactory, (void**)&pcf);
		if (SUCCEEDED(hr) && (pcf != NULL))
		{
			hr = pcf->CreateInstance(NULL, __uuidof(Idmsoft), (void**)&m_dm);
			if ((SUCCEEDED(hr) && (m_dm != NULL)) == FALSE)
				return NULL;

		}
		pcf->Release();
		m_bInit = true;
	}
	else
		m_bInit = false;
	return m_dm;

}

int main()
{
	Idmsoft* dm = GetDmObject();
	cout << dm->Ver() << endl;
	long hwnd0 = dm->FindWindow("", "Ragnarok");
	long DM_ret = dm->BindWindow(hwnd0, "gdi", "dx2", "dx", 4);
	dm->DownCpu(50);
	int handle = (int)GetModuleHandle("c:/dm/dm.dll");
	int pass = dm->SetDict(0, "c:/dm/光雨.txt");
	//printf("%03d\n", hq);
	cout << "遊戲句柄：" << hwnd0 << "字典載入：" << pass << "視窗綁定：" << DM_ret << endl;
	int value = 1;
	VARIANT intX;
	VARIANT intY;

	/*腳本*/
	while (1 == 1) {
		VariantInit(&intX);
		VariantInit(&intY);
		__int64 GetMsg = dm->ReadInt(hwnd0, "00F80558", 0);
		//cout << "對話視窗：" << GetMsg << endl;
		if ( GetMsg > 0 )
		{
			if (!isOver) {
				prepare();
				intrun = 0;
			}
			Sleep(10);
			__int64 Input = dm->ReadInt(hwnd0, "00F80518", 0);
			//1.找到"Input"
			dm->FindStr(0, 0, 1024, 768, "Input", "000000-000000", 0.95, &intX, &intY);
			if (Input > 0)
			{
				intrun++;
				ask();
				cout << "[" << intrun << "]猜測AB:" << answerA << "" << answerB << "" << answerC << endl;
				dm->KeyPress(96 + answerA);
				dm->KeyPress(96 + answerB);
				dm->KeyPress(96 + answerC);
				dm->KeyPress(13);
				a = b = 0;
			}
			else
			{
				Sleep(10);
				//2.找到"很可惜答錯了"
				dm->FindStr(0, 0, 1024, 768, "很可惜答錯了", "000000-000000", 0.95, &intX, &intY);
				if (intX.intVal > 0 && intY.intVal > 0 && a + b == 0)
				{
					do {
						int x = intX.intVal;
						int y = intY.intVal;
						_bstr_t GetAs = dm->Ocr(x + 92, y + 18, x + 108, y + 28, "ff3152-000000", 0.95);
						_bstr_t GetBs = dm->Ocr(x + 80, y + 36, x + 96, y + 46, "ff3152-000000", 0.95);
						//TracePrint "數字A:" & 數字A & "數字B:" & 數字B
						a = GetA = atoi(GetAs);
						b = GetB = atoi(GetBs);
					} while (a > 4 && b > 4);
					cout << "數字A : " << GetA << "數字B : " << GetB << endl;
					//answer();
					think();
					a = b = 5;
				}
				else
				{
					Sleep(10);
					//3.找到"得分模式"
					dm->FindStr(0, 0, 1024, 768, "得分模式", "000000-000000", 1.0, &intX, &intY);
					if (intX.intVal > 0 && intY.intVal > 0)
					{
						dm->KeyPress(40);
						dm->KeyPress(40);
						//TracePrint "找到:得分模式"
						cout << "找到:得分模式" << endl;
					}
				}
			}
			//不管怎樣都給我來一點
			dm->KeyPress(13);
		}
		else
		{
			Sleep(100);
			//TracePrint "重新點擊NPC"
			//重新點擊NPC
			dm->FindStr(0, 0, 1024, 768, "猜數字遊戲", "000000-000000", 0.95, &intX, &intY);
			if (intX.intVal > 0 && intY.intVal > 0)
			{
				isOver = 0;
				int x=intX.intVal;
				int y=intY.intVal;
				dm->MoveTo(x + 25, y + 50);
				dm->LeftClick();
				cout << "點擊NPC" << endl;
			}
		}
		Sleep(50);
	}
	/*腳本*/
	return 0;
}
