// This file (SampleCode.cpp) was converted from SampleCode.Bas
// with uCalc Transform 2.5 on 2/25/2014 7:51:19 AM using the Open Source 
// PowerBASIC to C++ converter found at https://github.com/uCalc/powerbasic-to-cpp

#include <math.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <algorithm>
#include <string>
#include "pbstrings.h"
using namespace std;

//  File name: SampleCode.Bas
//  To convert this file to C++ make sure you have uCalc Transform on your PC
//  and *.uc from github.com/uCalc/powerbasic-to-cpp/tree/master/convert
//  Do the following at the Command Prompt:
// 
//  C:\> PBtoCPP.Bat SampleCode.Bas


const int MyEquate = 0x100;
const int Other = 0x200;

int ProgStatus;

#if defined Other
//  Something
#elif !defined abcd
//  Something else
#else
//  Etc
#endif

#define MyMacroNum 12345
#define MyMacro(a, b, c) (a + b * (c))

struct point {
   int x;
   int y;
};

struct MyBits {
   unsigned int Year : 7;
   unsigned int Month : 5;
   unsigned int DayOfMonth : 4;
   unsigned int DayOfWeek : 3;
   unsigned char Red : 1;
   unsigned char Blue : 1;
   unsigned char Green : 1;
   double Other;
   long double xyz;
};

int MyFunc(int x)
{
   return x * 2;
}

int MyFunction(int a, float& b)
{
   int x;
   int y;
   int *Test = new int [a+25+1];
   int yVar;
   int MyValue;
   //  Dim q As Long
   //  The commented line above is not translated
   
   MyFunc(a);
   x = MyFunc(b)+1;
   
   if (b > 5) {
      for (x=1; x<=10; x += 1) {
         for (yVar=10; yVar>=1; yVar += -1) {
            if (x > y) {
               return a+y;
            }
            while (Test[a+5] == yVar) {
               while (!(a+1 == 1234)) {
                  if (y < MyEquate) {
                     return Test[x-y]*10;
                  }
                  a = a + 1;
                  do {
                     b = a * 5 + b;
                  } while (!(b == 300));
               }
            }
         }
      }
   }
   
   delete[] Test;
}

void MySub(int x)
{
   int y;
   float *Test;
   float *Number = new float [10+1];
   int *Other = new int [x+1];
   int z;
   
   ProgStatus = 10;
   y = x + 1;
   z = y+x;
   Other[x] = x+1;
   
   while (x < 10) {
      y = MyFunction(x, *Test);
      Test = &x;
      Number[z] = *Test + Other[5+x];
      x = x+1;
      if (Test < 0) {
         continue;
      }
      if (Test == y) {
         return;
      }
      if (Test == z) {
         break;
      }
   }
   
   delete[] Other;
   delete[] Number;
}
//   ' This line is broken up using a _ (underscore)
//   This is a commment (even without ')
//   Everything after _ is a comment

void TestCertainOperators(int x, int y, int z, double& OtherVar, float *FinalArg)
{
   //  Note: comments after _ are regrouped into a different place
   
   int *MyArray = new int [10+1];
   Point MyPoint;
   Point *pp;
   int n;
   
   for (x=1; x<=10; x += 1) {
      n = y == z //  This works differently in PB than in C++
      MyArray[x] = x*2;
      if (x == 5) {
         y = x+5;
      } else {
         y = 23*2;
      }
      y = x == z;
      MyArray[5] = MyArray[n] == MyArray[n+1];
      if (x == y == z) {
         y = n == 2;
      } else {
         y = n == 3;
      }
      if (x == y && x != 10 || y == x && x < 25) {
         y = x || y == z;
      }
      if ((x == y & x != 10 | y == x & x < 25)) {
         y = x || y == z;
      }
      if ((x == y & x != 10) || y == x && x < 25) {
         y = x || y == z;
      }
      if (~(x == y | x == z)) {
         x = y + 10;
      }
      if (~(x == y | x == z)) {
         x = y + 10;
      }
      
      if (x != y) {
         MyPoint.x = y;
      } else {
         MyPoint.x = x;
      }
      
      pp = &p;
      MyPoint.x = MyPoint.y+1;
      n = MyPoint.x == MyPoint.y;
      *pp.x = *pp.y == *pp.x+1;
   }
   
   delete[] MyArray;
}

