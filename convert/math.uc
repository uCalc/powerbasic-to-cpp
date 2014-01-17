# math.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.5 on 1/17/2014 4:30:19 PM
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
Enabled: True
Find: {@Start}
      {@Note:   
         ToDo: ^ \ exp10 frac sgn shift
               eqv imp bin hex oct
               IsTrue IsFalse Not
               and fix LCase for next version
      }
Replace: #include <math.h>{nl}

Criteria: 2
Enabled: True
SkipOver: True
Find: ' {Comment:".*"}
Replace: [Skip over]

Criteria: 3
Enabled: False
Find: {func: Abs|Sin|Cos|Tan|Exp|Exp2|Log|Log2|Log10|Ceil}
Replace: {@Evaluate: LCase({func})}

Criteria: 4
Enabled: True
Comment: Bitwise AND and OR
BackColor: YellowGreen
Find: ({expr%})
Replace: ({@Eval: Replace(Replace('{expr}', "&&", "&"), "||", "|")})

Criteria: 5
Enabled: True
Find: Mod
Replace: %

Criteria: 6
Enabled: True
BackColor: Yellow
Find: Atn
Replace: atan

Criteria: 7
Enabled: True
BackColor: Lime
Find: Sqr
Replace: sqrt

Criteria: 8
Enabled: True
BackColor: Brown
Find: Fix
Replace: trunc

Criteria: 9
Enabled: True
BackColor: Pink
Find: Cint
Replace: lround

Criteria: 10
Enabled: True
BackColor: Red
Find: Incr {var:1}
Replace: {var}++

Criteria: 11
Enabled: True
Selected: True
BackColor: RoyalBlue
Find: Decr {var:1}
Replace: {var}--

Criteria: 12
Enabled: True
Comment: Logical (short-circuit) AND
Find: And
Replace: &&

Criteria: 13
Enabled: True
Comment: Logical (short-circuit) OR
BackColor: Purple
Find: Or
Replace: ||

Criteria: 14
Enabled: True
BackColor: Khaki
Find: Xor
Replace: ^

Criteria: 15
Enabled: True
BackColor: Green
Find: Not
Replace: ~

Criteria: 16
Enabled: True
SkipOver: True
Find: #{metastatement:1} Not
Replace: [Skip over]

Criteria: 17
Enabled: True
BackColor: Silver
Find: IsTrue {x}
Replace: ({x} <> 0)

Criteria: 18
Enabled: True
BackColor: SandyBrown
Find: IsFalse {x}
Replace: !{x}

Criteria: 19
Enabled: True
BackColor: Violet
Find: <>
Replace: !=

Criteria: 20
Enabled: False
BackColor: Gold
Precedence: 20
Find: {x} ^ {y}
Replace: pow({x}, {y})

Criteria: 21
Enabled: False
BackColor: Gold
Find: {x} { +|-|*|/|\|<|<=|>|>= } {y}
Replace: 

# End Search
