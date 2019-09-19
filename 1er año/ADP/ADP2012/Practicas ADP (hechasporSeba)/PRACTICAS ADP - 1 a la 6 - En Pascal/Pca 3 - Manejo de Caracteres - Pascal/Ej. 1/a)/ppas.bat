@echo off
SET THEFILE=c:\users\juanma~1\desktop\practi~1\practi~1\pca3-m~1\eja69d~1.1\a)\ej1ap3.exe
echo Linking %THEFILE%
c:\dev-pas\bin\ldw.exe  -s   -b base.$$$ -o c:\users\juanma~1\desktop\practi~1\practi~1\pca3-m~1\eja69d~1.1\a)\ej1ap3.exe link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
