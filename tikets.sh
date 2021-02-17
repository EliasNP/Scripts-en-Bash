#!/bin/bash -   
#Titulo         :tikets.sh
#Descripción   :Crea maneja y modifica tikets y sus respuestas
#Autor          :Elias Nieva
#Fecha          :2020-08-10
#Versión       :0.1    
#uso            :./tikets.sh
#Notas          :       
#bash_version   :4.4.20(1)-release
#E-mail         :nombre@servidor.com
#Empresa        :NOMBRE DE LA EMPRESA
#Telefono       :666 999 999
##===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@

#============================================================================
#                   TRABAJOS PREVIOS DE COMPROBACION                        #
#============================================================================

# Variables Genericas cargadas desde el Script 'Variables.sh'
# Variables Genericas y Funciones
FUNCIONES=~/scripts/funciones.sh
if test -f $FUNCIONES ; then source $FUNCIONES; else wget -c -P ~/scripts/ http://radius.ctbell.com/ctbell/scripts/funciones.sh ; source $FUNCIONES ; fi

#░░▒▒▒▓▓▓▓██████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
#                           DECLARAMOS VARIABLES                            #
#░░▒▒▒▓▓▓▓██████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
valor="${1}"

#============================================================================
#               DEFINICION DE FUNCIONES/VARIABLES PROPIAS                   #
#============================================================================
archivo=$HOME/Rpositorios/Scripts-en-Bash/tikets.sh
FECHA=`date +%Y%m%d`
DIAMESANO=`date +%d-%b-%Y| tr 'a-z' 'A-Z'`
HORA=`date +%H%M%S`
NUMTIK=${FECHA}${HORA}
USERID=`id -g`
IP=`hostname -I  | cut -d " " -f1`
IP2=`hostname -I  | cut -d " " -f2`
DIR=$HOME/Documentos/INFORMATICO/TIKETS

function _menu()
{

  OPCION1="Crear"
  OPCION2="Buscar"
  OPCION3="Editar"
  OPCION4="Responder"
  OPCION5="Listar"
  OPCION20="░░▒▒▒▓▓██████   SALIR    █████▓▓▓▓▒▒▒░░"

echo -e "${Purpura}░░▒▒▒▓▓▓▓█████████████████████████▓▓▓▓▒▒▒░░ ${Verdeclaro}"
          echo -e "          ¿Que quieres Hacer?"
echo -e "${Purpura}░░▒▒▒▓▓▓▓█████████████████████████▓▓▓▓▒▒▒░░${Verdeclaro}"
  echo "  1)${OPCION1}"
  echo "  2)${OPCION2}"
  echo "  3)${OPCION3}"
  echo "  4)${OPCION4}"
  echo "  5)${OPCION5}"

  echo "  20)${OPCION20}" 

  #read n
  case ${valor} in
    1) 
        _CreaTiket
        TEXTO="${OPCION1}"
        ;;
    2)  
        _BuscaTiket
        TEXTO="${OPCION2}"
        
        ;;
    3) 
        _EditaTiket
        TEXTO="${OPCION3}"
        
        ;;
    4)
        _RespondeTiket
        TEXTO="${OPCION4}"
        ;;
    5) 
        _ListaTiket
        TEXTO="${OPCION1}"
        ;;
    
    20) exit;;
    
    *) 
        echo -e "
        ${Rojoclaro}Selecciona una opción valida${nc}
        "
        read valor 
        clear 
        ./${0} ${valor}
        ;;
  esac

}

function _ListaDirs(){
	cd ${DIR}
	files="$(ls -d */)"
	select filename in ${files}; do echo "Has seleccionado ${filename}"; break; done
	if [ -z "${filename}" ] ; then  echo -e "${Verdeclaro} No existe Introduce el nuevo nombre del Cliente?${nc}"; read filename ; mkdir ${DIR}/${filename}/ ; sleep 2 
	else echo -e "${Azulclaro} ${filename} ${nc} " ;
	fi
}

