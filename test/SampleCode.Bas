' File name: SampleCode.Bas
' To convert this file to C++ make sure you have uCalc Transform on your PC
' and *.uc from github.com/uCalc/powerbasic-to-cpp/tree/master/convert
' Do the following at the Command Prompt:
'
' C:\> PBtoCPP.Bat SampleCode.Bas

DefLng a-z

%MyEquate = &h100
%Other = &h200

Global ProgStatus As Long

#If %Def(%Other)
' Something
#ElseIf Not %Def(%abcd)
' Something else
#Else
' Etc
#EndIf

Macro MyMacroNum = 12345
Macro MyMacro(a, b, c) = (a + b * (c))

Type point
   x As Long
   y As Long
End Type

Type MyBits
   Year       As Bit * 7 In Dword
   Month      As Bit * 5
   DayOfMonth As Bit * 4
   DayOfWeek  As Bit * 3
   Red        As Bit * 1 In Byte
   Blue       As Bit * 1
   Green      As Bit * 1
   Other      As Double
End Type

Function MyFunc(ByVal x As Long) As Long
   Function = x * 2
End Function

Function MyFunction(ByVal a As Long, ByRef b As Single) As Long
   Dim x As Long, y As Long, Test(a+25) As Long
   Dim yVar As Long, MyValue&
   ' Dim q As Long
   ' The commented line above is not translated

   MyFunc(a)
   x = MyFunc(b)+1

   If b > 5 Then
      For x = 1 To 10
         For yVar = 10 To 1 Step -1
            If x > y Then Function = a+y
            Do While Test(a+5) = yVar
               Do Until a+1 = 1234
                  If y < %MyEquate Then Function = Test(x-y)*10
                  a = a + 1
                  Do
                     b = a * 5 + b
                  Loop Until b = 300
               Loop
            Loop
         Next
      Next
   End If
End Function

Sub MySub(ByVal x As Long)
   Local y As Long, Test As Single Ptr
   Dim Number(10) As Single, Other(x) As Long
   Register z As Long

   ProgStatus = 10
   y = x + 1 : z = y+x : Other(x) = x+1

   While x < 10
      y = MyFunction(x, @Test)
      Test = VarPtr(x)
      Number(z) = @Test + Other(5+x)
      x = x+1
   Wend
End Sub

