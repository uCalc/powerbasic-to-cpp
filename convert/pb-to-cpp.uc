# pb-to-cpp.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.95 on 3/27/2014 10:05:28 AM
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
Selected: True
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
Find: If {cond} Then {nl}
         {code+}
      End If
Replace: if ({cond}) {
            {code}
         }

Criteria: 26
Highlight: True
PassOnce: False
Find: For {x} = {start} To {stop} [Step {inc=1}]{nl}
         {code+}
      Next
Replace: for ({x}={start}; {x}{@Eval: IIF(sgn({inc})>0, '<', '>')}={stop}; {x} += {inc}) {
            {code}
         }

Criteria: 27
Highlight: True
PassOnce: False
Find: While {cond} {nl}
         {code+}
      Wend
Replace: while ({cond}) {
            {code}
         }

Criteria: 28
Highlight: True
PassOnce: False
Find: Do { {while: While} | {until: Until} } {cond} {nl}
         {code+}
      Loop
Replace: while ({while: {cond}}{until:!({cond})}) {
            {code}
         }

Criteria: 29
Highlight: True
PassOnce: False
Find: Do{nl}
         {code+}
      Loop { {while: While} | {until: Until} } {cond}
Replace: do {
            {code}
         } while ({while: {cond}}{until:!({cond})}) 

Criteria: 30
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

Criteria: 31
Highlight: True
BackColor: Orange
PassOnce: False
Find: { Dim | {member: {nl}}} {var:1} As {type} [{ptr: Ptr}]
Replace: {member: {nl}}{type} {ptr:*}{var};

Criteria: 32
Highlight: True
PassOnce: False
Find: {nl} {bitfield:1} As Bit * {size} [{in: In {type}}]
Replace: {nl}{@Eval:
            IIf("{type}" <> "", SetVar(BitType, "{type}"))
            BitType
         } {bitfield} : {size};

Criteria: 33
Highlight: True
PassOnce: False
Find: Dim {array}({subscript}) As {type}
Replace: {type} *{array} = new {type} [{subscript}+1];{@Eval:
            Insert(ArrayNames, "{array}")
         }{@Define:: Syntax: {array}([{index}]) ::= {array}[{index}]} 

Criteria: 34
Highlight: True
BackColor: SandyBrown
PassOnce: False
Find: Dim {var1}, {more}
Replace: Dim {var1}
         Dim {more}

Criteria: 35
Highlight: True
BackColor: Gold
PassOnce: False
Find: { Local | Global | Register }
Replace: Dim

Criteria: 36
Highlight: True
Find: @
Replace: *

Criteria: 37
Highlight: True
BackColor: Silver
Find: VarPtr({var})
Replace: &{var}

Criteria: 38
Highlight: True
BackColor: DeepSkyBlue
PassOnce: False
Find: Function = {value}
Replace: return {value}

Criteria: 39
Find: Iterate
Replace: continue

Criteria: 40
Find: Exit
Replace: break

Criteria: 41
Highlight: True
Find: Exit Sub
Replace: return

Criteria: 42
Highlight: True
BackColor: Lime
Find: Long
Replace: int

Criteria: 43
Highlight: True
BackColor: Red
Find: Single
Replace: float

Criteria: 44
Find: Double
Replace: double

Criteria: 45
Highlight: True
Find: Byte
Replace: unsigned char

Criteria: 46
Highlight: True
Find: Integer
Replace: short

Criteria: 47
Highlight: True
Find: Word
Replace: unsigned short

Criteria: 48
Highlight: True
Find: Dword
Replace: unsigned int

Criteria: 49
Find: AsciiZ
Replace: LPCSTR

Criteria: 50
Highlight: True
Find: Quad
Replace: __int64

Criteria: 51
SkipOver: True
Find: long double
Replace: [Skip over]

Criteria: 52
Highlight: True
Find: { Extended | Ext }
Replace: long double

Criteria: 53
Highlight: True
BackColor: SlateBlue
PassOnce: False
Find: ByRef {arg} As {type:1}
Replace: {type}& {arg}

Criteria: 54
PassOnce: False
Find: ByRef {array}() As {type:1}
Replace: {type} {array}[]{@Define::
            Syntax: {array}([{index}]) ::= {array}[{index}]
         }

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
Find: #ElseIf
Replace: #elif

Criteria: 59
Find: #{directive: If | Else | EndIf }
Replace: #{@Eval: LCase("{directive}", "{'.*'}")}

Criteria: 60
Highlight: True
PassOnce: False
Find: [{NOT: Not }] %Def({const})
Replace: {NOT:!}defined {const}

Criteria: 61
Find: Choose[&]({index}, {choice})
Replace: IIf({index}, {choice}, 0)

Criteria: 62
Find: Choose$({index}, {choice})
Replace: IIf({index}, {choice}, "")

Criteria: 63
PassOnce: False
Find: Choose[{type: $ | & }]({index}, {choice1}, {more})
Replace: IIf({index}, {choice1}, Choose{type}({index}, {more}))

Criteria: 64
Find: StdOut {text} { {sameline: ;} | {NewLine: } }
Replace: cout << {text} {NewLine: << endl;}

Criteria: 65
Find: Sleep {milliseconds}
Replace: PB_SLEEP({milliseconds})

Criteria: 66
Find: {keyword:"CV(BYT|DWD|D|E|I|L|Q|S|WRD)"}({string} [, {offset=1}])
Replace: PB_{@Eval:UCase("{keyword}", "{'.*'}")}({string}, {offset})

Criteria: 67
PassOnce: False
Find: Line Input [{prompt: {q}{str}{q} | ${equate:1}}][,] {StrVariable:1}
Replace: {prompt: cout << {prompt};}getline(cin, {StrVariable});

Criteria: 68
Comment: Adds semi-colons to statements
Pass: 4

Criteria: 69
Highlight: True
SkipOver: True
Find: { "{" | "}" | ; | //[{".*"}] | #{".*"} } {nl} [{"[ \n]+"}]
Replace: [Skip over]

Criteria: 70
Comment: Skips over so that colons in bit fields are not affected
Highlight: True
SkipOver: True
Find: struct {name:1} "{" {members+} "}"
Replace: [Skip over]

Criteria: 71
SkipOver: True
Find: ({cond} ? {this} :
Replace: [Skip over]

Criteria: 72
Highlight: True
Find: :
Replace: ;

Criteria: 73
SkipOver: True
Find: ::
Replace: [Skip over]

Criteria: 74
Highlight: True
PassOnce: False
Find: {nl}
Replace: ;{nl}

Criteria: 75
PassOnce: False
Find: IIf[$]({cond}, {this}, {that})
Replace: ({cond} ? {this} : {that})

Criteria: 76
Find: _char([{char= }])
Replace: '{char}'

Criteria: 77
Find: {" \xFF\xFF\n"}
Replace: {nl}

Criteria: 78
Find: {" \xFF"}{comment:"[^\xFF]+"}{"\xFF\n"}
Replace:  /* {comment} */{nl}

# End Search
