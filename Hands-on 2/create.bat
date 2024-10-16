@echo off
rem create.bat
echo Creando archivo "mytext.txt" con el texto "Hola Mundo"...
echo Hola Mundo > mytext.txt
echo.
echo Mostrando el contenido del archivo "mytext.txt":
type mytext.txt
echo.
echo Creando subdirectorio "backup"...
mkdir backup
echo Copiando "mytext.txt" al subdirectorio "backup"...
copy mytext.txt backup\
echo.
echo Listando el contenido del subdirectorio "backup":
dir backup
echo.
echo Eliminando el archivo "mytext.txt" del subdirectorio "backup"...
del backup\mytext.txt
echo Eliminando el subdirectorio "backup"...
rmdir backup
echo.
echo Operaciones completadas.
	