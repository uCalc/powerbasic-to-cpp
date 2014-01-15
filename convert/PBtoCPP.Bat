REM To convert a file from PowerBASIC to C++, run this:
REM
REM PBtoCPP MyFile.Bas
REM
REM (Rename MyFile.Bas to anything you'd like)
REM This will produce MyFile.cpp as output.

uCalcTransform  refactor.uc        %1        %1.1.tmp /Q
uCalcTransform  strings.uc         %1.1.tmp  %1.2.tmp /Q
uCalcTransform  typespecifiers.uc  %1.2.tmp  %1.3.tmp /Q
uCalcTransform  pb-to-cpp.uc       %1.3.tmp  %1.4.tmp /Q
uCalcTransform  beautify.uc        %1.4.tmp  %~n1.cpp /Q

REM Del *.tmp
REM Temp files can give some insight about the conversion.
REM If you do not need Temp files, un-comment the above "Del *.tmp" line.
