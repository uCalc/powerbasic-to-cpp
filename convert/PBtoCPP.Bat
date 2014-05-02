@Echo off
if "%1" == "/?" (
echo To convert a file from PowerBASIC to C++, run this:
echo.
echo PBtoCPP MyFile.Bas
echo.
echo ^(Rename MyFile.Bas to your PB input file^)
echo This will produce MyFile.cpp as output.
echo.
echo To preserve a list of intermediate transform files run:
echo PBtoCPP /d MyFile.Bas
echo Intermediate files can offer insight for debugging transforms.
Exit /B
)

if /i "%1" == "/d" (
   REM This option is for debugging   
   uCalcTransform  refactor.uc        %2        %2.1.tmp /Q
   uCalcTransform  implicit-dim.uc    %2.1.tmp  %2.2.tmp /Q
   uCalcTransform  typespecifiers.uc  %2.2.tmp  %2.3.tmp /Q
   uCalcTransform  strings.uc         %2.3.tmp  %2.4.tmp /Q
   uCalcTransform  filehandler.uc     %2.4.tmp  %2.5.tmp /Q
   uCalCTransform  math.uc            %2.5.tmp  %2.6.tmp /Q
   uCalCTransform  print.uc           %2.6.tmp  %2.7.tmp /Q
   uCalcTransform  pb-to-cpp.uc       %2.7.tmp  %2.8.tmp /Q
   uCalcTransform  beautify.uc        %2.8.tmp  %~n2.cpp /Q
) else (
   uCalcTransform "refactor.uc|implicit-dim.uc|typespecifiers.uc|strings.uc|filehandler.uc|math.uc|print.uc|pb-to-cpp.uc|beautify.uc" %1 %~n1.cpp %2 /q
)
