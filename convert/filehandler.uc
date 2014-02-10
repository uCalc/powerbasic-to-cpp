# filehandler.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.5 on 2/10/2014 9:28:20 AM
# Comment: File handler

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique

FindMode: Replace

# Definitions


# Search Criteria

Criteria: 0
Enabled: True
Exclude: False
Comment: File handler
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
Replace: #include <iostream>
         #include <fstream>
         {@Var: FreeFileNum}

Criteria: 4
Selected: True
BackColor: DeepSkyBlue
Find: Open {filespec}
      { For {{Input: Input}|{Output: Output}|{Append: Append}|{Binary: Binary}|{Random: Random}}|{Default: } }
      { Access Read | Access Write | Access Read Write | }
      { Lock {{LockRead: Read}|{LockWrite: Write}|{LockBoth: Read Write}|{LockShared: Shared}}|{LockDefault: } }
      As [#]{filenum} [Len = {size=128}]
Replace: fstream file_{filenum} (string({filespec}).c_str(),
            {Input:   ios::in}
            {Output:  ios::out | ios::trunc}
            {Append:  ios::out | ios::app}
            {Binary:  ios::binary | ios::in | ios::out}
            {Random:  ios::binary | ios::in | ios::out}
            {Default: ios::binary | ios::in | ios::out}
         );

Criteria: 5
BackColor: Lime
Find: Close [#]{filenum}
Replace: file_{filenum}.close() ' PB: Close #{filenum}

Criteria: 6
BackColor: RoyalBlue
PassOnce: False
Find: Close [#]{file1}, {more}
Replace: Close {file1}
         Close {more}

Criteria: 7
BackColor: Pink
Find: Seek [#] {filenum}, {position}
Replace: file_{filenum}.seekg({position}-1)
         file_{filenum}.seekp({position}-1)

Criteria: 8
Find: Seek([#] {filenum})
Replace: file_{filenum}.tellg()+1

Criteria: 9
BackColor: SlateBlue
Find: LOF({filenum})
Replace: (missing)

Criteria: 10
Find: EOF({filenum})
Replace: file_{filenum}.eof()

Criteria: 11
Find: FreeFile
Replace: {@Eval: FreeFileNum += 1; FreeFileNum}

Criteria: 12
BackColor: Green
Find: Get$ [#] {filenum}, {count}, {StringVar}
Replace: {StringVar}.resize({count})
         file_{filenum}.read(&{StringVar}[0], {count})

Criteria: 13
BackColor: SandyBrown
Find: Put$ [#] {filenum}, {text}
Replace: file_{filenum}.write(&{text}[0], {text}.size())

Criteria: 14
Comment: 
Pass: 2

Criteria: 15
BackColor: Yellow
Find: fstream {file} ({args+})
Replace: {@Eval: Replace('{Self}', '{"[ \n]+"}', ' ')}

# End Search