Sub TestCertainOperators(ByVal x As Long, _ ' This line is broken up using a _ (underscore)
                         ByVal y As Long, _ This is a commment (even without ')
                         ByVal z As Long, _
                         ByRef OtherVar As Double,    _ Everything after _ is a comment
                         ByVal FinalArg As Single Ptr _
                        ) ' Note: comments after _ are regrouped into a different place

   Dim MyArray(10) As Long, MyPoint As Point, pp As Point Ptr, n As Long

   For x = 1 To 10
      n = y = z ' This works differently in PB than in C++
      MyArray(x) = x*2
      If x = 5 Then y = x+5 Else y = 23*2
      y = x = z : MyArray(5) = MyArray(n) = MyArray(n+1)
      If x = y = z Then y = n = 2 Else y = n = 3
      If x = y And x <> 10 Or y = x And x < 25 Then y = x Or y = z
      If (x = y And x <> 10 Or y = x And x < 25) Then y = x Or y = z
      If (x = y And x <> 10) Or y = x And x < 25 Then y = x Or y = z
      If Not(x = y Or x = z) Then x = y + 10
      If Not(x = y Or x = z) Then x = y + 10

      If x <> y Then MyPoint.x = y Else MyPoint.x = x

      pp = VarPtr(p)
      MyPoint.x = MyPoint.y+1
      n = MyPoint.x = MyPoint.y
      @pp.x = @pp.y = @pp.x+1
   Next
End Sub

' The section below is a test for variables declared implicitely with data type
' based on Def[Type] declarations or on type specifiers.

DefByt b
DefInt i
DefStr s
DefQud q
DefSng n-p, x-z
' Note: DefLng a-z was already defined at the beginning of the code

Global MyValue!, Label$, Price@, ExtVal##, qNum&&

Function TestFunc(a, b, c, i, s, n)
   Print MyValue!, Label$, PriceB#

   Label$ = "Missing quote at the end of this line is added by Refactor.uc
End Function

Function Report$(LastName$, ByVal x&, ByRef NewPrice#, n, ByVal i, nValue, qValue)
   Dim FirstName$, Age?, Total#
   Static Index&

   Print LastName$, x&, NewPrice#, n, i, nValue, qValue
   Report$ = FirstName$ + LastName$
End Function

Function Hello(txt$) As String
   Print txt$
   Function = txt$ + " friend!"
End Function

Function Bye()
   Print "Bye"
End Function


' This section is a test for Subs or Functions that are called as a statement
' without parentheses.  The converter adds them.

'#Include "Win32API.inc"
Declare Function ShellExecute Lib "SHELL32.DLL" Alias "ShellExecuteA" (ByVal hwnd As Dword, lpOperation As Asciiz, lpFile As Asciiz, lpParameters As Asciiz, lpDirectory As Asciiz, ByVal nShowCmd As Long) As Dword
Declare Function SetCursorPos Lib "USER32.DLL" Alias "SetCursorPos" (ByVal x As Long, ByVal y As Long) As Long
Declare Sub      SetLastError Lib "KERNEL32.DLL" Alias "SetLastError" (ByVal dwErrCode As Dword)

Sub DoSomething(ByVal Arg1 As Long, ByRef txt$, Number##, Optional ByVal xyz As Dword Ptr)
   SetCursorPos 10, Arg1 + 5
   If Arg1 = 15 Then SetLastError 123
End Sub

Function PBMain()
   Dim x As Ext, pi As Ext, MyString$
   DoSomething Len("Test")+5, "Hello " + "world!", Sin(x+1)*pi, VarPtr(x)-4 ' Comment

   DoSomething 10, "abc", 5, 1 : DoSomething 1, "x", 5, 0  ' Etc...

   If x > 1 Then DoSomething(1, "x", 5, 0) ' Parenthesis already here

   MyFunc 5

   ShellExecute 0, "Open", "ReadMe.Txt", $Nul, $Nul, %SW_ShowNormal

   BinFile = FreeFile
   InFile  = FreeFile

   ' File handling test
   Open "MyBin.Txt"    For Binary As #BinFile
   Open "MyInput.Txt"  For Input  As #InFile
   Open "MyOutput.Txt" For Output As #3
   Open "MyAppend.Txt" For Append As #4   

   i = Lof(BinFile)
   i = Seek(#BinFile)
   i = eof(1)
   Seek #tst, i+100

   Get$ #1, 500, MyString$
   Put$ #1, MyString$

   Close #3
   Close 4, #BinFile, InFile

   i = IIf(x > 1, Sin(x)+1, Cos(x)-1) * 2
   MyString$ = IIf$(x>50, Left$(MyString$, 10), Mid$(MyString$, 25))
End Function

' This section tests transforms found in strings.uc
Function StringTest(MyString$, ByVal OtherString As String) As String
   Dim MyText$, i As Long, MyWideStr As WString
   Dim Txt As String, x$, y$, z$$

   i = InStr(MyString$, "abc")
   i = InStr(i+10, MyString$, "xyz")*2
   i = InStr(MyString$, ANY "aeiou")
   i = InStr(i+10, "This is a test", "is")
   i = InStr("This is a test", ANY "aeiou")
   x$ = Space$(25) + String$(10, "*") + String$(10, 65)
   MyText$ = Left$(MyString$, 3) + Mid$(OtherString, 5, 10) + Right$(x$, i+1)
   If Mid$(MyText$, 3, 5) = y$ Then Mid$(MyText$, 20) = "Test" + Str$(i*15)
   Mid$(x$, 25, Val(y$)+1) = y$ : Mid$(MyString$, 25, 5) = Mid$(y$, Val(x$), 7)
   Mid$(x$, 25) = y$ : Mid$(MyString$, 25) = Mid$(y$, Val(x$))
End Function

' This tests exported subs/functions
Function MyExport Alias "MyExport" (ByVal n As Long) Export As Long
   StringTest "abc", "xyz"
End Function

Sub MyExportSub Alias "MyExportSub" (ByVal a, ByVal b) Export
   DoSomething(1, "xyz", 2, 3)
End Sub

' Math test
' If x Mod 2 > Cint(Sqr(x^2 + y^2)) Then Incr q Else Decr q
Function DoMath() As Double   
   If x Mod 2 > Cint(Sqr(x^2 + y^2)) Then Incr q Else Decr q
   n = Sqr(x) * Atn(y) + 2 '* x^2 + Tan(x^3-1)^2
   n = x^2 + y^2
   y = Fix(3.14159)

   Randomize 1234
   y = Rnd + Rnd() + Rnd(1995, 2014)
   Shift Right x, 1
   Shift Left x, 1
End Function
