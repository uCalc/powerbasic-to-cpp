# precompile.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.96 on 5/16/2014 5:03:10 PM
# Comment: Inserts include files, handles directives, expands macros etc

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, InputFile, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique, FilterTally

FindMode: Replace

# Definitions


# Search Criteria

Criteria: 0
Enabled: True
Exclude: False
Comment: Inserts include files, handles directives, expands macros etc
Selected: False
Highlight: False
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
FilterTally: False
Min: 0
Max: -1
MinSoft: 0
MaxSoft: -1
BatchAction: Transform
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
PassOnce: False
Find: {nl}#include {q}{file}{q}
Replace: ' =============== Include: {file} ===============
         {@Eval: FileText("{file}")}
         ' ============ End of Include: {file} ===========
         

Criteria: 2
Selected: True
Find: {@Note: Other items to come later}
Replace: 

# End Search
