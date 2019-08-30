#!/bin/bash
#titulo         :scripts_variables.sh
#descripcion    :Este Script almacena las FUNCIONES que serán llamados desde los menús de Variables.
#autor	        :Elias Nieva Prieto
#fecha          :2019-08-22
#version        :0.0.1
#uso		:sh scripts_variables.sh
#notas          :Install Nano and Emacs para usar el Script
#bash_version   :4.1.5(1)-version
#e-mail         :informatica@ctbell.com
#Empresa        :C.T.Bell s.l.u
#Telefono       :966 812 131
#===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@
#Recurso con más funciones y opciones genericas
source funciones.sh
#source source/scripts_variables.sh
source variables.sh

<<INFO
░░▒▒▒▓▓▓▓█████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
 I N I C I O   D E L   P R I M E R    N I V E L    D E   F U N C I O N E S
░░▒▒▒▓▓▓▓▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼▓▓▓▓▒▒▒░░

Śelección de Opciones del Menú de Variables 
	case $menuitem in
		1.VARIABLES)ver_variables;;
		2.EDITAR) edita_variables;;
		3.FICHERO) nano_variables;;
		9.VOLVER) break;;
INFO

<<INFO
		█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█		

		█████████████████████
			ver Variables.
		█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█

INFO
function ver_variables(){
TEXTO_VARIABLES="Nombre que va delante del numero de Extensión Ej.EXT \n\nINDICE=${INDICE}\n\nExtension de Inicio para el Contador \n\nHABSTART=${HABSTART} \n\nExtension Limite para el contador \n\nLIMIT=${LIMIT} 
\n\nHabitación por defecto para la cabina \n\nROMCAB=${ROMCAB}\n\nNombre que aparecera en la extension de la Cabina \n\nCABINA='${ROMCAB}-CABINA'\n\nFichero de salida donde el Driver del 'CHAR' cargara los nombres en los CheckIn-Out
\n\nSALIDA=${SALIDA}\n\nPassword para la compresion de Audios de llamadas \n\nPASSWORD=${PASSWORD}\n\nRuta de los Ficheros de Actualizacion de los scripts. \n\nFOLDER1=${FOLDER1}\n\nCARPETA=${CARPETA}"
dialog --title "${CTBELL}" --pause "${TEXTO_VARIABLES}" 200 150 55
}

<<INFO
		█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█		

		█████████████████████
		   Edita Variables.
		█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█


INFO
function edita_variables(){
# Definimos el loop infinito
while true
do
VARIABLES_TEXTO="\nINDICE=${INDICE}\nHABSTART=${HABSTART}\nLIMIT=${LIMIT}\nROMCAB=${ROMCAB}\nCABINA='${ROMCAB}-CABINA'\nSALIDA=${SALIDA}\nPASSWORD=${PASSWORD}"
### MUESTRA MENU DE VARIABLES ###
	dialog --clear --backtitle "${CTBELL}" \
	--title "[ E D I T A R  - V A R I A B L E S ]" \
	--menu "${MENU_TXT}${VARIABLES_TEXTO}" 30 100 9 \
		1.INDICE "${INDICE} - EDITA EL NOMBRE QUE VA DELANTE DEL Nº DE EXTENSIÓN" \
		2.HABSTART "${HABSTART} - EDITA EL 1ER NUMERO DE EXTENSIONES" \
		3.LIMIT "${LIMIT} - EDITA EL ULTIMO NUMERO DE EXTENSIONES" \
		4.ROMCAB "${ROMCAB} - EDITA EL NUMERO DE EXTENSION DE LA CABINA"\
		5.CABINA "${CABINA} - NOMBRE QUE LE VAMOS A DAR A LA EXTENSION DE LA CABINA"\
		6.SALIDA "${SALIDA} - RUTA DEL FICHERO DE SALIDA DISTINTI DE HESTIA PARA LOS NOMBRES"\
		7.PASSWORD "${PASSWORD} - EDITA EL PASSWORD PARA ENCRIPTAR LOS FICHEROS DE AUDIO"\
		9.VOLVER "VOLVER AL MENÚ PRINCIPAL" 2>"${INPUT}"

	menuitem=$(<"${INPUT}")
# Śelección de Opciones 
	case $menuitem in
		1.INDICE) f_indice;;
		2.HABSTART) f_habstart;;
		3.LIMIT) f_limit;;
		4.ROMCAB) f_romcab;;
		5.CABINA) f_cabina;;
		6.SALIDA) f_salida;;
		7.PASSWORD) f_password;; 
		9.VOLVER) break;;
	esac
