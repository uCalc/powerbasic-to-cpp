' This is sample code
' Note: proper indentation might be handled in a separate transform

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

Type point
   x As Long
   y As Long
End Type

Function MyFunction(ByVal a As Long, ByRef b As Single) As Long
   Dim x As Long, y As Long, Test(a+25) As Long
   Dim yVar As Long, MyValue&
   ' Dim q As Long
   ' I don't want the commented line above to be translated

   If b > 5 Then
      For x = 1 To 10
         For yVar = 10 To 1 Step -1
            If x > y then Function = a+y
            If y < %MyEquate Then Function = Test(x-y)*10
         Next
      Next
   End If
End Function

Sub MySub(ByVal x As Long)
   Local y As Long, Test As Long Ptr, Number(10) As Single, Other(x) As Long
   Register z As Long

   ProgStatus = 10

   While x < 10
      y = MyFunction(x, 10.5)
      Test = VarPtr(x)
      Number(z) = @Test + Other(5+x)
      x = x+1
   Wend   
End Sub
