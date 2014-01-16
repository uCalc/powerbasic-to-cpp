# math.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.5 on 1/16/2014 12:34:12 PM
# Comment: Converts math-related code from PowerBASIC to C++

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique

FindMode: Replace

# Definitions


# Search Criteria

Criteria: 0
Enabled: False
Exclude: False
Comment: Converts math-related code from PowerBASIC to C++
Selected: False
Highlight: True
ForeColor: ControlText
BackColor: Aqua
FontName: 
FontSize: 
FontStyle: 
CaseSensitive: False
QuoteSensitive: True
CodeBlockSensitive: True
FilterEndText: 
FilterSeparator: {#10}
FilterSort: False
FilterSortFunc: 
FilterStartText: 
FilterUnique: False
Min: 0
Max: -1
MinSoft: 0
MaxSoft: -1
BatchAction: Transform
OutputFile: 
SEND: 
StartAfter: 0
StopAfter: -1
SkipOver: False
ParentChild: 0
Pass: 0
PassOnce: True
Precedence: 0
RightToLeft: False

Criteria: 1
Enabled: True
Find: {@Start}
      {@Note:
         Note that this conversion comes AFTER pb-to-cpp.uc
         ToDo: ^ \ exp10 frac sgn shift
               eqv imp bin hex oct
               and fix LCase for next version
      }
Replace: #include <math.h>{nl}

Criteria: 2
Enabled: True
Selected: True
SkipOver: True
Find: // {Comment:".*"}
Replace: [Skip over]

Criteria: 3
Enabled: False
Find: {func: Abs|Sin|Cos|Tan|Exp|Exp2|Log|Log2|Log10|Ceil}
Replace: {@Evaluate: LCase({func})}

Criteria: 4
Enabled: True
Find: Mod
Replace: %

Criteria: 5
Enabled: True
BackColor: Yellow
Find: Atn
Replace: atan

Criteria: 6
Enabled: True
BackColor: Lime
Find: Sqr
Replace: sqrt

Criteria: 7
Enabled: True
BackColor: Brown
Find: Fix
Replace: trunc

Criteria: 8
Enabled: True
BackColor: Pink
Find: Cint
Replace: lround

Criteria: 9
Enabled: True
BackColor: Red
Find: Incr {var} ;
Replace: {var}++;

Criteria: 10
Enabled: True
BackColor: RoyalBlue
Find: Decr {var} ;
Replace: {var}--;

# End Search
