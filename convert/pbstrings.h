// PowerBASIC to C++ converter - Macros for PB strings
// https://github.com/uCalc/powerbasic-to-cpp/tree/master/convert/pbstrings.h
// Contributors: Daniel Corbier
//               <other contributers needed>
//               ...
//               ...

#define FULL_STRING string::npos

#define PB_LEFT(MainStr, n) ((n) == 0 ? "" : \
   (n)>0 ? string(MainStr).substr(0, (n))    \
         : string(MainStr).substr(0, string(MainStr).length()+(n)))

#define PB_RIGHT(MainStr, n) ((n) == 0 ? "" :                        \
   (n)>0 ? string(MainStr).substr(string(MainStr).length()-(n), (n)) \
         : string(MainStr).substr(-(n), (n))

#define PB_MID(MainStr, Start, Length) string(MainStr).substr(Start-1, Length)
// Help needed here for negative Start & Length
// Turns out there might be a conflict between string::npos and MID(..., ..., -1) (for Left$, Right$ too)
// Negative args were not always a feature in PB
// These extra lines might be removed if nobody cares

#define PB_MID_REPLACE(MainStr, Start, Length) string(MainStr).replace((Start)-1, Length, MainStr)

#define PB_INSTR(n, MainStr, MatchStr) ((n) == 0 ? 0 :  \
   (n)>0 ? string(MainStr).find(MatchStr, (n)-1)+1      \
         : string(MainStr).rfind(MatchStr, string(MainStr).length()+(n))+1)

#define PB_INSTR_ANY(n, MainStr, MatchStr) ((n) == 0 ? 0 :   \
   (n)>0 ? string(MainStr).find_first_of(MatchStr, (n)-1)+1  \
         : string(MainStr).find_last_of(MatchStr, string(MainStr).length()+(n))+1)
