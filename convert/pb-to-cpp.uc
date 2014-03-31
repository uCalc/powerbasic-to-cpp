# pb-to-cpp.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.95 on 3/31/2014 6:26:39 PM
# Comment: Converts PB source code to C++; modified by Daniel Corbier

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, InputFile, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique, FilterTally

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
Highlight: True
PassOnce: False
Find: {@Start}
Replace: // This file ({@Eval: Extract(ShortName(InputFile), ".")}.cpp) was converted from {@Eval: Extract(ShortName(InputFile), ".")}.Bas
         // with {@Eval: AppName} on {@Eval: TimeStamp()} using the Open Source 
         // PowerBASIC to C++ converter found at https://github.com/uCalc/powerbasic-to-cpp
         
         #include "pbOS.h"
         #include "pbMisc.h"
         #include <cstdarg>
         {@Define:
            Var: Array As String
            Var: ArrayNames As Table
            Var: CleanUp As String
            Var: BitType As String
         }{@Define::
            Token: \xFF[^\xFF]*\xFF\n ~~ Properties: ucWhiteSpace
         }

Criteria: 2
Comment: Handles long line break (underscore _)
Pass: 1

Criteria: 3
Highlight: True
PassOnce: False
Find: {nl}{line} _ [{" +"}] [{comment:".+"}]{nl}
      
