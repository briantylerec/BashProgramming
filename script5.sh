#!/bin/bash

# Descripción
# Escribid un script que renombre todos los ficheros con extensión JPG 
# del directorio actual, añadiendo un prefijo con la fecha en formato año,
# mes, día. Por ejemplo, un fichero con nombre imagen1.jpg pasaría a 
# llamarse 20240413-image1.jpg, si el script se ejecuta el 13 de abril de 2024.

# Obtener la fecha actual en formato YYYYMMDD
fecha=$(date +%Y%m%d)

# Recorrer todos los archivos con extensión JPG en el directorio actual
for archivo in *.jpg *.JPG; do
    # Verificar que existen archivos que coincidan con el patrón
    if [ -f "$archivo" ]; then
        # Comprobar si el archivo ya tiene la fecha actual como prefijo
        if [[ "$archivo" != ${fecha}-* ]]; then
            # Renombrar el archivo añadiendo el prefijo de la fecha
            nuevo_nombre="${fecha}-$archivo"
            mv "$archivo" "$nuevo_nombre"
            echo "Renombrado: $archivo -> $nuevo_nombre"
        fi
    fi
done

# Mensaje si no se encuentran archivos JPG
if [ $? -ne 0 ]; then
    echo "No se encontraron archivos JPG en el directorio actual."
fi
