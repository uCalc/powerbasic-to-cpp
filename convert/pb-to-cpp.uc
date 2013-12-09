# C:\Misc\convert.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.0 on 12/9/2013 8:54:12 AM
# Comment: Converts PB source code to C++; modified by Daniel Corbier

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique

FindMode: Replace

# Definitions


# Search Criteria

Criteria: 0
Enabled: True
Exclude: False
Comment: Converts PB source code to C++; modified by Daniel Corbier
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
Find: ' {comment~}
Replace: // {comment}

Criteria: 2
BackColor: Green
Find: {nl}%{equate} = {value%}
Replace: {nl}const int {equate} = {value};

Criteria: 3
BackColor: Green
Find: %{equate}
Replace: {equate}

Criteria: 4
BackColor: SandyBrown
Find: {"&h"}
Replace: 0x

Criteria: 5
BackColor: Green
Find: If {cond%} Then {statement%}{nl}
Replace: if ({cond}) { {statement} }{nl}

Criteria: 6
Find: If {cond%} Then {nl}
         {code%+}
      End If
Replace: if ({cond}) {
            {code}
         }

Criteria: 7
BackColor: DarkKhaki
Find: Function {name} ([{args%}]) As {type%}{nl}
         {code%+}
      End Function
Replace: {type} {name}({args}) {
            {code}
         }

Criteria: 8
Selected: True
Find: Sub {name} ([{args%}]){nl}
         {code%+}
      End Sub
Replace: void {name}({args}) {
            {code}
         }

Criteria: 9
Find: For {x} = {start} To {stop} [Step {inc=1}]{nl}
         {code%+}
      Next
Replace: for ({x}={start}; {x}{@Eval: IIF(sgn({inc})>0, '<', '>')}={stop}; x += {inc}) {
            {code}
         }

Criteria: 10
BackColor: Orange
Find: Dim {var} As {type%}
Replace: {type} {var};

Criteria: 11
BackColor: SandyBrown
PassOnce: False
Find: Dim {var1}, {more}
Replace: Dim {var1}
         Dim {more}

Criteria: 12
BackColor: DeepSkyBlue
Find: Function = {value}
Replace: return {value};

Criteria: 13
BackColor: Lime
Find: Long
Replace: long

Criteria: 14
BackColor: Red
Find: Single
Replace: float

Criteria: 15
BackColor: SlateBlue
Find: ByRef {arg} As {type%:1}
Replace: {type}& {arg}

Criteria: 16
BackColor: Pink
Find: ByVal {arg} As {type%:1}
Replace: {type} {arg}

# End Search
