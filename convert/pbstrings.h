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

inline string PB_UCASE(const string& Str) { std::transform(Str.begin(), Str.end(), Str.begin(), ::toupper); return Str; }

inline string PB_LCASE(const string& Str) { std::transform(Str.begin(), Str.end(), Str.begin(), ::tolower); return Str; }

// +++ For now only [L|R]Trim$ with one arg, or with with "ANY" for 2nd arg is impelemented

#define PB_TRIM_ANY(Str, chars) PB_LTRIM_ANY(PB_RTRIM_ANY(Str, chars))

inline string PB_LTRIM_ANY(const string& Str, const string& chars) { return Str.substr(Str, Str.find_first_not_of(chars)); }

inline string PB_RTRIM_ANY(const string& Str, const string& chars) { Str.erase(Str.find_last_not_of(chars)+1); return Str; }

inline string PB_EXTRACT(long start, const string& Str, const string& Match) { return Str.substr(0, Str.find(Match, start-1)-1); }

inline string PB_EXTRACT_ANY(long start, const string& Str, const string& Match) { return Str.substr(0, Str.find_first_of(Match, start-1)-1); }

inline string PB_REMAIN(long start, const string& Str, const string& Match) { return Str.substr(Str.find(Match, start-1)+Str.length()); }

inline string PB_REMAIN_ANY(long start, const string& Str, const string& Match) { return Str.substr(Str.find_first_of(Match, start-1)+1); }

// +++ PB_REMOVE and PB_REPLACE here are incomplete; removes/replaces just one occurence for now
inline string PB_REMOVE(const string& Str, const string& Match) { PB_EXTRACT(1, Str, Match) + PB_REMAIN(1, Str, MATCH); }

inline string PB_REMOVE_ANY(const string& Str, const string& Match) { PB_EXTRACT_ANY(1, Str, Match) + PB_REMAIN_ANY(1, Str, MATCH); }

inline void PB_REPLACE(const string& Str, const string& Match, const string& NewStr) { PB_EXTRACT(1, Str, Match) + NewStr + PB_REMAIN(1, Str, MATCH); }

inline string PB_REPEAT(const string& Str, long count) { string NewStr; for(int x=1; x <= count; x++) NewStr += Str; return NewStr; } // +++ must optimize this

inline int PB_ASC(const string& Str, int pos) { return (int)Str.at(pos-1); }

inline string PB_STR(long double number, int prec=16) { stringstream Str; Str.precision(prec); Str << number; return Str.str(); }

inline string PB_HEX(int number) { stringstream Str; Str << hex << uppercase << number; return Str.str(); }

inline string PB_OCT(int number) { stringstream Str; Str << oct << uppercase << number; return Str.str(); }

// +++ Need something for PB_BIN
