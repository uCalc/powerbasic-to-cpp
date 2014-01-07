# strings.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.0 on 1/7/2014 8:21:28 AM
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
Selected: True
Find: WString
Replace: wstring

Criteria: 4
Find: {@Start}
Replace: #include <string>
         using namespace std;{nl}{nl}

Criteria: 5
BackColor: DodgerBlue
PassOnce: False
Find: InStr([{n=1},] {MainStr}, {MatchStr})
      
Replace: ({MainStr}.find({MatchStr}, ({n})-1)+1)

Criteria: 6
BackColor: Tomato
PassOnce: False
Find: InStr([{n=1},] {MainStr}, Any {MatchStr})
Replace: ({MainStr}.find_first_of({MatchStr}, ({n})-1)+1)

Criteria: 7
BackColor: DarkKhaki
PassOnce: False
Find: [{Sep: {nl} | : | Then | Else}] Mid$({Str}, {Start})
Replace: {Sep} Mid$({Str}, {Start}, {Str}.length())

Criteria: 8
BackColor: Red
PassOnce: False
Find: Left$({Str}, {n})
Replace: {Str}.substr(0, {n})

Criteria: 9
BackColor: Brown
PassOnce: False
Find: Right$({Str}, {n})
Replace: {Str}.substr({Str}.length()-({n}), {n})

Criteria: 10
BackColor: Orange
PassOnce: False
Find: Mid$({Str}, {Start}, {Length})
Replace: {Str}.substr(({Start})-1, {Length})

Criteria: 11
BackColor: DeepSkyBlue
PassOnce: False
Find: {Sep: {nl} | : | Then | Else }
      Mid$({Str}, {Start}, {Length}) = {Txt%}
Replace: {Sep} {Str}.replace(({Start})-1, {Length}, {Txt})

Criteria: 12
BackColor: RoyalBlue
PassOnce: False
Find: Val({Str})
Replace: stold({Str}) 

Criteria: 13
BackColor: Pink
PassOnce: False
Find: Str$({Number})
Replace: to_string({Number})

# End Search
