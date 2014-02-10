# strings.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.5 on 2/10/2014 9:24:02 AM
# Comment: Converts string-related code from PowerBASIC to C++

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique

FindMode: Replace

# Definitions


# Search Criteria

Criteria: 0
Enabled: True
Exclude: False
Comment: Converts string-related code from PowerBASIC to C++
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
SkipOver: True
Find: ' {Comment:".*"}
Replace: [Skip over]

Criteria: 2
Find: String
Replace: string

Criteria: 3
Find: WString
Replace: wstring

Criteria: 4
Find: {@Start}
Replace: #include <algorithm>
         #include <string>
         #include "pbstrings.h"
         using namespace std;{nl}{nl}

Criteria: 5
BackColor: DodgerBlue
PassOnce: False
Find: InStr([{n=1},] {MainStr}, {MatchStr})
Replace: PB_INSTR({n}, {MainStr}, {MatchStr})

Criteria: 6
BackColor: Tomato
PassOnce: False
Find: InStr([{n=1},] {MainStr}, Any {MatchStr})
Replace: PB_INSTR_ANY({n}, {MainStr}, {MatchStr})

Criteria: 7
BackColor: Red
PassOnce: False
Find: Left$({Str}, {n})
Replace: PB_LEFT({Str}, {n})

Criteria: 8
BackColor: Brown
PassOnce: False
Find: Right$({Str}, {n})
Replace: PB_RIGHT({Str}, {n})

Criteria: 9
BackColor: Orange
PassOnce: False
Find: Mid$({Str}, {Start} [, {Length=FULL_STRING}])
Replace: PB_MID({Str}, {Start}, {Length})

Criteria: 10
BackColor: DeepSkyBlue
PassOnce: False
Find: {Sep: {nl} | : | Then | Else }
      Mid$({Str}, {Start} [, {Length=FULL_STRING}]) = {Txt%}
Replace: {Sep} PB_MID_REPLACE({Str}, {Txt}, {Start}, {Length})

Criteria: 11
BackColor: RoyalBlue
PassOnce: False
Find: Val({Str})
Replace: stold({Str}) 

Criteria: 12
BackColor: Pink
PassOnce: False
Find: Str$({Number})
Replace: to_string({Number})

Criteria: 13
Find: Space$({count})
Replace: string({count}, _char( ))

Criteria: 14
Find: String$({count}, {char})
Replace: string({count}, {char})

Criteria: 15
BackColor: Violet
Find: String$({count}, {q}{char}{q})
Replace: string({count}, _char({char}))

Criteria: 16
Find: UCase$({text})
Replace: PB_UCASE({text})

Criteria: 17
BackColor: YellowGreen
Find: LCase$({text})
Replace: PB_LCASE({text})

Criteria: 18
Find: Trim$({Str} [, ANY {chars=" "}])
Replace: PB_TRIM_ANY({Str}, {chars})

Criteria: 19
BackColor: Gold
Find: LTrim$({Str} [, ANY {chars=" "}])
Replace: PB_LTRIM_ANY({Str}, {chars})

Criteria: 20
Selected: True
BackColor: Silver
Find: RTrim$({Str} [, ANY {chars=" "}])
Replace: PB_RTRIM_ANY({Str}, {chars})

# End Search
