#!/bin/bash

# Descripción
# Escribid un script que imprima en este orden y en líneas diferentes:
# •	El nombre del script que se está ejecutando.
# •	El número de argumentos que se han pasado al script.
# •	El primer y segundo argumentos, ambos en la misma línea.
# •	Si hay más de dos argumentos, los argumentos a partir del tercero (este incluido) cada uno en una línea.

# Imprimir el nombre del script
echo "$0"

# Imprimir el número de argumentos
num_args=$#
echo "$num_args"

# Imprimir el primer y segundo argumento en la misma línea
if [ $num_args -eq 1 ]; then
    echo "$1"
elif [ $num_args -ge 2 ]; then
    echo "$1 $2"
fi

# Imprimir los argumentos a partir del tercero, si los hay
if [ $num_args -gt 2 ]; then
    for arg in "${@:3}"; do
        echo "$arg"
    done
fi
