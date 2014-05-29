# refactor.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.96 on 5/28/2014 3:24:55 PM
# Comment: This rewrites code in more proper PB form

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, InputFile, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique, FilterTally

FindMode: Replace

# Definitions


# Search Criteria

Criteria: 0
Enabled: True
Exclude: False
Comment: This rewrites code in more proper PB form
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
BackColor: Khaki
Find: 
Replace: {@Define: Var: Args As String}

Criteria: 2
Comment: Defines comments as whitespace and adds missing quotes
Pass: 1

Criteria: 3
Selected: True
Find: {@Start}
Replace: {@Define::
            Token: _.*\n  ~~ Properties: ucWhiteSpace
            Token: \x27.* ~~ Properties: ucWhiteSpace
            Token: :      ~~ Properties: ucStatementSep
         }{nl}

Criteria: 4
Comment: Adds closing quote for quoted text with missing closing quote
BackColor: DarkKhaki
Find: {QuotedText:"\q[^\q\n]*"}{nl}
Replace: {QuotedText}"{nl}

Criteria: 5
Comment: Uniform syntax for optional args
Pass: 2

Criteria: 6
Find: Opt
Replace: Optional

Criteria: 7
BackColor: Lime
Find: "[", {arg} "]"
Replace: Optional {arg}

Criteria: 8
Comment: Misc
Pass: 3

Criteria: 9
Comment: Adds parenthesis around args in function/sub calls that do not have it
BackColor: Lime
Find: [Declare]{ Function|Sub } {name} [Lib {lib}] [Alias {alias}] ({args})
Replace: {@Evaluate:
            Args = Remove({args}, "{ Optional|ByVal|ByRef|As {type:1} [Ptr] | {'[#!@$%&]+'} | () }")
            Args = SetSyntaxParams(Args, Args)
         }{@Define::
            {@Eval: "PassOnce ~~ Syntax: {name} "+Args+" ::= {name}("+Args+")"}
            {@Eval: "SkipOver ~~ Syntax: {name} ({etc})"}
         }{Self}

Criteria: 10
Comment: Adds () As Long to PBMain if missing
Find: Function PBMain [()] [As Long]
Replace: Function PBMain() As Long

Criteria: 11
PassOnce: False
Find: {dim: Local|Global|Static}
      [{etc},] {item:1}[{array1: ()}], {last:1}[{array2: ()}] As {type}
Replace: {dim} {etc: {etc},} {item}{array1} As {type}
         {dim} {last}{array2} As {type}

Criteria: 12
Find: Call {function} [To {var:1}]
Replace: {var: {var} = }{function}

# End Search
