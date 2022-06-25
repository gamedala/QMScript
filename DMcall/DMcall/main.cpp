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
void prepare(void);  //�ǳƤu�@����� 
void ask(void);  //�q���ݤ���� 
void answer(void);  //�H�����Xa�Xb����� 
void think(void);  //�q����Ҥ���ơ]���N�O�q���׮w���ư����i�઺���ס^
void menu(void);  //��椧��� 
int answerBase[504][3];  /*���׮w�A�|�ˤJ�Ҧ����ƪ��|��ơA�q1234��9876,5040�O�]��10*9*8*7�A4�O�]���C�յ��׬O�@�ӥ|���*/
int isOver, restart;  //��@���L�ȡA�P�_�O�_�C�������H�άO�_�n�~��
int remain, remain2;  //���׮w�̭������׼� 
int a, b;  //���Ӹ˨ϥΪ̦^�����Xa�Xb
int randNum;  //�˶üơA�H���q���׮w�̭������� 
int answerA, answerB, answerC, intrun;
int GetA, GetB;
/****** �ǳƤu�@����� ******/
void prepare(void) {
	int i, tmp, unit_1, unit_10, unit_100;
	remain = 504;
	tmp = 0;	//tmp�u�O�@�Ӯ��ӭp���ܼ� 
	isOver = 1;	//�P�_�����P�_ 
	for (i = 0; i < 1000; i++)	//�o��for���͵��׮w 
	{
		unit_1 = (i / 1) % 10;	//�H�U�|���|��Ʃ�|�ӦU��Ƥ��O�s��|���ܼ� 
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
	cout << "\n���m�D�w" << endl;
}
/****** �q���ݤ���� ******/
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
		aa = bb = 0;  //���a�ȩMb�ȡA���n�ϧO�󤧫e���H����J��a��b�� 
		for (j = 0; j < 3; j++) {  //�H�U���for�ΨӤ���i�ӵ��שM�üƨ������ת��O�Xa�Xb 
			for (k = 0; k < 3; k++) {
				if (answerBase[i][j] == refer[k]) {
					if (j == k) aa++;
					else bb++;
				}
			}
		}
		if ((aa == a) && (bb == b)) {  //��a��b�Ȭ۵������׫O�d�U�� 
			for (k = 0; k < 3; k++) {
				answerBase[remain2][k] = answerBase[i][k];
			}
			remain2++;
		}
		/*
		if (!((aa == a) && (bb == b))) {  //��a��b�Ȭ۵������׫O�d�U�� 
			for (j = i; j < remain; j++) {  //�}�l�h�B 
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
	if (remain == 0) {  //�o�{�S�����ײŦX���a�Q���Ʀr�A�N�O���a�@���I
		isOver = 0;
	}
}
/*ab*/


Idmsoft* GetDmObject()
{
	Idmsoft* m_dm = NULL;
	bool m_bInit = false;
	//�����[��dll�Ыع�H�A�קK�i����U���
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
	int pass = dm->SetDict(0, "c:/dm/���B.txt");
	//printf("%03d\n", hq);
	cout << "�C���y�`�G" << hwnd0 << "�r����J�G" << pass << "�����j�w�G" << DM_ret << endl;
	int value = 1;
	VARIANT intX;
	VARIANT intY;

	/*�}��*/
	while (1 == 1) {
		VariantInit(&intX);
		VariantInit(&intY);
		__int64 GetMsg = dm->ReadInt(hwnd0, "00F80558", 0);
		//cout << "��ܵ����G" << GetMsg << endl;
		if ( GetMsg > 0 )
		{
			if (!isOver) {
				prepare();
				intrun = 0;
			}
			Sleep(10);
			__int64 Input = dm->ReadInt(hwnd0, "00F80518", 0);
			//1.���"Input"
			dm->FindStr(0, 0, 1024, 768, "Input", "000000-000000", 0.95, &intX, &intY);
			if (Input > 0)
			{
				intrun++;
				ask();
				cout << "[" << intrun << "]�q��AB:" << answerA << "" << answerB << "" << answerC << endl;
				dm->KeyPress(96 + answerA);
				dm->KeyPress(96 + answerB);
				dm->KeyPress(96 + answerC);
				dm->KeyPress(13);
				a = b = 0;
			}
			else
			{
				Sleep(10);
				//2.���"�ܥi�������F"
				dm->FindStr(0, 0, 1024, 768, "�ܥi�������F", "000000-000000", 0.95, &intX, &intY);
				if (intX.intVal > 0 && intY.intVal > 0 && a + b == 0)
				{
					do {
						int x = intX.intVal;
						int y = intY.intVal;
						_bstr_t GetAs = dm->Ocr(x + 92, y + 18, x + 108, y + 28, "ff3152-000000", 0.95);
						_bstr_t GetBs = dm->Ocr(x + 80, y + 36, x + 96, y + 46, "ff3152-000000", 0.95);
						//TracePrint "�ƦrA:" & �ƦrA & "�ƦrB:" & �ƦrB
						a = GetA = atoi(GetAs);
						b = GetB = atoi(GetBs);
					} while (a > 4 && b > 4);
					cout << "�ƦrA : " << GetA << "�ƦrB : " << GetB << endl;
					//answer();
					think();
					a = b = 5;
				}
				else
				{
					Sleep(10);
					//3.���"�o���Ҧ�"
					dm->FindStr(0, 0, 1024, 768, "�o���Ҧ�", "000000-000000", 1.0, &intX, &intY);
					if (intX.intVal > 0 && intY.intVal > 0)
					{
						dm->KeyPress(40);
						dm->KeyPress(40);
						//TracePrint "���:�o���Ҧ�"
						cout << "���:�o���Ҧ�" << endl;
					}
				}
			}
			//���ޫ�˳����ڨӤ@�I
			dm->KeyPress(13);
		}
		else
		{
			Sleep(100);
			//TracePrint "���s�I��NPC"
			//���s�I��NPC
			dm->FindStr(0, 0, 1024, 768, "�q�Ʀr�C��", "000000-000000", 0.95, &intX, &intY);
			if (intX.intVal > 0 && intY.intVal > 0)
			{
				isOver = 0;
				int x=intX.intVal;
				int y=intY.intVal;
				dm->MoveTo(x + 25, y + 50);
				dm->LeftClick();
				cout << "�I��NPC" << endl;
			}
		}
		Sleep(50);
	}
	/*�}��*/
	return 0;
}
