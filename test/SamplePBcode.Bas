' This is sample code
' Note: proper indentation might be handled in a separate transform

%MyEquate = &h100
%Other = &h200

Global ProgStatus As Long

Function MyFunction(ByVal a As Long, ByRef b As Single) As Long
   Dim x As Long, y As Long
   Dim yVar As Long, MyValue&
   ' Dim q As Long
   ' I don't want the commented line above to be translated

   If b > 5 Then
      For x = 1 To 10
         For yVar = 10 To 1 Step -1
            If x > y then Function = a+y
            If y < %MyEquate Then Function = 123
         Next
      Next
   End If
End Function

Sub MySub(ByVal x As Long)
   Local y As Long
   Register z As Long

   ProgStatus = 10

   While x < 10
      y = MyFunction(x, 10.5)
      z = x*2
      x = x+1
   Wend   
End Sub
