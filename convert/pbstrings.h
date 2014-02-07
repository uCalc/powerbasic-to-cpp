// PowerBASIC to C++ converter - Macros for PB strings
// https://github.com/uCalc/powerbasic-to-cpp/tree/master/convert/pbstrings.h
// Contributor(s): Daniel Corbier

#define FULL_STRING string::npos

#define PB_LEFT(MainStr, n) ( string(MainStr).substr(0, (n)) )

#define PB_RIGHT(MainStr, n) ( string(MainStr).substr(string(MainStr).length()-(n), (n)) )

#define PB_MID(MainStr, Start, Length) string(MainStr).substr(Start-1, Length)

#define PB_MID_REPLACE(MainStr, Start, Length) string(MainStr).replace((Start)-1, Length, MainStr)

#define PB_INSTR(n, MainStr, MatchStr) ((n) == 0 ? 0 :  \
   (n)>0 ? string(MainStr).find(MatchStr, (n)-1)+1      \
         : string(MainStr).rfind(MatchStr, string(MainStr).length()+(n))+1)

#define PB_INSTR_ANY(n, MainStr, MatchStr) ((n) == 0 ? 0 :   \
   (n)>0 ? string(MainStr).find_first_of(MatchStr, (n)-1)+1  \
         : string(MainStr).find_last_of(MatchStr, string(MainStr).length()+(n))+1)

inline string PB_UCASE(string Str) { std::transform(Str.begin(), Str.end(), Str.begin(), ::toupper); return Str;}

inline string PB_LCASE(string Str) { std::transform(Str.begin(), Str.end(), Str.begin(), ::tolower); return Str;}
