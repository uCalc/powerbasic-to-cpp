// This file is for handling operating system dependent code that might not be directly
// portable using the same method.

#include "windows.h"  // For now everything is Windows-specific

inline BOOL PB_ISFILE(string FileName) {
   DWORD attr = GetFileAttributes(FileName.c_str());
   return (attr != INVALID_FILE_ATTRIBUTES && !(attr & FILE_ATTRIBUTE_DIRECTORY));
}
