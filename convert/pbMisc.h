// Miscellaneous

#define EXTENDED double

// PB string equates

const string PB_NUL  = "\x00";
const string PB_BEL  = "\a";
const string PB_BS   = "\b";
const string PB_TAB  = "\t";
const string PB_LF   = "\n";
const string PB_VT   = "\v";
const string PB_FF   = "\f";
const string PB_CR   = "\r";
const string PB_CRLF = "\r\n";
const string PB_EOF  = "\x1A";
const string PB_ESC  = "\x1B";
const string PB_SPC  = " ";
const string PB_DQ   = "\"";
const string PB_SQ   = "\'";
const string PB_QCQ  = "\",\"";

// Actual patterns that convert to the following are found in *.uc

#define PB_CV(keyword, type) inline type keyword(const string& Str, int Offset=1) \
        { type *ret; ret = (type*)(Str.data()+Offset-1); return *ret; }
PB_CV(PB_CVBYT, unsigned char)
PB_CV(PB_CVD,   double)
PB_CV(PB_CVDWD, unsigned int)
PB_CV(PB_CVE,   EXTENDED)
PB_CV(PB_CVI,   short)
PB_CV(PB_CVL,   int)
PB_CV(PB_CVQ,   long long)
PB_CV(PB_CVS,   float)
PB_CV(PB_CVWRD, unsigned short)


inline string PB_PEEK_STR(int address, int count) { return string((char *)address, count); }
inline void PB_POKE_STR(int address, const string& data) { memmove((void *)address, data.c_str(), data.length()); }

inline void PB_NAME(const string& oldname, const string& newname) { rename(oldname.c_str(), newname.c_str()); }

inline int PB_LOF(fstream& file) {
   int size, current_loc;
   
   current_loc = file.tellg();
   file.seekg(0, file.end);
   size = file.tellg();
   file.seekg(0, current_loc);
   return size;
}

// Math

#define PB_SGN(number) ((number > 0) ? 1 : ((number < 0) ? -1 : 0))
#define PB_EXP10(number) (10^(number))

inline bool PB_XOR(bool x, bool y) { return (x != y || x != y) ? true : false; }
inline int  PB_XOR(int  x, int  y) { return x ^ y | x ^ y; }
inline bool PB_EQV(bool x, bool y) { return (x && y || !x && !y) ? true : false; }
inline int  PB_EQV(int  x, int  y) { return x & y | !x & !y; }
inline bool PB_IMP(bool x, bool y) { return (x == true && y == false) ? false : true; }
inline bool PB_IMP(int  x, int  y) { return PB_EQV(x, y) | y; }
inline EXTENDED PB_FIX(EXTENDED n) {EXTENDED fix; modf(n, &fix); return fix;}
inline EXTENDED PB_FRAC(EXTENDED n) {EXTENDED ignore; return modf(n, &ignore);}
inline int _round(EXTENDED number) { return (number > 0.0) ? (number + 0.5) : (number - 0.5); }

#define ARGCOUNT(x) x  // ARGCOUNT simply makes the first arg of variadic function stand out
#define GREATER >
#define LESS <

#define MAXMIN(func, type, compare_op)                                                             \
inline type func(int argCount, ...) {                                                              \
   type max, value;                                                                                \
   va_list args;                                                                                   \
   va_start(args, argCount);                                                                       \
   max = va_arg(args, type);                                                                       \
   for(int x = 2; x <= argCount; x++) if((value = va_arg(args, type)) compare_op max) max = value; \
   va_end(args);                                                                                   \
   return max;                                                                                     \
}

MAXMIN(PB_MAX,     EXTENDED, GREATER)
MAXMIN(PB_MAX_INT, int,      GREATER)
MAXMIN(PB_MAX_STR, string,   GREATER)
MAXMIN(PB_MIN,     EXTENDED, LESS)
MAXMIN(PB_MIN_INT, int,      LESS)
MAXMIN(PB_MIN_STR, string,   LESS)

#define PZONE left << setw(14)

// This template allows rvalues (any expression) where lvalues (a variable) are expected (in ByRef args)
template<typename T> inline T& lvalue(const T& Arg) { static T ReturnVal; ReturnVal = Arg; return ReturnVal; }
