# convert.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.0 on 12/17/2013 2:30:45 PM
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
Find: 
Replace: {@Define:
            Var: Array As String
            Var: ArrayNames As Table
            Var: CleanUp As String
         }

Criteria: 2
SkipOver: True
Find: // {comment~}
Replace: [Skip over]

Criteria: 3
Find: ' {comment~}
Replace: // {comment}

Criteria: 4
BackColor: Green
Find: {nl}%{equate} = {value%}
Replace: {nl}const int {equate} = {value};

Criteria: 5
BackColor: Green
Find: %{equate}
Replace: {equate}

Criteria: 6
BackColor: SandyBrown
Find: {"&h"}
Replace: 0x

Criteria: 7
BackColor: Green
Find: If {cond%} Then {statement%}{nl}
Replace: if ({cond}) { {statement} }{nl}

Criteria: 8
Find: If {cond%} Then {nl}
         {code%+}
      End If
Replace: if ({cond}) {
            {code}
         }

Criteria: 9
BackColor: DarkKhaki
PassOnce: False
Find: Function {name} ([{args}]) As {type}{nl}
         {code%+}
      End Function
Replace: {type} {name}({args}) {
            {code}
         !!ReleaseDynamicArrays!!}

Criteria: 10
PassOnce: False
Find: Sub {name} ([{args}]){nl}
         {code%+}
      End Sub
Replace: void {name}({args}) {
            {code}
         !!ReleaseDynamicArrays!!}

Criteria: 11
Find: For {x} = {start} To {stop} [Step {inc=1}]{nl}
         {code+}
      Next
Replace: for ({x}={start}; {x}{@Eval: IIF(sgn({inc})>0, '<', '>')}={stop}; {x} += {inc}) {
            {code}
         }

Criteria: 12
Find: While {cond%} {nl}
         {code+}
      Wend
Replace: while ({cond}) {
            {code}
         }

Criteria: 13
Find: !!ReleaseDynamicArrays!!
Replace: {@Eval:
            CleanUp = ""
            Array = ReadKey(ArrayNames, x)
            uc_For(x, 1, Count(ArrayNames), 1,
               CleanUp=CleanUp+"delete[] "+Array+";{nl}"
               Delete(ArrayNames, Array)      
            )
            CleanUp
         }

Criteria: 14
BackColor: Orange
Find: { Dim | {member: {nl}}} {var:1} As {type%} [{ptr: Ptr}]
Replace: {member: {nl}}{type} {ptr:*}{var};

Criteria: 15
Find: Dim {array}({subscript}) As {type%}
Replace: {type} *{array} = new {type} [{subscript}+1];{@Eval:
            Insert(ArrayNames, "{array}")
         }{@Define:: Syntax: {array}({index}) ::= {array}[{index}]} 

Criteria: 16
BackColor: SandyBrown
PassOnce: False
Find: Dim {var1}, {more}
Replace: Dim {var1}
         Dim {more}

Criteria: 17
BackColor: Gold
PassOnce: False
Find: { Local | Global | Register }
Replace: Dim

Criteria: 18
Find: @
Replace: *

Criteria: 19
BackColor: Silver
Find: VarPtr({var})
Replace: &{var}

Criteria: 20
BackColor: DeepSkyBlue
Find: Function = {value%}
Replace: return {value};

Criteria: 21
BackColor: Lime
Find: Long
Replace: long

Criteria: 22
BackColor: Red
Find: Single
Replace: float

Criteria: 23
Find: Double
Replace: double

Criteria: 24
BackColor: SlateBlue
Find: ByRef {arg} As {type%:1}
Replace: {type}& {arg}

Criteria: 25
BackColor: Pink
Find: ByVal {arg} As {type%:1}
Replace: {type} {arg}

Criteria: 26
Find: Type {name:1}
         {members%+}
      End Type
Replace: struct {name} {
            {members}
         }

Criteria: 27
Find: #If
Replace: #if

Criteria: 28
Find: #Else
Replace: #else

Criteria: 29
Find: #ElseIf
Replace: #elif

Criteria: 30
Find: #EndIf
Replace: #endif

Criteria: 31
Selected: True
Find: [{NOT: Not }] %Def({const%})
Replace: {NOT:!}defined {const}

# End Search
