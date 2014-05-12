# implicit-dim.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.96 on 5/12/2014 10:33:51 AM
# Comment: Declares variables (with Dim) that were not explicitely declared before

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, InputFile, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique, FilterTally

FindMode: Replace

# Definitions


# Search Criteria

Criteria: 0
Enabled: True
Exclude: False
Comment: Declares variables (with Dim) that were not explicitely declared before
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
InputFile: ImplicitDim.Bas
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
         In addition to declaring variables that were not previously declared
         explicitely, this transform also comments out user declarations that
         are from the Windows API, since Windows.h already takes care of it,
         and the PB mixed casing of an API equate might not correspond with
         the exact API case-sensitive C++ orthograph.
      }
      
Replace: {@Define:: 
            Token: \x27.* ~~ Properties: ucWhitespace
            Token: _[^\n]*\n ~~ Properties: ucWhitespace
         }
         {@Define:
            Var: Globals As Table
            Var: ImplicitDim As Table
            Var: ExplicitDim As Table
            Var: CurrentRoutine As String
            Var: ExpIndex As Long
            Var: ImpIndex As Long
            Var: GlobalIndex As Long
         }
         {@Exec:
            Split(File("WinAPIKeywords.txt"))   
            uc_For(x, 1, StringItemCount, 2, Insert(Globals, StringItem(x)))
         }

Criteria: 2
Comment: Teporarily adds Dim keyword in front of args for further parsing
Pass: 1

Criteria: 3
Find: {nl}{routine: Sub | Function } {etc}({args})
Replace: {nl}{routine} {etc}(Dim {args})

Criteria: 4
SkipOver: True
Find: {nl}Function =
Replace: [Skip over]

Criteria: 5
Comment: Inserts explicitly Dimmed variable names in global or local tables
Pass: 2

Criteria: 6
Find: Global{" +"}{variable:"[a-z][a-z0-9_]*[#!?%&]*"}
Replace: {Self}{@Eval: Insert(Globals, "{variable}")}

Criteria: 7
BackColor: Silver
Find: {nl}{ Macro | Type | Union | % | $[$] | Declare {func:1} }  {name:1}
Replace: {Self}{@Eval: Insert(Globals, "{name}")}

Criteria: 8
BackColor: Lime
Find: {nl}{ Sub | Function }{" +"}{RoutineName:"[a-z0-9_]+"}
Replace: {Self}{@Define:
            Var: {RoutineName}ExplicitDim As Table
            Var: {RoutineName}ImplicitDim As Table
         }{@Eval: SetVar(CurrentRoutine, "{RoutineName}"); Insert(Globals,"{RoutineName}")}

Criteria: 9
Find: {nl}End { Sub | Function }
Replace: {Self}{@Eval: SetVar(CurrentRoutine, "")}

Criteria: 10
BackColor: Pink
Find: {declare: Dim [[Optional] { ByVal | ByRef }] | Local | Static | Register | fstream }
      {" +"}{variable:"[a-z][a-z0-9_]*[#!?%&]*"}
Replace: {Self}{@Eval: Insert(~Eval(CurrentRoutine)ExplicitDim, "{variable}")}

Criteria: 11
Comment: Temporarily inserts declaration for each individual variable a lines with a list of multiple vars, for easier parsing
BackColor: SlateBlue
PassOnce: False
Find: {declare: Global|Dim|Local|Static|Register} {variable},
Replace: {declare} {variable} ::: {declare}

Criteria: 12
Selected: True
Find: {nl}%{equate:1} = {@If: Index(Globals, {equate})}
Replace: {nl} ' <WinAPI> {equate} =

Criteria: 13
Find: {nl}Declare {method: Sub | Function } {name:1}  {@If: Index(Globals, {name})}
Replace: {nl} ' <WinAPI> Declare {method} {name}

Criteria: 14
Comment: Places non-Dimmed variable names in separate local tables
Pass: 3

Criteria: 15
Find: [{eq: %}]{name:"[a-z][a-z0-9_]*[#!?%&]*"} [{IsFunc:" *\("}]
Replace: {eq}{@Eval:
            ExpIndex    = Index(~Eval(CurrentRoutine)ExplicitDim, "{name}")
            ImpIndex    = Index(~Eval(CurrentRoutine)ImplicitDim, "{name}")
            GlobalIndex = Index(Globals, "{name}")
            IIf(ExpIndex+ImpIndex+GlobalIndex == 0 And "{IsFunc}" == "",
                Insert(~Eval(CurrentRoutine)ImplicitDim, "{name}"))
            
            text = "{name}"
            IIf(GlobalIndex, text = ReadKey(Globals, GlobalIndex))
            IIf(ExpIndex, text = ReadKey(~Eval(CurrentRoutine)ExplicitDim, ExpIndex))
            IIf(ImpIndex, text = ReadKey(~Eval(CurrentRoutine)ImplicitDim, ImpIndex))
            text + "{IsFunc}"
         }

Criteria: 16
SkipOver: True
Find: {"[a-z0-9_]+"}  {UDT:"\.[a-z0-9_\@\.]+"}
Replace: [Skip over]

Criteria: 17
SkipOver: True
Find: {"&h[0-9a-f]+"}
Replace: [Skip over]

Criteria: 18
SkipOver: True
Find: {@Eval: "{'"+Retain(FileText("PBKeywords.txt"), "{keyword:'.*'}", Delim("\b|"))+"\b'}"}
Replace: [Skip over]

Criteria: 19
BackColor: Brown
Find: {"\n"}{ Sub | Function }{" +"}{RoutineName:"[a-z0-9_]+"}
Replace: {Self}{@Eval: SetVar(CurrentRoutine, "{RoutineName}")}

Criteria: 20
Find: {"\n"}End { Sub | Function }
Replace: {Self}{@Eval: SetVar(CurrentRoutine, "")}

Criteria: 21
Comment: Inserts local Dim statements for variables that were not dimmed
Pass: 4

Criteria: 22
BackColor: Purple
Find: {nl}{ Sub | Function }{" +"}{RoutineName:"[a-z0-9_]+"} {etc}
Replace: {Self}
         {@Eval: 
            Range(1, Count({RoutineName}ImplicitDim),
            {Q}"   Dim "+ReadKey({RoutineName}ImplicitDim, x)+" ' Implicit"+Chr(10){Q})
         }

Criteria: 23
Comment: Clean up (temp declaration statements removed)
Pass: 5

Criteria: 24
BackColor: Violet
Find: ::: {declare:1}
Replace: ,

Criteria: 25
BackColor: CornflowerBlue
Find: (Dim {args})
Replace: ({@Eval: Replace("{args}", "::: Dim", ",")})

Criteria: 26
Find: Dim {nl}
Replace: {Nothing}

# End Search