//  The section below is a test for variables declared implicitely with data type
//  based on Def[Type] declarations or on type specifiers.


float MyValue;
string Label;
Currency Price;
long double ExtVal;
__int64 qNum;

int TestFunc(int& a, unsigned char& b, int& c, short& i, String& s, float& n)
{
   Print MyValue, Label, PriceB;
   
   Label = "Missing quote at the end of this line is added by Refactor.uc";
}

string Report(string& LastName, int x, double& NewPrice, float& n, short i, float& nValue, __int64& qValue)
{
   string FirstName;
   unsigned char Age;
   double Total;
   static int Index;
   
   Print LastName, x, NewPrice, n, i, nValue, qValue;
   Report = FirstName + LastName;
}

string Hello(string& txt)
{
   Print txt;
   return txt + " friend!";
}

unsigned char  Bye() {
   Print "Bye";
}


//  This section is a test for Subs or Functions that are called as a statement
//  without parentheses.  The converter adds them.

// #Include "Win32API.inc"
extern __declspec(dllimport) unsigned int ShellExecute(unsigned int hwnd, lpOperation As LPCSTR, lpFile As LPCSTR, lpParameters As LPCSTR, lpDirectory As LPCSTR, int nShowCmd);
extern __declspec(dllimport) int SetCursorPos(int x, int y);
extern __declspec(dllimport) void SetLastError(unsigned int dwErrCode);

void DoSomething(int Arg1, string& txt, long double& Number, Optional unsigned int *xyz)
{
   SetCursorPos(10, Arg1 + 5);
   if (Arg1 == 15) {
      SetLastError(123);
   }
}

float main()
{
   long double x;
   long double pi;
   string MyString;
   DoSomething(Len("Test")+5, "Hello " + "world!", Sin(x+1)*pi, &x-4) //  Comment
   
   DoSomething(10, "abc", 5, 1);
   DoSomething(1, "x", 5, 0)  //  Etc...
   
   if (x > 1) {
      DoSomething(1, "x", 5, 0) //  Parenthesis already here
   }
   
   MyFunc(5);
   
   ShellExecute(0, "Open", "ReadMe.Txt", $Nul, $Nul, SW_ShowNormal);
   
   BinFile = 1;
   InFile  = 2;
   
   //  File handling test
   fstream file_BinFile (string("MyBin.Txt").c_str(), ios::binary | ios::in | ios::out);
   fstream file_InFile (string("MyInput.Txt").c_str(), ios::in);
   fstream file_3 (string("MyOutput.Txt").c_str(), ios::out | ios::trunc);
   fstream file_4 (string("MyAppend.Txt").c_str(), ios::out | ios::app);
   
   i = (missing);
   i = file_BinFile.tellg()+1;
   i = file_1.eof();
   file_BinFile.seekg(i+100-1);
   file_BinFile.seekp(i+100-1);
   
   MyString.resize(500);
   file_1.read(&MyString[0], 500);
   file_1.write(&MyString[0], MyString.size());
   
   file_3.close() //  PB: Close #3
   file_4.close() //  PB: Close #4
   file_BinFile.close() //  PB: Close #BinFile
   file_InFile.close() //  PB: Close #InFile
   
   i = (x > 1 ? Sin(x)+1 : Cos(x)-1) * 2;
   MyString = (x>50 ? PB_LEFT(MyString, 10) : PB_MID(MyString, 25, FULL_STRING));
} int;

