@echo off
::close monkey PID
echo check monkey PID
set ADB_CMD=%cd%\slog\windows\tools\adb.exe
set checkMonkey=%ADB_CMD% shell "ps | grep 'com.android.commands.monkey'"
for /f "tokens=2,*" %%i in ('%checkMonkey%') do set PID=%%i
echo exist monkeyrunner is:%PID%
%ADB_CMD% shell "kill -9 %PID%"
echo kill PID : %PID%
pause