done
}

<<INFO
		█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█		

		█████████████████████
		   Nano Variables.
		█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█

INFO
function nano_variables(){
nano source/variables.sh
}

<<INFO
█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█			█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█			█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█	
          F I N    D E L   P R I M E R    N I V E L    D E   F U N C I O N E S

░░▒▒▒▓▓▓▓█████████████████████████████████████████████████████████▓▓▓▓▒▒▒░░
   I N I C I O   S E G U N D O   N I V E L   D E   V A R I A B L E S                       
░░▒▒▒▓▓▓▓▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼▓▓▓▓▒▒▒░░
INFO

<<INFO
		█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█		

		█████████████████████
		   f_indice.
		█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█
INFO
function f_indice(){
	#Preguntamos en nuevo valor de la Variable $INDICE
	input=$(dialog --inputbox "Actualmente el Valor del INDICE es ${INDICE} \nIntroduce el nuevo valor" 20 30  --output-fd 1)
	retval=$?
	case $retval in
		0)
			f_indice_yes;;
		1)
			echo "Se ha Cancelado la Operación.";;
	esac
}
<<INFO
				█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█		

				█████████████████████
					f_indice_yes.
				█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█
INFO
function f_indice_yes(){
	dialog --title "Se va a cambiar el valor de INDICE" --yesno "El nuevo valor es ${input}" 0 0 
	sed -i "s/INDICE=\"${INDICE}\"/INDICE=\"${input}\"/gi" source/variables.sh
	source source/variables.sh 
}

#f_habstart
<<INFO
		█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█		

		█████████████████████
		  f_habstart
		█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█
INFO
function f_habstart(){
	#Preguntamos en nuevo valor de la Variable $HABSTART
	input=$(dialog --inputbox "Actualmente el Valor del HABSTART es ${HABSTART} \nIntroduce el nuevo valor" 20 30  --output-fd 1)
	retval=$?
	case $retval in
		0)
			f_habstart_yes;;
		1)
			echo "Se ha Cancelado la Operación.";;
	esac
}
<<INFO
				█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█		

				█████████████████████
					f_habstart_yes.
				█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█
INFO
function f_habstart_yes(){
	dialog --title "Se va a cambiar el valor de HABSTART" --yesno "El nuevo valor es ${input}" 0 0 
	sed -i "s/HABSTART=${HABSTART}/HABSTART=${input}/gi" source/variables.sh
	source source/variables.sh 
}

#f_limit;;
<<INFO
		█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█		

		█████████████████████
		  f_limit
		█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█
INFO
function f_limit(){
	#Preguntamos en nuevo valor de la Variable $HABSTART
	input=$(dialog --inputbox "Actualmente el Valor del LIMIT es ${LIMIT} \nIntroduce el nuevo valor" 20 30  --output-fd 1)
	retval=$?
	case $retval in
		0)
			f_limit_yes;;
		1)
			echo "Se ha Cancelado la Operación.";;
	esac
}
<<INFO
				█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█		

				█████████████████████
					f_limit_yes.
				█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█
INFO
function f_limit_yes(){
	dialog --title "Se va a cambiar el valor de LIMIT" --yesno "El nuevo valor es ${input}" 0 0 
	sed -i "s/LIMIT=${LIMIT}/LIMIT=${input}/gi" source/variables.sh
	source source/variables.sh 
}
#f_romcab;;
<<INFO
		█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█		

		█████████████████████
		  f_romcab
		█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█
