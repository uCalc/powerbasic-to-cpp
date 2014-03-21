# beautify.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.95 on 3/21/2014 9:34:42 AM
# Comment: Fixes indentation and spacing in C++ source code

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, InputFile, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique, FilterTally

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
SkipOver: True
Find: ({code~})
Replace: [Skip over]

Criteria: 5
Comment: 
Pass: 2

Criteria: 6
BackColor: RoyalBlue
Find: {spc} "{" {spc}
Replace: {

Criteria: 7
BackColor: Pink
Find: {spc} "}"
Replace: }

Criteria: 8
BackColor: Purple
Find: {" *; *"}
Replace: ;

Criteria: 9
Find: {" *, *"}
Replace: ,{sp}

Criteria: 10
Comment: Handles semicolons
Pass: 3

Criteria: 11
BackColor: Green
Find: ({params~})
Replace: ({@Eval: Replace({Q}{params}{Q}, ";", "; ")})

Criteria: 12
BackColor: SandyBrown
Find: ;{char:"[^\n]"}
Replace: ;{nl}{char}

Criteria: 13
Comment: Preserves comment location if it's after a ";"
Selected: True
Find: ;//{comment:".*"}
Replace: ; //{comment}

Criteria: 14
Comment: Performs indentation
Pass: 4

Criteria: 15
BackColor: DeepSkyBlue
Find: {nl}
Replace: {nl}{indent}

Criteria: 16
BackColor: DarkKhaki
Find: "{" [{comment: //{c:".*"}}]
Replace: {sp}{{comment: {comment}}{nl}{indent+}{indent}

Criteria: 17
BackColor: Yellow
Find: "}" [{comment: //{c:".*"}}]
Replace: {nl}{indent-}{indent}}{comment: {comment}}

Criteria: 18
BackColor: Brown
Find: {nl}{type:1}{func:1}([{args+}])"{"
Replace: {nl}{type} {func}({args}){nl}{{indent+}{nl}{indent}

Criteria: 19
Find: 
Replace: 

# End Search
