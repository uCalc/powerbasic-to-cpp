# typespecifiers.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.96 on 5/13/2014 5:08:40 PM
# Comment: Replaces data type specifiers with explicit type names

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, InputFile, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique, FilterTally

FindMode: Replace

# Definitions


# Search Criteria

Criteria: 0
Enabled: True
Exclude: False
Comment: Replaces data type specifiers with explicit type names
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
                  "?", "Byte", "??", "Word", "???", "DWORD", _
                  "!", "Single", "#", "double", "##", "Extended", _
                  "@", "Currency", "@@", "CurrencyX", _
                  "$", "string", "$$", "wstring"}
            Var: DefType As Table = _
                 {"INT", "Integer", "LNG", "Long", "QUD", "Quad", _
                 "BYT", "Byte", "WRD", "Word", "DWD", "Dword", _
                 "SNG", "Single", "DBL", "Double", "EXT", "Extended", _
                 "CUR", "Currency", "CUX", "CurrencyX", "STR", "String"}
            Var: dType="(INT|LNG|QUD|BYT|WRD|DWD|SNG|DBL|EXT|CUR|CUX|STR)\b"
            Func: Round(x) = Sgn(x)*Int(Abs(x)+0.5)
         }{@Define:: Token: \x27.* ~~ Properties: ucWhitespace}

Criteria: 2
Comment: Handles DefType declarations; also inserts <Arg> marker for easier parsing
Pass: 1

Criteria: 3
Comment: Stores the DefType statement associated with character initials
BackColor: Purple
Find: {"Def"}{type:"{@Eval: dType}"} {char} {nl}
Replace: {@Evaluate:
            SetVar(DefTypeInitial(Asc(LCase({char}))), ReadStr(DefType, {type}))
            SetVar(DefTypeInitial(Asc(UCase({char}))), ReadStr(DefType, {type}))
         }

Criteria: 4
Comment: Changes a DefType range into multiple DefType statements
BackColor: SlateBlue
PassOnce: False
Find: {"Def"}{type:"{@Eval: dType}"} {from}-{to} {nl}
Replace: {@Eval: Range(Asc("{from}"), Asc("{to}"), "'Def{type} '+Chr(x)+Chr(10)")}

Criteria: 5
Comment: Break DefType statements containing commas into multiple DefStype statements (one per line)
BackColor: Pink
PassOnce: False
Find: {"Def"}{type:"{@Eval: dType}"} {etc}, {more} {nl}
Replace: Def{type} {etc}
         Def{type} {more} 

Criteria: 6
Comment: Inserts <arg> marker for easier parsing
BackColor: Red
Find: {nl} [ {d: Declare} ] {decl: Sub | Function } {etc} ({args})
Replace: {nl}{d} {decl} {etc}(<Arg>{@Evaluate: Replace({args}, ",", ", <Arg>")})

Criteria: 7
SkipOver: True
Find: {nl}Function =
Replace: [Skip over]

Criteria: 8
Comment: Inserts ByRef to params that have neither ByRef nor ByVal
Pass: 2

Criteria: 9
Comment: Inserts ByRef in front of params that do not explicitlly have ByVal or ByRef
BackColor: SandyBrown
Find: <Arg> [{optional: Optional}] {name:1}
Replace: <Arg>{optional} ByRef {name}

Criteria: 10
Comment: Skips params that already have ByVal or ByRef
BackColor: Green
SkipOver: True
Find: <Arg> [Optional] { ByVal | ByRef }
Replace: [Skip over]

Criteria: 11
Comment: Adds explicit data types to arg or variable declarations (functions also)
Pass: 3

Criteria: 12
BackColor: RoyalBlue
Find: <Arg> [Optional] {by: ByVal | ByRef } {name:1}
Replace: <Arg>{by} {name} As {@Evaluate: DefTypeInitial(Asc({name}))}

Criteria: 13
Find: <Arg> [Optional] {by: ByVal | ByRef } {name:1}{spec:"[!?@#$%&]+"}
Replace: <Arg>{by} {name} As {@Evaluate: ReadStr(Specifier, {spec})}

Criteria: 14
SkipOver: True
Find: <Arg> [Optional] {by: ByVal | ByRef } {name:1}[()] As
Replace: [Skip over]

Criteria: 15
Find: Dim {var:1}{comment:" *'.*"}{nl}
Replace: Dim {var} As {@Evaluate: DefTypeInitial(Asc({var}))}{comment}{nl}

Criteria: 16
BackColor: Tomato
PassOnce: False
Find: {decl: Dim|Global|Local|Static|Register}{etc}{spec:"[!?@#$%&]+"}
Replace: {decl} {etc} As {@Evaluate: ReadStr(Specifier, {spec})}

Criteria: 17
Comment: Adds the appropriate type for functions with no explicit type or specifier
BackColor: CornflowerBlue
Find: {nl} [{decl: Declare}] Function {name:1} [As {alias}] ([{args%}])
Replace: {nl}{decl} Function {name}({args}) As {@Evaluate: DefTypeInitial(Asc({name}))}

Criteria: 18
Comment: Changes function type specifier to data type name
Find: {nl} [{decl: Declare}] Function {name:1}{spec:"[!?@#$%&]+"} [As {alias}] ([{args%}])
Replace: {nl}{decl} Function {name}({args}) As {@Evaluate: ReadStr(Specifier, {spec})}

Criteria: 19
Comment: Skips functions that already have an explicit type
Selected: True
BackColor: Gold
Find: {nl} [{decl: Declare}] Function {name} [As {alias}] ([{args%}]) As {type}
Replace: {nl}{decl} Function {name}({args}) As {type}

Criteria: 20
Find: As {type:1}([{arraysize}])
Replace: ({arraysize}) As {type}

Criteria: 21
Comment: Cleans up; removes <Arg> marker; as well as type specifiers
Pass: 4

Criteria: 22
Comment: Removes <Arg> that was inserted in earlier pass
BackColor: SandyBrown
Find: <Arg>
Replace: {Nothing}

Criteria: 23
Comment: Removes statement specifiers
BackColor: Violet
Find: {variable:"[a-z][a-z0-9_]*"}{spec:"[!?@#$%&]+"}
Replace: {variable}

Criteria: 24
SkipOver: True
Find: {@Eval: "{'"+Retain(FileText("PBKeywords.txt"), "{keyword:'.*'}", Delim("\b|"))+"\b'}"}
Replace: [Skip over]

Criteria: 25
Find: {num:"([0-9]*\.)?[0-9]+(e[-+]?[0-9]+)?"}
      { {single: !} | {ext: #[#]} }
      
Replace: {num}{@Evaluate:
            IIf(Val({num})==Int(Val({num})), ".0")   
         }{single:F}

Criteria: 26
Find: {num:"([0-9]*\.)?[0-9]+(e[-+]?[0-9]+)?"}
      { {quad: &&}|{long: &}|{dword: ???} }
Replace: {@Eval: Round({num})}{long: }{dword:U}{quad:L}

Criteria: 27
Find: {num:"&h[0-9a-f]+"}{ {quad: &&}|{long: &}|{dword: ???} }
Replace: {num}{long: }{dword:U}{quad:L}

Criteria: 28
Find: {text:"\q[^\q]*\q"}$$
Replace: L{text}

Criteria: 29
Comment: Accommodates array passed as arg
Pass: 5

Criteria: 30
Find: As ()
Replace: ()

# End Search
