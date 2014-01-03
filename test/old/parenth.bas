'#Include "Win32API.inc"
Declare Function ShellExecute Lib "SHELL32.DLL" Alias "ShellExecuteA" (ByVal hwnd As Dword, lpOperation As Asciiz, lpFile As Asciiz, lpParameters As Asciiz, lpDirectory As Asciiz, ByVal nShowCmd As Long) As Dword
Declare Function SetCursorPos Lib "USER32.DLL" Alias "SetCursorPos" (ByVal x As Long, ByVal y As Long) As Long
Declare Sub      SetLastError Lib "KERNEL32.DLL" Alias "SetLastError" (ByVal dwErrCode As Dword)

Sub DoSomething(ByVal Arg1 As Long, ByRef txt$, Number##, Optional ByVal xyz As Dword Ptr)
   SetCursorPos 10, Arg1 + 5
   If Arg1 = 15 Then SetLastError 123
End Sub

Function PBMain()
   Dim x As Ext, pi As Ext
   DoSomething Len("Test")+5, "Hello " + "world!", Sin(x+1)*pi, VarPtr(x)-4 ' Comment

   DoSomething 10, "abc", 5, 1 : DoSomething 1, "x", 5, 0  ' Etc...

   If x > 1 Then DoSomething(1, "x", 5, 0) ' Parenthesis already here

   ShellExecute 0, "Open", "ReadMe.Txt", $Nul, $Nul, %SW_ShowNormal
End Function
