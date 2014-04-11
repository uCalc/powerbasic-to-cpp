# interactive.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.95 on 4/11/2014 10:25:00 AM
# Comment: Allows you to convert with a click of a button instead of a batch file

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, InputFile, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique, FilterTally

FindMode: Replace

# Definitions


# Search Criteria

Criteria: 0
Enabled: True
Exclude: False
Comment: Allows you to convert with a click of a button instead of a batch file
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
Selected: True
Highlight: True
Find: {AllText}
Replace: {@Evaluate:
            Text = Transform({AllText}, "refactor.uc")
            Text = Transform(Text, "strings.uc")
            Text = Transform(Text, "typespecifiers.uc")
            Text = Transform(Text, "math.uc")
            Text = Transform(Text, "filehandler.uc")
            Text = Transform(Text, "print.uc")
            Text = Transform(Text, "pb-to-cpp.uc") 
            Text
         }

# End Search
