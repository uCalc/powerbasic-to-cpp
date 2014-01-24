// This file (SampleCode.cpp) was converted from SampleCode.Bas
// with uCalc Transform 2.5 on 1/24/2014 1:27:11 PM using the Open Source 
// PowerBASIC to C++ converter found at https://github.com/uCalc/powerbasic-to-cpp

#include <Windows.h>
#include <math.h>
#include <string>
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
double ExtVal;
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

void DoSomething(int Arg1, string& txt, double& Number, Optional unsigned int *xyz)
{
   SetCursorPos(10, Arg1 + 5);
   if (Arg1 == 15) {
      SetLastError(123);
   }
}

float main()
{
   double x;
   double pi;
   string MyString;
   DoSomething(Len("Test")+5, "Hello " + "world!", Sin(x+1)*pi, &x-4) //  Comment
   
   DoSomething(10, "abc", 5, 1);
   DoSomething(1, "x", 5, 0)  //  Etc...
   
   if (x > 1) {
      DoSomething(1, "x", 5, 0) //  Parenthesis already here
   }
   
   MyFunc(5);
   
   ShellExecute(0, "Open", "ReadMe.Txt", $Nul, $Nul, SW_ShowNormal);
   
   //  File handling test
   //  Open "MyInput.Txt" For Input As #1
   _FileHandle(1) = CreateFile("MyInput.Txt", GENERIC_READ, 0, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
   
   //  Open "MyOutput.Txt" For Output As #2
   _FileHandle(2) = CreateFile("MyOutput.Txt", GENERIC_WRITE, 0, 0, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
   
   //  Open "MyAppend.Txt" For Append As #3
   _FileHandle(3) = CreateFile("MyAppend.Txt", GENERIC_WRITE, 0, 0, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
   SetFilePointer(_FileHandle(3), 0, 0, FILE_END);
   
   //  Open "MyBin.Txt" For Binary As #tst
   _FileHandle(tst) = CreateFile("MyBin.Txt", GENERIC_READ Or GENERIC_WRITE, 0, 0, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
   
   //  Open "MyRandom.Txt" For Random As #r Len = 1
   _FileHandle(r) = CreateFile("MyRandom.Txt", GENERIC_READ Or GENERIC_WRITE, 0, 0, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
   
   
   i = GetFileSize(_FileHandle(tst), 0);
   i = SetFilePointer(_FileHandle(tst), 0, 0, FILE_CURRENT)+1;
   i = (Seek(1) == LOF(1)+1 ? -1 : 0);
   SetFilePointer(_FileHandle(tst), i+100-1, 0, FILE_BEGIN);
   
   //  Close #1
   CloseHandle(_FileHandle(1));
   _FileHandle(1) = 0;
   
   //  Close #2
   CloseHandle(_FileHandle(2));
   _FileHandle(2) = 0;
   
   //  Close #3
   CloseHandle(_FileHandle(3));
   _FileHandle(3) = 0;
   
   //  Close #tst
   CloseHandle(_FileHandle(tst));
   _FileHandle(tst) = 0;
   
   //  Close #r
   CloseHandle(_FileHandle(r));
   _FileHandle(r) = 0;
   
   
   i = (x > 1 ? Sin(x)+1 : Cos(x)-1) * 2;
   MyString = (x>50 ? MyString.substr(0, 10) : MyString.substr((25)-1, MyString.length()));
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
   
   i = (MyString.find("abc", (1)-1)+1);
   i = (MyString.find("xyz", (i+10)-1)+1)*2;
   i = (MyString.find_first_of("aeiou", (1)-1)+1);
   //    i = InStr(i+10, "This is a test")
   //    i = InStr("This is a test", ANY "aeiou")
   MyText = MyString.substr(0, 3) + OtherString.substr((5)-1, 10) + x.substr(x.length()-(i+1), i+1);
   if (MyText.substr((3)-1, 5) == y) {
      MyText.replace((20)-1, MyText.length(), "Test" + to_string(i*15));
   }
   x.replace((25)-1, stold(y) +1, y);
   MyString.replace((25)-1, 5, y.substr((stold(x) )-1, 7));
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
}
