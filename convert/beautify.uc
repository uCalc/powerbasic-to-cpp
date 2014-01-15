# beautify.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.5 on 1/14/2014 6:37:14 PM
# Comment: Fixes indentation and spacing in C++ source code

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique

FindMode: Replace

# Definitions


# Search Criteria

Criteria: 0
Enabled: True
Exclude: False
Comment: Fixes indentation and spacing in C++ source code
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
Find: 
Replace: {@Define:
            Var: Indentation   = 0
            Const: IndentSize  = 3
            SyntaxArg: {spc}   = [{"[ \n]+"}]
            Inline: {indent+} := Indentation += IndentSize
            Inline: {indent-} := Indentation -= IndentSize
            Inline: {indent}  := " " * Indentation
         }{@Eval: Indentation = 0}

Criteria: 2
Comment: Strips all indentation and some spacing
Pass: 1

Criteria: 3
BackColor: Brown
Find: {"\n"}{" +"}
Replace: {nl}

Criteria: 4
BackColor: RoyalBlue
Find: {spc} "{" {spc}
Replace: {

Criteria: 5
BackColor: Pink
Find: {spc} "}"
Replace: }

Criteria: 6
BackColor: Purple
Find: {" *; *"}
Replace: ;

Criteria: 7
Find: {" *, *"}
Replace: ,{sp}

Criteria: 8
Comment: Handles semicolons
Pass: 2

Criteria: 9
Selected: True
BackColor: Green
Find: ({params~})
Replace: ({@Eval: Replace({Q}{params}{Q}, ";", "; ")})

Criteria: 10
BackColor: SandyBrown
Find: ;{char:"[^\n]"}
Replace: ;{nl}{char}

Criteria: 11
Comment: Performs indentation
Pass: 3

Criteria: 12
BackColor: DeepSkyBlue
Find: {nl}
Replace: {nl}{indent}

Criteria: 13
BackColor: DarkKhaki
Find: "{" [{comment: //{".*"}}]
Replace: {sp}{{comment: {comment}}{nl}{indent+}{indent}

Criteria: 14
BackColor: Yellow
Find: "}" [{comment: //{".*"}}]
Replace: {nl}{indent-}{indent}}{comment: {comment}}

Criteria: 15
BackColor: Brown
Find: {nl}{type:1}{func:1}([{args}])"{"
Replace: {nl}{type} {func}({args}){nl}{{indent+}{nl}{indent}

# End Search