Replace: {nl}{line} {#255}{comment}{#255}{nl}

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
Comment: Functions, Subs, =
Pass: 2

Criteria: 7
Highlight: True
Find: =
Replace: ==

Criteria: 8
SkipOver: True
Find: { + | - | * | / | % | & | ^ | ! }=
Replace: [Skip over]

Criteria: 9
Highlight: True
SkipOver: True
Find: { {nl}[{ %|$ }]|Then|Else|For|: } {var:" *[a-z\@\.\_]+"}[({index})] =
Replace: [Skip over]

Criteria: 10
Highlight: True
SkipOver: True
Find: { { #If | #ElseIf } Not | ' [{comment:".*"}] }
Replace: [Skip over]

Criteria: 11
Highlight: True
SkipOver: True
Find: Macro {name}[({params})] =
Replace: [Skip over]

Criteria: 12
Highlight: True
PassOnce: False
Find: Sub {name:1} [Alias {alias}]([{args}])[{exp: Export}] [{comment:" *'.*"}] {nl}
         {code+}
      End Sub
Replace: {exp:extern "C" __declspec(dllexport)} void {exp:__stdcall} {name}({args}) { {comment}
            {code}
         !!ReleaseDynamicArrays!!}

Criteria: 13
Highlight: True
BackColor: DarkKhaki
PassOnce: False
Find: Function {name:1} [Alias {alias}]([{args}])[{exp: Export}] As {type}[{comment:" *'.*"}]{nl}
         {code+}
      End Function
Replace: {exp:extern "C" __declspec(dllexport)} {type} {exp:__stdcall} {name}({args}) { {comment}
            {code}
         !!ReleaseDynamicArrays!!}

Criteria: 14
Highlight: True
PassOnce: False
Find: Function PBMain [()] [As Long]
Replace: Function main() As Long

Criteria: 15
Highlight: True
PassOnce: False
Find: Declare Function {name:1} [Lib {lib}] [Alias {alias}]
      [([{args}])] As {type}
Replace: {lib: extern __declspec(dllimport)} {type} {name}({args})

Criteria: 16
Highlight: True
Find: Declare Sub {name:1} [Lib {lib}] [Alias {alias}]
      [([{args}])] 
Replace: {lib: extern __declspec(dllimport)} void {name}({args})

Criteria: 17
Highlight: True
Find: Static
Replace: static dim

Criteria: 18
Comment: Misc
Pass: 3

Criteria: 19
Highlight: True
SkipOver: True
Find: // [{comment:".*"}]
Replace: [Skip over]

Criteria: 20
Highlight: True
Find: ' [{comment:".*"}]
Replace: //{comment}

Criteria: 21
Highlight: True
BackColor: Green
PassOnce: False
Find: {nl}{ {num: %} | {str: $} }{equate} = {value}
Replace: {nl}const{num: int}{str: string} {equate} = {value};

Criteria: 22
Highlight: True
BackColor: Green
Find: { % | $ }{equate:"[a-z]+"}
Replace: {equate}

Criteria: 23
Highlight: True
BackColor: SandyBrown
Find: {"&h"}
Replace: 0x

Criteria: 24
Highlight: True
BackColor: Green
PassOnce: False
Find: If {cond} Then {statement} [Else {else}]{nl}
Replace: if ({cond}) {{statement}{nl}}{else: else {{else}{nl}}}{nl}

Criteria: 25
Highlight: True
PassOnce: False
Find: If {cond} Then [{comment:" *'.*"}] {nl}
         {code+}
      End If
Replace: if ({cond}) { {comment}
            {code}
         }

Criteria: 26
Find: {nl}Else
Replace: {nl} } else {

Criteria: 27
Selected: True
Find: {nl}ElseIf {cond} Then
Replace: {nl} } else if ({cond}) {

Criteria: 28
Highlight: True
PassOnce: False
Find: For {x} = {start} To {stop} [Step {inc=1}]{nl}
         {code+}
      Next
Replace: for ({x}={start}; {x}{@Eval: IIF(sgn({inc})>0, '<', '>')}={stop}; {x} += {inc}) {
            {code}
         }

Criteria: 29
Highlight: True
PassOnce: False
Find: While {cond} {nl}
         {code+}
      Wend
Replace: while ({cond}) {
            {code}
         }

Criteria: 30
Highlight: True
PassOnce: False
Find: Do { {while: While} | {until: Until} } {cond} {nl}
         {code+}
      Loop
Replace: while ({while: {cond}}{until:!({cond})}) {
            {code}
         }

Criteria: 31
Highlight: True
PassOnce: False
Find: Do{nl}
         {code+}
      Loop { {while: While} | {until: Until} } {cond}
Replace: do {
            {code}
         } while ({while: {cond}}{until:!({cond})}) 

Criteria: 32
Highlight: True
Find: !!ReleaseDynamicArrays!!
Replace: {@Eval:
            CleanUp = ""   
            uc_For(x, Count(ArrayNames), 1, -1,
               Array = ReadKey(ArrayNames, x)
               CleanUp=CleanUp+"delete[] "+Array+";{nl}"
               Delete(ArrayNames, Array)      
            )
            CleanUp
         }

Criteria: 33
Highlight: True
BackColor: Orange
PassOnce: False
Find: { Dim | {member: {nl}}} {var:1} As {type} [{ptr: Ptr}]
Replace: {member: {nl}}{type} {ptr:*}{var};

Criteria: 34
Highlight: True
PassOnce: False
Find: {nl} {bitfield:1} As Bit * {size} [{in: In {type}}]
Replace: {nl}{@Eval:
            IIf("{type}" <> "", SetVar(BitType, "{type}"))
            BitType
         } {bitfield} : {size};

Criteria: 35
Highlight: True
PassOnce: False
Find: Dim {array}({subscript}) As {type}
Replace: {type} *{array} = new {type} [{subscript}+1];{@Eval:
            Insert(ArrayNames, "{array}")
         }{@Define:: Syntax: {array}([{index}]) ::= {array}[{index}]} 

Criteria: 36
Highlight: True
BackColor: SandyBrown
PassOnce: False
Find: Dim {var1}, {more}
Replace: Dim {var1}
         Dim {more}

Criteria: 37
Highlight: True
BackColor: Gold
PassOnce: False
Find: { Local | Global | Register }
Replace: Dim

Criteria: 38
Highlight: True
Find: @
Replace: *

Criteria: 39
Highlight: True
BackColor: Silver
Find: VarPtr({var})
Replace: &{var}

Criteria: 40
Highlight: True
BackColor: DeepSkyBlue
PassOnce: False
Find: Function = {value}
Replace: return {value}

Criteria: 41
Find: Iterate
Replace: continue

Criteria: 42
Find: Exit
Replace: break

Criteria: 43
Highlight: True
Find: Exit Sub
Replace: return

Criteria: 44
Highlight: True
BackColor: Lime
Find: Long
Replace: int

Criteria: 45
Highlight: True
BackColor: Red
Find: Single
Replace: float

Criteria: 46
Find: Double
Replace: double

Criteria: 47
Highlight: True
Find: Byte
Replace: unsigned char

Criteria: 48
Highlight: True
Find: Integer
Replace: short

Criteria: 49
Highlight: True
Find: Word
Replace: unsigned short

Criteria: 50
Highlight: True
Find: Dword
Replace: unsigned int

Criteria: 51
Find: AsciiZ
Replace: LPCSTR

Criteria: 52
Highlight: True
Find: Quad
Replace: __int64

Criteria: 53
SkipOver: True
Find: long double
Replace: [Skip over]

Criteria: 54
Highlight: True
Find: { Extended | Ext }
Replace: long double

Criteria: 55
Highlight: True
BackColor: SlateBlue
PassOnce: False
Find: ByRef {arg} As {type:1}
Replace: {type}& {arg}

Criteria: 56
PassOnce: False
Find: ByRef {array}() As {type:1}
Replace: {type} {array}[]{@Define::
            Syntax: {array}([{index}]) ::= {array}[{index}]
         }

Criteria: 57
Highlight: True
BackColor: Pink
PassOnce: False
Find: ByVal {arg} As {type:1} [{ptr: Ptr}]
Replace: {type} {ptr:*}{arg}

Criteria: 58
Highlight: True
PassOnce: False
Find: Type {name:1}
         {members+}
      End Type
Replace: struct {name} {
            {members}
         }

Criteria: 59
Highlight: True
Find: Macro {name} [{params: ({paramlist})}] = {replacement}
Replace: #define {name}{params} {replacement}

Criteria: 60
Highlight: True
Find: #ElseIf
Replace: #elif

Criteria: 61
Find: #{directive: If | Else | EndIf }
Replace: #{@Eval: LCase("{directive}", "{'.*'}")}

Criteria: 62
Highlight: True
PassOnce: False
Find: [{NOT: Not }] %Def({const})
Replace: {NOT:!}defined {const}

Criteria: 63
Find: Choose[&]({index}, {choice})
Replace: IIf({index}, {choice}, 0)

Criteria: 64
Find: Choose$({index}, {choice})
Replace: IIf({index}, {choice}, "")

Criteria: 65
PassOnce: False
Find: Choose[{type: $ | & }]({index}, {choice1}, {more})
Replace: IIf({index}, {choice1}, Choose{type}({index}, {more}))

Criteria: 66
Find: StdOut {text} { {sameline: ;} | {NewLine: } }
Replace: cout << {text} {NewLine: << endl;}

Criteria: 67
Find: Sleep {milliseconds}
Replace: PB_SLEEP({milliseconds})

Criteria: 68
Find: {keyword:"CV(BYT|DWD|D|E|I|L|Q|S|WRD)"}({string} [, {offset=1}])
Replace: PB_{@Eval:UCase("{keyword}", "{'.*'}")}({string}, {offset})

Criteria: 69
PassOnce: False
Find: Line Input [{prompt: {q}{str}{q} | ${equate:1}}][,] {StrVariable:1}
Replace: {prompt: cout << {prompt};}getline(cin, {StrVariable});

Criteria: 70
Comment: Adds semi-colons to statements
Pass: 4

Criteria: 71
Highlight: True
SkipOver: True
Find: { "{" | "}" | ; | //[{".*"}] | #{".*"} } {nl} [{"[ \n]+"}]
Replace: [Skip over]

Criteria: 72
Comment: Skips over so that colons in bit fields are not affected
Highlight: True
SkipOver: True
Find: struct {name:1} "{" {members+} "}"
Replace: [Skip over]

Criteria: 73
SkipOver: True
Find: ({cond} ? {this} :
Replace: [Skip over]

Criteria: 74
Highlight: True
Find: :
Replace: ;

Criteria: 75
SkipOver: True
Find: ::
Replace: [Skip over]

Criteria: 76
Highlight: True
PassOnce: False
Find: {nl}
Replace: ;{nl}

Criteria: 77
PassOnce: False
Find: IIf[$]({cond}, {this}, {that})
Replace: ({cond} ? {this} : {that})

Criteria: 78
Find: _char([{char= }])
Replace: '{char}'

Criteria: 79
Find: {" \xFF\xFF\n"}
Replace: {nl}

Criteria: 80
Find: {" \xFF"}{comment:"[^\xFF]+"}{"\xFF\n"}
Replace:  /* {comment} */{nl}

# End Search
