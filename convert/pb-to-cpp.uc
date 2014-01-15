# pb-to-cpp.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.5 on 1/14/2014 7:19:30 PM
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
Highlight: False
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
Highlight: True
PassOnce: False
Find: {@Start}
Replace: // This file ({@Eval: Extract(ShortName(InputFile), ".")}.cpp) was converted from {@Eval: Extract(ShortName(InputFile), ".")}.Bas
         // with {@Eval: AppName} on {@Eval: TimeStamp()} using the Open Source 
         // PowerBASIC to C++ converter found at https://github.com/uCalc/powerbasic-to-cpp
         
         {@Define:
            Var: Array As String
            Var: ArrayNames As Table
            Var: CleanUp As String
            Var: BitType As String
         }

Criteria: 2
Comment: Handles long line break (underscore _)
Pass: 1

Criteria: 3
Highlight: True
PassOnce: False
Find: {nl}{line} _ [{comment:".*"}] {nl}
      
Replace: {comment: ' {comment}{nl}}{nl}{line}{sp}

Criteria: 4
Highlight: True
SkipOver: True
Find: {"[\(\)]"} {@Note: These are ( and ); must be skipped}
Replace: [Skip over]

Criteria: 5
Highlight: True
SkipOver: True
Find: ' [{comment:".*"}]
Replace: [Skip over]

Criteria: 6
Comment: Processes some operators
Pass: 2

Criteria: 7
Comment: Bitwise AND and OR
Highlight: True
Find: ({expr%})
Replace: ({@Eval: Replace(Replace('{expr}', "&&", "&"), "||", "|")})

Criteria: 8
Comment: Logical (short-circuit) AND
Highlight: True
Find: And
Replace: &&

Criteria: 9
Comment: Logical (short-circuit) OR
Highlight: True
Find: Or
Replace: ||

Criteria: 10
Highlight: True
Find: Xor
Replace: ^

Criteria: 11
Highlight: True
Find: Not
Replace: ~

Criteria: 12
Highlight: True
Find: IsFalse
Replace: !

Criteria: 13
Highlight: True
Find: <>
Replace: !=

Criteria: 14
Highlight: True
Find: =
Replace: ==

Criteria: 15
Highlight: True
SkipOver: True
Find: { {nl}[%]|Then|Else|For|: } {var:" *[a-z\@\.]+"}[({index})] =
Replace: [Skip over]

Criteria: 16
Highlight: True
SkipOver: True
Find: { { #If | #ElseIf } Not | ' [{comment:".*"}] }
Replace: [Skip over]

Criteria: 17
Highlight: True
SkipOver: True
Find: Macro {name}[({params})] =
Replace: [Skip over]

Criteria: 18
Highlight: True
PassOnce: False
Find: Sub {name:1} [Alias {alias}]([{args}])[{exp: Export}] [{comment:" *'.*"}] {nl}
         {code+}
      End Sub
Replace: {exp:extern "C" __declspec(dllexport)} void {exp:__stdcall} {name}({args}) { {comment}
            {code}
         !!ReleaseDynamicArrays!!}

Criteria: 19
Highlight: True
BackColor: DarkKhaki
PassOnce: False
Find: Function {name:1} [Alias {alias}]([{args}])[{exp: Export}] As {type}[{comment:" *'.*"}]{nl}
         {code+}
      End Function
Replace: {exp:extern "C" __declspec(dllexport)} {type} {exp:__stdcall} {name}({args}) { {comment}
            {code}
         !!ReleaseDynamicArrays!!}

Criteria: 20
Highlight: True
PassOnce: False
Find: Function PBMain [()] [As Long]
Replace: Function main() As Long

Criteria: 21
Highlight: True
PassOnce: False
Find: Declare Function {name:1} [Lib {lib}] [Alias {alias}]
      [([{args}])] As {type}
Replace: {lib: extern __declspec(dllimport)} {type} {name}({args})

Criteria: 22
Highlight: True
Find: Declare Sub {name:1} [Lib {lib}] [Alias {alias}]
      [([{args}])] 
Replace: {lib: extern __declspec(dllimport)} void {name}({args})

Criteria: 23
Highlight: True
Find: Static
Replace: static dim

Criteria: 24
Comment: 
Pass: 3

Criteria: 25
Highlight: True
SkipOver: True
Find: // [{comment:".*"}]
Replace: [Skip over]

Criteria: 26
Highlight: True
Find: ' [{comment:".*"}]
Replace: // {comment}

Criteria: 27
Highlight: True
BackColor: Green
PassOnce: False
Find: {nl}%{equate} = {value}
Replace: {nl}const int {equate} = {value};

Criteria: 28
Highlight: True
BackColor: Green
Find: %{equate}
Replace: {equate}

Criteria: 29
Highlight: True
BackColor: SandyBrown
Find: {"&h"}
Replace: 0x

Criteria: 30
Highlight: True
BackColor: Green
PassOnce: False
Find: If {cond} Then {statement} [Else {else}]{nl}
Replace: if ({cond}) {{statement}{nl}}{else: else {{else}{nl}}}{nl}

Criteria: 31
Highlight: True
PassOnce: False
Find: If {cond} Then {nl}
         {code+}
      End If
Replace: if ({cond}) {
            {code}
         }

Criteria: 32
Highlight: True
PassOnce: False
Find: For {x} = {start} To {stop} [Step {inc=1}]{nl}
         {code+}
      Next
Replace: for ({x}={start}; {x}{@Eval: IIF(sgn({inc})>0, '<', '>')}={stop}; {x} += {inc}) {
            {code}
         }

Criteria: 33
Highlight: True
PassOnce: False
Find: While {cond} {nl}
         {code+}
      Wend
Replace: while ({cond}) {
            {code}
         }

Criteria: 34
Highlight: True
PassOnce: False
Find: Do { {while: While} | {until: Until} } {cond} {nl}
         {code+}
      Loop
Replace: while ({while: {cond}}{until:!({cond})}) {
            {code}
         }

Criteria: 35
Highlight: True
PassOnce: False
Find: Do{nl}
         {code+}
      Loop { {while: While} | {until: Until} } {cond}
Replace: do {
            {code}
         } while ({while: {cond}}{until:!({cond})}) 

Criteria: 36
Highlight: True
Find: !!ReleaseDynamicArrays!!
Replace: {@Eval:
            CleanUp = ""   
            uc_For(x, 1, Count(ArrayNames), 1,
               Array = ReadKey(ArrayNames, x)
               CleanUp=CleanUp+"delete[] "+Array+";{nl}"
               Delete(ArrayNames, Array)      
            )
            CleanUp
         }

Criteria: 37
Highlight: True
BackColor: Orange
PassOnce: False
Find: { Dim | {member: {nl}}} {var:1} As {type} [{ptr: Ptr}]
Replace: {member: {nl}}{type} {ptr:*}{var};

Criteria: 38
Highlight: True
PassOnce: False
Find: {nl} {bitfield:1} As Bit * {size} [{in: In {type}}]
Replace: {nl}{@Eval:
            IIf("{type}" <> "", SetVar(BitType, "{type}"))
            BitType
         } {bitfield} : {size};

Criteria: 39
Highlight: True
PassOnce: False
Find: Dim {array}({subscript}) As {type}
Replace: {type} *{array} = new {type} [{subscript}+1];{@Eval:
            Insert(ArrayNames, "{array}")
         }{@Define:: Syntax: {array}({index}) ::= {array}[{index}]} 

Criteria: 40
Highlight: True
BackColor: SandyBrown
PassOnce: False
Find: Dim {var1}, {more}
Replace: Dim {var1}
         Dim {more}

Criteria: 41
Highlight: True
BackColor: Gold
PassOnce: False
Find: { Local | Global | Register }
Replace: Dim

Criteria: 42
Highlight: True
Find: @
Replace: *

Criteria: 43
Highlight: True
BackColor: Silver
Find: VarPtr({var})
Replace: &{var}

Criteria: 44
Highlight: True
BackColor: DeepSkyBlue
PassOnce: False
Find: Function = {value}
Replace: return {value};

Criteria: 45
Highlight: True
Find: Exit Sub
Replace: return;

Criteria: 46
Highlight: True
BackColor: Lime
Find: Long
Replace: int

Criteria: 47
Highlight: True
BackColor: Red
Find: Single
Replace: float

Criteria: 48
Highlight: True
Find: { Double | Extended | Ext }
Replace: double{@Note: May instead use "long double" for Extended}

Criteria: 49
Highlight: True
Find: Byte
Replace: unsigned char

Criteria: 50
Highlight: True
Find: Integer
Replace: short

Criteria: 51
Highlight: True
Find: Word
Replace: unsigned short

Criteria: 52
Highlight: True
Find: Dword
Replace: unsigned int

Criteria: 53
Find: AsciiZ
Replace: LPCSTR

Criteria: 54
Highlight: True
BackColor: SlateBlue
PassOnce: False
Find: ByRef {arg} As {type:1}
Replace: {type}& {arg}

Criteria: 55
Highlight: True
BackColor: Pink
PassOnce: False
Find: ByVal {arg} As {type:1} [{ptr: Ptr}]
Replace: {type} {ptr:*}{arg}

Criteria: 56
Highlight: True
PassOnce: False
Find: Type {name:1}
         {members+}
      End Type
Replace: struct {name} {
            {members}
         }

Criteria: 57
Highlight: True
Find: Macro {name} [{params: ({paramlist})}] = {replacement}
Replace: #define {name}{params} {replacement}

Criteria: 58
Highlight: True
Find: #If
Replace: #if

Criteria: 59
Highlight: True
Find: #Else
Replace: #else

Criteria: 60
Highlight: True
Find: #ElseIf
Replace: #elif

Criteria: 61
Highlight: True
Find: #EndIf
Replace: #endif

Criteria: 62
Highlight: True
PassOnce: False
Find: [{NOT: Not }] %Def({const})
Replace: {NOT:!}defined {const}

Criteria: 63
Comment: Adds semi-colons to statements
Pass: 4

Criteria: 64
Highlight: True
SkipOver: True
Find: { "{" | "}" | ; | //[{".*"}] | #{".*"} } {nl} [{"[ \n]+"}]
Replace: [Skip over]

Criteria: 65
Comment: Skips over so that colons in bit fields are not affected
Highlight: True
SkipOver: True
Find: struct {name:1} "{" {members+} "}"
Replace: [Skip over]

Criteria: 66
Highlight: True
Find: :
Replace: ;

Criteria: 67
Highlight: True
PassOnce: False
Find: {nl}
Replace: ;{nl}

Criteria: 68
Selected: True
Highlight: True
Find: Quad
Replace: __int64

# End Search
