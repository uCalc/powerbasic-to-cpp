' Stripped version of Win32API.inc for faster testing
' Eventually should work with the real Win32API.inc

%SW_SHOWMINIMIZED   = 2
Declare Function ShellExecute Lib "SHELL32.DLL" Alias "ShellExecuteA" (ByVal hwnd As Dword, lpOperation As Asciiz, lpFile As Asciiz, lpParameters As Asciiz, lpDirectory As Asciiz, ByVal nShowCmd As Long) As Dword
Declare Function SetCursorPos Lib "USER32.DLL" Alias "SetCursorPos" (ByVal x As Long, ByVal y As Long) As Long
Declare Sub      SetLastError Lib "KERNEL32.DLL" Alias "SetLastError" (ByVal dwErrCode As Dword)
