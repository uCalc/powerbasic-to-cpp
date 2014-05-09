// This file (SampleCode.cpp) was converted from SampleCode.Bas
// with uCalc Transform 2.96 on 05/09/14 using the Open Source 
// PowerBASIC to C++ converter found at https://github.com/uCalc/powerbasic-to-cpp

// Standard lib headers used by PB to C++ are in sdtafx.h & pre-compiled
#include "stdafx.h"

using namespace std;



#include "pbOS.h"
#include "pbMisc.h"
#include "pbstrings.h"
// File name: SampleCode.Bas
// To convert this file to C++ make sure you have uCalc Transform on your PC
// and *.uc from github.com/uCalc/powerbasic-to-cpp/tree/master/convert
// Do the following at the Command Prompt:
//
// C:\> PBtoCPP.Bat SampleCode.Bas


const int MyEquate = 0x100;
const int Other = 0x200;
const int LongEquate = 12345L;
const int HexLongEquate = 0x123L;
const int EquateWithComment = 123; // This is a comment
const string StrEquate = "Just a test: ";
const wstring WideEquate = L"This is a wide string equate";

int ProgStatus;
float MyValue;
string Label;
EXTENDED ExtVal;
__int64 qNum;
std::vector<int> gArray;
std::vector<float> gArray2;

#if defined Other
// Something
#elif !defined abcd
// Something else
#else
// Etc
#endif

#define MyMacroNum 12345
#define MyMacro(a, b, c) (a + b * (c))

struct pointType {
   int x;
   int y;
};

struct TestType {
   int a;
   int *b;
   pointType c;
   pointType *d;
};

struct OtherType {
   int First;
   int *Second;
   TestType *Third;
};

struct MyBits { // A comment goes here
   unsigned Year : 7;
   unsigned Month : 5;
   unsigned DayOfMonth : 4;
   unsigned DayOfWeek : 3;
   UCHAR Red : 1; // A comment here
   UCHAR Blue : 1; // A comment there
   UCHAR Green : 1;
   double Other;
   EXTENDED xyz;
};

union MyUnion {
   int x1;
   unsigned y1;
   float z1;
};

union OtherUinion { // A comment goes here 
   int xx;
   unsigned yy;
   float zz;
};

struct NestedTypeA {
   double Item1;
   int x;
   int y;
   union {
      int x1;
      unsigned y1;
      float z1;
   };
};

struct NestedTypeB {
   int Something;
   int a;
   int *b;
   pointType c;
   pointType *d;
   
   double Item1;
   int x;
   int y;
   union {
      int x1;
      unsigned y1;
      float z1;
   };
   
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
   std::vector<int>Test(a+25+1);
   int yVar;
   int MyValue;
   // Dim q As Long
   // The commented line above is not translated
   
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
}

void MySub(int x, std::vector<double>& dArray)
{
   short i; // Implicit
   
   int y;
   float *Test;
   std::vector<float>Number(10+1);
   std::vector<int>Other(x+1);
   int z;
   
   z = (dArray.size()-1);
   z = (Number.size()-1);
   Test = &Number[0];
   
   if (x == 0) { // If Then
      ProgStatus = 10;
      y = x + 1;
      z = y+x;
      Other[x] = x+1;
   } else if (x == -1) { // Test for ElseIf
      while (x < 10) {
         y = MyFunction(x, *Test);
         Test = &MyValue;
         Number[z] = *Test + Other[5+x];
         dArray[x] = Number[x];
         x = x+1;
         if (*Test < 0) {
            continue;
         }
         if (*Test == y) {
            return;
         }
         if (*Test == z) {
            break;
         }
      }
   } else if (x == 1) {
      PB_SLEEP(2+y);
   } else { // Test for Else
      ProgStatus = 25;
      if (x == 2) {
         y = x * 25;
         z = y - 7;
      } else {
         Other[1] = x+1;
      }
   }
   
   OtherType t1;
   OtherType *t2;
   
   i = t1.First;
   i = *t1.Second;
   i = t1.Third;
   i = t1.Third->a;
   i = t1.Third->b;
   i = *t1.Third->b;
   i = t1.Third->d->x;
   
   i = t2->First;
   i = *t2->Second;
   i = t2->Third;
   i = t2->Third->a;
   i = t2->Third->b;
   i = *t2->Third->b;
   i = t2->Third->d->x;
   i = *t1.Second + t1.Third->b + t2->First + *t2->Second + t2->Third->a + *t2->Third->b + t2->Third->d->x;
   
   NestedTypeA NstA;
   NestedTypeB NstB;
   
   NstA.Item1 = 123;
   NstA.x = 10;
   NstA.x1 = 10;
   NstB.Something = 123;
   NstB.a = NstB.Something +1;
   NstB.Item1 = 123.456;
   NstB.x = NstB.a + NstB.Something;
   NstB.x1 = 123;
   NstB.Other = NstB.Item1*2;
}

