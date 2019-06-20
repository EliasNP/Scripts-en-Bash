#!/bin/bash
#titulo         :mkscripts.sh
#descripcion    :Este Script Genera Scripts Vacios con los Parametros Basicos.
#autor	        :Elias Nieva Prieto
#fecha          :2019-05-27
#version        :0.4
#uso		    :sh mkscripts.sh
#notas          :Install Nano and Emacs para usar el Script
#bash_version   :4.1.5(1)-version
#e-mail         :informatica@ctbell.com
#Empresa        :C.T.Bell s.l.u
#Telefono       :966 812 131
#===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@

VARIABLE=~/scripts/variables.sh
today=$(date +%Y-%m-%d)
div====3=====l======N=======1=========P=======r========1======@

/usr/bin/clear

_select_title(){

    # Guardamos el nombre introducido.
    printf "Introduce Nombre: " ; read -r title

    # Quitamos los espacios al nombre si los tiene
    title=${title// /_}

    # Convertimos las Mayuscalas en Minusculas
    title=${title,,}

    # Le añadimos el .sh al final si el archivo ya no lo tiene
    [ "${title: -3}" != '.sh' ] && title=${title}.sh

    # Revisamos si el nombre dado al archivo ya existe en esta ruta.
    if [ -e $title ] ; then
        printf "\n%s\n%s\n\n" "El script \"$title\" ya existe con ese nombre." \
        "Por favor selecciona Otro nombre de archivo."
        _select_title
    fi

}

_select_title

printf "Introduce la Descripción del Script: " ; read -r dscrpt
printf "Intruduce el nombre del Creador: " ; read -r name
printf "¿Cual es la Versión de este Script?: " ; read -r vnum

# Le Damos Formato por Defecto al Archivo de Salida.
printf "%-16s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%s\n" '#!/bin/bash -' '#Titulo' ":$title" '#Descripción' \
":${dscrpt}" '#Autor' ":$name" '#Fecha' ":$today" '#Versión' \
":$vnum" '#uso' ":./$title" '#Notas' ':' '#bash_version' \
":${BASH_VERSION}" '#E-mail' ':informatica@ctbell.com' '#Empresa' ':C.T.Bell s.l.u' '#Telefono' ':966 812 131' \##$div${div} > $title

printf "
#============================================================================
#                   TRABAJOS PREVIOS DE COMPROBACION                        #
#============================================================================

# Variables Genericas cargadas desde el Script 'Variables.sh'
VARIABLE=~/scripts/variables.sh
source \$VARIABLE

#============================================================================
#                      DEFINICION DE VARIABLES PROPIAS                      #
#============================================================================

FECHA=\`date +\x25Y-\x25m-\x25d\`
HORA=\`date +\x25\H:\x25M\`
USERID=\`id -g\`
IP=\`hostname -I  | cut -d \" \" -f1\`
IP2=\`hostname -I  | cut -d \" \" -f2\`
VARIABLE_EJEMPLO='valor de ejemplo'

#============================================================================
#                           INICIAMOS EL SCRIPT                             #
#============================================================================

# Aqui iniciamos el Codigo.
# Ejemplo de Mostrar resultados de Variables como Ejemplo.

:<<-! # ESTE CODIGO ESTA COMENTADO PARA MOSTRAR LA SINTAXIS DE COMO DEBEN MOSTRARSE LAS VARIABLES.
echo \$FECHA
echo \$HORA
echo \$USERID
echo \$IP
echo \$IP2
echo \$VARIABLE_EJEMPLO
!
%-16s%-8s\n\
%s\n " >> $title

echo ":<<-! # ESTE CODIGO ESTA COMENTADO PARA MOSTRAR LA VARIABLES HEREDADAS DEL ARCHIVO $VARIABLE" >> $title
grep -P "^\s*\w*" -o $VARIABLE | sort -u | tr ' \n' ' ' >> $title
echo -e "\n #-----(↑)----(↑)------(↑)-------- HASTA AQUÍ LAS VARIABLES HEREDADAS ----(↑)------(↑)-----(↑)-------" >> $title
echo "!" >> $title


# Lo hacemos Ejecutable
chmod +x $title

/usr/bin/clear

_select_editor(){

    # Selecciona entre Nano ó Vim.
    printf "%s\n%s\n%s\n\n" "Seleciona un editor." "1 para Nano." "2 para Vim."
    read -r editor

    # Open the file with the cursor on the twelth line.
    case $editor in
        1) nano +12 $title
            ;;
        2) vims +12 $title &
            ;;
        *) /usr/bin/clear
           printf "%s\n%s\n\n" "No he entendido la seleccion." \
               "Presiona <Ctrl-c> para Salir."
           _select_editor
            ;;
    esac

}

_select_editor
