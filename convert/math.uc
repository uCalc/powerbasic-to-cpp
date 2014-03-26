# math.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.95 on 3/26/2014 4:52:38 PM
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
Comment: ^ (power)
Pass: 1

Criteria: 2
SkipOver: True
Find: ' {Comment:".*"}
Replace: [Skip over]

Criteria: 3
BackColor: Gold
Precedence: 100
Find: {x} ^ {y}  {@Note: precedence property set to 100}
Replace: pow({x}, {y})

Criteria: 4
Comment: Bitwise AND and OR
Pass: 2

Criteria: 5
SkipOver: True
Find: ' {Comment:".*"}
Replace: [Skip over]

Criteria: 6
Comment: Bitwise AND and OR
BackColor: YellowGreen
Find: ({expr})
Replace: ({@Eval: Replace(Replace('{expr}', "And", "&"), "Or", "|")})

Criteria: 7
Comment: Everything else
Pass: 3

Criteria: 8
Find: {@Start}
      {@Note:   
         ToDo:  \ exp10 frac sgn shift
               eqv imp bin hex oct Not         
      }
Replace: #include <math.h>
         #include <stdlib.h>
         {@Note: rand & srand are in stdlib.h}

Criteria: 9
SkipOver: True
Find: ' {Comment:".*"}
Replace: [Skip over]

Criteria: 10
Find: {func: Abs|Sin|Cos|Tan|Exp|Exp2|Log|Log2|Log10|Ceil}
Replace: {@Eval: LCase("{func}", "{'.*'}")}

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
BackColor: Brown
Find: Fix
Replace: PB_FIX

Criteria: 15
Find: Frac
Replace: PB_FRAC

Criteria: 16
Selected: True
BackColor: Pink
Find: Cint
Replace: (short)

Criteria: 17
Find: Int
Replace: (__int64)

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
Replace: (({x}) <> 0)

Criteria: 26
BackColor: SandyBrown
Find: IsFalse {x%} [{stop-: And | Or | Then | : }]
Replace: !({x})

Criteria: 27
BackColor: Violet
Find: <>
Replace: !=

Criteria: 28
Find: Randomize {number}
Replace: srand({number})

Criteria: 29
Find: Rnd[()]
Replace: (rand() / RAND_MAX)

Criteria: 30
Find: Rnd({a}, {b})
Replace: (rand() % ({b}) + ({a}))

Criteria: 31
Find: Shift Right {ivar}, {countexpr}
Replace: {ivar} = ({ivar} >> {countexpr})

Criteria: 32
Find: Shift Left {ivar}, {countexpr}
Replace: {ivar} = ({ivar} << {countexpr})

Criteria: 33
Find: Sgn({number})
Replace: PB_SGN({number})

Criteria: 34
Find: Max({args})
Replace: PB_MAX({args})

# End Search
