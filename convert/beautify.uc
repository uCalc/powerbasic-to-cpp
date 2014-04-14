# beautify.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.95 on 4/14/2014 5:32:53 PM
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
         }
         {@Eval: Indentation = 0}
         {@Token:: //[^`]*` ~~ Properties: ucWhiteSpace}

Criteria: 2
Comment: Strips all indentation and some spacing
Pass: 1

Criteria: 3
Find: {comment:"//.*"}
Replace: {comment}`

Criteria: 4
BackColor: Brown
Find: {"\n"}{" +"}
Replace: {nl}

Criteria: 5
SkipOver: True
Find: ({code~})
Replace: [Skip over]

Criteria: 6
Comment: 
Pass: 2

Criteria: 7
BackColor: RoyalBlue
Find: {spc} "{" {spc}
Replace: {

Criteria: 8
BackColor: Pink
Find: {spc} "}"
Replace: }

Criteria: 9
BackColor: Purple
Find: {" *; *"}
Replace: ;

Criteria: 10
Find: {" *, *"}
Replace: ,{sp}

Criteria: 11
Comment: Handles semicolons
Pass: 3

Criteria: 12
BackColor: Green
Find: ({params~})
Replace: ({@Eval: Replace({Q}{params}{Q}, ";", "; ")})

Criteria: 13
BackColor: SandyBrown
Find: ;{char:"[^\n]"}
Replace: ;{nl}{char}

Criteria: 14
Comment: Preserves comment location if it's after a ";"
Find: ;{" *//"}
Replace: ; //

Criteria: 15
Comment: Performs indentation
Pass: 4

Criteria: 16
BackColor: DeepSkyBlue
Find: {nl}
Replace: {nl}{indent}

Criteria: 17
BackColor: DarkKhaki
Find: "{" [[{" +"}]{comment:"//[^`]*`"}[{nl}]]
Replace: {sp}{{comment: {comment}}{nl}{indent+}{indent}

Criteria: 18
BackColor: Yellow
Find: "}" [[{" +"}]{comment:"//[^`]*`"}]
Replace: {nl}{indent-}{indent}}{comment: {comment}}

Criteria: 19
BackColor: Brown
Find: {nl}{type:1}{func:1}([{args+}])"{"
Replace: {nl}{type} {func}({args}){nl}{{indent+}{nl}{indent}

Criteria: 20
Comment: 
Pass: 5

Criteria: 21
Selected: True
Find: {comment:" *//[^`]*"}`
Replace: {comment}

# End Search
