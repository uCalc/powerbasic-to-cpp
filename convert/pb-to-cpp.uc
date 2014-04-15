# pb-to-cpp.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.95 on 4/14/2014 6:18:21 PM
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
Find: 
Replace: {@Define:
            Var: BitType As String
            Var: Case1
         }
         {@Define::
            Token: \xFF[^\xFF]*\xFF\n ~~ Properties: ucWhiteSpace
         }

Criteria: 2
Highlight: True
Find: {@Start}
Replace: ' This file ({@Eval: Extract(ShortName(InputFile), ".")}.cpp) was converted from {@Eval: Extract(ShortName(InputFile), ".")}.Bas
         ' with {@Eval: AppName} on {@Eval: TimeStamp()} using the Open Source 
         ' PowerBASIC to C++ converter found at https://github.com/uCalc/powerbasic-to-cpp
         
         #include "pbOS.h"
         #include "pbMisc.h"
         #include <cstdarg>
         

Criteria: 3
Comment: Handles long line break (underscore _)
Pass: 1

Criteria: 4
Highlight: True
PassOnce: False
Find: {nl}{line} _ [{" +"}] [{comment:".+"}]{nl}
      
Replace: {nl}{line} {#255}{comment}{#255}{nl}

Criteria: 5
Highlight: True
SkipOver: True
Find: {"[\(\)]"} {@Note: These are ( and ); must be skipped}
Replace: [Skip over]

Criteria: 6
Highlight: True
SkipOver: True
Find: ' [{comment:".*"}]
Replace: [Skip over]

Criteria: 7
Comment: Functions, Subs, =
Pass: 2

Criteria: 8
Highlight: True
Find: =
Replace: ==

Criteria: 9
SkipOver: True
Find: { + | - | * | / | % | & | ^ | ! }=
Replace: [Skip over]

Criteria: 10
Highlight: True
SkipOver: True
Find: { {nl}[{ %|$ }]|Then|Else|For|: } {var:" *[a-z\@\.\_]+"}[({index})] =
Replace: [Skip over]

Criteria: 11
Highlight: True
SkipOver: True
Find: { { #If | #ElseIf } Not | ' [{comment:".*"}] }
Replace: [Skip over]

Criteria: 12
Highlight: True
SkipOver: True
Find: Macro {name}[({params})] =
Replace: [Skip over]

Criteria: 13
Highlight: True
PassOnce: False
Find: Sub {name:1} [Alias {alias}]([{args}])[{exp: Export}] [{comment:" *'.*"}] {nl}
Replace: {exp:extern "C" __declspec(dllexport)} void {exp:__stdcall} {name}({args}) { {comment}

Criteria: 14
Highlight: True
BackColor: DarkKhaki
PassOnce: False
Find: Function {name:1} [Alias {alias}]([{args}])[{exp: Export}] As {type}[{comment:" *'.*"}]{nl}
Replace: {exp:extern "C" __declspec(dllexport)} {type} {exp:__stdcall} {name}({args}) { {comment}
         {@Define:: Syntax: {name} = ::= return{#32}}

Criteria: 15
Highlight: True
PassOnce: False
Find: Function PBMain [()] [As Long]
Replace: Function main() As Long

Criteria: 16
Highlight: True
PassOnce: False
Find: Declare Function {name:1} [Lib {lib}] [Alias {alias}]
      [([{args}])] As {type}
Replace: {lib: extern __declspec(dllimport)} {type} {name}({args})

Criteria: 17
Highlight: True
Find: Declare Sub {name:1} [Lib {lib}] [Alias {alias}]
      [([{args}])] 
Replace: {lib: extern __declspec(dllimport)} void {name}({args})

Criteria: 18
Highlight: True
Find: Static
Replace: static dim

Criteria: 19
Comment: For type member access (temp stage)
Find: {typevar:"@*[a-z_][a-z_0-9@]+\.[a-z_0-9@\.]+"}
Replace: `{typevar}`

Criteria: 20
Comment: Misc
Pass: 3

Criteria: 21
Highlight: True
SkipOver: True
Find: // [{comment:".*"}]
Replace: [Skip over]

Criteria: 22
Highlight: True
Find: ' [{comment:".*"}]
Replace: //{comment}

Criteria: 23
Highlight: True
BackColor: Green
PassOnce: False
Find: {nl}{ {num: %} | {str: $} }{equate} = {value}
Replace: {nl}const{num: int}{str: string} {equate} = {value};

Criteria: 24
Highlight: True
BackColor: Green
Find: { % | $ }{equate:"[a-z]+"}
Replace: {equate}

Criteria: 25
Highlight: True
BackColor: SandyBrown
Find: {"&h"}
Replace: 0x

Criteria: 26
Comment: Single-line IF
Highlight: True
BackColor: Green
PassOnce: False
Find: If {cond} Then {statement} [Else {else}]{nl}
Replace: if ({cond}) {{statement}{nl}}{else: else {{else}{nl}}}{nl}

Criteria: 27
Comment: Multi-line IF
Highlight: True
PassOnce: False
Find: If {cond} Then [{comment:" *'.*"}] {nl}
Replace: if ({cond}) { {comment}{nl}

Criteria: 28
Find: {nl}Else
Replace: {nl} } else {

Criteria: 29
Find: {nl}ElseIf {cond} Then
Replace: {nl} } else if ({cond}) {

Criteria: 30
Highlight: True
PassOnce: False
Find: For {x} = {start} To {stop} [Step {inc=1}][{comment:" *'.*"}]
Replace: for ({x}={start}; {x}{@Eval: IIF(sgn({inc})>0, '<', '>')}={stop}; {x} += {inc}) { {comment}

Criteria: 31
Highlight: True
PassOnce: False
Find: {nl}While {cond} [{comment:" *'.*"}] {nl}
Replace: {nl}while ({cond}) { {comment} {nl}

Criteria: 32
Highlight: True
PassOnce: False
Find: Do { {while: While} | {until: Until} } {cond} [{comment:" *'.*"}]{nl}
Replace: while ({while: {cond}}{until:!({cond})}) { {comment}

Criteria: 33
Find: { End { Sub|Function|If|Type|Union } | Wend|Next|Loop }
Replace: }

Criteria: 34
Find: do{nl}
Replace: do {

Criteria: 35
Highlight: True
PassOnce: False
Find: Loop { {while: While} | {until: Until} } {cond} [{comment:" *'.*"}]
Replace: } while ({while: {cond}}{until:!({cond})}) {comment}

Criteria: 36
Find: Select Case [As] [Long | Const | Const$] {expr} {nl}
Replace: { auto CASE_VAR = {expr}
         {@Execute: Case1 = 1}

Criteria: 37
Find: End Select
Replace: }}

Criteria: 38
Selected: True
Find: Case [IS] {test%} [:] [' {comment:".*"}]
Replace: {@Evaluate:
            IIf(Case1==1, Case1=0; "", "} else")
         } if (CASE_VAR == {test}) {{comment: // {comment}}

Criteria: 39
PassOnce: False
Find: Case [IS] {item}, {more}
Replace: Case {item} || CASE_VAR = {more}

Criteria: 40
Find: Case Else
Replace: } else {

Criteria: 41
Highlight: True
BackColor: Orange
PassOnce: False
Find: { Dim | {member: {nl}}} {var:1} As {type} [{ptr: Ptr}]
Replace: {member: {nl}}{type} {ptr:*}{var};

Criteria: 42
Highlight: True
PassOnce: False
Find: {nl} {bitfield:1} As Bit * {size:1} [{in: In {type:1}}]
Replace: {nl}{@Eval:
            IIf("{type}" <> "", SetVar(BitType, "{type}"))
            BitType
         } {bitfield} : {size};

Criteria: 43
Highlight: True
PassOnce: False
Find: Dim {array}([{size}]) As {type}
Replace: std::vector<{type}> {array}{size: ({size}+1)};{@Define::
             Syntax: {array}([{sz}]) ::= {array}[{sz}]} 

Criteria: 44
Find: Erase {array:1}[()]
Replace: {array}.clear();

Criteria: 45
PassOnce: False
Find: ReDim {array}({size}) [As {type}] [{more: , {etc}}]
Replace: {array}.clear();
         {array}.resize({size}+1); {more: {nl} ReDim {etc}}

Criteria: 46
PassOnce: False
Find: ReDim Preserve {array}({size}) [As {type}] [{more: , {etc}}]
Replace: {array}.resize({size}+1); {more: {nl} ReDim Preserve {etc}}

Criteria: 47
Find: UBound({array})
Replace: ({array}.size()-1)

Criteria: 48
Highlight: True
BackColor: SandyBrown
PassOnce: False
Find: Dim {var1}, {more}
Replace: Dim {var1}
         Dim {more}

Criteria: 49
Highlight: True
BackColor: Gold
PassOnce: False
Find: { Local | Global | Register }
Replace: Dim

Criteria: 50
Find: `{typevar}.@{last:1}`
Replace: *`{typevar}.{last}`

Criteria: 51
Highlight: True
BackColor: Silver
Find: VarPtr({var})
Replace: &{var}

Criteria: 52
Find: Iterate
Replace: continue

Criteria: 53
Find: Exit
Replace: break

Criteria: 54
Highlight: True
Find: Exit Sub
Replace: return

Criteria: 55
Highlight: True
BackColor: Lime
Find: Long
Replace: int

Criteria: 56
Highlight: True
BackColor: Red
Find: Single
Replace: float

Criteria: 57
Find: Double
Replace: double

Criteria: 58
Highlight: True
Find: Byte
Replace: unsigned char

Criteria: 59
Highlight: True
Find: Integer
Replace: short

Criteria: 60
Highlight: True
Find: Word
Replace: unsigned short

Criteria: 61
Highlight: True
Find: Dword
Replace: unsigned int

Criteria: 62
Find: AsciiZ
Replace: LPCSTR

Criteria: 63
Highlight: True
Find: Quad
Replace: __int64

Criteria: 64
SkipOver: True
Find: long double
Replace: [Skip over]

Criteria: 65
Highlight: True
Find: { Extended | Ext }
Replace: long double

Criteria: 66
Highlight: True
BackColor: SlateBlue
PassOnce: False
Find: ByRef {arg} As {type:1}
Replace: {type}& {arg}

Criteria: 67
PassOnce: False
Find: ByRef {array}() As {type:1}
Replace: {type} {array}[]{@Define::
            Syntax: {array}([{index}]) ::= {array}[{index}]
         }

Criteria: 68
Highlight: True
BackColor: Pink
PassOnce: False
Find: ByVal {arg} As {type:1} [{ptr: Ptr}]
Replace: {type} {ptr:*}{arg}

Criteria: 69
Find: Type {name:1}
Replace: struct {name} {

Criteria: 70
Find: Union {name:1}
Replace: union {name} {

Criteria: 71
Highlight: True
Find: Macro {name} [{params: ({paramlist})}] = {replacement%}
Replace: #define {name}{params} {replacement}

Criteria: 72
Highlight: True
Find: #ElseIf
Replace: #elif

Criteria: 73
Find: #{directive: If | Else | EndIf }
Replace: #{@Eval: LCase("{directive}", "{'.*'}")}

Criteria: 74
Highlight: True
PassOnce: False
Find: [{NOT: Not }] %Def({const})
Replace: {NOT:!}defined {const}

Criteria: 75
Find: Choose[&]({index}, {choice})
Replace: IIf({index}, {choice}, 0)

Criteria: 76
Find: Choose$({index}, {choice})
Replace: IIf({index}, {choice}, "")

Criteria: 77
PassOnce: False
Find: Choose[{type: $ | & }]({index}, {choice1}, {more})
Replace: IIf({index}, {choice1}, Choose{type}({index}, {more}))

Criteria: 78
Find: StdOut {text} { {sameline: ;} | {NewLine: } }
Replace: cout << {text} {NewLine: << endl;}

Criteria: 79
Find: Sleep {milliseconds}
Replace: PB_SLEEP({milliseconds})

Criteria: 80
Find: {keyword:"CV(BYT|DWD|D|E|I|L|Q|S|WRD)"}({string} [, {offset=1}])
Replace: PB_{@Eval:UCase("{keyword}", "{'.*'}")}({string}, {offset})

Criteria: 81
PassOnce: False
Find: Line Input [{prompt: {q}{str}{q} | ${equate:1}}][,] {StrVariable:1}
Replace: {prompt: cout << {prompt};}getline(cin, {StrVariable});

Criteria: 82
Comment: Adds semi-colons to statements, etc
Pass: 4

Criteria: 83
Highlight: True
SkipOver: True
Find: { "{" | "}" | ; | //[{".*"}] | #{".*"} } {nl} [{"[ \n]+"}]
Replace: [Skip over]

Criteria: 84
Comment: Skips over so that colons in bit fields are not affected
Highlight: True
SkipOver: True
Find: { struct | union } {name:1} "{" {members+} "}"
Replace: [Skip over]

Criteria: 85
SkipOver: True
Find: ({cond} ? {this} :
Replace: [Skip over]

Criteria: 86
Highlight: True
Find: :
Replace: ;

Criteria: 87
SkipOver: True
Find: ::
Replace: [Skip over]

Criteria: 88
Highlight: True
PassOnce: False
Find: {nl}
Replace: ;{nl}

Criteria: 89
PassOnce: False
Find: IIf[$]({cond%}, {this%}, {that%})
Replace: ({cond} ? {this} : {that})

Criteria: 90
Find: _char([{char= }])
Replace: '{char}'

Criteria: 91
Find: {" \xFF\xFF\n"}
Replace: {nl}

Criteria: 92
Find: {" \xFF"}{comment:"[^\xFF]+"}{"\xFF\n"}
Replace:  /* {comment} */{nl}

Criteria: 93
Highlight: True
BackColor: DeepSkyBlue
PassOnce: False
Find: Function = {value}
Replace: return {value}

Criteria: 94
Find: PB_ASC({q}{char}{q}, {n:" *[0-9]+"})
Replace: '{@Eval:Mid("{char}", {n}, 1, ucChar)}'

Criteria: 95
Find: @
Replace: *

Criteria: 96
Highlight: True
Find: @{pointer:1}.
Replace: {pointer}->

Criteria: 97
Find: `{@Comment: removes temp char for type member access}
Replace: {Nothing}

# End Search
