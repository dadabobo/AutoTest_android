@echo off

::set monkeyrunner path
set ADB_CMD=%cd%\slog\windows\tools\adb.exe
set MONKEY=%cd%\tools\sdk\tools\monkeyrunner.bat
set TAIL=%cd%\slog\tools\tail.exe
set TEE=%cd%\slog\tools\tee.exe

::get phone project version name
set DTYPE=%ADB_CMD% shell "getprop ro.product.cg_version"
for /f %%i in ('%DTYPE%') do set DTYPE=%%i

::init log file
::set date=%DATE:~0,10%_%TIME:~0,8%
set date=%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set logdir=%cd%\logs\%date%
echo monkey log save path : %logdir%
mkdir "%logdir%"

set logfile=Monkeyrunner_%date%.log
set logpath=%logdir%\%logfile%
echo monkey log save file : %logpath%

::run monkeyrunner test
echo run order : %MONKEY% %run_file% %DTYPE%
echo -------------------------------------------------------------------------
echo if you want exit,press Ctrl + C, and input Y/y. Then press Enter to exit.
echo -------------------------------------------------------------------------
call %MONKEY% %run_file% %DTYPE% | %TEE% %logpath%

::get Android log
if %DEBUG%==0 goto getlog
if %DEBUG%==1 goto nolog

:getlog
echo get android log, save to : %cd%\slog\windows\logs
cd %cd%\slog\windows
call LogAndroid2PC.bat
cd ..\..
goto end
:nolog
echo no android log, just do the test.
goto end
:end