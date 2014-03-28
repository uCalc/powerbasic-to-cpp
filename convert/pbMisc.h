// Miscellaneous
// Actual patterns that convert to these are in *.uc


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
const string PB_EOF  = "\x1A;
const string PB_ESC  = "\x1B";
const string PB_SPC  = " ";
const string PB_DQ   = "\"";
const string PB_SQ   = "\'";
const string PB_QCQ  = "\q,\q";

#define PB_CV(keyword, type) inline type keyword(string Str, int Offset=1) \
        { type *ret; ret = (type*)(Str.data()+Offset-1); return *ret; }
PB_CV(PB_CVBYT, unsigned char)
PB_CV(PB_CVD,   double)
PB_CV(PB_DWD,   unsigned int)
PB_CV(PB_CVE,   long double)
PB_CV(PB_CVI,   short)
PB_CV(PB_CVL,   int)
PB_CV(PB_CVQ,   long long)
PB_CV(PB_CVS,   float)
PB_CV(PB_CVWRD, unsigned short)
// PB_CV(PB_CVCUR, ...) +++ no C++ type for currency
// PB_CV(PB_CVCUX, ...)

inline string PB_PEEK_STR(int address, int count) { return string((char *)address, count); }
inline void PB_POKE_STR(int address, string data) { memmove((void *)address, data.c_str(), data.length()); }

inline void PB_NAME(string oldname, string newname) { rename(oldname.c_str(), newname.c_str()); }

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

inline long double PB_FIX(long double n) {long double fix; modf(n, &fix); return fix;}
inline long double PB_FRAC(long double n) {long double ignore; return modf(n, &ignore);}

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

MAXMIN(PB_MAX,     long double, GREATER)
MAXMIN(PB_MAX_INT, int,         GREATER)
MAXMIN(PB_MAX_STR, string,      GREATER)
MAXMIN(PB_MIN,     long double, LESS)
MAXMIN(PB_MIN_INT, int,         LESS)
MAXMIN(PB_MIN_STR, string,      LESS)
