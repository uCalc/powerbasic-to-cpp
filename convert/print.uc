# print.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.95 on 4/8/2014 6:29:17 PM
# Comment: 

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, InputFile, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique, FilterTally

FindMode: Replace

# Definitions


# Search Criteria

Criteria: 0
Enabled: False
Exclude: False
Comment: 
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
Enabled: True
Highlight: True
BackColor: Yellow
Find: 
Replace: {@Token:: : ~~ Properties: ucStatementSep }

Criteria: 2
Comment: 
Pass: 1

Criteria: 3
Enabled: True
BackColor: Purple
Find: Print
Replace: cout <<

Criteria: 4
Comment: Add ENDL to lines that need it
Pass: 2

Criteria: 5
Enabled: True
Highlight: True
BackColor: DarkKhaki
Find: cout << [{data}]
Replace: cout << {data} << endl

Criteria: 6
Enabled: True
Highlight: True
BackColor: DeepSkyBlue
Find: cout << [{data}] {punc: ; | , }{end: {nl} | : }
Replace: cout << {data} {punc}{end}

Criteria: 7
Comment: 
Pass: 3

Criteria: 8
Enabled: True
Highlight: True
BackColor: Lime
PassOnce: False
Find: cout << {data}, [{more}]
Replace: cout << PZONE << {data}{more: : cout << {more}}

Criteria: 9
Enabled: True
Selected: True
BackColor: SlateBlue
PassOnce: False
Find: cout << {data}; [{more}]
Replace: cout << {data}{more: : cout << {more}}

Criteria: 10
Comment: Clean up
Pass: 4

Criteria: 11
Enabled: True
Highlight: True
BackColor: RoyalBlue
PassOnce: False
Find: << <<
Replace: <<

Criteria: 12
Enabled: True
BackColor: SlateBlue
PassOnce: False
Find: cout << {data} : cout <<
Replace: cout << {data} <<

# End Search
