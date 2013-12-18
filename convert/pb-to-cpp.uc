# convert.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.0 on 12/18/2013 2:36:02 PM
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
Comment: 
Pass: 1

Criteria: 2
Find: 
Replace: {@Define:
            Var: Array As String
            Var: ArrayNames As Table
            Var: CleanUp As String
         }

Criteria: 3
SkipOver: True
Find: // {comment~}
Replace: [Skip over]

Criteria: 4
Find: ' {comment~}
Replace: // {comment}

Criteria: 5
BackColor: Green
PassOnce: False
Find: {nl}%{equate} = {value}
Replace: {nl}const int {equate} = {value};

Criteria: 6
BackColor: Green
Find: %{equate}
Replace: {equate}

Criteria: 7
BackColor: SandyBrown
Find: {"&h"}
Replace: 0x

Criteria: 8
BackColor: Green
PassOnce: False
Find: If {cond} Then {statement}{nl}
Replace: if ({cond}) { {statement} }{nl}

Criteria: 9
PassOnce: False
Find: If {cond} Then {nl}
         {code+}
      End If
Replace: if ({cond}) {
            {code}
         }

Criteria: 10
BackColor: DarkKhaki
PassOnce: False
Find: Function {name} ([{args}]) As {type}{nl}
         {code+}
      End Function
Replace: {type} {name}({args}) {
            {code}
         !!ReleaseDynamicArrays!!}

Criteria: 11
PassOnce: False
Find: Sub {name} ([{args}]){nl}
         {code+}
      End Sub
Replace: void {name}({args}) {
            {code}
         !!ReleaseDynamicArrays!!}

Criteria: 12
Selected: True
PassOnce: False
Find: For {x} = {start} To {stop} [Step {inc=1}]{nl}
         {code+}
      Next
Replace: for ({x}={start}; {x}{@Eval: IIF(sgn({inc})>0, '<', '>')}={stop}; {x} += {inc}) {
            {code}
         }

Criteria: 13
PassOnce: False
Find: While {cond} {nl}
         {code+}
      Wend
Replace: while ({cond}) {
            {code}
         }

Criteria: 14
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

Criteria: 15
BackColor: Orange
PassOnce: False
Find: { Dim | {member: {nl}}} {var:1} As {type} [{ptr: Ptr}]
Replace: {member: {nl}}{type} {ptr:*}{var};

Criteria: 16
PassOnce: False
Find: Dim {array}({subscript}) As {type}
Replace: {type} *{array} = new {type} [{subscript}+1];{@Eval:
            Insert(ArrayNames, "{array}")
         }{@Define:: Syntax: {array}({index}) ::= {array}[{index}]} 

Criteria: 17
BackColor: SandyBrown
PassOnce: False
Find: Dim {var1}, {more}
Replace: Dim {var1}
         Dim {more}

Criteria: 18
BackColor: Gold
PassOnce: False
Find: { Local | Global | Register }
Replace: Dim

Criteria: 19
Find: @
Replace: *

Criteria: 20
BackColor: Silver
Find: VarPtr({var})
Replace: &{var}

Criteria: 21
BackColor: DeepSkyBlue
PassOnce: False
Find: Function = {value}
Replace: return {value};

Criteria: 22
BackColor: Lime
Find: Long
Replace: long

Criteria: 23
BackColor: Red
Find: Single
Replace: float

Criteria: 24
Find: Double
Replace: double

Criteria: 25
BackColor: SlateBlue
PassOnce: False
Find: ByRef {arg} As {type:1}
Replace: {type}& {arg}

Criteria: 26
BackColor: Pink
PassOnce: False
Find: ByVal {arg} As {type:1}
Replace: {type} {arg}

Criteria: 27
PassOnce: False
Find: Type {name:1}
         {members+}
      End Type
Replace: struct {name} {
            {members}
         }

Criteria: 28
Find: #If
Replace: #if

Criteria: 29
Find: #Else
Replace: #else

Criteria: 30
Find: #ElseIf
Replace: #elif

Criteria: 31
Find: #EndIf
Replace: #endif

Criteria: 32
PassOnce: False
Find: [{NOT: Not }] %Def({const})
Replace: {NOT:!}defined {const}

Criteria: 33
Comment: Adds semi-colons to statements
Pass: 2

Criteria: 34
SkipOver: True
Find: { "{" | "}" | ; | //{".*"} | #{".*"} } {nl} [{"[ \n]+"}]
Replace: [Skip over]

Criteria: 35
Find: :
Replace: ;

Criteria: 36
PassOnce: False
Find: {nl}
Replace: ;{nl}

# End Search
