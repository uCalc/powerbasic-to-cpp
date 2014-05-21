# implicit-convert.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.96 on 5/21/2014 5:14:40 PM
# Comment: Handles implicit data type conversions

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, InputFile, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique, FilterTally

FindMode: Replace

# Definitions


# Search Criteria

Criteria: 0
Enabled: False
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
Enabled: True
Highlight: False
Find: 
Replace: {@Eval:
            Dim Size As Table = {
               "Byte", 1, "Word", 2, "Integer", 2, "Long", 4, "Dword", 4,
               "Single", 4, "Double", 8, "Extended", 10
            }
         }
         {@Define: 
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
Enabled: True
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
Enabled: True
Highlight: False
Find: { Global | Local | Static | Dim | , | { ByVal | ByRef } } {var:1} As {type:1}
Replace: {Self}{@Define:: Pass: 1 ~~ Syntax: {var} ::= `{type}({var})}

Criteria: 5
Enabled: True
Highlight: False
Find: {number}
Replace: `Double({number})

Criteria: 6
Enabled: True
Highlight: False
BackColor: RoyalBlue
Find: {q}{text}{q}
Replace: `StringLit({Self})

Criteria: 7
Enabled: True
Highlight: False
BackColor: Pink
Find: {func: InStr|Len|UBound|VarPtr|StrPtr|Dir|CurDir } ({args%})
Replace: `Long({func}({args}))

Criteria: 8
Enabled: True
Highlight: False
BackColor: SlateBlue
Find: {func: Mid|Left|Right|Remove|Extract|Remain } ({args%})
Replace: `String({func}({args}))

Criteria: 9
Enabled: True
Highlight: False
BackColor: Purple
SkipOver: True
Find: {nl} { Type | Union }
         {members+}
      End {TypeOrUnion}
Replace: [Skip over]

Criteria: 10
Enabled: True
BackColor: Khaki
SkipOver: True
Find: {nl}{ % | $ | # | ! | ASM } {etc} {@Note: Skips equates, metastatements, ASM}
Replace: [Skip over]

Criteria: 11
Comment: Convert
Pass: 2

Criteria: 12
Enabled: True
BackColor: Violet
PassOnce: False
Find: ##Asciiz(string({arg}))
Replace: `Asciiz({arg}.c_str())

Criteria: 13
Enabled: True
PassOnce: False
Find: `StringLit({arg})+`StringLit({arg})
Replace: `String((string){arg}+{arg})

Criteria: 14
Enabled: True
BackColor: CornflowerBlue
PassOnce: False
Find: `WideString({arg}) + `String({arg})
Replace: `WideString({arg}) + `WideString(string({arg}))

Criteria: 15
Enabled: True
BackColor: SandyBrown
PassOnce: False
Find: Len(`String({arg}))
Replace: `Long(({arg}).length())

Criteria: 16
Enabled: True
BackColor: Gold
PassOnce: False
Find: Len(`LPCSTR({arg}))
Replace: `Long(strlen({arg}))

Criteria: 17
Enabled: True
Selected: True
PassOnce: False
Find: `{ Extended | Ext }
Replace: `Double

Criteria: 18
Comment: Highlights the inserted data type names
Pass: 3

Criteria: 19
Enabled: False
BackColor: Red
Find: ##{type:1}
Replace: {Self}

Criteria: 20
Enabled: False
Comment: This line is there to provide highlighting for clarity
Find: `{type:1}
Replace: {Self}

# End Search
