@ECHO off
SETLOCAL

IF "%1" == "/?" (
   ECHO To convert a file from PowerBASIC to C++, run this:
   ECHO.
   ECHO PBtoCPP MyFile.Bas
   ECHO.
   ECHO ^(Rename MyFile.Bas to your PB input file^)
   ECHO This will produce MyFile.cpp as output.
   ECHO.
   ECHO For debugging purposes run:
   ECHO.
   ECHO PBtoCPP /D MyFile.Bas
   ECHO.
   ECHO This preserves a list of intermediate transform files, which can offer
   ECHO insight into the transformations performed by each .uc file.
   EXIT /B
)

IF /I "%1" == "/D" (
   SET DEBUG=True
   SHIFT
)

IF /I "%1" == "/F" (
   SET FAST=True
   SHIFT
)

SET FILE=%~n1

IF /I "%DEBUG%" == "True" (
   REM This option is for debugging
   uCalcTransform  precompile.uc       %1            %FILE%.1.tmp  /Q
   uCalcTransform  refactor.uc         %FILE%.1.tmp  %FILE%.2.tmp  /Q
   uCalcTransform  implicit-dim.uc     %FILE%.2.tmp  %FILE%.3.tmp  /Q
   uCalcTransform  typespecifiers.uc   %FILE%.3.tmp  %FILE%.4.tmp  /Q
   uCalcTransform  implicit-convert.uc %FILE%.4.tmp  %FILE%.5.tmp  /Q
   uCalcTransform  strings.uc          %FILE%.5.tmp  %FILE%.6.tmp  /Q
   uCalcTransform  filehandler.uc      %FILE%.6.tmp  %FILE%.7.tmp  /Q
   uCalCTransform  math.uc             %FILE%.7.tmp  %FILE%.8.tmp  /Q
   uCalCTransform  print.uc            %FILE%.8.tmp  %FILE%.9.tmp  /Q
   uCalcTransform  pb-to-cpp.uc        %FILE%.9.tmp  %FILE%.10.tmp /Q
   uCalcTransform  beautify.uc         %FILE%.10.tmp %FILE%.cpp    /Q
) ELSE (
   IF /I "%FAST%" == "True" (
      uCalcTransform interactive.uc %1 %FILE%.cpp %2 /q
      EXIT /B
   )

   uCalcTransform "precompile.uc|refactor.uc|implicit-dim.uc|typespecifiers.uc|implicit-convert.uc|strings.uc|filehandler.uc|math.uc|print.uc|pb-to-cpp.uc|beautify.uc" %1 %FILE%.cpp %2 /q
)
