# math.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.96 on 6/17/2014 7:44:29 PM
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
Find: {x%} ^ {y%}  {@Note: precedence property set to 100}
Replace: pow({x}, {y})

Criteria: 5
Precedence: 60
Find: {x%} \ {y%}  {@Note: precedence property set to 60}
Replace: _round({x} / {y})

Criteria: 6
Precedence: 60
Find: {x%} mod {y%}
Replace: Long({x}) mod {y}

Criteria: 7
Precedence: 19
Find: {x%} Eqv {y%}
Replace: PB_EQV({x}, {y})

Criteria: 8
Precedence: 18
Find: {x%} Imp {y%}
Replace: PB_IMP({x}, {y})

Criteria: 9
Precedence: 20
Find: {x%} Xor {y%}
Replace: PB_XOR({x}, {y})

Criteria: 10
Precedence: 1
Find: To {etc%}
Replace: To {etc}

Criteria: 11
Find: If {cond%} Then
Replace: If {cond} Then

Criteria: 12
Find: {nl} {var:1} = {etc%}
Replace: {nl} {var} = {etc} {@Note: Must fix >=}

Criteria: 13
Comment: Bitwise AND and OR
Pass: 2

Criteria: 14
SkipOver: True
Find: ' {Comment:".*"}
Replace: [Skip over]

Criteria: 15
Comment: Bitwise AND and OR
BackColor: YellowGreen
Find: ({expr})
Replace: ({@Evaluate: Replace(Replace({expr}, "And", "&"), "Or", "|")})

Criteria: 16
Comment: Everything else
Pass: 3

Criteria: 17
SkipOver: True
Find: ' {Comment:".*"}
Replace: [Skip over]

Criteria: 18
Find: Mod
Replace: %

Criteria: 19
BackColor: Yellow
Find: Atn
Replace: atan

Criteria: 20
BackColor: Lime
Find: Sqr
Replace: sqrt

Criteria: 21
BackColor: Pink
Find: Cint
Replace: Integer

Criteria: 22
Find: Int(
Replace: __int64(

Criteria: 23
BackColor: Red
Find: Incr {var:1}
Replace: {var}++

Criteria: 24
BackColor: RoyalBlue
Find: Decr {var:1}
Replace: {var}--

Criteria: 25
Comment: Logical (short-circuit) AND
Find: And
Replace: &&

Criteria: 26
Comment: Logical (short-circuit) OR
BackColor: Purple
Find: Or
Replace: ||

Criteria: 27
Selected: True
BackColor: Green
Find: Not
Replace: ~

Criteria: 28
SkipOver: True
Find: #{metastatement:1} Not
Replace: [Skip over]

Criteria: 29
BackColor: Silver
Find: IsTrue {x%}  [{stop-: And | Or | Then | : }]
Replace: (({x}) != 0)

Criteria: 30
BackColor: SandyBrown
Find: IsFalse {x%} [{stop-: And | Or | Then | : }]
Replace: !({x})

Criteria: 31
BackColor: Violet
Find: <>
Replace: !=

Criteria: 32
Find: Randomize {number%}
Replace: srand({number})

Criteria: 33
Find: Rnd[()]
Replace: (rand() / RAND_MAX)

Criteria: 34
Find: Rnd({a%}, {b%})
Replace: (rand() % ({b}) + ({a}))

Criteria: 35
Find: Shift Right {ivar}, {countexpr%}
Replace: {ivar} = ({ivar} >> {countexpr})

Criteria: 36
Find: Shift Left {ivar}, {countexpr%}
Replace: {ivar} = ({ivar} << {countexpr})

Criteria: 37
Find: {func: Abs|Sin|Cos|Tan|Exp|Exp2|Log|Log2|Log10|Ceil}
Replace: {@Evaluate: LCase("{func}", "{'.*'}")}

Criteria: 38
Find: {func: Exp10 | Fix | Frac | Sgn}
Replace: PB_{@Evaluate: UCase("{func}", "{'.*'}")}

Criteria: 39
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

Criteria: 40
Find: )()
Replace: ){@Note:
            because of problem "between = {etc#%}" in pass 1
            & Rnd which leaves a stray ()
         }

# End Search
