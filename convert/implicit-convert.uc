# implicit-convert.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.98 on 7/11/2014 8:18:09 AM
# Comment: Handles implicit data type conversions

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, InputFile, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique, FilterTally

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
            Var: Variables As Table
            SyntaxArgL: {number} = {number:"([0-9]*\.)?[0-9]+(e[-+]?[0-9]+)?"}
         }
         {@Define:: Token: _.*\n ~~ Properties: ucWhitespace }

Criteria: 2
Comment: Inserts data type names in front of variabls and functions
Pass: 1

Criteria: 3
Highlight: False
Find: {nl}[Declare] { Function | Sub } {name~:1} [Alias {alias}] ([{args%}]) [As {ftype:1=void}]
Replace: {@Exec:
            Args = Remove("{args}", "{ Optional | ByVal | () | {' *_.*\n *'} }")
            Before = Replace(Args, "[ByRef] {arg:1} As {type:1} [Ptr]", "{{arg}%}")
            After = Replace(Args, "ByRef {arg:1} As {type:1}", "ByRef({arg} As {type})")
            After = Replace(After, "{arg:1} As {type:1} Ptr", "Ptr({arg} As {type})")
            After = Replace(After, "{arg:1} As {type:1}", "##{type}({{arg}})")
         
            Def  = "Pass: 1 ~~ Syntax: {name}("+Before+")"
            Def += " ::= `{ftype}({name}(" + After + "))"
         }{@Define:: {@Eval: Def}}{Self}

Criteria: 4
Highlight: False
Find: { Global | Local | Static | Dim | , | { ByVal | ByRef } } {var:1}[([{size}])] As {type:1}
Replace: {Self}{@Execute: Insert(Variables, {var})
         }{@Define:: Pass: 1 ~~ Syntax: {var} ::= `{type}({var})
         }{@Define:: Pass: 1 ~~ Syntax: {var}([{i%}]) ::= `{type}({var}({i}))}

Criteria: 5
Highlight: False
Find: {number}
Replace: {@Eval: IIf(Int({number})=={number}, "`Long({number})", "`Extended({number})")}

Criteria: 6
Highlight: False
BackColor: RoyalBlue
Find: {q}{text}{q}
Replace: `StringLit({Self})

Criteria: 7
Highlight: False
BackColor: Pink
Find: {func: Asc|InStr|Len|UBound|VarPtr|StrPtr|Ceil|Int } ({args%})
Replace: `Long({func}({args}))

Criteria: 8
Find: {func: Sin|Cos|Tan|Atn|Exp|Exp2|Exp10|Log|Log2|Log10|Abs } ({args%})
Replace: `Extended({func}({args}))

Criteria: 9
Highlight: False
BackColor: SlateBlue
Find: {func:
         Mid|Left|Right|Remove|Extract|Space|Hex|Oct|Bin|Dir|Min|Max|
         Remain|UCase|LCase|Trim|LTrim|RTrim|Choose|Repeat|Dir|CurDir
      }$({args%})
Replace: `String({func}$({args}))

Criteria: 10
Find: {nl}${equate:1}
Replace: {Self}{@Define:: Pass: 1 ~~ Syntax: ${equate} ::= `String(${equate})}

Criteria: 11
Find: {nl}$${equate:1}
Replace: {Self}{@Define:: Pass: 1 ~~ Syntax: $${equate} ::= `WString($${equate})}

Criteria: 12
Find: {nl}%{equate:1}
Replace: {Self}{@Define:: Pass: 1 ~~ Syntax: %{equate} ::= `Long(%{equate})}

Criteria: 13
Highlight: False
BackColor: Purple
SkipOver: True
Find: {nl} { Type | Union }
         {members+}
      End {TypeOrUnion}
Replace: [Skip over]

Criteria: 14
BackColor: Khaki
SkipOver: True
Find: {nl}{ # | ! | ASM } {etc} {@Note: Skips metastatements, ASM}
Replace: [Skip over]

Criteria: 15
SkipOver: True
Find: ' {Comment:".*"}
Replace: [Skip over]

Criteria: 16
Comment: Convert
Pass: 2

Criteria: 17
BackColor: Violet
PassOnce: False
Find: ##Asciiz(string({arg}))
Replace: `Asciiz({arg}.c_str())

Criteria: 18
Find: `StringLit({arg})
Replace: `String({arg})

Criteria: 19
PassOnce: False
Find: `StringLit({arg1})+`StringLit({arg2})
Replace: `String(string({arg1})+{arg2})

Criteria: 20
BackColor: CornflowerBlue
PassOnce: False
Find: `WString({arg1}) + `StringLit({arg2})
Replace: `WString({arg1}) + `WString(L{arg2})

Criteria: 21
Find: Len({other})
Replace: sizeof({other})

Criteria: 22
BackColor: SandyBrown
PassOnce: False
Find: Len(`String({arg}))
Replace: string({arg}).length()

Criteria: 23
BackColor: Gold
PassOnce: False
Find: Len(`LPCSTR({arg}))
Replace: `Long(strlen({arg}))

Criteria: 24
PassOnce: False
Find: `{ Extended | Ext }
Replace: `Double

Criteria: 25
SkipOver: True
Find: ' {Comment:".*"}
Replace: [Skip over]

Criteria: 26
Comment: Handles ByRef and removes temp characters
Pass: 3

Criteria: 27
Selected: True
Find: {@Start}
      {@Note:
         The use of Final is due to a limitation where immediate expansion in
         {arg%} expands all passes causing the undesirable change in pass 3
         before it is needed.
      }
Replace: {@Exec: Final = True}

Criteria: 28
PassOnce: False
Find: ByRef(##{RequiredType}({arg}))  {@If: Final}
Replace: lvalue({RequiredType}({arg}))

Criteria: 29
PassOnce: False
Find: ByRef(##{RequiredType}(`{ActualType}({scalar:1}[()])))
      {@If: Final == True And Index(Variables, {scalar}) <> 0}
Replace: {scalar}

Criteria: 30
PassOnce: False
Find: ByRef(##{RequiredType}(`{ActualType}({array:1}({index}))))
      {@If: Final == True And Index(Variables, {array}) <> 0}
Replace: {array}({index})

Criteria: 31
PassOnce: False
Find: Ptr(##{RequiredType}({arg}))
Replace: ({RequiredType} *)({arg})

Criteria: 32
PassOnce: False
Find: { ` | ## }{type:1}({arg}) {@If: Final}
Replace: {arg}

# End Search
