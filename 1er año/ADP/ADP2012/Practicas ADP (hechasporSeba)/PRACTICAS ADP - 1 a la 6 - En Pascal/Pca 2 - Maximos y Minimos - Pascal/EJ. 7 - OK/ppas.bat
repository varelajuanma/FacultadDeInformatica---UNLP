@echo off
SET THEFILE=c:\docume~1\administrador\escritorio\1∫ a—o - info\adp\practicas\pca 2 - maximos y minimos - pascal\ej. 7 - ok\ej7pca2.exe
echo Linking %THEFILE%
c:\dev--pascal\bin\ldw.exe  -s   -b base.$$$ -o "c:\docume~1\administrador\escritorio\1∫ a—o - info\adp\practicas\pca 2 - maximos y minimos - pascal\ej. 7 - ok\ej7pca2.exe" link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
