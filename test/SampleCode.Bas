' File name: SampleCode.Bas
' To convert this file to C++ make sure you have uCalc Transform on your PC
' and *.uc from github.com/uCalc/powerbasic-to-cpp/tree/master/convert
' Do the following at the Command Prompt:
'
' C:\> PBtoCPP.Bat SampleCode.Bas

DefLng a-z

%MyEquate = &h100
%Other = &h200
%LongEquate = 12345&&
%HexLongEquate = &h123&&
%EquateWithComment = 123 ' This is a comment
$StrEquate = "Just a test: "
$$WideEquate = "This is a wide string equate"$$

Global ProgStatus As Long
Global MyValue!, Label$, ExtVal##, qNum&&
Global gArray() As Long, gArray2!()

#If %Def(%Other)
' Something
#ElseIf Not %Def(%abcde)
' Something else
#Else
' Etc
#EndIf

Macro MyMacroNum = 12345
Macro MyMacro(a, b, c) = (a + b * (c))

Type pointType
   x As Long
   y As Long
End Type

Type TestType
   a As Long
   b As Long Ptr
   c As PointType
   d As PointType Ptr
End Type

Type OtherType
   First As Long
   Second As Long Ptr
   Third As TestType Ptr
End Type

Type MyBits ' A comment goes here
   Year       As Bit * 7 In Dword
   Month      As Bit * 5
   DayOfMonth As Bit * 4
   DayOfWeek  As Bit * 3
   Red        As Bit * 1 In Byte ' A comment here
   Blue       As Bit * 1 ' A comment there
   Green      As Bit * 1
   Other      As Double
   xyz        As Extended
End Type

Union MyUnion
   x1 As Long
   y1 As Dword
   z1 As Single
End Union

Union OtherUinion ' A comment goes here
   xx As Long
   yy As Dword
   zz As Single
End Union

Type NestedTypeA
   Item1 As Double
   PointType
   MyUnion
End Type

Type NestedTypeB
   Something As Long
   TestType
   NestedTypeA
   Other As Double
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

Sub MySub(ByVal x As Long, dArray() As Double)
   Local y As Long, Test As Single Ptr
   Dim Number(10) As Single, Other(x) As Long
   Register z As Long

   z = UBound(dArray)
   z = UBound(Number)
   Test = VarPtr(Number(0))

   If x = 0 Then ' If Then
      ProgStatus = 10
      y = x + 1 : z = y+x : Other(x) = x+1
   ElseIf x = -1 Then ' Test for ElseIf
      While x < 10
         y = MyFunction(x, @Test)
         Test = VarPtr(MyValue!)
         Number(z) = @Test + Other(5+x)
         dArray(x) = Number(x)
         x = x+1
         If @Test < 0 Then Iterate
         If @Test = y Then Exit Sub
         If @Test = z Then Exit
      Wend
   ElseIf x = 1 Then
      Sleep 2+y
   Else ' Test for Else
      ProgStatus = 25
      If x = 2 Then
         y = x * 25
         z = y - 7
      Else
         Other(1) = x+1
      End If
   End If

   Dim t1 As OtherType, t2 As OtherType Ptr

   t2 = VarPtr(t1)

   i = Len(t1)       ' Len(t1)
   i = Len(TestType) ' Len(TestType)
   i = Len("Test")   ' Len("Test")

   i = t1.First
   i = t1.@Second
   i = t1.Third
   i = t1.@Third.a
   i = t1.@Third.b
   i = t1.@Third.@b
   i = t1.@Third.@d.x

   i = @t2.First
   i = @t2.@Second
   i = @t2.Third
   i = @t2.@Third.a
   i = @t2.@Third.b
   i = @t2.@Third.@b
   i = @t2.@Third.@d.x
   i = t1.@Second + t1.@Third.b + @t2.First + @t2.@Second + @t2.@Third.a + @t2.@Third.@b + @t2.@Third.@d.x

   Dim NstA As NestedTypeA, NstB As NestedTypeB

   NstA.Item1 = 123
   NstA.x = 10
   NstA.x1 = 10
   NstB.Something = 123
   NstB.a = NstB.Something +1
   NstB.Item1 = 123.456
   NstB.x = NstB.a + NstB.Something
   NstB.x1 = 123
   NstB.Other = NstB.Item1*2