INFO
function f_romcab(){
	#Preguntamos en nuevo valor de la Variable $ROMCAB
	input=$(dialog --inputbox "Actualmente el Valor del ROMCAB es ${ROMCAB} \nIntroduce el nuevo valor" 20 30  --output-fd 1)
	retval=$?
	case $retval in
		0)
			f_romcab_yes;;
		1)
			echo "Se ha Cancelado la Operación.";;
	esac
}
<<INFO
				█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█		

				█████████████████████
					f_romcab_yes.
				█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█
INFO
function f_romcab_yes(){
	dialog --title "Se va a cambiar el valor de ROMCAB" --yesno "El nuevo valor es ${input}" 0 0 
	sed -i "s/ROMCAB=\"${ROMCAB}\"/ROMCAB=\"${input}\"/gi" source/variables.sh
	source source/variables.sh 
}
#f_cabina;;
<<INFO
		█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█		

		█████████████████████
		  f_cabina
		█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█
INFO
function f_cabina(){
	#Preguntamos en nuevo valor de la Variable $CABINA
	input=$(dialog --inputbox "Actualmente el Valor del CABINA es ${CABINA} \nIntroduce el nuevo valor" 20 30  --output-fd 1)
	retval=$?
	case $retval in
		0)
			f_cabina_yes;;
		1)
			echo "Se ha Cancelado la Operación.";;
	esac
}
<<INFO
				█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█		

AQUI ME QUEDE, NO CAMBIA EL TEXTO 26-08-2019

				█████████████████████
					f_cabina_yes.
				█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█
INFO
function f_cabina_yes(){
	dialog --title "Se va a cambiar el valor de CABINA" --yesno "El nuevo valor es ${input}" 0 0 
	#CABINA="$ROMCAB-CABINA"
	sed -i "s/CABINA=\"\$ROMCAB-${CABINA}\"/CABINA=\"\$ROMCAB-${input}\"/gi" source/variables.sh
	source source/variables.sh 
}
#f_salida;;
<<INFO
		█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█		

		█████████████████████
		  f_habstart
		█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█
INFO
function f_habstart(){
	#Preguntamos en nuevo valor de la Variable $HABSTART
	input=$(dialog --inputbox "Actualmente el Valor del HABSTART es ${HABSTART} \nIntroduce el nuevo valor" 20 30  --output-fd 1)
	retval=$?
	case $retval in
		0)
			f_habstart_yes;;
		1)
			echo "Se ha Cancelado la Operación.";;
	esac
}
<<INFO
				█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█		

				█████████████████████
					f_habstart_yes.
				█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█
INFO
function f_habstart_yes(){
	dialog --title "Se va a cambiar el valor de HABSTART" --yesno "El nuevo valor es ${input}" 0 0 
	sed -i "s/HABSTART=${HABSTART}/HABSTART=${input}/gi" source/variables.sh
	source source/variables.sh 
}
#f_password;; 
<<INFO
		█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█		

		█████████████████████
		  f_habstart
		█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█
INFO
function f_habstart(){
	#Preguntamos en nuevo valor de la Variable $HABSTART
	input=$(dialog --inputbox "Actualmente el Valor del HABSTART es ${HABSTART} \nIntroduce el nuevo valor" 20 30  --output-fd 1)
	retval=$?
	case $retval in
		0)
			f_habstart_yes;;
		1)
			echo "Se ha Cancelado la Operación.";;
	esac
}
<<INFO
				█▲█▲█▲█▲█▲█▲█▲█▲█▲█▲█		

				█████████████████████
					f_habstart_yes.
				█▼█▼█▼█▼█▼█▼█▼█▼█▼█▼█
INFO
function f_habstart_yes(){
	dialog --title "Se va a cambiar el valor de HABSTART" --yesno "El nuevo valor es ${input}" 0 0 
	sed -i "s/HABSTART=${HABSTART}/HABSTART=${input}/gi" source/variables.sh
	source source/variables.sh 
}