// This file is for handling operating system dependent code that might not be directly
// portable using the same method.
// +++ These might eventually (maybe) be replaced with Boost C++ Libraries

// The actual transforms that convert to this code are found in *.uc

#include "windows.h"  // For now everything is Windows-specific

WIN32_FIND_DATA FindFileData;
HANDLE DirHandle = INVALID_HANDLE_VALUE;

inline string PB_DIR(const string& file) {
   DirHandle = FindFirstFile(file, &FindFileData);
   return (DirHandle == INVALID_HANDLE_VALUE ? "" : FindFileData.cFileName);
}

inline string PB_DIR_NEXT() {
   FindNextFile(DirHandle, &FindFileData);
   return (DirHandle == INVALID_HANDLE_VALUE ? "" : FindFileData.cFileName);
}

inline BOOL PB_ISFILE(const string& FileName) {
   DWORD attr = GetFileAttributes(FileName.c_str());
   return (attr != INVALID_FILE_ATTRIBUTES && !(attr & FILE_ATTRIBUTE_DIRECTORY));
}

inline string PB_EXE_FULL() { TCHAR fName[MAX_PATH]; GetModuleFileName(NULL, fName, MAX_PATH); return fName; }
#define PB_EXE_NAME  PB_EXE_NAMEX.substr(0, PB_EXE_NAMEX.rfind("."))
#define PB_EXE_NAMEX PB_EXE_FULL().substr(PB_EXE_FULL().rfind("\\")+1)
#define PB_EXE_PATH  PB_EXE_FULL().substr(PB_EXE_FULL().rfind("\\"))
#define PB_EXE_EXTN  PB_EXE_FULL().substr(PB_EXE_FULL().rfind("."))

#define PB_SLEEP(milliseconds) Sleep(milliseconds)
