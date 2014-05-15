# implicit-convert.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.96 on 5/15/2014 3:40:01 PM
# Comment: Handles implicit data type conversions

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, InputFile, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique, FilterTally

FindMode: Replace

# Definitions


# Search Criteria

Criteria: 0
Enabled: True
Exclude: False
Comment: Handles implicit data type conversions
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
Highlight: False
Find: 
Replace: {@Define: Var: Args As String}
         {@Define::
            Token: \x27.* ~~ Properties: ucWhitespace
            Token: _[^\n]*\n ~~ Properties: ucWhitespace
            LineContinue: " _"
         }

Criteria: 2
Comment: Inserts data type names in front of variabls and functions
Pass: 1

Criteria: 3
Selected: True
Highlight: False
Find: {nl}[Declare]{ Function | Sub } {name:1} [{etc}] ({args%}) [ As {ftype:1}]
Replace: {@Define::  Pass: 1 ~~ Syntax: {name}({@Eval:                      _
             Args = Remove("{args}", "{ Optional | ByVal | ByRef | Ptr }"); _
             Replace(Args, "{arg:1} As {type:1}", "{"+"{arg}"+"}")          _
           }) ::= <{ftype}>{name}({@Eval:                                   _
             Args = Remove("{args}", "{ Optional | ByVal | ByRef | Ptr }"); _
             Replace(Args, "{arg:1} As {type:1}", "<{type}>{arg}")          _
           })
         }{Self}

Criteria: 4
Highlight: False
Find: { Global | Local | Static | Dim | , | { ByVal | ByRef } } {var:1} As {type:1}
Replace: {Self}{@Define:: Pass: 1 ~~ Syntax: {var} ::= <<{type}>>{var}}

Criteria: 5
Comment: Highlights the inserted data type names
Pass: 2

Criteria: 6
BackColor: Red
Find: <{arg:1}>
Replace: {Self}

Criteria: 7
Comment: This line is there to provide highlighting for clarity
Find: <<{type}>>{var:1}
Replace: {Self}

# End Search
