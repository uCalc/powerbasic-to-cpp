# pb-to-cpp.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.96 on 6/19/2014 7:46:46 PM
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
PassOnce: False
Find: 
Replace: {@Exec: Dim IsPrototype = 1, Case1, UDT, BitType As String }
         {@Define:: Token: \xFF[^\xFF]*\xFF\n ~~ Properties: ucWhiteSpace }

Criteria: 2
Highlight: True
Find: {@Start}
Replace: ' This file ({@Eval: Extract(ShortName(InputFile), ".")}.cpp) was converted from {@Eval: Extract(ShortName(InputFile), ".")}.Bas
         ' with {@Eval: AppName} on {@Eval: TimeStamp("MM/dd/yy")} using the Open Source 
         ' PowerBASIC to C++ converter found at https://github.com/uCalc/powerbasic-to-cpp
         
         ' Standard lib headers used by PB to C++ are in sdtafx.h & pre-compiled
         #include "stdafx.h"
         
         using namespace std;{nl}{nl}
         
         #include "pbOS.h"
         #include "pbMisc.h"
         #include "pbstrings.h"
         

Criteria: 3
Comment: Renames words that conflict w/ C++ keywords
Pass: 1

Criteria: 4
Find: { auto|bitand|bitor|bool|break|char|compl|constexpr|
      continue|default|delete|explicit|extern|false|float|
      friend|inline|mutable|new|nullptr|operator|private|
      protected|public|short|signed|struct|template|this|
      throw|true|typename|unsigned|virtual|void|volatile }
      {@If: {@Self} == LCase({@Self})}
Replace: {Self}_Renamed

