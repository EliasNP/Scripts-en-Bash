#!/bin/bash -   
#Titulo         :gitpush.sh
#Descripción   :Comando facil para actualizar repositorio git
#Autor          :3ln1r1 
#Fecha          :2019-06-20
#Versión       :0.0.1  
#uso            :./gitpush.sh
#Notas          :       
#bash_version   :4.4.19(1)-release
#E-mail         :informatica@ctbell.com
#Empresa        :C.T.Bell s.l.u
#Telefono       :966 812 131
##===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@

#============================================================================
#                   TRABAJOS PREVIOS DE COMPROBACION                        #
#============================================================================

# Variables Genericas cargadas desde el Script 'Variables.sh'
# VARIABLE=~/scripts/variables.sh
# source $VARIABLE

#============================================================================
#                      DEFINICION DE VARIABLES PROPIAS                      #
#============================================================================

FECHA=`date +%Y-%m-%d`
HORA=`date +%\H:%M`
USERID=`id -g`
IP=`hostname -I  | cut -d " " -f1`
IP2=`hostname -I  | cut -d " " -f2`
VARIABLE_EJEMPLO='valor de ejemplo'

#============================================================================
#                           INICIAMOS EL SCRIPT                             #
#============================================================================

# Aqui iniciamos el Codigo.
# Ejemplo de Mostrar resultados de Variables como Ejemplo.


: 'COMENTARIO1 ESTE CODIGO ESTA COMENTADO PARA MOSTRAR LA SINTAXIS DE COMO DEBEN MOSTRARSE LAS VARIABLES.
echo $FECHA
echo $HORA
echo $USERID
echo $IP
echo $IP2
echo $VARIABLE_EJEMPLO
' 

: ' COMENTARIO2  ESTE CODIGO ESTA COMENTADO PARA MOSTRAR LA VARIABLES HEREDADAS DEL ARCHIVO /home/informatico/scripts/variables.sh

 #-----(↑)----(↑)------(↑)-------- HASTA AQUÍ LAS VARIABLES HEREDADAS ----(↑)------(↑)-----(↑)-------
COMENTARIO2 '  

echo "Cual va a ser el Texto del \"Commit\""
read COMMIT

git add . ; git commit -m "$COMMIT" ; git push

function _declarada{
    echo "Texto declarado dentro de la función _declarada"
}
# Usage: banner_color green "my title"

function banner_color() {
    local color=$1
    shift

    case $color in
        black) color=0
        ;;
        red) color=1
        ;;
        green) color=2
        ;;
        yellow) color=3
        ;;
        blue) color=4
        ;;
        magenta) color=5
        ;;
        cyan) color=6
        ;;
        white) color=7
        ;;
        *) echo "color is not set"; exit 1
        ;;
    esac

    local s=("$@") b w
    for l in "${s[@]}"; do
        ((w<${#l})) && { b="$l"; w="${#l}"; }
    done
    tput setaf $color
    echo " =${b//?/=}=
| ${b//?/ } |"
    for l in "${s[@]}"; do
        printf '| %s%*s%s |\n' "$(tput setaf $color)" "-$w" "$l" "$(tput setaf $color)"
    done

    echo "| ${b//?/ } |
 =${b//?/=}="
    tput sgr 0
}

banner_color green "tu madre"
_declarada