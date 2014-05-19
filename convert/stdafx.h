// stdafx.h : include file for standard system include files,
// or project specific include files that are used frequently, but
// are changed infrequently

#pragma once

#include "targetver.h"

#include <stdio.h>
#include <tchar.h>

// TODO: reference additional headers your program requires here
//#include <cmath>
#include <mathimf.h> // Use this for Intel C++, or <cmath> otherwise
#include <cstdlib>
#include <vector>
#include <cstdarg>
#include <algorithm>
#include <string>
#include <sstream>
#include <iostream>
#include <iomanip>
#include <fstream>

// Intel's mathimf.h does not have overload issue that <cmath> with VC++ has for things like pow()
