# typespecifiers.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.0 on 1/2/2014 4:45:59 PM
# Comment: Replaces data type specifiers with explicit type names

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique

FindMode: Replace

# Definitions


# Search Criteria

Criteria: 0
Enabled: True
Exclude: False
Comment: Replaces data type specifiers with explicit type names
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
Min: 0
Max: -1
MinSoft: 0
MaxSoft: -1
BatchAction: Transform
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
Highlight: False
Find: {@Note:
         This transform does the following:
      
         * Adds explicit ByRef to args w/o ByVal or ByRef
         * Changes type specifiers to type names in param
           definitions and removes them elsewhere
         * Adds data type name to params that have neither
           an explicit type name or specifier, based on
           DefType definitions
      
         The section to the immediate right defines the
         required tables and an array to accomplish this.
      
         Bug: LCase() and UCase() are re-defined on the right
              due to a problem affecting pre-existing LCase/UCase.
              That is a temp solution.
      }
Replace: {@Define:
            LineContinue: " _"
            Var: DefTypeInitial(255) As String
            Var: Specifier As Table = _
                 {"%", "Integer", "&", "Long", "&&", "Quad", _
                  "?", "Byte", "??", "Word", "???", "Dword", _
                  "!", "Single", "#", "Double", "##", "Extended", _
                  "@", "Currency", "@@", "CurrencyX", "$", "String"}
            Var: DefType As Table = _
                 {"INT", "Integer", "LNG", "Long", "QUD", "Quad", _
                 "BYT", "Byte", "WRD", "Word", "DWD", "Dword", _
                 "SNG", "Single", "DBL", "Double", "EXT", "Extended", _
                 "CUR", "Currency", "CUX", "CurrencyX", "STR", "String"}
            Var: dType="(INT|LNG|QUD|BYT|WRD|DWD|SNG|DBL|EXT|CUR|CUX|STR)\b"
            Func: LCase(c As String) As String = IIF(Asc(c) > 64 and Asc(c) < 91, Chr(Asc(c)+32), c)
            Func: UCase(c As String) As String = IIF(Asc(c) > 96 and Asc(c) < 123, Chr(Asc(c)-32), c)
         }{@Define:: Token: \x27.* ~~ Properties: ucWhitespace}

Criteria: 2
Comment: Handles DefType declarations; also inserts <Arg> marker for easier parsing
Pass: 1

Criteria: 3
Comment: Stores the DefType statement associated with character initials
Highlight: False
BackColor: Purple
Find: {"Def"}{type:"{@Eval: dType}"} {char} {nl}
Replace: {@Eval:
            SetVar(DefTypeInitial(Asc(LCase("{char}"))), ReadStr(DefType, "{type}"))
            SetVar(DefTypeInitial(Asc(UCase("{char}"))), ReadStr(DefType, "{type}"))
         }

Criteria: 4
Comment: Changes a DefType range into multiple DefType statements
Highlight: False
BackColor: SlateBlue
PassOnce: False
Find: {"Def"}{type:"{@Eval: dType}"} {from}-{to} {nl}
Replace: {@Eval: Range(Asc("{from}"), Asc("{to}"), "'Def{type} '+Chr(x)+Chr(10)")}

Criteria: 5
Comment: Break DefType statements containing commas into multiple DefStype statements (one per line)
Highlight: False
BackColor: Pink
PassOnce: False
Find: {"Def"}{type:"{@Eval: dType}"} {etc}, {more} {nl}
Replace: Def{type} {etc}
         Def{type} {more} 

Criteria: 6
Comment: Inserts <arg> marker for easier parsing
Highlight: False
BackColor: Red
Find: {nl}{decl: Sub | Function } {etc} ({args})
Replace: {nl}{decl} {etc}(<Arg>{@Eval: Replace("{args}", ",", ", <Arg>")})

Criteria: 7
Highlight: False
SkipOver: True
Find: {nl}Function =
Replace: [Skip over]

Criteria: 8
Comment: Inserts ByRef to params that have neither ByRef nor ByVal
Pass: 2

Criteria: 9
Comment: Inserts ByRef in front of params that do not explicitlly have ByVal or ByRef
Highlight: False
BackColor: SandyBrown
Find: <Arg> [{optional: Optional}] {name:1}
Replace: <Arg>{optional} ByRef {name}

Criteria: 10
Comment: Skips params that already have ByVal or ByRef
Highlight: False
BackColor: Green
SkipOver: True
Find: <Arg> [Optional] { ByVal | ByRef }
Replace: [Skip over]

Criteria: 11
Comment: Adds explicit data types to arg or variable declarations (functions also)
Pass: 3

Criteria: 12
Highlight: False
BackColor: RoyalBlue
Find: <Arg> [Optional] {by: ByVal | ByRef } {name:1}
Replace: <Arg>{by} {name} As {@Eval: DefTypeInitial(Asc("{name}"))}

Criteria: 13
Highlight: False
Find: <Arg> [Optional] {by: ByVal | ByRef } {name:1}{spec:"[!?@#$%&]+"}
Replace: <Arg>{by} {name} As {@Eval: ReadStr(Specifier, "{spec}")}

Criteria: 14
Highlight: False
SkipOver: True
Find: <Arg> [Optional] {by: ByVal | ByRef } {name:1} As
Replace: [Skip over]

Criteria: 15
Highlight: False
BackColor: Tomato
PassOnce: False
Find: {decl: Dim | Global | Local | Static } {etc} {spec:"[!?@#$%&]+"}
Replace: {decl} {etc} As {@Eval: ReadStr(Specifier, "{spec}")}

Criteria: 16
Comment: Adds the appropriate type for functions with no explicit type or specifier
Highlight: False
BackColor: CornflowerBlue
Find: {nl}Function {name:1}([{args%}])
Replace: {nl}Function {name}({args}) As {@Eval: DefTypeInitial(Asc("{name}"))}

Criteria: 17
Comment: Changes function type specifier to data type name
Highlight: False
Find: {nl}Function {name:1}{spec:"[!?@#$%&]+"}([{args%}])
Replace: {nl}Function {name}({args}) As {@Eval: ReadStr(Specifier, "{spec}")}

Criteria: 18
Comment: Skips functions that already have an explicit type
Highlight: False
BackColor: Gold
Find: {nl}Function {name}([{args%}]) As {type}
Replace: {nl}Function {name}({args}) As {type}

Criteria: 19
Comment: Cleans up; removes <Arg> marker; as well as type specifiers
Pass: 4

Criteria: 20
Comment: Removes <Arg> that was inserted in earlier pass
Highlight: False
BackColor: SandyBrown
Find: <Arg>
Replace: {Nothing}

Criteria: 21
Comment: Removes statement specifiers
Highlight: False
BackColor: Violet
Find: {variable:"[a-z0-9_]+"}{spec:"[!?@#$%&]+"}
Replace: {variable}

# End Search
