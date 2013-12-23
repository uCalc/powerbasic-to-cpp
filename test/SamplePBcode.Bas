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

   MySub(a)
   x = MySub(b)+1

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
   y = x + 1 : z = y+x : Other(x) = x+1

   While x < 10
      y = MyFunction(x, 10.5)
      Test = VarPtr(x)
      Number(z) = @Test + Other(5+x)
      x = x+1
   Wend   
End Sub

Sub TestCertainOperators()
   Dim MyArray(10) As Long, MyPoint As Point, pp As Point Ptr

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
