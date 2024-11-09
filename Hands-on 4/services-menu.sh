#!/bin/bash

# Funcion para mostrar el menu
mostrar_menu(){
	echo "Seleccione una opcion: "
	echo "1) Listar el contenido de un directorio"
	echo "2) Crear un archivo de texto"
	echo "3) Comparar dos archivos de texto"
	echo "4) Mostrr uso basico del comando awk"
	echo "5) Mostrar uso basico del comando grep"
	echo "6) Rick"
	echo "7) Salir"
	read -p "Opcion: " opcion
}

# Funcion para listar contenido de un directorio
listar_contenido(){
	read -p "Ingrese la ruta absoluta del directorio: " ruta
	if [ -d "$ruta" ]; then
		echo "Contenido de $ruta: "
		ls "$ruta"
	else
		echo "La ruta ingresada no es un directorio valido."
	fi
}

crear_archivo() {
	read -p "Ingrese el nombre del archivo a crear (incluya la extension): " nombre_archivo
	read -p "Ingrese el texto que desea almacenar: " texto
	echo "$texto" > "$nombre_archivo"
	echo "Archivo $nombre_archivo creado con exito."
}

# Funcion para comparar dos archivos de texto
comparar_archivos() {
	read -p "Ingrese la ruta del primer archivo: " archivo1
	read -p "Ingrese la ruta del segundo archivo: " archivo2

    	if [[ -f "$archivo1" && -f "$archivo2" ]]; then
        	resultado=$(diff "$archivo1" "$archivo2")
        	if [[ -z "$resultado" ]]; then
            		echo "Los archivos son idénticos."
        	else
            		echo "Los archivos son diferentes:"
            		echo "$resultado" # Muestra las diferencias
       		fi
    	else
        	if [[ ! -f "$archivo1" ]]; then
            		echo "El archivo '$archivo1' no existe."
        	fi
        	if [[ ! -f "$archivo2" ]]; then
            		echo "El archivo '$archivo2' no existe."
        	fi
    	fi
}

# Funcion para mostrar awk
uso_awk(){
	read -p "Ingrese la ruta de un archivo de texto para procesar con awk" archivo
	if [ -f "$archivo" ]; then
		echo "Mostrando la primera colimna del archivo usando awk:"
		awk '{print $1}' "$archivo"
	else
		echo "El archivo no existe."
	fi
}
	echo ""

# Funcion para mostrar grep
uso_grep(){
	read -p "Ingrese una palabra clave a buscar: " palabra
	read -p "Ingrese la ruta del archivo de texto donde buscar la palabra: " archivo
	if [ -f "$archivo" ]; then
		echo "Resultados de la busqueda: "
		grep "$palabra" "$archivo"
	else
		echo "El archivo no existe."
	fi
}

# Rick Roll
rick(){
	gif_url="https://c.tenor.com/x8v1oNUOmg4AAAAd/tenor.gif"
	gif_file="12345678900987654321"
	
	if [[ -f "$gif_file" ]]; then
		echo "El archivo '$gif_file' ya existe. Reproduciendo..."
	else
		echo "descargando GIF..."
		if ! curl -L -o "$gif_file" "$gif_url"; then
			echo "Error al descargar con curl."
			if ! wget -O "$gif_file" "$gif_url"; then
				echo "Error al descargar el Gif con wget."
				return 1
			fi
		fi
	fi
	echo "reproduciendo..."
	for i in {1..5}; do
		xdg-open "$gif_file" &
		sleep 1
	done
}

# Bucle menu
while true; do
	mostrar_menu
	case $opcion in
		1)
			listar_contenido
			;;
		2)
			crear_archivo
			;;
		3)
			comparar_archivos
			;;
		4)
			uso_awk
			;;
		5)
			uso_grep
			;;
		
		6)
			rick
			;;
		7)
			echo "saliendo del script."
			break
			;;
		*)
			echo "Opcion no valida. intente de nuevo."
	esac
	echo ""
	echo ""
	echo ""
done
	


