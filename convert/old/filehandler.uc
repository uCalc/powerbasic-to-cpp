# filehandler.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.5 on 1/23/2014 5:55:48 PM
# Comment: 

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique

FindMode: Replace

# Definitions


# Search Criteria

Criteria: 0
Enabled: True
Exclude: False
Comment: 
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
Comment: 
Pass: 1

Criteria: 2
BackColor: Yellow
SkipOver: True
Find: ' {Comment:".*"}
Replace: [Skip over]

Criteria: 3
BackColor: DeepSkyBlue
Find: {@Start}
Replace: #include <Windows.h>
         

Criteria: 4
BackColor: DeepSkyBlue
Find: Open {filespec}
      { For {{Input: Input}|{Output: Output}|{Append: Append}|{Binary: Binary}|{Random: Random}}|{Default: } }
      { Access Read | Access Write | Access Read Write | }
      { Lock {{LockRead: Read}|{LockWrite: Write}|{LockBoth: Read Write}|{LockShared: Shared}}|{LockDefault: } }
      As [#]{filenum} [Len = {size=128}]
Replace: ' {Self}
         _FileHandle({filenum}) = CreateFile({filespec},
            {Input: GENERIC_READ}
            {Output: GENERIC_WRITE}
            {Append: GENERIC_WRITE}
            {Binary: GENERIC_READ Or GENERIC_WRITE}
            {Random: GENERIC_READ Or GENERIC_WRITE}
            {Default: GENERIC_READ Or GENERIC_WRITE}
         ,
            {LockRead: FILE_SHARE_WRITE}
            {LockWrite: FILE_SHARE_READ}
            {LockBoth: 0}
            {LockShared: FILE_SHARE_READ Or FILE_SHARE_WRITE}
            {LockDefault: 0}
         , 0,
            {Input: OPEN_EXISTING}
            {Output: CREATE_ALWAYS}
            {Append: OPEN_ALWAYS}
            {Binary: OPEN_ALWAYS}
            {Random: OPEN_ALWAYS}
            {Default: OPEN_ALWAYS}
         , FILE_ATTRIBUTE_NORMAL, 0)
         {Append:SetFilePointer(_FileHandle({filenum}), 0, 0, FILE_END){nl}}

Criteria: 5
BackColor: Lime
Find: Close [#]{filenum}
Replace: ' Close #{filenum}
         CloseHandle(_FileHandle({filenum}))
         _FileHandle({filenum}) = 0
         

Criteria: 6
BackColor: RoyalBlue
PassOnce: False
Find: Close [#]{file1}, {more}
Replace: Close {file1}
         Close {more}

Criteria: 7
BackColor: Pink
Find: Seek [#] {filenum}, {position}
Replace: SetFilePointer(_FileHandle({filenum}), {position}-1, 0, FILE_BEGIN)

Criteria: 8
Find: Seek([#] {filenum})
Replace: SetFilePointer(_FileHandle({filenum}), 0, 0, FILE_CURRENT)+1

Criteria: 9
BackColor: SlateBlue
Find: LOF({filenum})
Replace: GetFileSize(_FileHandle({filenum}), 0)

Criteria: 10
Selected: True
Find: EOF({filenum})
Replace: IIf(Seek({filenum}) = LOF({filenum})+1, -1, 0)

Criteria: 11
Comment: 
Pass: 2

Criteria: 12
BackColor: Yellow
Find: CreateFile({arg1}{nl}{args+})
Replace: {@Eval: Replace('{Self}', '{"[ \n]+"}', ' ')}

# End Search
