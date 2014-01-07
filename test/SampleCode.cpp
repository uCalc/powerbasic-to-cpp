// This file (SampleCode.cpp) was converted from SampleCode.Bas
// with uCalc Transform 2.0 on 1/7/2014 8:26:45 AM using the Open Source 
// PowerBASIC to C++ converter found at https://github.com/uCalc/powerbasic-to-cpp

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
   
   delete[] Number;
   delete[] Other;
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
      if ((x == y & x <> 10 | y == x & x < 25)) {
         y = x || y == z;
      }
      if ((x == y & x <> 10) || y == x && x < 25) {
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
long long qNum;

int TestFunc(int& a, unsigned char& b, int& c, short& i, String& s, float& n)
{
   Print MyValue, Label, PriceB;
}

string Report(string& LastName, int x, double& NewPrice, float& n, short i, float& nValue, long long& qValue)
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

unsigned char Bye() {
   Print "Bye";
}


//  This section is a test for Subs or Functions that are called as a statement
//  without parentheses.  The converter adds them.

// #Include "Win32API.inc"
//  Declare Function ShellExecute Lib "SHELL32.DLL" Alias "ShellExecuteA" (ByVal hwnd As Dword, lpOperation As Asciiz, lpFile As Asciiz, lpParameters As Asciiz, lpDirectory As Asciiz, ByVal nShowCmd As Long) As Dword
//  Declare Function SetCursorPos Lib "USER32.DLL" Alias "SetCursorPos" (ByVal x As Long, ByVal y As Long) As Long
//  Declare Sub      SetLastError(Lib "KERNEL32.DLL" Alias "SetLastError" (ByVal dwErrCode As Dword))

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
   DoSomething(Len("Test")+5, "Hello " + "world!", Sin(x+1)*pi, &x-4) //  Comment
   
   DoSomething(10, "abc", 5, 1);
   DoSomething(1, "x", 5, 0)  //  Etc...
   
   if (x > 1) {
      DoSomething(1, "x", 5, 0) //  Parenthesis already here
   }
   
   MyFunc(5);
   
   ShellExecute(0, "Open", "ReadMe.Txt", $Nul, $Nul, SW_ShowNormal);
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