function _Continuaere(){

	echo -e "${blue}¿Quieres ${continuar}${nc}"
while true; do
    read -p "S/s ó N/n :>>" sn
    case $sn in
        [Ss]* ) sleep 1 ; break;;
        [Nn]* ) exit;;
        * ) echo "Por favor, elige 'S/s' o 'N/n'.";;
    esac
done

}
function _EstadoTikt(){
	
	echo -e "${Verdeclaro} ¿Estado?${nc}"
	OPCION1="NUEVO" ; 	OPCION2="PENDIENTE" ; OPCION3="PARALIZADO" ; OPCION4="EN ESPERA" ; OPCION5="FINALIZADO" 
	select opcion in "${OPCION1}" "${OPCION2}" "${OPCION3}" "${OPCION4}" "${OPCION5}"
		do
			Estado="$opcion"
			#echo "${Estado}"
	break; done
}

function _CreaTiket() {
	clear
	## RESULTADO FINAL {||	TIKET	|	20200807134800	|	07/AGO/2020		|	FLAMINGO	|		Adoptar Antena Nueva				|		PENDIENTE	Cambio AP	||}
	echo -e "${Amarillo}Crear un nuevo tiket${nc}"
	echo -e "${Amarillo}-----------------------------------------------${nc}"
	echo -e "${Verdeclaro} ¿Nombre del Cliente?${nc}"
	echo -e "${Rojoclaro} Si nuevo marca opcion \"0\" ${nc}"
	_ListaDirs
	echo -e "${Amarillo}-----------------------------------------------${nc}"
	clear
	_EstadoTikt	
	clear
	echo -e "${Verdeclaro} ¿Aviso?${nc}"
	read Aviso
	clear
	echo -e "${Verdeclaro} ¿Extra?${nc}"
	read Extra
	clear
	if test -f ${DIR}/${filename}/${NUMTIK}.txt ; then echo -e "${Purpura} ${NUMTIK} ${nc}"; else touch ${DIR}/${filename}/${NUMTIK}.txt ; fi
	
		echo -e "|	${NUMTIK} 	|	${DIAMESANO}	|	${filename}/ 	|	${Aviso}	|	${Estado}	|	${Extra}	|" >> ~/Rpositorios/Documentos/TIKETS.md
		echo -e "TIKET Nº: ${NUMTIK} \n\rFecha: ${DIAMESANO} \n\rESTADO: ${Estado} \n\rCLIENTE: ${filename} \n\rAVISO: ${Aviso}\n\rNOTAS EXTRAS: ${Extra}\n\r-----------------------------------" >> ${DIR}/${filename}/${NUMTIK}.txt
		# cat ${DIR}/${filename}/${NUMTIK}.txt
		# echo -e "${Verdeclaro}------------------------${nc}"
		cat ~/Rpositorios/Documentos/TIKETS.md | grep ${NUMTIK}
		echo -e "${Verdeclaro}------------------------${nc}"
		sleep 3; echo "wait ..."
	#break; done
}

