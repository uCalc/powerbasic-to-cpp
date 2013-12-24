# pb-to-cpp.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.0 on 12/24/2013 3:36:28 PM
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
Comment: Handles long line break (underscore _)
Pass: 1

Criteria: 3
PassOnce: False
Find: {nl}{line} _ [{comment:".*"}] {nl}
      
Replace: {comment: ' {comment}{nl}}{nl}{line}{sp}

Criteria: 4
SkipOver: True
Find: {"[\(\)]"} {@Note: These are ( and ); must be skipped}
Replace: [Skip over]

Criteria: 5
SkipOver: True
Find: ' {comment:".*"}
Replace: [Skip over]

Criteria: 6
Comment: Processes some operators
Pass: 2

Criteria: 7
Comment: Bitwise AND and OR
Find: ({expr%})
Replace: ({@Eval: Replace(Replace(Replace("{expr}", "And", "&"), "Or", "|"), "=", "==")})

Criteria: 8
Comment: Logical (short-circuit) AND
Find: And
Replace: &&

Criteria: 9
Comment: Logical (short-circuit) OR
Find: Or
Replace: ||

Criteria: 10
Find: Xor
Replace: ^

Criteria: 11
Find: Not
Replace: ~

Criteria: 12
Find: IsFalse
Replace: !

Criteria: 13
Find: <>
Replace: !=

Criteria: 14
Find: =
Replace: ==

Criteria: 15
SkipOver: True
Find: { {nl}[%]|Then|Else|For|: } {var:" *[a-z\@\.]+"}[({index})] =
Replace: [Skip over]

Criteria: 16
SkipOver: True
Find: { #If | #ElseIf } Not
Replace: [Skip over]

Criteria: 17
Comment: 
Pass: 3

Criteria: 18
SkipOver: True
Find: // {comment~}
Replace: [Skip over]

Criteria: 19
Find: ' {comment~}
Replace: // {comment}

Criteria: 20
BackColor: Green
PassOnce: False
Find: {nl}%{equate} = {value}
Replace: {nl}const int {equate} = {value};

Criteria: 21
BackColor: Green
Find: %{equate}
Replace: {equate}

Criteria: 22
BackColor: SandyBrown
Find: {"&h"}
Replace: 0x

Criteria: 23
BackColor: Green
PassOnce: False
Find: If {cond} Then {statement} [Else {else}]{nl}
Replace: if ({cond}) { {statement} }{else: else {{else}}}{nl}

Criteria: 24
PassOnce: False
Find: If {cond} Then {nl}
         {code+}
      End If
Replace: if ({cond}) {
            {code}
         }

Criteria: 25
BackColor: DarkKhaki
PassOnce: False
Find: Function {name} ([{args}]) As {type}{nl}
         {code+}
      End Function
Replace: {type} {name}({args}) {
            {code}
         !!ReleaseDynamicArrays!!}

Criteria: 26
PassOnce: False
Find: Sub {name} ([{args}]){nl}
         {code+}
      End Sub
Replace: void {name}({args}) {
            {code}
         !!ReleaseDynamicArrays!!}

Criteria: 27
PassOnce: False
Find: For {x} = {start} To {stop} [Step {inc=1}]{nl}
         {code+}
      Next
Replace: for ({x}={start}; {x}{@Eval: IIF(sgn({inc})>0, '<', '>')}={stop}; {x} += {inc}) {
            {code}
         }

Criteria: 28
PassOnce: False
Find: While {cond} {nl}
         {code+}
      Wend
Replace: while ({cond}) {
            {code}
         }

Criteria: 29
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

Criteria: 30
BackColor: Orange
PassOnce: False
Find: { Dim | {member: {nl}}} {var:1} As {type} [{ptr: Ptr}]
Replace: {member: {nl}}{type} {ptr:*}{var};

Criteria: 31
PassOnce: False
Find: Dim {array}({subscript}) As {type}
Replace: {type} *{array} = new {type} [{subscript}+1];{@Eval:
            Insert(ArrayNames, "{array}")
         }{@Define:: Syntax: {array}({index}) ::= {array}[{index}]} 

Criteria: 32
BackColor: SandyBrown
PassOnce: False
Find: Dim {var1}, {more}
Replace: Dim {var1}
         Dim {more}

Criteria: 33
BackColor: Gold
PassOnce: False
Find: { Local | Global | Register }
Replace: Dim

Criteria: 34
Find: @
Replace: *

Criteria: 35
BackColor: Silver
Find: VarPtr({var})
Replace: &{var}

Criteria: 36
BackColor: DeepSkyBlue
PassOnce: False
Find: Function = {value}
Replace: return {value};

Criteria: 37
BackColor: Lime
Find: Long
Replace: long

Criteria: 38
BackColor: Red
Find: Single
Replace: float

Criteria: 39
Find: Double
Replace: double

Criteria: 40
BackColor: SlateBlue
PassOnce: False
Find: ByRef {arg} As {type:1}
Replace: {type}& {arg}

Criteria: 41
Selected: True
BackColor: Pink
PassOnce: False
Find: ByVal {arg} As {type:1} [{ptr: Ptr}]
Replace: {type} {ptr:*}{arg}

Criteria: 42
PassOnce: False
Find: Type {name:1}
         {members+}
      End Type
Replace: struct {name} {
            {members}
         }

Criteria: 43
Find: #If
Replace: #if

Criteria: 44
Find: #Else
Replace: #else

Criteria: 45
Find: #ElseIf
Replace: #elif

Criteria: 46
Find: #EndIf
Replace: #endif

Criteria: 47
PassOnce: False
Find: [{NOT: Not }] %Def({const})
Replace: {NOT:!}defined {const}

Criteria: 48
Comment: Adds semi-colons to statements
Pass: 4

Criteria: 49
SkipOver: True
Find: { "{" | "}" | ; | //{".*"} | #{".*"} } {nl} [{"[ \n]+"}]
Replace: [Skip over]

Criteria: 50
Find: :
Replace: ;

Criteria: 51
PassOnce: False
Find: {nl}
Replace: ;{nl}

# End Search
