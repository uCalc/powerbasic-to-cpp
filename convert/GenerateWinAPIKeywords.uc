# GenerateWinAPIKeywords.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.96 on 5/13/2014 9:42:24 AM
# Comment: Parses Win32API.inc to generate keword list (equates, Subs, Functions)

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, InputFile, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique, FilterTally

FindMode: Replace

# Definitions


# Search Criteria

Criteria: 0
Enabled: True
Exclude: False
Comment: Parses Win32API.inc to generate keword list (equates, Subs, Functions)
Selected: False
Highlight: False
ForeColor: ControlText
BackColor: Aqua
FontName: 
FontSize: 
FontStyle: 
CaseSensitive: False
QuoteSensitive: False
CodeBlockSensitive: False
FilterEndText: 
FilterSeparator: {#10}
FilterSort: True
FilterSortFunc: 
FilterStartText: 
FilterUnique: True
FilterTally: False
Min: 0
Max: -1
MinSoft: 0
MaxSoft: -1
BatchAction: Filter
InputFile: 
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
Selected: True
Find: 
Replace: {@Var: Includes As Table}
         {@Exec: Insert(Includes, "Win32API.inc")}

Criteria: 2
Comment: Insert content of nested include files
Pass: 1

Criteria: 3
BackColor: DeepSkyBlue
PassOnce: False
Find: {nl}#include {q}{file}{q}
Replace: ' =============== Include: {file} ===============
         {@Eval: 
            IIf(Index(Includes, "{file}"), 
                "' Already  included",
                Insert(Includes, "{file}"); FileText("{file}")
            )
         }
         ' ============ End of Include: {file} ===========

Criteria: 4
Comment: Filter out keywords
Pass: 2

Criteria: 5
Highlight: True
BackColor: Orange
Find: {nl}{ Union | Type | % | $[$] } {name:1}
Replace: {name}

Criteria: 6
Highlight: True
BackColor: DeepSkyBlue
Find: {nl}Declare { Sub | Function } {name:1}
Replace: {name}

# End Search
