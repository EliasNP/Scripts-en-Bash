#!/bin/bash -
#Titulo         :sendmail.sh
#Descripción    :Enviar E-Mail desde la consola pidiendo argumentos
#Autor          :Elías Nieva Prieto
#Fecha          :2019-06-07
#Versión        :0.1
#uso            :./sendmail.sh
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
VARIABLE=~/scripts/variables.sh
source $VARIABLE

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
:<<-! # ESTE CODIGO ESTA COMENTADO PARA MOSTRAR LA VARIABLES HEREDADAS DEL ARCHIVO /home/informatico/scripts/variables.sh
Amarillo Azul Azulclaro Blanco Cyan Cyanclaro FOLDER1 Grisclaro Grisoscuro Marron nc Negro Purpura Purpuraclaro Rojo Rojoclaro ROOTSCRIPT URL URL1 VAR VAR1 VAR2 Verde Verdeclaro 
 #-----(↑)----(↑)------(↑)-------- HASTA AQUÍ LAS VARIABLES HEREDADAS ----(↑)------(↑)-----(↑)-------
!

echo -e "${Purpuraclaro}###############################################################"
echo " #######"                                                         
echo " #       #    # #    # #   ##   #####     #    #   ##   # #"      
echo " #       ##   # #    # #  #  #  #    #    ##  ##  #  #  # #"      
echo " #####   # #  # #    # # #    # #    #    # ## # #    # # #"      
echo " #       #  # # #    # # ###### #####     #    # ###### # #"      
echo " #       #   ##  #  #  # #    # #   #     #    # #    # # #"      
echo " ####### #    #   ##   # #    # #    #    #    # #    # # ######"
echo -e "###############################################################"
##
echo -e "${Azulclaro}"
read -p "#Para : " Para
echo "#"
read -p "#Texto : " Texto
echo "#"
read -p "#Asunto : " Asunto
echo "#"
echo "Especifica la /ruta/file.txt del adjunto o pulsa Enter"
echo -n -e "Ruta del adjunto: ${nc} "
read Ruta
##
while true; do
    read -p "Estas seguro de enviar un archivo adjunto? y o n : " yn
    case $yn in
        [Yy]* ) echo $Texto | mutt -s $Asunto $Para -a $Ruta; echo "${Purpura}Enviando correo con adjunto ${nc}"; exit;;
        [Nn]* ) echo $Texto | mail -s $Asunto $Para; echo -e "${Purpura}Enviando correo ${nc}"; exit;;
        * ) echo "La seleccion y o n, es necesaria";;
     esac
done
