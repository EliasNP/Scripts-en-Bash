#!/bin/bash -   
#Titulo         :post.sh
#Descripción   :Scipt para crear Post en el Blog de EliasNieva
#Autor          :Elias Nieva
#Fecha          :2020-04-14
#Versión       :A.0.1  
#uso            :./post.sh
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
IP=`hostname -I  | cut -d " " -f1`
IP2=`hostname -I  | cut -d " " -f2`
VARIABLE_EJEMPLO='valor de ejemplo'

#============================================================================
#                           INICIAMOS EL SCRIPT                             #
#============================================================================

# Aqui iniciamos el Codigo.
# Ejemplo de Mostrar resultados de Variables como Ejemplo.

:<<-! # ESTE CODIGO ESTA COMENTADO PARA MOSTRAR LA SINTAXIS DE COMO DEBEN MOSTRARSE LAS VARIABLES.
echo $FECHA
echo $HORA
echo $USERID
echo $IP
echo $IP2
echo $VARIABLE_EJEMPLO
!
                        

 :<<-! # ESTE CODIGO ESTA COMENTADO PARA MOSTRAR LA VARIABLES HEREDADAS DEL ARCHIVO /home/enieva/scripts/variables.sh

 #-----(↑)----(↑)------(↑)-------- HASTA AQUÍ LAS VARIABLES HEREDADAS ----(↑)------(↑)-----(↑)-------
!
