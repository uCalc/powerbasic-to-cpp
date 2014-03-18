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

#define PB_SGN(number) ((number > 0) ? 1 : ((number < 0) ? -1 : 0))

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
