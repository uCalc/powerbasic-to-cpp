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

// +++ Offset is missing
inline unsigned int PB_DVDWD(string Str, int Offset) { return (unsigned int)Str.data(); }
