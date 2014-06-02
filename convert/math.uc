# math.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.96 on 6/2/2014 5:32:38 PM
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
         {@Note: rand & srand are in <cstdlib>, the others in <cmath>}
         {@Note: ToDo: \ eqv imp bin }

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
Precedence: 60
Find: {x} \ {y}  {@Note: precedence property set to 60}
Replace: _round({x} / {y})

Criteria: 6
Precedence: 60
Find: {x} mod {y}
Replace: Long({x}) mod {y}

Criteria: 7
Selected: True
Precedence: 1
Find: {sep: = | If | To} {etc#%}
Replace: {sep} {etc}

Criteria: 8
Comment: Bitwise AND and OR
Pass: 2

Criteria: 9
SkipOver: True
Find: ' {Comment:".*"}
Replace: [Skip over]

Criteria: 10
Comment: Bitwise AND and OR
BackColor: YellowGreen
Find: ({expr})
Replace: ({@Evaluate: Replace(Replace({expr}, "And", "&"), "Or", "|")})

Criteria: 11
Comment: Everything else
Pass: 3

Criteria: 12
SkipOver: True
Find: ' {Comment:".*"}
Replace: [Skip over]

Criteria: 13
Find: Mod
Replace: %

Criteria: 14
BackColor: Yellow
Find: Atn
Replace: atan

Criteria: 15
BackColor: Lime
Find: Sqr
Replace: sqrt

Criteria: 16
BackColor: Pink
Find: Cint
Replace: Integer

Criteria: 17
Find: Int(
Replace: __int64(

Criteria: 18
BackColor: Red
Find: Incr {var:1}
Replace: {var}++

Criteria: 19
BackColor: RoyalBlue
Find: Decr {var:1}
Replace: {var}--

Criteria: 20
Comment: Logical (short-circuit) AND
Find: And
Replace: &&

Criteria: 21
Comment: Logical (short-circuit) OR
BackColor: Purple
Find: Or
Replace: ||

Criteria: 22
BackColor: Khaki
Find: Xor
Replace: ^

Criteria: 23
BackColor: Green
Find: Not
Replace: ~

Criteria: 24
SkipOver: True
Find: #{metastatement:1} Not
Replace: [Skip over]

Criteria: 25
BackColor: Silver
Find: IsTrue {x%}  [{stop-: And | Or | Then | : }]
Replace: (({x}) != 0)

Criteria: 26
BackColor: SandyBrown
Find: IsFalse {x%} [{stop-: And | Or | Then | : }]
Replace: !({x})

Criteria: 27
BackColor: Violet
Find: <>
Replace: !=

Criteria: 28
Find: Randomize {number%}
Replace: srand({number})

Criteria: 29
Find: Rnd[()]
Replace: (rand() / RAND_MAX)

Criteria: 30
Find: Rnd({a%}, {b%})
Replace: (rand() % ({b}) + ({a}))

Criteria: 31
Find: Shift Right {ivar}, {countexpr%}
Replace: {ivar} = ({ivar} >> {countexpr})

Criteria: 32
Find: Shift Left {ivar}, {countexpr%}
Replace: {ivar} = ({ivar} << {countexpr})

Criteria: 33
Find: {func: Abs|Sin|Cos|Tan|Exp|Exp2|Log|Log2|Log10|Ceil}
Replace: {@Evaluate: LCase("{func}", "{'.*'}")}

Criteria: 34
Find: {func: Exp10 | Fix | Frac | Sgn}
Replace: PB_{@Evaluate: UCase("{func}", "{'.*'}")}

Criteria: 35
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

Criteria: 36
Find: )()
Replace: ){@Note:
            because of problem "between = {etc#%}" in pass 1
            & Rnd which leaves a stray ()
         }

# End Search
