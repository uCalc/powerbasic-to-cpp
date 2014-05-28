# implicit-convert.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.96 on 5/28/2014 8:18:23 AM
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
Highlight: False
Find: 
Replace: {@Eval:
            Dim Size As Table = {
               "Byte", 1, "Word", 2, "Integer", 2, "Long", 4, "Dword", 4,
               "Single", 4, "Double", 8, "Extended", 10
            }
         }
         {@Define:
            Var: Def As String
            Var: Args As String
            Var: Before As String
            Var: After As String
            Var: UDT As Table
            Var: Size
            Var: Final
            SyntaxArgL: {number} = {number:"([0-9]*\.)?[0-9]+(e[-+]?[0-9]+)?"}
         }
         {@Define:: Token: _.*\n ~~ Properties: ucWhitespace }

Criteria: 2
Comment: Inserts data type names in front of variabls and functions
Pass: 1

Criteria: 3
Enabled: True
Highlight: False
Find: {nl}[Declare] { Function | Sub } {name~:1} [Alias {alias}] ([{args%}]) [As {ftype:1=void}]
Replace: {@Exec:
            Args = Remove("{args}", "{ Optional | ByVal | ByRef | Ptr | () | {' *_.*\n *'} }")
            Before = Replace(Args, "{arg:1} As {type:1}", "{{arg}%}")
            After = Replace(Args, "{arg:1} As {type:1}", "##{type}({{arg}})")
         
            Def  = "Pass: 1 ~~ Syntax: {name}("+Before+")"
            Def += " ::= `{ftype}({name}(" + After + "))"
         }{@Define:: {@Eval: Def}}{Self}

Criteria: 4
Enabled: True
Selected: True
Highlight: False
Find: { Global | Local | Static | Dim | , | { ByVal | ByRef } } {var:1}[([{size}])] As {type:1}
Replace: {Self}{@Define:: Pass: 1 ~~ Syntax: {var}[({i%})] ::= `{type}({var}{i:({i})})}

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
Find: {func: Asc|InStr|Len|UBound|VarPtr|StrPtr|Dir|CurDir } ({args%})
Replace: `Long({func}({args}))

Criteria: 8
Enabled: True
Highlight: False
BackColor: SlateBlue
Find: {func:
         Mid|Left|Right|Remove|Extract|Space|Hex|Oct|Bin|Dir|Min|Max|
         Remain|UCase|LCase|Trim|LTrim|RTrim|Choose|Repeat
      }$({args%})
Replace: `String({func}$({args}))

Criteria: 9
Enabled: True
Find: {nl}${equate:1}
Replace: {Self}{@Define:: Pass: 1 ~~ Syntax: ${equate} ::= `String(${equate})}

Criteria: 10
Enabled: True
Find: {nl}$${equate:1}
Replace: {Self}{@Define:: Pass: 1 ~~ Syntax: $${equate} ::= `WString($${equate})}

Criteria: 11
Enabled: True
Find: {nl}%{equate:1}
Replace: {Self}{@Define:: Pass: 1 ~~ Syntax: %{equate} ::= `Long(%{equate})}

Criteria: 12
Enabled: True
Highlight: False
BackColor: Purple
SkipOver: True
Find: {nl} { Type | Union }
         {members+}
      End {TypeOrUnion}
Replace: [Skip over]

Criteria: 13
Enabled: True
BackColor: Khaki
SkipOver: True
Find: {nl}{ # | ! | ASM } {etc} {@Note: Skips metastatements, ASM}
Replace: [Skip over]

Criteria: 14
Enabled: True
SkipOver: True
Find: ' {Comment:".*"}
Replace: [Skip over]

Criteria: 15
Comment: Convert
Pass: 2

Criteria: 16
Enabled: True
BackColor: Violet
PassOnce: False
Find: ##Asciiz(string({arg}))
Replace: `Asciiz({arg}.c_str())

Criteria: 17
Enabled: True
Find: `StringLit({arg})
Replace: `String({arg})

Criteria: 18
Enabled: True
PassOnce: False
Find: `StringLit({arg})+`StringLit({arg})
Replace: `String(string({arg})+{arg})

Criteria: 19
Enabled: True
BackColor: CornflowerBlue
PassOnce: False
Find: `WString({arg}) + `String({arg})
Replace: `WString({arg}) + `WString(string({arg}))

Criteria: 20
Enabled: True
Find: Len({other})
Replace: sizeof({other})

Criteria: 21
Enabled: True
BackColor: SandyBrown
PassOnce: False
Find: Len(`String({arg}))
Replace: string({arg}).length()

Criteria: 22
Enabled: True
BackColor: Gold
PassOnce: False
Find: Len(`LPCSTR({arg}))
Replace: `Long(strlen({arg}))

Criteria: 23
Enabled: True
PassOnce: False
Find: `{ Extended | Ext }
Replace: `Double

Criteria: 24
Enabled: True
SkipOver: True
Find: ' {Comment:".*"}
Replace: [Skip over]

Criteria: 25
Comment: Highlights the inserted data type names
Pass: 3

Criteria: 26
Enabled: True
Find: {@Start}
      {@Note:
         The use of Final is due to a limitation where immediate expansion in
         {arg%} expands with all passes causing the undesirable change in pass 3
         before it is needed.
      }
Replace: {@Exec: Final = True}

Criteria: 27
Enabled: False
BackColor: Red
Find: ##{type:1}
Replace: {Self}

Criteria: 28
Enabled: False
Comment: This line is there to provide highlighting for clarity
Find: `{type:1}
Replace: {Self}

Criteria: 29
Enabled: True
PassOnce: False
Find: { ` | ## }{type:1}({arg}) {@If: Final}
Replace: {arg}

# End Search
