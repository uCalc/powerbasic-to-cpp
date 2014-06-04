# precompile.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.96 on 6/4/2014 5:07:40 PM
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
QuoteSensitive: False
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
Find: {@Note:
         This file is still under construction.
         It does not work just yet.
      }
Replace: {@Define:
            Syntax: { % | & | ? } ::= {Nothing}
            Syntax: Def([%]{equate}) ::= (Index(Equates, "{equate}") <> 0)
            Syntax: &{base:"[hbo]"} ::= #{base}
            Var: Equates As Table
            Var: MetaIF = True
            Var: NestedIF As Stack
            Var: IsInclude
         }
         {@Define:: Token: _.*\n ~~ Properties: ucWhiteSpace}

Criteria: 2
Comment: 
Pass: 1

Criteria: 3
Selected: True
PassOnce: False
Find: {@Start}
Replace: ' These equates may need to be adjusted manually
         ' depending on the compiler version used
         %PB_REVISION = &H501
         %PB_REVLETTER = &H20
         %PB_EXE = -1
         %PB_CC32 = -1
         %PB_DLL32 = 0
         %PB_WIN32 = 0
         %USEMACROS = -1
         

Criteria: 4
BackColor: Purple
Find: { [{nl}]{comment:"'.*"} | {"_[^\n]*\n"} }
      {@If: IsInclude}
Replace: {Nothing}

Criteria: 5
PassOnce: False
Find: {nl}#Include {q}{file}{q}
Replace: #IncludeStart {file}
         {@Eval: FileText("{file}")}
         #IncludeEnd {file}
         {@Exec: IsInclude = True}

Criteria: 6
Find: {nl}#IncludeEnd
Replace: {Self}{@Exec: IsInclude = False}

Criteria: 7
Comment: 
Pass: 2

Criteria: 8
BackColor: DarkKhaki
Find: {nl}%{equate} = {value} [{"[?%&]+"}] [']
      
Replace: {Self}{@Exec:
            Dim {equate} = ~Eval(Replace(Replace({Q}{value}{Q}, "&", "#"), "{'_.*\n'}", ""))
            Insert(Equates, "{equate}")
         }

Criteria: 9
BackColor: Yellow
Find: {nl}{line:".*"} {@If: MetaIF == False}
Replace: {nl}'{line}

Criteria: 10
BackColor: Yellow
Find: {nl}{" *#If"} {expr}
Replace: {Self}{@Exec:
            Push(NestedIF, MetaIF)
            IIf({expr}, MetaIF=True, MetaIF=False)   
         }

Criteria: 11
BackColor: Brown
Find: {nl}{" *#Else"}
Replace: {Self}{@Execute: MetaIF = -(MetaIF+1)}

Criteria: 12
BackColor: RoyalBlue
Find: {nl}{" *#ElseIf"} {expr}
Replace: {Self}{@Exec:
            IIf(MetaIF==False And {expr}, MetaIF=True, MetaIF=False)  
         }

Criteria: 13
Find: {nl}{" *#EndIf"}
Replace: {Self}{@Execute: MetaIF = PopNum(NestedIF)}

Criteria: 14
Find: 
Replace: 

# End Search