void TestCertainOperators(int x, /* ' This line is broken up using a _ (underscore) */
                         int y, /* This is a commment (even without ') */
                         int z, 
                         double& OtherVar, /* Everything after _ is a comment */
                         float *FinalArg)
{
   int abc; // Implicit
   __int64 q; // Implicit
   float xyz; // Implicit
   // Embedded comments after _ are preserved in their original location
   
   std::vector<int>MyArray(10+1);
   pointType MyPoint;
   pointType *pp;
   int n;
   
   for (x=1; x<=10; x += 1) { // Just a test {comment}.
      n = y == z; // This works differently in PB than in C++
      MyArray[x] = x*2;
      if (x == 5) {
         y = x+5;
      } else {
         q = 23*2;
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
      
      if (x == 1) {
         MyArray.clear();
      } else {
         MyArray.clear(); // Erase with and without optional () in PB
      }
      
      if (abc != xyz) {
         MyPoint.x = y;
      } else {
         MyPoint.x = x;
      }
      
      pp = &MyPoint;
      MyPoint.x = MyPoint.y+1;
      n = MyPoint.x == MyPoint.y;
      pp->x = pp->y == pp->x+1;
   }
}

// The section below is a test for variables declared implicitely with data type
// based on Def[Type] declarations or on type specifiers.


// These globals defined at the top
// Global MyValue!, Label$, ExtVal##, qNum&&
// Global gArray As Long, gArray2!()

int TestFunc(int& a, UCHAR& b, int& c, short& i, string& s, float& n)
{
   double PriceB; // Implicit
   
   cout << PZONE << MyValue << PZONE << Label << PriceB << endl;
   cout << endl;
   cout << endl;
   
   Label = "Missing quote at the end of this line is added by Refactor.uc";
   return b + c;
}

string Report(string& LastName, int x, double& NewPrice, float& n, short i, float& nValue, __int64& qValue)
{
   string FirstName;
   UCHAR Age;
   double Total;
   static int Index;
   
   cout << PZONE << LastName << PZONE << x << PZONE << NewPrice << PZONE << n << PZONE << i << PZONE << nValue << qValue << endl;
   return FirstName + LastName;
}

string Hello(string& Txt)
{
   cout << Txt << endl;
   return Txt + " friend!";
}

UCHAR Bye()
{
   cout << "Bye" << endl;
}


// This section is a test for Subs or Functions that are called as a statement
// without parentheses.  The converter adds them.

//#Include "Win32API.inc"
extern __declspec(dllimport) unsigned ShellExecute(unsigned hwnd, LPCSTR& lpOperation, LPCSTR& lpFile, LPCSTR& lpParameters, LPCSTR& lpDirectory, int nShowCmd);
extern __declspec(dllimport) int SetCursorPos(int x, int y);
extern __declspec(dllimport) void SetLastError(unsigned dwErrCode);

void DoSomething(int Arg1, string& txt, EXTENDED& Number, unsigned *xyz = NULL)
{
   SetCursorPos(10, Arg1 + 5);
   if (Arg1 == 15) {
      SetLastError(123);
   }
}

const int True_Renamed = 1;
const int False_Renamed = 0;

int main()
{
   short BinFile; // Implicit
   short i; // Implicit
   short InFile; // Implicit
   
   EXTENDED x;
   EXTENDED pi;
   string MyString;
   string FileInfo;
   std::vector<string>MyFile(50+1);
   int n;
   unsigned dwTest;
   string Num;
   std::vector<double>mArray(10+1);
   
   DoSomething(Len("Test")+5, "Hello " + "world!", sin(x+1)*pi, &x-4); // Comment
   
   DoSomething(10, "abc", 5, 1);
   DoSomething(1, "x", 5, 0); // Etc...
   
   if (x > 1) {
      DoSomething(1, "x", 5, 0); // Parenthesis already here
   }
   
   MyFunc(5);
   MySub(10, mArray);
   
   gArray.clear();
   gArray.resize(15+1);
   gArray2.clear();
   gArray2.resize(35+1);
   mArray.resize(200+1);
   
   ShellExecute(0, "Open", "ReadMe.Txt", PB_NUL, PB_NUL, SW_ShowNormal);
   
   getline(cin, MyString); // No prompt
   cout << "Please enter some text:";
   getline(cin, MyString); // quoted prompt - no comma
   cout << "Please enter some text:";
   getline(cin, MyString); // quoted prompt - with comma
   cout << StrEquate;
   getline(cin, MyString); // equate prompt - no comma
   cout << StrEquate;
   getline(cin, MyString); // equate prompt - with comma
   
   dwTest = PB_CVDWD(MyString, 1);
   dwTest = PB_CVDWD(MyString, 3);
   
   BinFile = 1;
   InFile  = 2;
   
   // File handling test
   fstream file_BinFile (string("MyBin.Txt").c_str(), ios::binary | ios::in | ios::out);
   fstream file_InFile (string("MyInput.Txt").c_str(), ios::in);
   fstream file_3 (string("MyOutput.Txt").c_str(), ios::out | ios::trunc);
   fstream file_4 (string("MyAppend.Txt").c_str(), ios::out | ios::app);
   
   i = PB_ISFILE("Test.Txt");
   i = PB_LOF(file_BinFile);
   i = (int)file_BinFile.tellg()+1;
   i = file_4.eof();
   file_BinFile.seekg(i+100-1);
   file_BinFile.seekp(i+100-1);
   
   MyString.resize(500);
   file_BinFile.read(&MyString[0], 500);
   file_BinFile.write(&MyString[0], MyString.size());
   
   file_3 << PB_CVBYT(Num, n) << endl;
   file_3 << PB_CVD(Num, 1) << endl;
   file_3 << PB_CVI(Num, 4) << endl;
   file_3 << PB_CVL(Num, 1) << endl;
   file_3 << endl;
   file_3 << "This is a test" << endl;
   file_3 << "This is a test";
   file_3 << "Part 1..." << "Part 2" << endl;
   file_3 << "Part 1..." << "Part 2";
   file_3 << "Part 1..." << "Part 2" << "Part 3" << endl;
   file_3.close(); // PB: Close #3
   file_4.close(); // PB: Close #4
   file_BinFile.close(); // PB: Close #BinFile
   file_InFile.close(); // PB: Close #InFile
   
   FileInfo = PB_EXE_EXTN;
   FileInfo = PB_EXE_FULL();
   FileInfo = PB_EXE_NAME;
   FileInfo = PB_EXE_NAMEX;
   FileInfo = PB_EXE_PATH;
   
   i = (x > 1 ? sin(x)+1 : cos(x)-1) * 2;
   MyString = (x>50 ? PB_LEFT(MyString, 10) : PB_MID(MyString, 25, FULL_STRING));
   
   MyFile[0] = PB_DIR("*.Bas");
   MyFile[1] = PB_DIR_NEXT();
   MyFile[2] = PB_DIR_NEXT();
   
   MyFile[0] = PB_DIR("*.Bas");
   while (MyFile[n] != "" && n < 50) {
      MyFile[n] = PB_DIR_NEXT();
      n += 1;
   }
   
   PB_NAME("Temp.Txt", "Text.Tmp");
   PB_NAME("Something.Txt", "Other.Txt");
   
   // Variables etc in your PB code that may conflict with C++ keywords like char, float, etc are renamed
   int Auto_Renamed;
   int Break_Renamed;
   double Float_Renamed;
   UCHAR char_Renamed;
   int This_Renamed;
   
   Break_Renamed = False_Renamed;
   for (Auto_Renamed=1; Auto_Renamed<=10; Auto_Renamed += 1) {
      if (Auto_Renamed == 5) {
         Break_Renamed = True_Renamed;
      }
      Float_Renamed = 1/Auto_Renamed + Float_Renamed;
      char_Renamed = 'A' + Auto_Renamed;
      This_Renamed = Auto_Renamed * 25;
   }
   
   // The following should change casing to match that of original def, since C++ is case sensitive
   // For instance if a function is defined as Hello() then occurrences of HELLO() change to Hello()
   
   MyUnion UnionTest;
   pointType OtherItem;
   int MixedCasing;
   i = MyEquate + MyFunc(123) + MyMacroNum + ProgStatus + ImplicitVar(MixedCasing);
   MultiDim();
   MyExportSub(10, 20);
   PrintTest;
   i = MyFunc(123);
   Bye();
   Bye;
}

// This section tests transforms found in strings.uc
string StringTest(string& MyString, string OtherString)
{
   string MyText;
   int i;
   wstring MyWideStr;
   string Txt;
   string x;
   string y;
   wstring z;
   
   z = WideEquate + "Test";
   
   i = PB_INSTR(1, MyString, "abc");
   i = PB_INSTR(i+10, MyString, "xyz")*2;
   i = PB_INSTR_ANY(1, MyString, "aeiou");
   i = PB_INSTR(i+10, "This is a test", "is");
   i = PB_INSTR_ANY(1, "This is a test", "aeiou");
   i = PB_ASC(MyText, 1);
   i = PB_ASC(MyText, 5);
   i = 'T';
   i = 'a';
   i = PB_ASC("This is a test", 10+i);
   i = 'A' + 32;
   i = 's';
   y = PB_UCASE(MyString) + PB_LCASE(MyString);
   x = string(25, ' ') + string(10, '*') + string(10, 65);
   x = PB_TRIM_ANY(x, " ")+PB_LTRIM_ANY(x, " ")+PB_RTRIM_ANY(x, " ")+PB_TRIM_ANY(x, ".,! ")+PB_LTRIM_ANY(x, ".,! ")+PB_RTRIM_ANY(x, ".,! ");
   x = PB_REPEAT("Test", i+5);
   x = (i ? "This" : (i ? "That" : (i ? "Other" : (i ? "Misc" : ""))));
   i = ((rand() % (5) + (1)) ? 5 : ((rand() % (5) + (1)) ? 10 : ((rand() % (5) + (1)) ? 15 : ((rand() % (5) + (1)) ? 20 : ((rand() % (5) + (1)) ? 25 : 0)))));
   MyText = PB_LEFT(MyString, 3) + PB_MID(OtherString, 5, 10) + PB_RIGHT(x, i+1);
   MyText = PB_EXTRACT(1, MyText, "::") + PB_EXTRACT(5+2*i, x, "::");
   MyText = PB_EXTRACT_ANY(1, MyText, ".!?") + PB_EXTRACT_ANY(15, y, ".!?");
   MyText = PB_REMAIN(1, MyText, "::") + PB_REMAIN(5+2*i, x, "::");
   MyText = PB_REMAIN_ANY(1, MyText, ".!?") + PB_REMAIN_ANY(15, y, ".!?");
   MyText = PB_REMOVE(MyText, "test") + PB_REMOVE_ANY(MyText, ".!?");
   MyText = PB_MAX_STR(ARGCOUNT(6), (string)"This", (string) "That", (string) x, (string) PB_MID(x, 2, 3), (string) y, (string) "!");
   MyText = PB_MIN_STR(ARGCOUNT(3), (string)"xyz", (string) PB_MAX_STR(ARGCOUNT(2), (string)x, (string) y), (string) ".");
   MyText = " Backslash\\is\\an\\escape\\char in C++.  ";
   //+++   MyText$ = " Also test for ""nested"" quotes. " + """abc""" + "...\\""..."
   PB_REPLACE(MyText, "abc", "xyz");
   PB_REPLACE_ANY(MyText, "abc", "xyz");
   if (PB_MID(MyText, 3, 5) == y) {
      PB_MID_REPLACE(MyText, "Test" + PB_STR(i*15) + "  " + PB_STR(10/7, 4), 20, FULL_STRING);
   }
   PB_MID_REPLACE(x, y, 25, stold(y) +1);
   PB_MID_REPLACE(MyString, PB_MID(y, stold(x), 7), 25, 5);
   PB_MID_REPLACE(x, y, 25, FULL_STRING);
   PB_MID_REPLACE(MyString, PB_MID(y, stold(x), FULL_STRING), 25, FULL_STRING);
   
   PB_POKE_STR((unsigned)&i, "ABCD");
   MyText = PB_PEEK_STR((unsigned)&i, 2);
   
   if (x == PB_CR || x == PB_LF || x == PB_NUL) {
      MyText = "Line 1" + PB_CRLF + "Line 2" + PB_QCQ + "quote"+PB_DQ +PB_TAB;
   }
   MyText = PB_HEX(123) + "   " + PB_OCT(1+2+3);
   // +++ C++ doesn't seem to have a built-in string stream flag for Binary
}

// This tests exported subs/functions
extern "C" __declspec(dllexport) int __stdcall MyExport(int n) {
   StringTest("abc", "xyz");
}

extern "C" __declspec(dllexport) void __stdcall MyExportSub(int a, UCHAR b) {
   __int64 q; // Implicit
   
   DoSomething(1, "xyz", 2, 3);
    {
      auto CASE_VAR = StringTest("abc", q);
      if (CASE_VAR == "a" || CASE_VAR == "b" || CASE_VAR == "c") {
         cout << "Test" << endl;
      } else if (CASE_VAR == "x") {
         
      } else if (CASE_VAR == q) {
          {
            auto CASE_VAR = (rand() % (10) + (1));
            if (CASE_VAR == 1) {
               cout << 1+1 << endl;
            } else if (CASE_VAR == 2) { //  Comment
               cout << "Do some thing" << endl;
            } else {
               cout << "Whatever" << endl;
            }
         }
      }
   }
}

// Math test
// If x Mod 2 > Cint(Sqr(x^2 + y^2)) Then Incr q Else Decr q
double DoMath()
{
   EXTENDED MyVar; // Implicit
   float n; // Implicit
   __int64 q; // Implicit
   float x; // Implicit
   float y; // Implicit
   
   int i;
   if (x % 2 > (__int16)(sqrt(pow(x, 2) + pow(y, 2)))) {
      q++;
   } else {
      q--;
   }
   n = sqrt(x) * atan(y) + 2; //* x^2 + Tan(x^3-1)^2
   pow(n == x, 2) + pow(y, 2);
   y = PB_FIX(3.14159);
   n = PB_FRAC(3.14159);
   n = (__int64)(3.14159) + (__int16)(3.14159) + PB_EXP10(3+2);
   n = PB_MAX(ARGCOUNT(5), (double)5.3, (double) 11/2, (double) 17, (double) 4, (double) PB_MIN(ARGCOUNT(4), (double)5, (double) 3.5, (double) -2, (double) 8/7));
   i = PB_MIN_INT(ARGCOUNT(7), (int)3, (int) -10, (int) 7, (int) -1, (int) PB_MAX_INT(ARGCOUNT(4), (int)3, (int) 1, (int) 7, (int) -5), (int) 23, (int) 11);
   i = PB_MIN_INT(ARGCOUNT(3), (int)1, (int) 2, (int) PB_MAX(ARGCOUNT(3), (double)5, (double) 6, (double) 7.5));
   
   srand(1234);
   y = (rand() / RAND_MAX) + (rand() / RAND_MAX) + (rand() % (2014) + (1995));
   i = (i >> 1);
   i = (i << 1);
   
   y = PB_SGN(-1) + PB_SGN(5) + PB_SGN(y);
   //   If IsTrue y = x Or IsFalse y > x + 1 Then y = y^2         +++ The ^ operator doesn't convert properly
   //   If IsTrue y = x Or IsFalse y > x + 1 And x < 10 Then y = y^2
   if (((y == x) != 0) || !(y > x + 1)) {
      y = y+2;
   }
   if (((y == x) != 0) || !(y > x + 1) && x < 10) {
      y = y+2;
   }
   y = ((x) != 0);
   y = PB_MAX(ARGCOUNT(5), (double)3, (double) 10, (double) -2, (double) 15+4, (double) 23);
   y = abs(-1)+tan(sin(2.5)+cos(3.5))+exp(1)+exp2(5)+log(5)+log2(5)+log10(5)+ceil(5);
   
   MyVar = -1 + 0 + 1.0F + 1.2F + 1.5 + 2.0 + 2.5 + 3  + 3  + 4  + 4L + 4L + 5U;
   i = 0x1A + 0x1B  + 0x1CL;
}

// Console routines
int PBConsoleTest()
{
   cout << "PB Semicolon at the end = No new line.  ";
   cout << "No semicolon = New Line at the end."  << endl;
}

// Test for the PRINT function
void PrintTest()
{
   int a; // Implicit
   UCHAR b; // Implicit
   int c; // Implicit
   int d; // Implicit
   int e; // Implicit
   int f; // Implicit
   
   cout << endl;
   cout << a << endl;
   cout << PZONE << a;
   cout << a;
   cout << a << endl; // My comment
   cout << PZONE << a;
   cout << endl << endl; // Print
   cout << endl << endl << endl << endl;
   cout << a << endl << b << endl << c << endl << d << endl;
   cout << PZONE << a << PZONE << b;
   cout << PZONE << "" << a << endl << PZONE << b << c << PZONE << d << e << endl;
   cout << PZONE << "" << a << endl;
   cout << PZONE << "" << PZONE << a << b << endl;
   cout << PZONE << "" << PZONE << "" << PZONE << a << PZONE << b;
   cout << PZONE << "" << PZONE << "" << PZONE << "" << PZONE << "" << a << endl;
   cout << PZONE << "" << PZONE << a << PZONE << "" << PZONE << "";
   cout << PZONE << "" << PZONE << a << PZONE << "" << PZONE << "" << "" << endl;
   cout << a << PZONE << b << c << PZONE << d << e << PZONE << f;
   cout << a << b << PZONE << c << d << endl;
}

// Test for implicit variable defs
short ImplicitVar(int x)
{
   __int64 b1; // Implicit
   int b2; // Implicit
   short b3; // Implicit
   UCHAR b4; // Implicit
   USHORT b5; // Implicit
   unsigned b6; // Implicit
   float b7; // Implicit
   double B8; // Implicit
   EXTENDED B9; // Implicit
   short i; // Implicit
   int LastNum; // Implicit
   float OtherValue; // Implicit
   int text; // Implicit
   
   for (x=1; x<=10; x += 1) {
      i = x * 10;
      text = PB_STR(i+x);
   }
   LastNum = x-1;
   MyValue = x/i; // Note: MyValue! was defined already as global
   OtherValue = i/x;
   b1 = b2 + b3 + b4 + b5 + b6 + b7 + B8 + B9;
}

// Test for optional args
void OptionalArgs(int a = 0, string b = "", double c = 0.0, int *d = NULL, string text = "")
{
   // Do things
}

// Test for optional args
float OptionalArgs2(int a, string b = "", double c = 0.0, int *d = NULL)
{
   // Do things
}

// Test for optional args
float OptionalArgs3(int a, string b = "", double c = 0.0, int d = 0)
{
   // Do things
}

std::vector<unsigned> g1;
unsigned g2;
unsigned g3;
unsigned g4;

void MultiDim()
{
   int *a;
   int *b;
   int *c;
   int *d;
   static string s1;
   static std::vector<string> s2;
   static string s3;
   static string s4;
   //+++   Static s1, s2[10], s3, s4 As String
   // Do things
}