//  This section tests transforms found in strings.uc
string StringTest(string& MyString, string OtherString)
{
   string MyText;
   int i;
   wstring MyWideStr;
   string Txt;
   string x;
   string y;
   wstring z;
   
   i = PB_INSTR(1, MyString, "abc");
   i = PB_INSTR(i+10, MyString, "xyz")*2;
   i = PB_INSTR_ANY(1, MyString, "aeiou");
   i = PB_INSTR(i+10, "This is a test", "is");
   i = PB_INSTR_ANY(1, "This is a test", "aeiou");
   i = PB_ASC("This is a test", 1);
   i = PB_ASC("This is a test", 10);
   y = PB_UCASE(MyString) + PB_LCASE(MyString);
   x = string(25, ' ') + string(10, '*') + string(10, 65);
   x = PB_TRIM_ANY(x, " ")+PB_LTRIM_ANY(x, " ")+PB_RTRIM_ANY(x, " ")+PB_TRIM_ANY(x, ".,! ")+PB_LTRIM_ANY(x, ".,! ")+PB_RTRIM_ANY(x, ".,! ");
   x = PB_REPEAT("Test", i+5);
   x = (i ? "This" : (i ? "That" : (i ? "Other" : (i ? "Misc" : 0))));
   i = ((rand() % (5) + (1)) ? 5 : ((rand() % (5) + (1)) ? 10 : ((rand() % (5) + (1)) ? 15 : ((rand() % (5) + (1)) ? 20 : ((rand() % (5) + (1)) ? 25 : 0)))));
   MyText = PB_LEFT(MyString, 3) + PB_MID(OtherString, 5, 10) + PB_RIGHT(x, i+1);
   MyText = PB_EXTRACT(1, MyText, "::") + PB_EXTRACT(5+2*i, x, "::");
   MyText = PB_EXTRACT_ANY(1, MyText, ".!?") + PB_EXTRACT_ANY(15, y, ".!?");
   MyText = PB_REMAIN(1, MyText, "::") + PB_REMAIN(5+2*i, x, "::");
   MyText = PB_REMAIN_ANY(1, MyText, ".!?") + PB_REMAIN_ANY(15, y, ".!?");
   MyText = PB_REMOVE(MyText, "test") + PB_REMOVE_ANY(MyText, ".!?");
   PB_REPLACE(MyText, "abc", "xyz");
   PB_REPLACE_ANY(MyText, "abc", "xyz");
   if (PB_MID(MyText, 3, 5) == y) {
      PB_MID_REPLACE(MyText, "Test" + to_string((long double)i*15), 20, FULL_STRING);
   }
   PB_MID_REPLACE(x, y, 25, stold(y) +1);
   PB_MID_REPLACE(MyString, PB_MID(y, stold(x), 7), 25, 5);
   PB_MID_REPLACE(x, y, 25, FULL_STRING);
   PB_MID_REPLACE(MyString, PB_MID(y, stold(x), FULL_STRING), 25, FULL_STRING);
}

//  This tests exported subs/functions
extern "C" __declspec(dllexport) int __stdcall MyExport(int n) {
   StringTest("abc", "xyz");
}

extern "C" __declspec(dllexport) void __stdcall MyExportSub(int a, unsigned char b) {
   DoSomething(1, "xyz", 2, 3);
}

//  Math test
//  If x Mod 2 > Cint(Sqr(x^2 + y^2)) Then Incr q Else Decr q
double DoMath()
{
   if (x % 2 > lround(sqrt(pow(x, 2) + pow(y, 2)))) {
      q++;
   } else {
      q--;
   }
   n = sqrt(x) * atan(y) + 2 // * x^2 + Tan(x^3-1)^2
   pow(n == x, 2) + pow(y, 2);
   y = trunc(3.14159);
   
   srand(1234);
   y = (rand() / RAND_MAX) + (rand() / RAND_MAX) + (rand() % (2014) + (1995));
   x = (x >> 1);
   x = (x << 1);
}

//  Console routines
int PBConsoleTest()
{
   cout << "PB Semicolon at the end = No new line.  ";
   cout << "No semicolon = New Line at the end."  << endl;
}
