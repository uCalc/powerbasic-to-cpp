# implicit-convert.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.96 on 5/19/2014 6:26:41 PM
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
QuoteSensitive: False
CodeBlockSensitive: False
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
Replace: {@Define: 
            Var: Args As String
            SyntaxArgL: {number} = {number:"([0-9]*\.)?[0-9]+(e[-+]?[0-9]+)?"}
         }
         {@Define::
         
            Token: \x27.* ~~ Properties: ucWhitespace
            Token: _[^\n]*\n ~~ Properties: ucWhitespace
            LineContinue: " _"
         }

Criteria: 2
Comment: Inserts data type names in front of variabls and functions
Pass: 1

Criteria: 3
Highlight: False
Find: {nl}[Declare]{ Function | Sub } {name:1} [{etc}] ([{args%}]) [ As {ftype:1}]
Replace: {@Define::  Pass: 1 ~~ Syntax: {name}({@Eval:                      _
             Args = Remove("{args}", "{ Optional | ByVal | ByRef | Ptr }"); _
             Replace(Args, "{arg:1} As {type:1}", "{"+"{arg}"+"%}")          _
           }) ::= `{ftype}({name}({@Eval:                                   _
             Args = Remove("{args}", "{ Optional | ByVal | ByRef | Ptr }"); _
             Replace(Args, "{arg:1} As {type:1}", "##{type}({arg})")        _
           }))
         }{Self}

Criteria: 4
Highlight: False
Find: { Global | Local | Static | Dim | , | { ByVal | ByRef } } {var:1} As {type:1}
Replace: {Self}{@Define:: Pass: 1 ~~ Syntax: {var} ::= `{type}({var})}

Criteria: 5
Highlight: False
Find: {number}
Replace: `Double({number})

Criteria: 6
Highlight: False
BackColor: RoyalBlue
Find: {q}{text}{q}
Replace: `String({Self})

Criteria: 7
Highlight: False
BackColor: Pink
Find: {func: InStr|Len|UBound|VarPtr|StrPtr|Dir|CurDir } ({args%})
Replace: `Long({func}({args}))

Criteria: 8
Highlight: False
BackColor: SlateBlue
Find: {func: Mid|Left|Right|Remove|Extract|Remain } ({args%})
Replace: `String({func}({args}))

Criteria: 9
Highlight: False
BackColor: Purple
SkipOver: True
Find: {nl} { Type | Union }
         {members+}
      End {TypeOrUnion}
Replace: [Skip over]

Criteria: 10
BackColor: Khaki
SkipOver: True
Find: {nl}{ % | $ | # | ! | ASM } {etc} {@Note: Skips equates, metastatements, ASM}
Replace: [Skip over]

Criteria: 11
Comment: Convert
Pass: 2

Criteria: 12
Selected: True
BackColor: Violet
Find: ##LPCSTR(string({arg}))
Replace: {arg}.c_str()

Criteria: 13
Comment: Highlights the inserted data type names
Pass: 3

Criteria: 14
BackColor: Red
Find: ##{type:1}
Replace: {Self}

Criteria: 15
Comment: This line is there to provide highlighting for clarity
Find: `{type:1}
Replace: {Self}

Criteria: 16
BackColor: SandyBrown
Find: 
Replace: 

# End Search
