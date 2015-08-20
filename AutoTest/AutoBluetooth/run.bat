@echo off

::init script file
set ADB_CMD=%cd%\slog\windows\tools\adb.exe
set proj=%2
set run_file=%cd%\%proj%\%1
set DEBUG=%3
echo "DEBUG:"%DEBUG%

::set monkeyrunner path
set MONKEY="%cd%\tools\sdk\tools\monkeyrunner.bat"

set repeat=10
::if exist %4 set repeat=%4
echo %repeat%

::get project version name
set DTYPE=%ADB_CMD% shell "getprop ro.product.cg_version"
for /f %%i in ('%DTYPE%') do set DTYPE=%%i

::init log file
::set date=%DATE:~0,10%_%TIME:~0,2%
set date=%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set logdir=%cd%\logs\%date%
echo %logdir%
mkdir "%logdir%"

set logfile=Monkeyrunner_%date%.log
set logpath=%logdir%\%logfile%
echo %logpath%

::run monkeyrunner test
echo.
echo Pay attention, the testing is beginning...
set run=monkeyrunner %run_file% %DTYPE%
echo %run%
echo monkeyrunner log is out in file %logpath%
echo.
echo -------------------------------------------------------------------------
echo if you want exit,press Ctrl + C, and input Y/y. Then press Enter to exit.
echo -------------------------------------------------------------------------
call %MONKEY% %run_file% %DTYPE% >> %logpath% && type %logpath%

::get Android log
echo Android log out to : %cd%\slog\windows\logs
cd %cd%\slog\windows
call LogAndroid2PC.bat
echo Pay attention, the testing is finished...
