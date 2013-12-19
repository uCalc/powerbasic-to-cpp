// This is improperly intended code
// Beautify.uc will fix this

const int MyEquate = 0x100;
const int Other = 0x200;

long ProgStatus;

#if defined Other
// Something
#elif !defined abcd
// Something else
#else
// Etc
#endif

struct point {
   long x;
   long y;
}

long MyFunction(long a, float& b)
{
   long x;
   long y;
   long *Test = new long [a+25+1];
   long yVar;
   
   // Dim q As Long
   // I don't want the commented line above to be translated
   
   MySub(a);
   x = MySub(b)+1;
   
   if (b > 5) {
      for (x=1; x<=10; x += 1) {
         for (yVar=10; yVar>=1; yVar += -1) {
            if (x > y) {
               return a+y;
            }
            if (y < MyEquate) {
               return Test[x-y]*10;
            }
         }
      }
   }
   
   delete[] Test;
}

void MySub(long x)
{
   long y;
   long *Test;
   float *Number = new float [10+1];
   long *Other = new long [x+1];
   long z;
   
   ProgStatus = 10;
   y = x + 1;
   z = y+x;
   Other[x] = x+1;
   
   while (x < 10) {
      y = MyFunction(x, 10.5);
      Test = &x;
      Number[z] = *Test + Other[5+x];
      x = x+1;
   }   
   
   delete[] Other;
   delete[] Other;
}
