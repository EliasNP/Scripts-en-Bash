#!/bin/bash -   
#Titulo         :notes.sh
#Descripción   :Crea notas rapidas para guardar información relevante a modo de wiki
#Autor          :Elías Nieva Prieto
#Fecha          :2021-02-12
#Versión       :1      
#uso            :./notes.sh
#Notas          :       
#bash_version   :4.4.20(1)-release
#E-mail         :eliasnieva@keemail.me
#Empresa        :Elías Nieva Prieto
#Telefono       :666 999 999
##===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@

#============================================================================
#                   TRABAJOS PREVIOS DE COMPROBACION                        #
#============================================================================

# Variables Genericas cargadas desde el Script 'Funciones.sh'
VARIABLE=~/scripts/funciones.sh
if [ -f "$VARIABLE" ]
then
source $VARIABLE
else
	echo "No Encuentro el Archivo de Variables"
	break
fi

#============================================================================
#                      DEFINICION DE VARIABLES PROPIAS                      #
#============================================================================

FECHA=`date +%Y-%m-%d`
HORA=`date +%\H:%M`
USERID=`id -g`
IP=`hostname -I  | cut -d " " -f1`
IP2=`hostname -I  | cut -d " " -f2`
VARIABLE_EJEMPLO='valor de ejemplo'
CARPETA=~/Rpositorios/notas

#============================================================================
#                           INICIAMOS EL SCRIPT                             #
#============================================================================

# Aqui iniciamos el Codigo.
                     

_Crea_Nota(){
	echo -e " ${Blanco} Vamos a Crear una nota nueva ${nc} "
	echo -e " ${Verde} Introduce el Titulo de la Nota ${nc} "
	read -r Titulo

	NewArchivo=`echo ${Titulo}.md | sed 's/ /_/g'` 
	touch ${CARPETA}/${NewArchivo}
	echo "#" ${Titulo}  >> ${CARPETA}/${NewArchivo}
}

_Lista_Notas(){
	
	echo -e " ${Azul} Listamos las Notas Existentes ${nc} \n"

	LINEAS=`ls ${CARPETA}/*.md`
	CONTADOR=0
	echo -e " ${Azul} Ver Archivo ${nc} "
	
	for LINEA in $LINEAS
	do
	    OPCIONLINEA=`echo ${LINEA} | cut -d "." -f1 | cut -d "/" -f6`
	    echo -e " ${Amarillo} $CONTADOR: ${OPCIONLINEA} ${nc} "
	    arr+=( "${LINEA}" )
	    CONTADOR=$((CONTADOR+1))

	done

	echo -e " ${Blanco} Opción/numero: ${nc} "
	read -r NUM

	cat ${arr[$NUM]} | more 
}
_Busca_Nota(){
	
	echo -e " ${Verde} Vamos a Buscar por algun valor en el nombre de la Nota ${nc} " 
	echo -e " ${Amarillo} Introduce la palabra a Buscar ${nc} " 
	read textserch 
			
	CONTADOR=0
	LINEAS=`ls ${CARPETA}/*.md | grep $textserch`
	echo -e " ${Azul} Seleciona la opcion a editar ${nc} "
	for LINEA in $LINEAS
	do
	    OPCIONLINEA=`echo ${LINEA} | cut -d "." -f1 | cut -d "/" -f6`
	    echo -e " ${Amarillo} $CONTADOR: ${OPCIONLINEA} ${nc} "
	    arr+=( "${LINEA}" )
	    CONTADOR=$((CONTADOR+1))

	done
	echo -e " ${Blanco} Opción/numero: ${nc} "
	read -r a_Editar

	nano ${arr[$a_Editar]} ; clear
	}

_git_push(){

	echo -e "${Azul} Empezamos añadiendo los Ficheros a subir ${nc} "
	git add .
	echo -e " ${Verde} Descargamos lo que pueda haber en el repositorio ${nc} "
	git pull
	echo "Cual va a ser el Texto del \"Commit\""
	read COMMIT
	git commit -m "$COMMIT" ; git push

}

_select_editor(){

    # Imprimimos por pantalla las opciones a seleccionar
    printf "%s\n%s\n%s\n%s\n%s\n\n" "Seleciona una opción." "1 Lista Notas." "2 Crea Nota." "3 Busca x Texto." "Actualiza Repositorio"
    read -r editor

    # Elegimos la opcion y ejecutamos su codigo
    case $editor in
        1) _Lista_Notas
            ;;
        2) _Crea_Nota
            ;;
        3) _Busca_Nota 
            ;;
        4) _git_push
			;;
        *) /usr/bin/clear
           printf "%s\n%s\n\n" "No he entendido la seleccion." \
               "Presiona <Ctrl-c> para Salir."
           _select_editor
            ;;
    esac

}

_banner_CTBELL
_select_editor