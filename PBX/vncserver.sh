#!/bin/bash
#titulo         :vncserver.sh
#descripcion    :Este Script Instala el Entorno Grafico por VNC Server, actualizando algunos paquetes necesarios.
#autor	        :Elias Nieva Prieto
#fecha          :2019-05-27
#version        :0.6
#uso		    :sh vncserver.sh
#notas          :Install Nano and Emacs para usar el Script
#bash_version   :4.1.5(1)-version
#e-mail         :informatica@ctbell.com
#Empresa        :C.T.Bell s.l.u
#Telefono       :966 812 131
#===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@

#============================================================================
#                     INICIAMOS ESTADO DE VARIABLES                         #
#============================================================================

# Variables Genericas cargadas desde el Script "Variables.sh"
VARIABLE=/root/scripts/variables.sh
source $VARIABLE

        # DEFINICION DE VARIABLES #
#==========================================
CREADOR="ELIAS NIEVA"
E_MAIL="informatica@ctbell.com"
EMPRESA="C.T.Bell s.l.u"
TELEFONO="966 812 131"
FOLDERWEB="/var/www/html/"
FECHA=`date +%Y-%m-%d`
HORA=`date +%H:%M`
USERID=`id -g`
IP=`hostname -I  | cut -d " " -f1`
IP2=`hostname -I  | cut -d " " -f2`
IPCHECK=www.google.es
#==========================================

#==========================================
   # TRABAJOS PREVIOS DE COMPROBACION #
#==========================================

# COMPROBAMOS QUE FUNCIONAN LOS DNS
if [ "`ping -c 1 $IPCHECK`" ]; then   YDNS=1; else   YDNS=0; fi
clear

# SI LAS DNS funcionan seguimos si no iniciamos el configurador de RED
if [ $YDNS -eq 1 ]; then
    echo -e "La Prueba de DNS ${red}(OK) ${nc},\n Procedemos con la instalación\n"
    sleep 1;
else
    echo  -e "${blue}Iniciamos el configurador de RED${nc}"
    sleep 3
         "system-config-network"
    sleep 2
         "services network restart" ;
fi

# Install VNC Server ~ XFCE Desktop |CentOS 6.5

echo -e "${blue}#####      Instalar XFCE desktop environment     ######\n${nc}===================================================="
yum -y update && yum -y upgrade

echo -e "${blue}¿Quieres instalar el programa?${nc}"
while true; do
    read -p "Y/y ó N/n :>>" yn
    case $yn in
        [Yy]* ) sleep 1 ; break;;
        [Nn]* ) exit;;
        * ) echo "Por favor, elige 'Y/y' o 'N/n'.";;
    esac
done

yum groupinstall Xfce "Desktop" --nogpgcheck
sleep 2
yum -y install xorg-x11-fonts-misc xorg-x11-fonts-Type1 --nogpgcheck
sleep 2
echo "Instalar el VNC server"
yum -y install tigervnc-server --nogpgcheck

vncserver
sleep 3
vncserver -kill :1

echo -e "Editamos el Fichero de Configuración ${blue}\"/etc/sysconfig/vncservers\"${nc}"
echo "Descomenta estas lineas cuando se abra el editor de tu elección"
echo "		"
echo "#VNCSERVERS=\"1:root\"" >>/etc/sysconfig/vncservers
echo "#VNCSERVERARGS[1]=\"-geometry 1024x768\"" >>/etc/sysconfig/vncservers
echo " "
echo -e "${red}		VNCSERVERS=\"1:root\""
echo -e "		VNCSERVERARGS[1]=\"-geometry 1024x768\"${nc}"
echo ""
echo "elige editor  (Ejemplo: nano, vi ,emacs )"
read EDITOR
$EDITOR /etc/sysconfig/vncservers
clear
echo -e "Editamos el Fichero de Configuración ${blue}\"~/.vnc/xstartup\"${nc}"
echo "Modifica estas lineas cuando se abra el editor de tu elección para que queden de esta manera"
echo "		"
echo "#xterm -geometry 80x24+10+10 -ls -title ${blue}\"\$VNCDESKTOP PBX Desktop\" &" >>~/.vnc/xstartup
echo "#startxfce4$" >>~/.vnc/xstartup
echo ""
echo -e "${red}		xterm -geometry 80x24+10+10 -ls -title ${blue}\"\$VNCDESKTOP Desktop\" ${red} &"
echo -e "		#twm & "
echo -e "		startxfce4${nc}"
echo ""
echo "elige editor  (Ejemplo: nano, vi ,emacs )"
read EDITOR
$EDITOR ~/.vnc/xstartup
clear
service vncserver start
chkconfig vncserver on
sleep 1

yum -y install firefox
descarga /root/scripts/ freepbx.png
descarga /root/scripts/ internet.sh
descarga /root/scripts/ logo-char.png
cp -R /root/scripts/Desktop/* /root/Desktop/
ln -f -s /opt/CHAR /root/Desktop/CHAR
clear

#ENVIAMOS AVISO DE CREACION
sh tmsg.sh " $IP:5901 Ha instalado el Servidor de VNCDESKTOP"
echo -e "TODO INSTALADO \n Si Observa algún error debera corregirlo manualmente \ Si todo es Correcto ya puede trabajar"
echo -e "${blue} Ejecute el cliente ${red}VNC ${nc} en el ordenador \"cliente\" como normalmente, luego conéctese al servidor, con el formato ${nc} \n $IP:5901 \n La primera vez que iniciamos sesión no olvide instalar Firefox y adaptar los Iconos al gusto."
echo ""
echo -e "${blue}El Equipo Necesita REINICIARSE${nc}"
while true; do
    read -p "¿Desea hacerlo ahora? Y/y ó N/n :>>" yn
    case $yn in
        [Yy]* ) reboot ; break;;
        [Nn]* ) echo "no olvide Reiniciar manualmente antes de usar el VNC server" ; exit;;
        * ) echo "Por favor, elige 'Y/y' o 'N/n'.";;
    esac
done
