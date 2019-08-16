#!/bin/bash -   
#Titulo         :version.sh
#Descripción   :Script de control de versiones para poder realizar actualizaciones a Voluntad si se detecta una diferencia entre el archivo de estados y el archivo de control de veriones version.txt del servidor
#Autor          :Elías 
#Fecha          :2019-08-15
#Versión        :0.15    
#uso            :./version.sh
#Notas          :       
#bash_version   :4.4.20(1)-release
#E-mail         :informatica@ctbell.com
#Empresa        :C.T.Bell s.l.u
#Telefono       :966 812 131
##===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@

#============================================================================
#                   TRABAJOS PREVIOS DE COMPROBACION                        #
#============================================================================

# Variables Genericas cargadas desde el Script 'Variables.sh'
VARIABLE=~/scripts/variables.sh
source $VARIABLE

#============================================================================
#                      DEFINICION DE VARIABLES PROPIAS                      #
#============================================================================

FECHA=`date +%Y-%m-%d`
HORA=`date +%\H:%M`
USERID=`id -g`
NAME=`hostname`
IP=`hostname -I  | cut -d " " -f1`
IP2=`hostname -I  | cut -d " " -f2`
VARIABLE_EJEMPLO='valor de ejemplo'

#============================================================================
#                           INICIAMOS EL SCRIPT                             #
#============================================================================

# Aqui iniciamos el Codigo.

	#Descargamos el archivo de control de veriones.
wget -P /root/scripts/ -N http://radius.ctbell.com/ctbell/version.txt

	# Introducimos en la variable VERWEB el texto del archivo 
	# Despues extraemos solo el numero de versión y lo introducimos en la variable NUMVERWEB

VERWEB=`grep -R "#version" /root/scripts/version.txt`
NUMVERWEB=`echo $VERWEB | cut -d ":" -f2` #Extrae Version del servidor

	# Introducimos en la variable VERSION el texto referente a la variable del archivo "estado.sh"
        # Despues extraemos solo el numero de versión y	lo introducimos	en la variable NUMVER

VERSION=`grep -R "#version" /root/scripts/estado.sh`
NUMVER=`echo $VERSION | cut -d ":" -f2` #Extrae Version en local 

	# Mostramos los numeros de verion por pantalla

echo "La versión actual en local es: $NUMVER"
echo "La version Actual en el Servidor es $NUMVERWEB"

	#Definimos el menu de opciones para el supuesto que queramos incluirlo de forma manual 
	
_opciones(){

    # Selecciona entre Instalar o Salir.
    printf "%s\n%s\n%s\n\n" "Deseas actualizar" "1 Para Instalar." "2 Para Salir."
    read -r option

    # 
    case $option in
        1) /root/scripts/./updatespt.sh
            ;;
        2) exit &
            ;;
        *) /usr/bin/clear
           printf "%s\n%s\n\n" "No he entendido la seleccion." \
               "Presiona <Ctrl-c> para Salir."
           _opciones
            ;;
    esac

}

clear

	# COMPARAMOS LAS 2 VERSIONES 
	#  SI SON IGUALES MOSTRAMOS POR PANTALLA QUE ES IGUAL Y NO HACEMOS NADA
	#  SI SON DIFERENTES EJECUTAMOS UNA CUENTA ANTRAS DE 10 SEGUNDOS Y LANZAMOS EL SCRIPT DE ACTUALIZACIÓN
	# UNA VEZ ACTUALIZADO ENVIAMOS UN MENSAJE DE TELEGRAM AVISANDO QUE LA ACTUALIZACION A SIDO PROBOCADA POR DIFERENCIA DE VERSIONES

    if [ "$NUMVER" = "$NUMVERWEB" ]; then

        echo -e "                ${Blanco} ES IGUAL$ ${nc}    $NUMVERWEB                    "
        echo -e "${Amarillo}============================================================================ ${nc}"
        echo -e "."

    else

	INI="1"
	FIN="10"

	for i in $(seq $INI $FIN);
		do	
		        echo -e "${Blanco}OK ES DISTINTO ${nc}              $NUMVERWEB =/ $NUMVER"
                	#_opciones
			echo -e "${Rojoclaro} Se va a actualizar en 10 Segundos ${nc} $i...."
			echo -e "${Blanco} 'Presiona ${Azulclaro}<Ctrl-c>${Blanco} para Salir.'${nc}"
			sleep 1
			clear
	done
	
	/root/scripts/./updatespt.sh
	/root/scripts/tmsge.sh "$NAME ACTUALIZADO POR DIFERENCIA DE VERSION                                          $NUMVERWEB </>  $NUMVER "
    fi 


 #-----(↑)----(↑)------(↑)-------- HASTA AQUÍ EL CODIGO ----(↑)------(↑)-----(↑)-------!

