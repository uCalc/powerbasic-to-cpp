# strings.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.98 on 7/21/2014 7:25:20 PM
# Comment: Converts string-related code from PowerBASIC to C++

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, InputFile, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique, FilterTally

# Definitions


# Search Criteria

Criteria: 0
Enabled: True
Exclude: False
Comment: Converts string-related code from PowerBASIC to C++
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
Replace: {@Token:: : ~~ Properties: ucStatementSep }

Criteria: 2
Comment: 
Pass: 1

Criteria: 3
SkipOver: True
Find: ' {Comment:".*"}
Replace: [Skip over]

Criteria: 4
Find: String
Replace: string

Criteria: 5
Find: WString
Replace: wstring

Criteria: 6
BackColor: DodgerBlue
PassOnce: False
Find: InStr([{n=1},] {MainStr}, {MatchStr})
Replace: PB_INSTR({n}, {MainStr}, {MatchStr})

Criteria: 7
BackColor: Tomato
PassOnce: False
Find: InStr([{n=1},] {MainStr}, Any {MatchStr})
Replace: PB_INSTR_ANY({n}, {MainStr}, {MatchStr})

Criteria: 8
BackColor: Red
PassOnce: False
Find: Left$({Str}, {n})
Replace: PB_LEFT({Str}, {n})

Criteria: 9
BackColor: Brown
PassOnce: False
Find: Right$({Str}, {n})
Replace: PB_RIGHT({Str}, {n})

Criteria: 10
BackColor: Orange
PassOnce: False
Find: Mid$({Str}, {Start} [, {Length=FULL_STRING}])
Replace: PB_MID({Str}, {Start}, {Length})

Criteria: 11
BackColor: DeepSkyBlue
PassOnce: False
Find: {Sep: {nl} | : | Then | Else }
      Mid$({Str}, {Start} [, {Length=FULL_STRING}]) = {Txt%}
Replace: {Sep} PB_MID_REPLACE({Str}, {Txt}, {Start}, {Length})

Criteria: 12
BackColor: RoyalBlue
PassOnce: False
Find: Val({Str})
Replace: stold({Str}) 

Criteria: 13
Find: Space$({count})
Replace: string({count}, _char( ))

Criteria: 14
Find: String$({count}, {char})
Replace: string({count}, {char})

Criteria: 15
BackColor: Violet
Find: String$({count}, {q}{char}{q})
Replace: string({count}, _char({char}))

Criteria: 16
Find: {function: UCase | LCase | Hex | Oct | Str}$({arg})
Replace: PB_{@Eval: UCase("{function}", "{'.*'}")}({arg})

Criteria: 17
Find: Trim$({Str} [, ANY {chars=" "}])
Replace: PB_TRIM_ANY({Str}, {chars})

Criteria: 18
BackColor: Gold
Find: LTrim$({Str} [, ANY {chars=" "}])
Replace: PB_LTRIM_ANY({Str}, {chars})

Criteria: 19
BackColor: Silver
Find: RTrim$({Str} [, ANY {chars=" "}])
Replace: PB_RTRIM_ANY({Str}, {chars})

Criteria: 20
Find: Extract$([{start=1},] {MainStr}, {MatchStr})
Replace: PB_EXTRACT({start}, {MainStr}, {MatchStr})

Criteria: 21
Find: Extract$([{start=1},] {MainStr}, Any {MatchStr})
Replace: PB_EXTRACT_ANY({start}, {MainStr}, {MatchStr})

Criteria: 22
Find: Remain$([{start=1},] {MainStr}, {MatchStr})
Replace: PB_REMAIN({start}, {MainStr}, {MatchStr})

Criteria: 23
Find: Remain$([{start=1},] {MainStr}, Any {MatchStr})
Replace: PB_REMAIN_ANY({start}, {MainStr}, {MatchStr})

Criteria: 24
Find: Remove$({Str}, {MatchStr})
Replace: PB_REMOVE({Str}, {MatchStr})

Criteria: 25
Find: Remove$({Str}, Any {MatchStr})
Replace: PB_REMOVE_ANY({Str}, {MatchStr})

Criteria: 26
Find: Replace {MatchStr} With {NewStr} In {MainStr}
Replace: PB_REPLACE({MainStr}, {MatchStr}, {NewStr})

Criteria: 27
Find: Replace Any {MatchStr} With {NewStr} In {MainStr}
Replace: PB_REPLACE_ANY({MainStr}, {MatchStr}, {NewStr})

Criteria: 28
Find: Repeat$({count}, {Str})
Replace: PB_REPEAT({Str}, {count})

Criteria: 29
Find: Asc({Str}[, {pos=1}])
Replace: PB_ASC({Str}, {pos})

Criteria: 30
Find: ${equate: NUL|BEL|BS|TAB|LF|VT|FF|CR|CRLF|EOF|ESC|SPC|DQ|SQ|QCQ }
Replace: PB_{@Eval: UCase("{equate}", "{'.*'}")}

Criteria: 31
Find: Peek$({args})
Replace: PB_PEEK_STR((DWord){args})

Criteria: 32
Find: Poke$ {address}, {stringexpr}
Replace: PB_POKE_STR((DWord){address}, {stringexpr})

Criteria: 33
Find: RegExpr {mask} In {main} [At {start=1}] To {iPos} [, {iLen=PB_DISCARD}]
Replace: PB_REGEXPR({mask}, {main}, {start}, {iPos}, {iLen})

Criteria: 34
Find: RegRepl {mask} In {main} With {repl} [At {start=1}] To {ipos}, {newmain}
Replace: PB_REGREPL({start}, {mask}, {main}, {repl}, {ipos}, {newmain})

Criteria: 35
Find: Retain$({main}, {match})
Replace: PB_RETAIN({main}, {match})

Criteria: 36
Find: Retain$({main}, Any {match})
Replace: PB_RETAIN_ANY({main}, {match})

Criteria: 37
Find: StrReverse$({main})
Replace: PB_STRREVERSE({main})

Criteria: 38
Find: Verify([{start=1}, ] {main}, {match})
Replace: PB_VERIFY({start}, {main}, {match})

Criteria: 39
Selected: True
Find: Tab$({StrToTab}, {TabStop})
Replace: PB_TAB({StrToTab}, {TabStop})

Criteria: 40
Comment: Doubles backslash to avoid escape
Pass: 2

Criteria: 41
Find: {q}{text$}{q}
Replace: {q}{@Evaluate: Replace({text}, "\", "\\")}{q}

# End Search
