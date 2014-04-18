# math.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.95 on 4/18/2014 5:09:17 PM
# Comment: Converts math-related code from PowerBASIC to C++

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, InputFile, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique, FilterTally

FindMode: Replace

# Definitions


# Search Criteria

Criteria: 0
Enabled: True
Exclude: False
Comment: Converts math-related code from PowerBASIC to C++
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
Find: 
Replace: {@Var: Type As String}

Criteria: 2
Comment: ^ (power)
Pass: 1

Criteria: 3
SkipOver: True
Find: ' {Comment:".*"}
Replace: [Skip over]

Criteria: 4
BackColor: Gold
Precedence: 100
Find: {x} ^ {y}  {@Note: precedence property set to 100}
Replace: pow({x}, {y})

Criteria: 5
Comment: Bitwise AND and OR
Pass: 2

Criteria: 6
SkipOver: True
Find: ' {Comment:".*"}
Replace: [Skip over]

Criteria: 7
Comment: Bitwise AND and OR
BackColor: YellowGreen
Find: ({expr})
Replace: ({@Evaluate: Replace(Replace({expr}, "And", "&"), "Or", "|")})

Criteria: 8
Comment: Everything else
Pass: 3

Criteria: 9
Find: {@Start}
      {@Note: ToDo: \ eqv imp bin }
Replace: #include <cmath>
         #include <cstdlib>
         {@Note: rand & srand are in cstdlib}

Criteria: 10
SkipOver: True
Find: ' {Comment:".*"}
Replace: [Skip over]

Criteria: 11
Find: Mod
Replace: %

Criteria: 12
BackColor: Yellow
Find: Atn
Replace: atan

Criteria: 13
BackColor: Lime
Find: Sqr
Replace: sqrt

Criteria: 14
Selected: True
BackColor: Pink
Find: Cint
Replace: (__int16)

Criteria: 15
Find: Int({arg})
Replace: (__int64)({arg})

Criteria: 16
BackColor: Red
Find: Incr {var:1}
Replace: {var}++

Criteria: 17
BackColor: RoyalBlue
Find: Decr {var:1}
Replace: {var}--

Criteria: 18
Comment: Logical (short-circuit) AND
Find: And
Replace: &&

Criteria: 19
Comment: Logical (short-circuit) OR
BackColor: Purple
Find: Or
Replace: ||

Criteria: 20
BackColor: Khaki
Find: Xor
Replace: ^

Criteria: 21
BackColor: Green
Find: Not
Replace: ~

Criteria: 22
SkipOver: True
Find: #{metastatement:1} Not
Replace: [Skip over]

Criteria: 23
BackColor: Silver
Find: IsTrue {x%}  [{stop-: And | Or | Then | : }]
Replace: (({x}) <> 0)

Criteria: 24
BackColor: SandyBrown
Find: IsFalse {x%} [{stop-: And | Or | Then | : }]
Replace: !({x})

Criteria: 25
BackColor: Violet
Find: <>
Replace: !=

Criteria: 26
Find: Randomize {number}
Replace: srand({number})

Criteria: 27
Find: Rnd[()]
Replace: (rand() / RAND_MAX)

Criteria: 28
Find: Rnd({a}, {b})
Replace: (rand() % ({b}) + ({a}))

Criteria: 29
Find: Shift Right {ivar}, {countexpr}
Replace: {ivar} = ({ivar} >> {countexpr})

Criteria: 30
Find: Shift Left {ivar}, {countexpr}
Replace: {ivar} = ({ivar} << {countexpr})

Criteria: 31
Find: {func: Abs|Sin|Cos|Tan|Exp|Exp2|Log|Log2|Log10|Ceil}
Replace: {@Evaluate: LCase("{func}", "{'.*'}")}

Criteria: 32
Find: {func: Exp10 | Fix | Frac | Sgn}
Replace: PB_{@Evaluate: UCase("{func}", "{'.*'}")}

Criteria: 33
PassOnce: False
Find: {func: Min | Max}[{ {int: &} | {str: $} | {dbl: } }]
      ({args})
Replace: PB_{@Evaluate:
            Type = "(double)"
            IIf("{int}" <> "", Type = "(int)")
            IIf("{str}" <> "", Type = "(string)")
            UCase("{func}", "{'.*'}")
         }{int:_INT}{str:_STR}(ARGCOUNT({@Evaluate: 
         Tally({args}, ",", Skip("({nest})"))+1}), {@Evaluate:
         Type + Replace({args}, ",", ", "+Type, Skip("({nest})"))})

# End Search
