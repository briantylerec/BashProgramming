#!/bin/bash

# Descripción
# Escribid un script que ejecute cierta acción en función de la extensión 
# de un archivo que recibe como parámetro. Si se trata de un JPG, 
# copiar dicho archivo en la carpeta ~/fotos. Si resulta ser de otro formato, 
# avisar al usuario sin hacer nada.

# Verificar si se ha proporcionado un argumento
if [ -z "$1" ]; then
    echo "Uso: $0 <ruta_a_fichero>"
    exit 1
fi

# Obtener la ruta proporcionada
archivo="$1"

# Verificar si es un fichero
if [ ! -f "$archivo" ]; then
    echo "El archivo proporcionado no existe o no es un archivo regular."
    exit 1
fi

# Obtener la extensión del archivo
extension="${archivo##*.}"

# Comprobar la extensión
if [ "$extension" == "jpg" ] || [ "$extension" == "JPG" ]; then
    # Crear la carpeta ~/fotos si no existe
    mkdir -p ~/fotos

    # Copiar el archivo
    cp "$archivo" ~/fotos
    echo "Archivo copiado a ~/fotos."
else
    echo "El archivo no es un JPG."
fi