function _BuscaTiket() {
	clear
	
	_ListaDirs
	clear	

	_EstadoTikt
	clear
	
	echo -e "${Azulclaro}Busca un tiket con estado ${Estado} en la carpeta ${filename} ${nc}"
	cat ~/Rpositorios/Documentos/TIKETS.md | grep ${filename} | grep ${Estado}
	
	for LINEA in $(cat ~/Rpositorios/Documentos/TIKETS.md | grep ${filename} | grep ${Estado} | cut -d "|" -f2 | sed 's/^[[:space:]]*//') ; do
  		IFS='\n'  # Caracter separador
  			for VALOR in $LINEA ; do
    			let A=$A+1
    			VARIABLE[$A]=${VALOR}
  				#echo -e "${Rojoclaro}${VARIABLE[$A]}${nc}"
  			done
  		IFS=$'\n'
	done

PS3="$Prompt "
select opt in "${VARIABLE[@]}" "Quit"; do 

    case "$REPLY" in

    1 ) clear; cat ${DIR}/${filename}/${opt}.txt; break;;
    2 ) clear; cat ${DIR}/${filename}/${opt}.txt; break;;
    3 ) clear; cat ${DIR}/${filename}/${opt}.txt; break;;
    4 ) clear; cat ${DIR}/${filename}/${opt}.txt; break;;
    5 ) clear; cat ${DIR}/${filename}/${opt}.txt; break;;
    6 ) clear; cat ${DIR}/${filename}/${opt}.txt; break;;
    7 ) clear; cat ${DIR}/${filename}/${opt}.txt; break;;
    8 ) clear; cat ${DIR}/${filename}/${opt}.txt; break;;
    9 ) clear; cat ${DIR}/${filename}/${opt}.txt; break;;
    10 ) clear; cat ${DIR}/${filename}/${opt}.txt; break;;
    11 ) clear; cat ${DIR}/${filename}/${opt}.txt; break;;
    12 ) clear; cat ${DIR}/${filename}/${opt}.txt; break;;
    13 ) clear; cat ${DIR}/${filename}/${opt}.txt; break;;
    14 ) clear; cat ${DIR}/${filename}/${opt}.txt; break;;
    15 ) clear; cat ${DIR}/${filename}/${opt}.txt; break;;
	16 ) clear; cat ${DIR}/${filename}/${opt}.txt; break;;
	17 ) clear; cat ${DIR}/${filename}/${opt}.txt; break;;
	17 ) clear; cat ${DIR}/${filename}/${opt}.txt; break;;
	18 ) clear; cat ${DIR}/${filename}/${opt}.txt; break;;
	19 ) clear; cat ${DIR}/${filename}/${opt}.txt; break;;
	20 ) clear; cat ${DIR}/${filename}/${opt}.txt; break;;
    
	$(( ${#VARIABLE[@]}+1 )) ) echo "Salir!"; break;;
    *) echo "Invalid option. Try another one.";continue;;

    esac

done

	#echo "${filename} + ${opt}"
nopt=${opt}
options=("Editar" "Responder" "Volver")

PS3="$Prompt "
select opt in "${options[@]}" "Quit"; do 

    case "$REPLY" in

    1 ) clear; _EditaTiket; break;;
    2 ) clear; _RespondeTiket; break;;
    3 ) clear; _menu; break;;

        $(( ${#options[@]}+1 )) ) echo "Goodbye!"; break;;
    *) echo "Invalid option. Try another one.";continue;;

    esac

done

}

function _EditaTiket() {
	echo -e "${Purpura} Edita un tiket${nc}"
	if test -f ${DIR}/${filename}/${nopt}.txt ; then echo -e "${Azul} ${filename} - ${nopt} ${nc}"; else _BuscaTiket ; fi
	sleep 2
	nano ${DIR}/${filename}/${nopt}.txt
}

function _RespondeTiket() {
	clear
	echo -e "${Purpura}Responde un tiket${nc}"
		if test -f ${DIR}/${filename}/${nopt}.txt ; then echo -e "${Azul} ${filename} - ${nopt}"; else _BuscaTiket ; fi
	cat ${DIR}/${filename}/${nopt}.txt
	echo -e "${nc}---------------------- \n\rAñadir Respuesta";
	#|	T	|	14/AGO/2020		|	1 HORA	|	ERROR EN ZULU DESKTOP SE CREA INCIDENCIA EN SANGOMA	| 	Confirmado Ticket ID: 962083** SIGUE EN TIKETS **	|
	echo -e "${Purpura}Tipo de Respuesta (R)espuesta, (LL)amada, (E)-Mail, (P)rogramación, (Tiket), (O)tro${nc}"
	while true; do
    read -p "R/r,LL/ll,E/e,P/p,T/t,O/o :>>" rlepto
    	case $rlepto in
        	[Rr]* ) Respuesta="Respuesta"; break;;
        	[LLll]* ) Respuesta="LLamada"; break;;
			[Ee]* ) Respuesta="E-mail"; break;;
			[Pp]* ) Respuesta="Programación"; break;;
			[Tt]* ) Respuesta="Tkt Externo"; break;;
			[Oo]* ) Respuesta="Otros"; break;;
        	* ) echo "Por favor, elige ${Rojoclaro}(R)espuesta, (LL)amada, (E)-Mail, (P)rogramación, (Tiket), (O)tro.${nc}";;
    	esac
	done
		#	echo -e "${Rojoclaro}${Respuesta}${nc}"
	echo -e "${Azulclaro}Tiempo dedicado ${nc}"	
	read tiempoded
	echo -e "${Azulclaro} Mensaje de la Respuesta${nc}"
	read Aviso
	echo -e "${Azulclaro} Aclaración o mensaje extra${nc}"
	read extra
	_EstadoTikt
	
	HGY=`grep "ESTADO:" ${DIR}/${filename}/${nopt}.txt | cut -d " " -f2`
	sed -i "/ESTADO/s/${HGY}/${Estado}/" ${DIR}/${filename}${nopt}.txt
	sed -i "/${nopt}/s/${HGY}/${Estado}/" ~/Rpositorios/Documentos/TIKETS.md
 	
	echo -e "» |	${Respuesta}	|	${DIAMESANO}	|	${tiempoded} HORA	|	${Aviso}	|	${extra}	|	${Estado}	|" >> ${DIR}/${filename}${nopt}.txt

	cat ${DIR}/${filename}${nopt}.txt

	if [[ "${Estado}" == "FINALIZADO" ]]; then

		LKO=`grep ${nopt} ~/Rpositorios/Documentos/TIKETS.md`
		sed -i "/${nopt}/d" ~/Rpositorios/Documentos/TIKETS.md

		if [ -d "${DIR}/${filename}FINALIZADO/" ] ; then  
				echo -e "${Azulclaro} ${DIR}/${filename}FINALIZADO -OK${nc} " 
			else 
				echo -e "${Verdeclaro} No existe, Se crea carpeta${nc}"
				mkdir ${DIR}/${filename}FINALIZADO
		fi
		
		echo ${LKO} >> ~/Rpositorios/Documentos/TIKETS_Arch.md
		mv ${DIR}/${filename}${nopt}.txt ${DIR}/${filename}FINALIZADO/${FECHA}_${nopt}.txt
		sed -i "/ESTADO/s/${HGY}/${Estado}\nFECHA_FIN: ${DIAMESANO}/" ${DIR}/${filename}${nopt}.txt
		sed -i "/${nopt}/s/${nopt}/${nopt}_to_${FECHA}/" ~/Rpositorios/Documentos/TIKETS.md
	fi


	#_BuscaTiket
	#_menu 0
}

