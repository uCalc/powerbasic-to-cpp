# Parenth.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.0 on 11/6/2013 2:41:02 PM
# Comment: Adds parenthesis around args in function/sub calls that don't have it

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique

FindMode: Replace

# Definitions


# Search Criteria

Criteria: 0
Enabled: True
Exclude: False
Comment: Adds parenthesis around args in function/sub calls that don't have it
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
Selected: True
Find: 
Replace: {@Define::
            Token: [\x27\_].* ~~ Properties: ucWhiteSpace
            Token: : ~~ Properties: ucStatementSep
         }{@Define: Var: Args As String}

Criteria: 2
Comment: 
Pass: 1

Criteria: 3
BackColor: Lime
Find: [Declare]{ Function|Sub } {name} [Lib {lib}] [Alias {alias}] ([{args}])
Replace: {@Eval:
            Args = Remove("{args}", "{ Optional|ByVal|ByRef|As {type:1} [Ptr] | {'[#!@$%&]+'} | () }")
            Args = SetSyntaxParams(Args, Args)
         }{@Define::
            PassOnce ~~ Syntax: {name} {@Eval: Args} ::= {name}({@Eval: Args})
            SkipOver ~~ Syntax: {name}({args})
         {@Eval: "PassOnce ~~ Syntax: {name} "+Args+" ::= {name}("+Args+")"}
         }{Self}

# End Search
