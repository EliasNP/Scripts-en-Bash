#!/bin/bash 

[[ -z $1 ]] 
echo "Debes especificar un archivo" 

echo " Sintaxis: $0 archivo" 
exit 1 

grep -v -e "#" -e "^$" $1