Criteria: 5
SkipOver: True
Find: { { ' | _ } {Comment:".*"} | %TRUE | %FALSE }
Replace: [Skip over]

Criteria: 6
Comment: Handles long line break (underscore _)
Pass: 2

Criteria: 7
Highlight: True
PassOnce: False
Find: {nl}{line} _ [{" +"}] [{comment:".+"}]{nl}
      
Replace: {nl}{line} {#255}{comment}{#255}{nl}

Criteria: 8
Highlight: True
SkipOver: True
Find: {"[\(\)]"} {@Note: These are ( and ); must be skipped}
Replace: [Skip over]

Criteria: 9
Highlight: True
SkipOver: True
Find: ' [{comment:".*"}]
Replace: [Skip over]

Criteria: 10
Comment: Functions, Subs, =
Pass: 3

Criteria: 11
Highlight: True
Find: =
Replace: ==

Criteria: 12
Selected: True
SkipOver: True
Find: { + | - | * | / | % | & | ^ | ! | > | < | _ReturnValue }=
Replace: [Skip over]

Criteria: 13
Highlight: True
SkipOver: True
Find: { {nl} [{ %|$[$] }]|Then|Else|For|: }{var:" *[a-z0-9\@\.\_]+"}[({index})] =
Replace: [Skip over]

Criteria: 14
Highlight: True
SkipOver: True
Find: { { #If | #ElseIf } Not | ' [{comment:".*"}] }
Replace: [Skip over]

Criteria: 15
Highlight: True
SkipOver: True
Find: Macro {name}[({params})] =
Replace: [Skip over]

Criteria: 16
Highlight: True
PassOnce: False
Find: Sub {name:1} [Alias {alias}]([{args}])[{exp: Export}] [{comment:" *'.*"}] {nl}
Replace: {exp:extern "C" __declspec(dllexport)} void {exp:__stdcall }{name}({args}) { {comment}

Criteria: 17
Highlight: True
BackColor: DarkKhaki
PassOnce: False
Find: Function {name:1} [Alias {alias}]([{args}])[{exp: Export}] As {type}[{comment:" *'.*"}]{nl}
Replace: {exp:extern "C" __declspec(dllexport)} {type} {exp:__stdcall }{name}({args}) { {comment}
         {type} _ReturnValue = {type}()
         {@Define:: Syntax: {name} = ::= _ReturnValue =}

Criteria: 18
Highlight: True
PassOnce: False
Find: Function PBMain [()] [As Long]
Replace: Function main() As Long

Criteria: 19
Highlight: True
PassOnce: False
Find: Declare Function {name:1} [Lib {lib}] [Alias {alias}]
      [([{args}])] [{exp: Export}] As {type}
Replace: {exp:extern "C" __declspec(dllexport)}{lib: extern __declspec(dllimport)} {type} {exp:__stdcall }{name}({args})

Criteria: 20
Highlight: True
Find: Declare Sub {name:1} [Lib {lib}] [Alias {alias}]
      [([{args}])] [{exp: Export}]
Replace: {exp:extern "C" __declspec(dllexport)}{lib: extern __declspec(dllimport)} void {exp:__stdcall }{name}({args})

Criteria: 21
Find: {nl}End Function
Replace: {nl}{nl}return _ReturnValue
         End Function

Criteria: 22
Highlight: True
Find: Static
Replace: static dim

Criteria: 23
Comment: For type member access (temp stage)
Find: {typevar:"@*[a-z_][a-z_0-9@]+\.[a-z_0-9@\.]+"}
Replace: `{typevar}`

Criteria: 24
Comment: Misc
Pass: 4

Criteria: 25
Highlight: True
SkipOver: True
Find: // [{comment:".*"}]
Replace: [Skip over]

Criteria: 26
Highlight: True
Find: ' [{comment:".*"}]
Replace: //{comment}

Criteria: 27
Highlight: True
BackColor: Green
PassOnce: False
Find: {nl}{ {num: %}|{wstr: $$}|{str: $} }{equate} = {value}
Replace: {nl}const{num: int}{str: string}{wstr: wstring} {equate} = {value}

Criteria: 28
Highlight: True
BackColor: Green
Find: { % | $[$] }{equate:"[a-z]+"}
Replace: {equate}

Criteria: 29
Highlight: True
BackColor: SandyBrown
Find: {"&h"}
Replace: 0x

Criteria: 30
Comment: Single-line IF
Highlight: True
BackColor: Green
PassOnce: False
Find: If {cond} Then {statement} [Else {else}]{nl}
Replace: if ({cond}) {{statement}{nl}}{else: else {{else}{nl}}}{nl}

Criteria: 31
Comment: Multi-line IF
Highlight: True
PassOnce: False
Find: If {cond} Then [{comment:" *'.*"}] {nl}
Replace: if ({cond}) { {comment}{nl}

Criteria: 32
Find: {nl}Else
Replace: {nl} } else {

Criteria: 33
Find: {nl}ElseIf {cond} Then
Replace: {nl} } else if ({cond}) {

Criteria: 34
Highlight: True
PassOnce: False
Find: For {x} = {start} To {stop} [Step {inc=1}][{comment:" *'.*"}]
Replace: for ({x}={start}; {x}{@Eval: IIF(sgn({inc})>0, '<', '>')}={stop}; {x} += {inc}) { {comment}

Criteria: 35
Highlight: True
PassOnce: False
Find: {nl}While {cond} [{comment:" *'.*"}] {nl}
Replace: {nl}while ({cond}) { {comment} {nl}

Criteria: 36
Highlight: True
PassOnce: False
Find: Do { {while: While} | {until: Until} } {cond} [{comment:" *'.*"}]{nl}
Replace: while ({while: {cond}}{until:!({cond})}) { {comment}

Criteria: 37
Find: { End { Sub|Function|If } | Wend | Next | Loop }
Replace: }

Criteria: 38
Find: Do{nl}
Replace: do {

Criteria: 39
Highlight: True
PassOnce: False
Find: Loop { {while: While} | {until: Until} } {cond} [{comment:" *'.*"}]
Replace: } while ({while: {cond}}{until:!({cond})}) {comment}

Criteria: 40
Find: Select Case [As] [Long | Const | Const$] {expr} {nl}
Replace: { auto CASE_VAR = {expr}
         {@Execute: Case1 = 1}

Criteria: 41
Find: Case [IS] {test%} [:] [' {comment:".*"}]
Replace: {@Evaluate:
            IIf(Case1==1, Case1=0; "", "} else")
         } if (CASE_VAR == {test}) {{comment: // {comment}}

Criteria: 42
PassOnce: False
Find: Case [IS] {item}, {more}
Replace: Case {item} || CASE_VAR = {more}

Criteria: 43
Find: Case Else
Replace: } else {

Criteria: 44
Find: End Select
Replace: }}

Criteria: 45
Find: Type {name:1}
Replace: struct {name} {

Criteria: 46
Find: Union {name:1}
Replace: union {name} {

Criteria: 47
Find: End { Type | Union }
Replace: };

Criteria: 48
Highlight: True
BackColor: Orange
PassOnce: False
Find: { Dim | {member: {nl}}} {var:1} As {type:1} [{ptr: Ptr}]
Replace: {member: {nl}}{type} {ptr:*}{var}{@Eval:
         IIf("{member}{ptr}" == "", " = {type}()")};

Criteria: 49
Highlight: True
Find: {nl} {bitfield:1} As Bit * {size:1} [In {type%:1}]
Replace: {nl}{@Eval:
            IIf("{type}" <> "", SetVar(BitType, "{type}"))
            BitType
         } {bitfield} : {size};

Criteria: 50
Highlight: True
PassOnce: False
Find: Dim {array}([{size}]) As {type}
Replace: std::vector<{type}> {array}{size: ({size}+1, {type}())};{@Define::Pass: 6 ~~ Syntax: {array}({sz}) ::= {array}[{sz}]}{@Define::Pass: 6 ~~ Syntax: {array}() ::= {array}}

Criteria: 51
Find: Erase {array:1}[()]
Replace: {array}.clear();

Criteria: 52
PassOnce: False
Find: ReDim {array}({size}) [As {type}] [{more: , {etc}}]
Replace: {array}.clear();
         {array}.resize({size}+1); {more: {nl} ReDim {etc}}

Criteria: 53
PassOnce: False
Find: ReDim Preserve {array}({size}) [As {type}] [{more: , {etc}}]
Replace: {array}.resize({size}+1); {more: {nl} ReDim Preserve {etc}}

Criteria: 54
Find: UBound({array})
Replace: ({array}.size()-1)

Criteria: 55
Highlight: True
BackColor: SandyBrown
PassOnce: False
Find: Dim {var1}, {more}
Replace: Dim {var1}
         Dim {more}

Criteria: 56
Highlight: True
BackColor: Gold
PassOnce: False
Find: { Local | Global | Register }
Replace: Dim

Criteria: 57
Find: `{typevar}.@{last:1}`
Replace: *`{typevar}.{last}`

Criteria: 58
Highlight: True
BackColor: Silver
Find: VarPtr({var})
Replace: &{var}

Criteria: 59
Find: Iterate
Replace: continue

Criteria: 60
Find: Exit
Replace: break

Criteria: 61
Highlight: True
Find: Exit Sub
Replace: return

Criteria: 62
Find: Exit Function
Replace: return _ReturnValue

Criteria: 63
Highlight: True
BackColor: DeepSkyBlue
PassOnce: False
Find: Function =
Replace: _ReturnValue =

Criteria: 64
Highlight: True
BackColor: Lime
Find: Long
Replace: int

Criteria: 65
Highlight: True
BackColor: Red
Find: Single
Replace: float

Criteria: 66
Find: Double
Replace: double

Criteria: 67
Highlight: True
Find: Byte
Replace: UCHAR

Criteria: 68
Highlight: True
Find: Integer
Replace: short

Criteria: 69
Highlight: True
Find: Word
Replace: USHORT

Criteria: 70
Highlight: True
Find: Dword
Replace: unsigned

Criteria: 71
Find: AsciiZ
Replace: LPCSTR

Criteria: 72
Highlight: True
Find: Quad
Replace: __int64

Criteria: 73
SkipOver: True
Find: EXTENDED
Replace: [Skip over]

Criteria: 74
Highlight: True
Find: { Extended | Ext }
Replace: EXTENDED

Criteria: 75
Highlight: True
BackColor: SlateBlue
PassOnce: False
Find: ByRef {arg} As {type:1}
Replace: {type}& {arg}

Criteria: 76
PassOnce: False
Find: ByRef {array}() As {type:1}
Replace: std::vector<{type}>& {array}{@Define::
            Syntax: {array}({index}) ::= {array}[{index}]
            Syntax: {array}() ::= {array}
         }

Criteria: 77
Highlight: True
BackColor: Pink
PassOnce: False
Find: ByVal {arg} As {type:1} [{ptr: Ptr}]
Replace: {type} {ptr:*}{arg}

Criteria: 78
Highlight: True
Find: Macro {name} [{params: ({paramlist})}] = {replacement%}
Replace: #define {name}{params} {replacement}

Criteria: 79
Highlight: True
Find: #ElseIf
Replace: #elif

Criteria: 80
Find: #{directive: If | Else | EndIf }
Replace: #{@Eval: LCase("{directive}", "{'.*'}")}

Criteria: 81
Highlight: True
PassOnce: False
Find: [{NOT: Not }] %Def({const})
Replace: {NOT:!}defined {const}

Criteria: 82
PassOnce: False
Find: Choose[&]({index}, {choice})
Replace: IIf({index}, {choice}, 0)

Criteria: 83
PassOnce: False
Find: Choose$({index}, {choice})
Replace: IIf({index}, {choice}, "")

Criteria: 84
PassOnce: False
Find: Choose[{type: $ | & }]({index}, {choice1}, {more})
Replace: IIf({index}, {choice1}, Choose{type}({index}, {more}))

Criteria: 85
Find: StdOut {text} { {sameline: ;} | {NewLine: } }
Replace: cout << {text} {NewLine: << endl;}

Criteria: 86
Find: Sleep {milliseconds}
Replace: PB_SLEEP({milliseconds})

Criteria: 87
Find: {keyword:"CV(BYT|DWD|D|E|I|L|Q|S|WRD)"}({string} [, {offset=1}])
Replace: PB_{@Eval:UCase("{keyword}", "{'.*'}")}({string}, {offset})

Criteria: 88
PassOnce: False
Find: Line Input [{prompt: {q}{str}{q} | ${equate:1}}][,] {StrVariable:1}
Replace: {prompt: cout << {prompt};}getline(cin, {StrVariable});

Criteria: 89
Find: IIf[$]({cond%}, {this%}, {that%})
Replace: ({cond} ? {this} : {that})

Criteria: 90
Find: PB_ASC({q}{char}{q}, {n:" *[0-9]+"})
Replace: '{@Eval:Mid("{char}", {n}, 1, ucChar)}'

Criteria: 91
Find: _char([{char= }])
Replace: '{char}'

Criteria: 92
Highlight: True
Find: :
Replace: ;{nl}

Criteria: 93
SkipOver: True
Find: ::
Replace: [Skip over]

Criteria: 94
Find: Swap {a}, {b}
Replace: swap({a}, {b})

Criteria: 95
Comment: Adds semi-colons to statements, etc
Pass: 5

Criteria: 96
Find: {@Start}
Replace: {@Define:: Token: [\x7b\x7d\;]}

Criteria: 97
Find: {nl} {code} [{comment:" *//.*"}] {delim-: {nl}}
Replace: {nl}{code};{comment}

Criteria: 98
SkipOver: True
Find: {nl} [{code}] { ; | "{" | "}" } [// {".*"}] {delim-: {nl}}
Replace: [Skip over]

Criteria: 99
SkipOver: True
Find: {nl} { # | // } [{".*"}]
Replace: [Skip over]

Criteria: 100
Comment: Nested UDTs - 1st pass (gather members)
Pass: 6

Criteria: 101
Find: {nl} struct {name} "{" {members+} "}";
Replace: {Self}{@Eval: Dim {name} As String = {Q}{members}{Q}}

Criteria: 102
Find: {nl} union {name} "{" {members+} "}";
Replace: {Self}{@Eval: Dim {name} As String = {Q}union{{members}};{Q}}

Criteria: 103
Comment: Nested UDTs - 2nd pass (insert members)
Pass: 7

Criteria: 104
Find: {nl} { struct | union }
Replace: {Self}{@Eval: UDT = True}

Criteria: 105
PassOnce: False
Find: {nl}{nested:1}; {@If: UDT}
Replace: {@Eval: {nested}}

Criteria: 106
SkipOver: True
Find: {nl}{type:1} {member};
Replace: [Skip over]

Criteria: 107
Find: {nl} "}";
Replace: {Self}{@Eval: UDT = False}

Criteria: 108
Comment: Adds default values in function prototypes for optional parameters
Pass: 8

Criteria: 109
PassOnce: False
Find: Optional {type:1}[{ptr: *}]{arg:1} [{more: , [Optional] {etc}}]
Replace: {type} {ptr}{arg} = {@Eval:
            IIf("{ptr}" <> "", "NULL",
            IIf(InStr("{type}", "{ float|double|EXTENDED }"), "0.0",
            IIf(InStr("{type}", "{ UCHAR|short|USHORT|int|unsigned }"), "0", 
            Chr(34, 34))))
         }{more: , Optional {etc}}

Criteria: 110
Find: Optional {@If: IsPrototype==0}
Replace: {Nothing}

Criteria: 111
SkipOver: True
Find: // {Comment:".*"}
Replace: [Skip over]

Criteria: 112
Find: {nl}// End of prototypes
Replace: {Self}{@Exec: IsPrototype = 0}

Criteria: 113
Comment: Misc
Pass: 9

Criteria: 114
SkipOver: True
Find: { // {comment:".*"} | /* {commentB~} */ }
Replace: [Skip over]

Criteria: 115
Find: {" \xFF\xFF\n"}
Replace: {nl}

Criteria: 116
Find: {" \xFF"}{comment:"[^\xFF]+"}{"\xFF\n"}
Replace:  /* {comment} */{nl}

Criteria: 117
Find: @
Replace: *

Criteria: 118
Highlight: True
Find: @{pointer:1}.
Replace: {pointer}->

Criteria: 119
Find: `{@Comment: removes temp char for type member access}
Replace: {Nothing}

Criteria: 120
Find: std::vector<{type}> {name:1} "["{size}"]"
Replace: std::vector<{type}>{name}({size})

Criteria: 121
Find: #IncludeStart {file}.inc
         {code+}
      #IncludeEnd {etc}
Replace: // #Include "{file}.inc"

# End Search
