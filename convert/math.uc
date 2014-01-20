# math.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.5 on 1/20/2014 4:50:16 PM
# Comment: Converts math-related code from PowerBASIC to C++

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique

FindMode: Replace

# Definitions


# Search Criteria

Criteria: 0
Enabled: False
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
Comment: ^ (power)
Pass: 1

Criteria: 2
Enabled: True
SkipOver: True
Find: ' {Comment:".*"}
Replace: [Skip over]

Criteria: 3
Enabled: True
BackColor: Gold
Precedence: 100
Find: {x} ^ {y}  {@Note: precedence property set to 100}
Replace: pow({x}, {y})

Criteria: 4
Comment: Bitwise AND and OR
Pass: 2

Criteria: 5
Enabled: True
SkipOver: True
Find: ' {Comment:".*"}
Replace: [Skip over]

Criteria: 6
Enabled: True
Comment: Bitwise AND and OR
BackColor: YellowGreen
Find: ({expr})
Replace: ({@Eval: Replace(Replace('{expr}', "And", "&"), "Or", "|")})

Criteria: 7
Comment: Everything else
Pass: 3

Criteria: 8
Enabled: True
Selected: True
Find: {@Start}
      {@Note:   
         ToDo:  \ exp10 frac sgn shift
               eqv imp bin hex oct Not
               and fix LCase for next version
      }
Replace: #include <math.h>{nl}

Criteria: 9
Enabled: True
SkipOver: True
Find: ' {Comment:".*"}
Replace: [Skip over]

Criteria: 10
Enabled: False
Find: {func: Abs|Sin|Cos|Tan|Exp|Exp2|Log|Log2|Log10|Ceil}
Replace: {@Evaluate: LCase({func})}

Criteria: 11
Enabled: True
Find: Mod
Replace: %

Criteria: 12
Enabled: True
BackColor: Yellow
Find: Atn
Replace: atan

Criteria: 13
Enabled: True
BackColor: Lime
Find: Sqr
Replace: sqrt

Criteria: 14
Enabled: True
BackColor: Brown
Find: Fix
Replace: trunc

Criteria: 15
Enabled: True
BackColor: Pink
Find: Cint
Replace: lround

Criteria: 16
Enabled: True
BackColor: Red
Find: Incr {var:1}
Replace: {var}++

Criteria: 17
Enabled: True
BackColor: RoyalBlue
Find: Decr {var:1}
Replace: {var}--

Criteria: 18
Enabled: True
Comment: Logical (short-circuit) AND
Find: And
Replace: &&

Criteria: 19
Enabled: True
Comment: Logical (short-circuit) OR
BackColor: Purple
Find: Or
Replace: ||

Criteria: 20
Enabled: True
BackColor: Khaki
Find: Xor
Replace: ^

Criteria: 21
Enabled: True
BackColor: Green
Find: Not
Replace: ~

Criteria: 22
Enabled: True
SkipOver: True
Find: #{metastatement:1} Not
Replace: [Skip over]

Criteria: 23
Enabled: True
BackColor: Silver
Find: IsTrue {x}
Replace: ({x} <> 0)

Criteria: 24
Enabled: True
BackColor: SandyBrown
Find: IsFalse {x}
Replace: !{x}

Criteria: 25
Enabled: True
BackColor: Violet
Find: <>
Replace: !=

# End Search
