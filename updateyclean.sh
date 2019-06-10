#!/bin/bash -   
#Titulo         :updateyclean.sh
#Descripción   :Script para actualizar y limpiar el sistema automaticamnete
#Autor          :3ln1pr1
#Fecha          :2018-11-10
#Versión       :0.1    
#uso            :./updateyclean.sh
#Notas          :       
#bash_version   :4.4.19(1)-release
#E-mail         :3ln1pr1[at]keemail[dot]me
#Empresa        :
#Telefono       :@3ln1pr1 (redes Sociales) @E3ln1pr1 (En Telegram)
##===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@

#============================================================================
#                   TRABAJOS PREVIOS DE COMPROBACION                        #
#============================================================================

# Variables Genericas cargadas desde el Script 'Variables.sh'
VARIABLE=~/scripts/variables.sh  #PONER AQUI LA RUTA GENERICA DEL ARCHIVO DE VARIABLES
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
 :<<-! # ESTE CODIGO ESTA COMENTADO PARA MOSTRAR LA VARIABLES HEREDADAS DEL ARCHIVO ~/scripts/variables.sh
Amarillo_Azul_Azulclaro_Blanco_Cyan_Cyanclaro_FOLDER1_Grisclaro_Grisoscuro_Marron_nc_Negro_Purpura_Purpuraclaro_Rojo_Rojoclaro_ROOTSCRIPT_URL_URL1_VAR_VAR1_VAR2_Verde_Verdeclaro_
 #-----(↑)----(↑)------(↑)-------- HASTA AQUÍ LAS VARIABLES HEREDADAS ----(↑)------(↑)-----(↑)-------
!
FICHERO=/usr/bin/updateyclean

if [ -f $FICHERO ]
then
   echo "El fichero $FICHERO existe en comandos puedes invocarlo directamente $updateyclean"
else
	sudo ln -f updateyclean.sh /usr/bin/updateyclean
   echo -e "El fichero $FICHERO no existe. ${Verde}SE CREA ${nc} en comandos puedes invocarlo directamente la proxima vez '${Azulclaro}updateyclean${nc}' "
fi 



echo -e "${Azulclaro}EMPEZANDO ACTUALIZACION DEL SISTEMA en ${Rojo}3${Azulclaro} segundos"
sleep 3
sudo apt update && sudo apt upgrade && sudo apt full-upgrade

echo -e "${Rojoclaro} EMPEZANDO LIMPIEZA DEL SISTEMA"
sudo apt clean && sudo apt autoclean && sudo apt autoremove
echo -e ""
echo -e "${Verdeclaro} Actualización y limpieza Correcta ${nc}"
echo ""
