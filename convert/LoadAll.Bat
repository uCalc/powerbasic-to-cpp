@ECHO OFF
REM This loads all the transforms at the same time (each under a separate tab)
REM for easier editing.

uCalcTransform /i ^
/TF:Interactive.uc ^
/TF:precompile.uc ^
/TF:refactor.uc ^
/TF:implicit-dim.uc ^
/TF:typespecifiers.uc ^
/TF:implicit-convert.uc ^
/TF:strings.uc ^
/TF:filehandler.uc ^
/TF:math.uc ^
/TF:print.uc ^
/TF:pb-to-cpp.uc ^
/TF:beautify.uc ^
SampleCode.Bas

