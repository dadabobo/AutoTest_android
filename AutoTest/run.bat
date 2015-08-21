@echo off

::init command
set ADB_CMD=%cd%\slog\windows\tools\adb.exe
set FIND_CMD=%cd%\slog\windows\tools\find.exe

::close monkey PID
echo check monkey PID
::%ADB_CMD% shell "ps|grep "com.android.commands.monkey"|awk '{print $2}"
set checkMonkey=%ADB_CMD% shell "ps | grep 'com.android.commands.monkey'"
for /f "tokens=2,*" %%i in ('%checkMonkey%') do set PID=%%i
echo exist monkeyrunner is:%PID%
%ADB_CMD% shell "kill -9 %PID%"
echo kill PID : %PID%

::set debug value
set DEBUG=%1
set repeat=%2
if "%DEBUG%"=="" goto ISDEBUG
if %DEBUG%==1 goto NODEBUG
if %DEBUG%==0 goto ISDEBUG

:ISDEBUG
set DEBUG=0
goto END
:NODEBUG
set DEBUG=1
goto END
:END
echo DEBUG set to:%DEBUG%

::TEST menu
:loop
echo ========================================
echo ____________AutoTest Menu_______________
echo ----------------------------------------
echo.
echo        0, AutoBluetooth
echo        1, AutoCall
echo        2, AutoCamera
echo        3, AutoCopyDel
echo        4, AutoFlick
echo        5, AutoIn.Un.Install
echo        6, AutoOpenApps
echo        7, AutoWlanShift
echo.
echo ========================================
set/p n=Choose your test:
if %n%==0 goto AutoBluetooth
if %n%==1 goto AutoCall
if %n%==2 goto AutoCamera
if %n%==3 goto AutoCopyDel
if %n%==4 goto AutoFlick
if %n%==5 goto AutoInUnInstall
if %n%==6 goto AutoOpenApps
if %n%==7 goto AutoWlanShift
goto loop
:end
exit

::TEST items
:AutoBluetooth
echo Choose AutoBluetooth
call %cd%\AutoBluetooth\run.bat run.py AutoBluetooth %DEBUG% %repeat%
pause
goto end
:AutoCall
echo Choose AutoCall
call %cd%\AutoCall\run.bat run.py AutoCall %DEBUG% %repeat%
pause
goto end
:AutoCamera
echo Choose AutoCamera
call %cd%\AutoCamera\run.bat run.py AutoCamera %DEBUG% %repeat%
pause
goto end
:AutoCopyDel
echo Choose AutoCopyDel
call %cd%\AutoCopyDel\run.bat run.py AutoCopyDel %DEBUG% %repeat%
pause
goto end
:AutoFlick
echo Choose AutoFlick
call %cd%\AutoFlick\run.bat run.py AutoFlick %DEBUG% %repeat%
pause
goto end
:AutoInUnInstall
echo Choose AutoIn.Un.Install
call %cd%\AutoIn.Un.Install\run.bat run.py AutoIn.Un.Install %DEBUG% %repeat%
pause
goto end
:AutoOpenApps
echo Choose AutoOpenApps
call %cd%\AutoOpenApps\run.bat run.py AutoOpenApps %DEBUG% %repeat%
pause
goto end
:AutoWlanShift
echo Choose AutoWlanShift
call %cd%\AutoWlanShift\run.bat run.py AutoWlanShift %DEBUG% %repeat%
pause
goto end
:end
exit