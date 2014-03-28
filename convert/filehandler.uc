# filehandler.uc - uCalc Transformation file
# This file was saved with uCalc Transform 2.95 on 3/28/2014 2:13:18 PM
# Comment: File handler

ExternalKeywords: Exclude, Comment, Selected, ParentChild, FindMode, InputFile, OutputFile, BatchAction, SEND
ExternalKeywords: Highlight, ForeColor, BackColor, FontName, FontSize, FontStyle
ExternalKeywords: FilterEndText, FilterSeparator, FilterSort, FilterSortFunc, FilterStartText, FilterUnique, FilterTally

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
Selected: True
Find: 
Replace: {@Token:: : ~~ Properties: ucStatementSep }

Criteria: 2
Comment: 
Pass: 1

Criteria: 3
BackColor: Yellow
SkipOver: True
Find: ' {Comment:".*"}
Replace: [Skip over]

Criteria: 4
BackColor: DeepSkyBlue
Find: {@Start}
Replace: #include <iostream>
         #include <fstream>
         {@Var: FreeFileNum}

Criteria: 5
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

Criteria: 6
BackColor: Lime
Find: Close [#]{filenum}
Replace: file_{filenum}.close() ' PB: Close #{filenum}

Criteria: 7
BackColor: RoyalBlue
PassOnce: False
Find: Close [#]{file1}, {more}
Replace: Close {file1}
         Close {more}

Criteria: 8
BackColor: Pink
Find: Seek [#] {filenum}, {position}
Replace: file_{filenum}.seekg({position}-1)
         file_{filenum}.seekp({position}-1)

Criteria: 9
Find: Seek([#] {filenum})
Replace: file_{filenum}.tellg()+1

Criteria: 10
BackColor: SlateBlue
Find: LOF({filenum})
Replace: PB_LOF({filenum})

Criteria: 11
Find: EOF({filenum})
Replace: file_{filenum}.eof()

Criteria: 12
Find: FreeFile
Replace: {@Eval: FreeFileNum += 1; FreeFileNum}

Criteria: 13
BackColor: Green
Find: Get$ [#] {filenum}, {count}, {StringVar}
Replace: {StringVar}.resize({count})
         file_{filenum}.read(&{StringVar}[0], {count})

Criteria: 14
BackColor: SandyBrown
Find: Put$ [#] {filenum}, {text}
Replace: file_{filenum}.write(&{text}[0], {text}.size())

Criteria: 15
Find: IsFile({file})
Replace: PB_ISFILE({file})

Criteria: 16
Find: Name {oldname} As {newname}
Replace: PB_NAME({oldname}, {newname})

Criteria: 17
BackColor: Gold
Find: EXE.Extn$
Replace: PB_EXE_EXTN

Criteria: 18
BackColor: Silver
Find: EXE.Full$
Replace: PB_EXE_FULL()

Criteria: 19
Find: EXE.Name$
Replace: PB_EXE_NAME

Criteria: 20
BackColor: CornflowerBlue
Find: EXE.Namex$
Replace: PB_EXE_NAMEX

Criteria: 21
Find: EXE.Path$
Replace: PB_EXE_PATH

Criteria: 22
Find: Dir$({mask})
Replace: PB_DIR({mask})

Criteria: 23
Find: Dir$([Next])
Replace: PB_DIR_NEXT()

Criteria: 24
Find: Print #{filenum}
Replace: file_{filenum} << endl

Criteria: 25
Find: Print #{filenum}, {text}
Replace: file_{filenum} << {text} << endl

Criteria: 26
Find: Print #{filenum}, {text};
Replace: file_{filenum} << {text}

Criteria: 27
PassOnce: False
Find: Print #{filenum}, {text}; {MoreText}
Replace: Print #{filenum}, {text} << {MoreText}

Criteria: 28
Comment: 
Pass: 2

Criteria: 29
BackColor: Yellow
Find: fstream {file} ({args+})
Replace: {@Eval: Replace('{Self}', '{"[ \n]+"}', ' ')}

# End Search
