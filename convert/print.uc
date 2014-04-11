# print.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.95 on 4/11/2014 3:00:18 PM
# Comment: 

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, InputFile, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique, FilterTally

FindMode: Replace

# Definitions


# Search Criteria

Criteria: 0
Enabled: True
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
Highlight: True
BackColor: Yellow
PassOnce: False
Find: 
Replace: {@Token:: : ~~ Properties: ucStatementSep }
         {@Token:: [\x27_].* ~~ Properties: ucWhiteSpace}

Criteria: 2
Comment: 
Pass: 1

Criteria: 3
BackColor: Purple
Find: Print
Replace: cout <<

Criteria: 4
PassOnce: False
Find: Print ,
Replace: Print "",

Criteria: 5
BackColor: Green
PassOnce: False
Find: Print {etc},,
Replace: Print {etc}, "",

Criteria: 6
Comment: Add ENDL to lines that need it
Pass: 2

Criteria: 7
Selected: True
Highlight: True
BackColor: DarkKhaki
Find: cout << [{data}]
Replace: cout << {data} << endl;

Criteria: 8
Highlight: True
BackColor: DeepSkyBlue
Find: cout << [{data}] {punc: ; | , }{end: {nl} | : }
Replace: cout << {data} {punc}{end}

Criteria: 9
Comment: 
Pass: 3

Criteria: 10
Highlight: True
BackColor: Lime
PassOnce: False
Find: cout << {data}, [{more}]
Replace: cout << PZONE << {data}{more: : cout << {more}}

Criteria: 11
BackColor: SlateBlue
PassOnce: False
Find: cout << {data}; [{more}]
Replace: cout << {data}{more: : cout << {more}}

Criteria: 12
Comment: Clean up
Pass: 4

Criteria: 13
Highlight: True
BackColor: RoyalBlue
PassOnce: False
Find: << <<
Replace: <<

Criteria: 14
BackColor: SlateBlue
PassOnce: False
Find: cout << {data} : cout <<
Replace: cout << {data} <<

# End Search
