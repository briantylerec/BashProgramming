#!/bin/bash

# Descripción
# Escribid un script que copie un archivo sobre otro, 
# garantizando que solo reciba dos parámetros.

# Verificar que se han proporcionado exactamente dos argumentos
if [ $# -ne 2 ]; then
    echo "Uso: $0 <archivo_origen> <archivo_destino>"
    exit 1
fi

# Obtener los parámetros
archivo_origen="$1"
archivo_destino="$2"

# Verificar que el archivo origen existe
if [ ! -f "$archivo_origen" ]; then
    echo "Error: El archivo origen '$archivo_origen' no existe o no es un archivo regular."
    exit 1
fi

# Verificar que el archivo destino existe
if [ ! -f "$archivo_destino" ]; then
    echo "Error: El archivo destino '$archivo_destino' no existe o no es un archivo regular."
    exit 1
fi

# Copiar el archivo origen al archivo destino
cp "$archivo_origen" "$archivo_destino"

# Confirmar la operación
echo "Archivo '$archivo_origen' copiado exitosamente a '$archivo_destino'."