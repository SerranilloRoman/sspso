#!/bin/bash
echo "Creando el archivo de texto 'mytext'..."
echo "Hola Mundo" > mytext
echo
echo "Mostrando el contenido de 'mytext':"
cat mytext
echo
echo "Creando directorio 'backup'..."
mkdir backup
echo "moviendo 'mytext' al directorio 'backup'..."
mv mytext backup/
echo
echo "Listando el contenido del directorio 'backup':"
ls backup
echo
echo "Eliminando 'mytext' del directorio 'backup'..."
rm backup/mytext
echo "Eliminando el directorio 'backup'..."
rmdir backup
echo
echo "Operaciones finalizadas :)"
