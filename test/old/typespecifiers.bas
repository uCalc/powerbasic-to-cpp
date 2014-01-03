DefLng a-z
DefByt b
DefInt i
DefStr s
DefQud q
DefSng n-p, x-z

Global MyValue!, Label$, Price@, ExtVal##, qNum&&

Function Test(a, b, c, i, s, n)
   Print MyValue!, Label$, Price@
End Function

Function Report$(LastName$, ByVal x&, ByRef NewPrice@, n, ByVal i, nValue, qValue)
   Dim FirstName$, Age?, Total@
   Static Index&

   Print LastName$, x&, NewPrice@, n, i, nValue, qValue
   Report$ = FirstName$ + LastName$
End Function

Function Hello(txt$) As String
   Print txt$
   Function = txt$ + " friend!"
End Function

Function Bye()
   Print "Bye"
End Function
