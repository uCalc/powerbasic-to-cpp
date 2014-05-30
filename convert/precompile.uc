# precompile.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.96 on 5/30/2014 8:36:41 AM
# Comment: Inserts include files, handles directives, expands macros etc

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, InputFile, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique, FilterTally

FindMode: Replace

# Definitions


# Search Criteria

Criteria: 0
Enabled: True
Exclude: False
Comment: Inserts include files, handles directives, expands macros etc
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
Find: {@Note:
         This file is still under construction.
         It does not work just yet.
      }
Replace: {@Define:
            Syntax: % ::= {Nothing}   
            Var: Equates As Table
            Var: MetaIF = True
         }

Criteria: 2
PassOnce: False
Find: {nl}#include {q}{file}{q}
Replace: ' =============== Include: {file} ===============
         {@Eval: FileText("{file}")}
         ' ============ End of Include: {file} ===========
         

Criteria: 3
Selected: True
BackColor: DarkKhaki
Find: {nl}%{equate} = {value}
Replace: {Self}{@Exec:
            Dim {equate} = Val(Replace("&", "#", "{value}"))
            Insert(Equates, "{equate}")
            ucDefine("Syntax: Def(%{equate}) ::= 1")
         }

Criteria: 4
BackColor: Yellow
Find: {nl}#If {expr}
Replace: {Self}{@Exec: IIf({expr}, MetaIF=True, MetaIF=False)}

Criteria: 5
BackColor: Yellow
Find: {nl}{line:".*"}
Replace: {@Evaluate: IIf(MetaIF==False, "' ", "") }{Self}

# End Search
