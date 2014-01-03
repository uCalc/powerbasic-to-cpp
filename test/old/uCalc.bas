Function MyFunction(ByVal a As Long, ByRef b As Single) As Long
   Dim x As Long, y As Long
   Dim yVar As Long

   If b > 5 Then
      For x = 1 To 10
         For yVar = 10 To 1 Step -1
            If x > y then Function = a+y
         Next
      Next
   End If
End Function
