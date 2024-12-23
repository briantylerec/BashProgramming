#!/bin/bash

# Descripción
# Escribid un script en Bash que acepte una ruta a un fichero o 
# un directorio e imprima por pantalla si es un fichero normal,
# un directorio u otro tipo de fichero. Finalmente, el script ejecutará el 
# comando ls sobre esta ruta en formato largo.

# Verificar si se ha proporcionado un argumento
if [ -z "$1" ]; then
    echo "Uso: $0 <ruta_a_fichero_o_directorio>"
    exit 1
fi

# Obtener la ruta proporcionada y convertirla al formato de Linux si es necesario
ruta="$1"

# Detectar si el sistema es Windows y convertir la ruta
if [[ "$ruta" =~ ^[A-Za-z]: ]]; then
    # Convertir ruta de estilo Windows a ruta de Linux (usando Git Bash o similar)
    ruta=$(echo "$ruta" | sed 's#^\\([A-Za-z]\\):#/mnt/\\L\\1#' | sed 's#\\\\#/#g')
fi

# Verificar el tipo de archivo o directorio
if [ -f "$ruta" ]; then
    echo "\"$ruta\" es un fichero normal."
elif [ -d "$ruta" ]; then
    echo "\"$ruta\" es un directorio."
else
    echo "\"$ruta\" es otro tipo de fichero."
fi

# Ejecutar el comando ls en formato largo
ls -l "$ruta"
