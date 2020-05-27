#!/bin/bash  
function _Data(){
echo "Titulo         :tgfile.sh"
echo "Descripción   :Envia Texto y ficheros al Grupo desde la consola"
echo "Autor          :Elías Nieva"
echo "Fecha          :2020-05-15"
echo "Versión       :A.0.1  "
echo "uso            :./tgfile.sh"
echo "Notas          :       "
echo "bash_version   :4.4.20(1)-release"
echo "E-mail         :eliasnievap(at)protonmail(dot)com"
echo "Telegram       :@EliasNieva"
echo "Mastodon       :@EliasNieva@mastodon.social"
echo "============================================================================@"
}
##============================================================================@
##============================================================================@
function _Logo(){
printf "\033[1;34m                      ═══════════════════════════════════\e[0m\n"
printf "\033[1;34m                      ║█████████████████████████████████║\e[0m\n"
printf "\033[1;34m                      ║██╔═══╦╗███████╔═╗█╔╗████████████║\e[0m\n"
printf "\033[1;34m                      ║██║╔══╣║███████║║╚╗║║████████████║\e[0m\n"
printf "\033[1;34m                      ║██║╚══╣║╔╦══╦══╣╔╗╚╝╠╦══╦╗╔╦══╗██║\e[0m\n"
printf "\033[1;34m                      ║██║╔══╣║╠╣╔╗║══╣║╚╗║╠╣║═╣╚╝║╔╗║██║\e[0m\n"
printf "\033[1;34m                      ║██║╚══╣╚╣║╔╗╠══║║█║║║║║═╬╗╔╣╔╗║██║\e[0m\n"
printf "\033[1;34m                      ║██╚═══╩═╩╩╝╚╩══╩╝█╚═╩╩══╝╚╝╚╝╚╝██║\e[0m\n"
printf "\033[1;34m                      ║█████████████████████████████████║\e[0m\n"
printf "\033[1;34m                      ═══════════════════════════════════\e[0m\n"
printf "\033[1;34m                         -----------------------\e[0m\n"
printf "\033[1;34m                        https://EliasNp.github.io\e[0m\n"
printf "\033[1;34m ============================================================================@\e[0m\n"
}
# ============================
#    PREVIOUS CHECK WORK 
# ============================

source .config
reset #Clean all the screen 
_Logo #This Function show Logo
_Data #This Funtion Show file Data

# ============================
#  SCRIPT START HERE VARIABLES
# ============================

URL="https://api.telegram.org/bot$KEY/sendMessage"
URL2="https://api.telegram.org/bot$KEY/sendDocument"
FILE=$2
MENSAJE=$1

curl -s -X POST $URL -d "chat_id=$USERID&text=$MENSAJE"
curl --fail -F chat_id="$USERID" -F document=@"$FILE" $URL2 -X POST --progress-bar -o tmp --connect-timeout 0