End Sub

Sub TestCertainOperators(ByVal x As Long, _ ' This line is broken up using a _ (underscore)
                         ByVal y As Long, _ This is a commment (even without ')
                         ByVal z As Long, _
                         ByRef OtherVar As Double,    _ Everything after _ is a comment
                         ByVal FinalArg As Single Ptr _
                        ) ' Embedded comments after _ are preserved in their original location

   Dim MyArray(10) As Long, MyPoint As PointType, pp As PointType Ptr, n As Long

   For x = 1 To 10 ' Just a test {comment}.
      n = y = z ' This works differently in PB than in C++
      MyArray(x) = x*2
      If x = 5 Then y = x+5 Else q = 23*2
      y = x = z : MyArray(5) = MyArray(n) = MyArray(n+1)
      If x = y = z Then y = n = 2 Else y = n = 3
      If x = y And x <> 10 Or y = x And x < 25 Then y = x Or y = z
      If (x = y And x <> 10 Or y = x And x < 25) Then y = x Or y = z
      If (x = y And x <> 10) Or y = x And x < 25 Then y = x Or y = z
      If Not(x = y Or x = z) Then x = y + 10
      If Not(x = y Or x = z) Then x = y + 10

      If x = 1 Then Erase MyArray() Else Erase MyArray ' Erase with and without optional () in PB

      If abcd <> xyz Then MyPoint.x = y Else MyPoint.x = x

      pp = VarPtr(MyPoint)
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

' These globals defined at the top
' Global MyValue!, Label$, ExtVal##, qNum&&
' Global gArray() As Long, gArray2!()

Function TestFunc(a, b, c, i, s, n)
   Print MyValue!, Label$, PriceB#
   Print
   Print

   If c = 123 Then Exit Function

   Label$ = "Missing quote at the end of this line is added by Refactor.uc
   Function = b + c
End Function

Function Report$(LastName$, ByVal x&, ByRef NewPrice#, n, ByVal i, nValue, qValue)
   Dim FirstName$, Age?, Total#
   Static Index&

   Print LastName$, x&, NewPrice#, n, i, nValue, qValue
   Report$ = FirstName$ + LastName$
End Function

Function Hello(Txt$) As String
   Print txt$
   Function = txt$ + " friend!"
End Function

Function Bye()
   Print "Bye"
End Function


' This section is a test for Subs or Functions that are called as a statement
' without parentheses.  The converter adds them.

'#Include "Win32API.inc"
%SW_SHOWMINIMIZED   = 2
Declare Function ShellExecute Lib "SHELL32.DLL" Alias "ShellExecuteA" (ByVal hwnd As Dword, lpOperation As Asciiz, lpFile As Asciiz, lpParameters As Asciiz, lpDirectory As Asciiz, ByVal nShowCmd As Long) As Dword
Declare Function SetCursorPos Lib "USER32.DLL" Alias "SetCursorPos" (ByVal x As Long, ByVal y As Long) As Long
Declare Sub      SetLastError Lib "KERNEL32.DLL" Alias "SetLastError" (ByVal dwErrCode As Dword)

Sub DoSomething(ByVal Arg1 As Long, ByRef txt$, Number##, Optional ByVal xyz As Dword Ptr)
   SetCursorPos 10, Arg1 + 5
   If Arg1 = 15 Then SetLastError 123
End Sub

%True = 1
%False = 0

Function PBMain()
   Dim x As Ext, pi As Ext, MyString$, FileInfo$, MyFile$(50), n As Long, dwTest As Dword, Num$
   Dim mArray(10) As Double

   n = Len(TestType) ' Len(TestType)
   n = Len(FileInfo$) ' Len(FileInfo$)
   n = Len(MyFile$(n+1)) ' Len(MyFile$(n+1))

   TestCertainOperators 1, 2.5, i, 4, VarPtr(MyValue!)-16

   DoSomething Len("Test")+5, "Hello " + "world!", Sin(x+1)*pi, VarPtr(x)-4 ' Comment

   DoSomething 10, "abc", 5, 1 : DoSomething 1, "x", 5, 0  ' Etc...

   If x > 1 Then DoSomething(1, "x", 5, 0) ' Parenthesis already here

   MyFunc 5
   MySub 10, mArray()

   ReDim gArray(15), gArray2(35)
   ReDim Preserve mArray(200) As Double

   ShellExecute 0, "Open", "ReadMe.Txt", $Nul, $Nul, %SW_ShowNormal
   ShellExecute 0, "Open", "ReadMe.Txt", $Nul, $Nul, %SW_ShowMinimized

   Line Input MyString$ ' No prompt
   Line Input "Please enter some text: " MyString$ ' quoted prompt - no comma
   Line Input "Please enter some text: ", MyString$ ' quoted prompt - with comma
   Line Input $StrEquate MyString$  ' equate prompt - no comma
   Line Input $StrEquate, MyString$ ' equate prompt - with comma

   dwTest = CvDwd(MyString$)
   dwTest = CvDwd(MyString$, 3)

   BinFile% = FreeFile
   InFile  = FreeFile

   ' File handling test
   Open "MyBin.Txt"    For Binary As #BinFile%
   Open "MyInput.Txt"  For Input  As #InFile
   Open "MyOutput.Txt" For Output As #3
   Open "MyAppend.Txt" For Append As #4

   i = IsFile("Test.Txt")
   i = Lof(#3)
   i = Lof(BinFile%)
   i = Seek(#BinFile%)
   i = Eof(#3)
   i = Eof(4)
   Seek #BinFile%, i+100

   Get$ #BinFile%, 500, MyString$
   Put$ #BinFile%, MyString$

   Print #3, CvByt(Num$, n)
   Print #3, Cvd(Num$)
   Print #3, Cvi(Num$, 4)
   Print #3, Cvl(Num$)
   Print #3
   Print #3, "This is a test"
   Print #3, "This is a test";
   Print #3, "Part 1..."; "Part 2"
   Print #3, "Part 1..."; "Part 2";
   Print #3, "Part 1..."; "Part 2"; "Part 3"
   Close #3
   Close 4, #BinFile%, InFile

   FileInfo$ = EXE.Extn$
   FileInfo$ = EXE.Full$
   FileInfo$ = EXE.Name$
   FileInfo$ = EXE.Namex$
   FileInfo$ = EXE.Path$

   i = IIf(x > 1, Sin(x)+1, Cos(x)-1) * 2
   MyString$ = IIf$(x>50, Left$(MyString$, 10), Mid$(MyString$, 25))

   MyFile$(0) = Dir$("*.Bas")
   MyFile$(1) = Dir$()
   MyFile$(2) = Dir$(Next)

   MyFile$(0) = Dir$("*.Bas")
   While MyFile$(n) <> "" And n < 50
      MyFile$(n) = Dir$()
      n += 1
   Wend

   Name "Temp.Txt" As "Text.Tmp" : Name "Something.Txt" As "Other.Txt"

   Swap MyString$, FileInfo$

   ' The following should change casing to match that of original def, since C++ is case sensitive
   ' For instance if a function is defined as Hello() then occurrences of HELLO() change to Hello()

   Dim UnionTest As MYUNION, OtherItem As POINTType, MixedCasing As Long
   I = %myequate + myfunc(123) + MYMACRONUM + Progstatus + IMPLICITVAR(MIXEDcasing)
   Call MultiDIM() : Call myexportSUB(10, 20)
   CALL PRINTtest
   call myfunc(123) to I
   BYE()
   bye
End Function

Sub Rename1()
   ' Variables etc in your PB code that may conflict with C++ keywords like char, float, etc are renamed
   ' Note: Items are renamed only if they are lowercase; otherwise there's no conflict
   Dim auto As Long, Break As Long, float As Double, char As Byte, This As Long

   Break = %False
   For Auto = 1 To 10
      If Auto = 5 Then Break = %True
      Float = 1/Auto + Float
      char = Asc("A") + Auto
      This = Auto * 25 + unsigned + Throw
   Next
End Sub

Sub Rename2()
   ' Variables etc in your PB code that may conflict with C++ keywords like char, float, etc are renamed
   ' Note: Items are renamed only if they are lowercase; otherwise there's no conflict
   Dim auto As Long, break As Long, Float As Double, Char As Byte, This As Long

   Break = %False
   For Auto = 1 To 10
      If Auto = 5 Then break = %True
      Float = 1/Auto + Float
      char = Asc("A") + Auto
      This = Auto * 25 + Unsigned + throw
   Next
End Sub

' This section tests transforms found in strings.uc
Function StringTest(MyString$, ByVal OtherString As String) As String
   Dim MyText$, i As Long, MyWideStr As WString
   Dim Txt As String, x$, y$, z$$

   z$$ = $$WideEquate + "Test"

   i = InStr(MyString$, "abc")
   i = InStr(i+10, MyString$, "xyz")*2
   i = InStr(MyString$, Any "aeiou")
   i = InStr(i+10, "This is a test", "is")
   i = InStr("This is a test", Any "aeiou")
   i = Asc(MyText$)
   i = Asc(MyText$, 5)
   i = Asc("This is a test")
   i = Asc("This is a test", 9)
   i = Asc("This is a test", 10+i)
   i = Asc("A") + 32
   i = Asc("Test", 3)
   y$ = UCase$(MyString$) + LCase$(MyString$)
   x$ = Space$(25) + String$(10, "*") + String$(10, 65)
   x$ = Trim$(x$)+LTrim$(x$)+RTrim$(x$)+Trim$(x$, Any ".,! ")+LTrim$(x$, Any ".,! ")+RTrim$(x$, Any ".,! ")
   x$ = Repeat$(i+5, "Test")
   x$ = Choose$(i, "This", "That", "Other", "Misc")
   i = Choose(Rnd(1, 5), 5, 10, 15, 20, 25)
   MyText$ = Left$(MyString$, 3) + Mid$(OtherString, 5, 10) + Right$(x$, i+1)
   MyText$ = Extract$(MyText$, "::") + Extract$(5+2*i, x$, "::")
   MyText$ = Extract$(MyText$, Any ".!?") + Extract$(15, y$, Any ".!?")
   MyText$ = Remain$(MyText$, "::") + Remain$(5+2*i, x$, "::")
   MyText$ = Remain$(MyText$, Any ".!?") + Remain$(15, y$, Any ".!?")
   MyText$ = Remove$(MyText$, "test") + Remove$(MyText$, Any ".!?")
   MyText$ = Max$("This", "That", x$, Mid$(x$, 2, 3), y$, "!")
   MyText$ = Min$("xyz", Max$(x$, y$), ".")
   MyText$ = " Backslash\is\an\escape\char in C++.  "
'+++   MyText$ = " Also test for ""nested"" quotes. " + """abc""" + "...\""..."
   Replace "abc" With "xyz" In MyText$
   Replace Any "abc" With "xyz" In MyText$
   If Mid$(MyText$, 3, 5) = y$ Then Mid$(MyText$, 20) = "Test" + Str$(i*15) + "  " + Str$(10/7, 4)
   Mid$(x$, 25, Val(y$)+1) = y$ : Mid$(MyString$, 25, 5) = Mid$(y$, Val(x$), 7)
   Mid$(x$, 25) = y$ : Mid$(MyString$, 25) = Mid$(y$, Val(x$))
   i = Val("123 Literal String") + Val("12" + "34") + Val("12" + y$)
   i = Verify("This is a test", "abcde")
   i = Verify(5, "This is a test", "abcde")

   RegExpr "t..t" In "This and that" To i
   RegExpr "t..t" In "This and that" At 5 To i
   RegExpr "t..t" In "This and that" At 5 To i, LengthVal

   RegRepl ".." In "This is a Test" with "new" To i, MyText$
   RegRepl ".." In "This is a Test" with "new" At 5 To i, MyText$

   Poke$ VarPtr(i), "ABCD" : MyText$ = Peek$(VarPtr(i), 2)
   If i = 1 Then Exit Function

   If x$ = $Cr Or x$ = $Lf Or x$ = $Nul Then MyText$ = "Line 1" + $CrLf + "Line 2" + $Qcq + "quote"+$Dq +$Tab
   MyText$ = Hex$(123) + "   " + Oct$(1+2+3)
   MyText$ = Retain$("This is a test", "is")
   MyText$ = Retain$("This is a test", Any "is")
   MyText$ = StrReverse$("This is a test")
   ' +++ C++ doesn't seem to have a built-in string stream flag for Binary
End Function

' This tests exported subs/functions
Function MyExport Alias "MyExport" (ByVal n As Long) Export As Long
   StringTest "abc", "xyz"
End Function

Sub MyExportSub Alias "MyExportSub" (ByVal a, ByVal b) Export
   DoSomething(1, "xyz", 2, a)

   Select Case StringTest("abc", q$)
   Case "a", "b", "c"
      Print "Test"
   Case "x"
   Case q$
      Select Case Rnd(1, 10)
      Case 1: Print 1+1
      Case 2 ' Comment
         Print "Do some thing"
      Case Else
         Print "Whatever"
      End Select
   End Select
End Sub

' Math test
' If x Mod 2 > Cint(Sqr(x^2 + y^2)) Then Incr q Else Decr q
Function DoMath() As Double
   Dim i As Long
   If x Mod 2 > CInt(Sqr(x^2 + y^2)) Then Incr q Else Decr q
   n = Sqr(x) * Atn(y) + 2 '* x^2 + Tan(x^3-1)^2
   n = x^2 + y^2
   y = Fix(3.14159)
   n = Frac(3.14159)
   n = Int(3.14159) + CInt(3.14159) + Exp10(3+2)
   n = Max(5.3, 11/2, 17, 4, Min(5, 3.5, -2, 8/7))
   i = Min&(3, -10, 7, -1, Max&(3, 1, 7, -5), 23, 11)
   i = Min&(1, 2, Max(5, 6, 7.5))
   i = 10 \ 3
   i = 123 eqv 345
   If x > 1 Eqv y > 2 Then i = 10
   If 123 Xor 456 Then i = 1
   If i >= n Or i => y Or n =< 1 Or i <= 1 Then i = 1 ' >= & => as well as <= & =< are synonymous in PB
   i = 123 Xor 456
   i = 123 Imp 456

   Randomize 1234
   y = Rnd + Rnd() + Rnd(1995, 2014)
   Shift Right i, 1
   Shift Left i, 1

   y = Sgn(-1) + Sgn(5) + Sgn(y)
'   If IsTrue y = x Or IsFalse y > x + 1 Then y = y^2         +++ The ^ operator doesn't convert properly
'   If IsTrue y = x Or IsFalse y > x + 1 And x < 10 Then y = y^2
   If IsTrue y = x Or IsFalse y > x + 1 Then y = y+2
   If IsTrue y = x Or IsFalse y > x + 1 And x < 10 Then y = y+2
   y = IsTrue x
   y = Max(3, 10, -2, 15+4, 23)
   y = Abs(-1)+Tan(Sin(2.5)+Cos(3.5))+Exp(1)+Exp2(5)+Log(5)+Log2(5)+Log10(5)+Ceil(5)

   MyVar## = -1 + 0 + 1! + 1.2! + 1.5# + 2## + 2.5## + 3& + 3.1& + 3.7& + 4&& + 4.3&& + 5???
   i = &h1A + &h1B& + &h1C&&

   Swap x, y
End Function

' Console routines
Function PBConsoleTest() As Long
   StdOut "PB Semicolon at the end = No new line.  ";
   StdOut "No semicolon = New Line at the end."
End Function

' Test for the PRINT function
Sub PrintTest()
   Print
   Print a
   Print a,
   Print a;
   Print a ' My comment
   Print a, ' Some comment
   Print : Print ' Print
   Print : Print : Print : Print
   Print a : Print b : Print c : Print d
   Print a, : Print b,
   Print , a: Print b, : Print c; d, : Print e
   Print , a
   Print , a, b
   Print ,, a, b,
   Print ,,,,a
   Print ,a,,,
   Print ,a,,,""
   Print a; b, c; d, e; f,
   Print a; b; c, : Print d
End Sub

' Test for implicit variable defs
Function ImplicitVar(ByVal x As Long)
   For x = 1 To 10
      i = x * 10
      text$ = Str$(i+x)
   Next
   LastNum = x-1
   MyValue! = x/i ' Note: MyValue! was defined already as global
   OtherValue! = i/x
   b1&& = b2& + b3% + b4? + b5?? + b6??? + b7! + B8# + B9##
End Function

' Test for optional args (default parameters are set in the prototype section at the top)
Sub OptionalArgs(Optional ByVal a As Long, ByVal b As String, ByVal c#, ByVal d As Long Ptr, ByVal text$)
   ' Do things
End Sub

' Test for optional args (default parameters are set in the prototype section at the top)
Function OptionalArgs2(ByVal a As Long, Opt ByVal b As String, ByVal c#, ByVal d As Long Ptr)
   ' Do things
End Function

' Test for optional args (default parameters are set in the prototype section at the top)
Function OptionalArgs3(ByVal a As Long, Opt ByVal b As String, Opt ByVal c#, ByVal d)
   ' Do things
End Function

Global g1(), g2, g3, g4 As Dword

Sub MultiDim()
   Local a, b, c, d As Long Ptr
   Static s1, s2(), s3, s4 As String
'+++   Static s1, s2(10), s3, s4 As String
   ' Do things
End Sub

' PowerBASIC allows you to pass an expression as a function arg even if it's defined ByRef
' whereas C++ expects the arg to be an lvalue (such as a variable of the exact parameter type).
' TestByRef() below tests the conversion transform from implicit-convert.uc, which uses the
' the lvalue() template defined in pbmisc.h.

Sub TestByRef()
   ' Args for TestFunc (defined earlier) are all passed by reference
   ' TestFunc(a As Long, b As Byte, c As Long, i As Integer, s As String, n As Single)

   Dim VarLong As Long, VarByte As Byte, VarInt As Integer, VarString As String, VarSingle As Single

   i = TestFunc(VarLong, VarByte, VarLong, VarInt, VarString, VarSingle)
   i = TestFunc((VarLong), (VarByte), (VarLong), (VarInt), (VarString), (VarSingle))
   i = TestFunc(VarLong+0, VarByte+0, VarLong+0, VarInt+0, VarString+"", VarSingle+0)
   i = TestFunc(1, 2, 3, 4, "Test", 5)
   i = TestFunc(Int(1+50/7)-5, 2+1, 3*50\i, 4-8, Left$("Test", 2), 8+3/2)
End Sub
