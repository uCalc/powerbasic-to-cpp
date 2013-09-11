# pb-to-cpp.uc - uCalc Transformation file
# This file was saved with uCalc Transform 1.8 on 9/10/2013 8:50:47 PM
# Comment: Converts PB source code to C++; modified by Daniel Corbier

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterStartText, FilterUnique

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
BackColor: DarkKhaki
Find: Function {name} ([{args%}]) As {type%}{nl}
         {code%+}
      End Function
Replace: {type} {name}({args}) {
            {code}
         }

Criteria: 2
BackColor: Green
Find: If {cond} Then {statement%}{nl}
Replace: if ({cond}) { {statement} }{nl}

Criteria: 3
Find: If {cond} Then {nl}
         {code%+}
      End If
Replace: if ({cond}) {
            {code}
         }

Criteria: 4
Find: For {x} = {start} To {stop} [Step {inc=1}]{nl}
         {code%+}
      Next
Replace: for ({x}={start}; {x}{@Eval: IIF(sgn({inc})>0, '<', '>')}={stop}; x += {inc}) {
            {code}
         }

Criteria: 5
BackColor: Orange
Find: Dim {var} As {type%}
Replace: {type} {var};

Criteria: 6
BackColor: SandyBrown
PassOnce: False
Find: Dim {var1}, {more}
Replace: Dim {var1}
         Dim {more}

Criteria: 7
BackColor: DeepSkyBlue
Find: Function = {value}
Replace: return {value};

Criteria: 8
BackColor: Lime
Find: Long
Replace: long

Criteria: 9
BackColor: Red
Find: Single
Replace: float

Criteria: 10
BackColor: SlateBlue
Find: ByRef {arg} As {type%:1}
Replace: {type}& {arg}

Criteria: 11
BackColor: Pink
Find: ByVal {arg} As {type%:1}
Replace: {type} {arg}

# End Search
