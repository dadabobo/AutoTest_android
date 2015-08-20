@echo off

set Win=%PROCESSOR_ARCHITECTURE%
echo your computer is %Win%
set py_86=%cd%\tools\python-2.7.9.msi
set py_64=%cd%\tools\python-2.7.9.amd64.msi
set jdk=%cd%\tools\jdk-7u71-windows-i586.exe

echo install JDK 7u71
start %jdk%

echo install python 2.7.9
if %Win%==x86 (start %py_86%) else (start %py_64%)

pause