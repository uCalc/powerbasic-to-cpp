long MyFunction(long a, float& b) {
   long x;
   long y;
   long yVar;

   if (b > 5) {
      for (x=1; x<=10; x += 1) {
         for (yVar=10; yVar>=1; x += -1) {
            if (x > y) { return a+y; }
         }
      }
   }
}