function _ListaTiket() {
#	echo -e "${Purpura}Listamos los tikets ${nc}"
	function _Listado() {
		echo -e "¿Quieres un solo Cliente(Sí) o Todos(No)?"
		while true; do
    	read -p "S/s ó N/n :>>" sn
    	case $sn in
        	[Ss]* ) _ListaDirs ;  echo "${NUPEN}" | grep "${filename}" ; break;;
        	[Nn]* ) echo "${NUPEN}" ; break;;
        	* ) echo "Por favor, elige 'S/s' o 'N/n'.";;
    		esac
		done
	}
clear
	echo -e "${Rojoclaro} ¿Quieres ver Todos (Si ó No)?${Purpuraclaro}"
		while true; do
    	read -p "S/s ó N/n :>>" sn
    	case $sn in
        	[Ss]* ) cat ~/Rpositorios/Documentos/TIKETS.md ; echo -e "\n\r --------------------------------------${nc} \n\r"; _Listado ; break;;
        	[Nn]* ) exit;;
        	* ) echo "Por favor, elige 'S/s' o 'N/n'.";;
    		esac
		done

	_EstadoTikt
	if [ "${Estado}" != "NUEVO" ] | [ "${Estado}" != "PENDIENTE" ]; then
		NUPEN=`grep "${Estado}" ~/Rpositorios/Documentos/TIKETS.md `
		_Listado

	else
		NUPEN=`grep -e "NUEVO" -e "PENDIENTE" ~/Rpositorios/Documentos/TIKETS.md `
		_Listado
	fi

	

	

	
}


#============================================================================
#                           INICIAMOS EL SCRIPT                             #
#============================================================================
#_EstadoTikt
_menu