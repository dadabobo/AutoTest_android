@echo off

:: get parameter items
set repeat=10
set repeat_count=%4
set DEBUG=%3
set proj=%2
set run_file=%cd%\%proj%\%1
echo parameter items : run_file(%1), project_name(%2), DEBUG(%3), repeat(%4)

::set repeat count
if "%repeat_count%"=="" (goto norepeat) else (goto setrepeat)

:setrepeat
set repeat=%4
echo repeat set to : %repeat%
goto end
:norepeat
set repeat=10
goto end
:end
echo final repeat : %repeat%

::run monkeyrunner test
echo Pay attention, the testing is beginning...
echo =========================================================================
::echo AutoBluetooth\run.bat call %cd%\AutoBluetooth\monkey.bat %run_file% %proj% %DEBUG%
for /L %%i IN (1, 1, %repeat%) DO ( call %cd%\AutoBluetooth\monkey.bat %run_file% %proj% %DEBUG%)
echo Pay attention, the testing is finished...
echo =========================================================================
