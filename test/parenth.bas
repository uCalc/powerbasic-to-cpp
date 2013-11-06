DECLARE FUNCTION ShellExecute LIB "SHELL32.DLL" ALIAS "ShellExecuteA" (BYVAL hwnd AS DWORD, lpOperation AS ASCIIZ, lpFile AS ASCIIZ, lpParameters AS ASCIIZ, lpDirectory AS ASCIIZ, BYVAL nShowCmd AS LONG) AS DWORD

Sub DoSomething(ByVal Arg1 As Long, ByRef txt$, Number##, Optional xyz As Dword Ptr)
   ' Code
End Sub

Function PBMain()
   DoSomething Len("Test")+5, "Hello " + "world!", Sin(x+1)*pi, VarPtr(x)-4 ' Comment
  
   DoSomething 10, "abc", 5, 1 : DoSomething 1, "x", 5, 0  ' Etc...
   
   If x > 1 Then DoSomething(1, "x", 5, 0) ' Parenthesis already here

   ShellExecute 0, "Open", "ReadMe.Txt", $NUL, $NUL, %SW_SHOWNORMAL
End Function
