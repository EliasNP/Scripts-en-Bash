
#!/bin/bash
#===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@
#titulo         :rederror.sh
#descripcion    :Este Script reinicia y borra la red.
#autor          :3Ln1Pr1
#fecha          :2019-11-22
#version        :0.6
#uso            :./rederror.sh
#notas          :Install Nano and Emacs para editar el Script
#bash_version   :4.1.5(1)-version
#e-mail         :3ln1pr1(Arroba)keemail(dot)me
#Empresa        :https://3ln1pr1.github.io/Bitacora/
#Telefono       :@3ln1pr1 (Telegram) @3l_n1 (Twitter)  3ln1pr1@mastodon.social  @3ln1pr1 en GNUsocial(https://is.gd/lPELkX)
#
#                      ██████╗ ██╗     ███╗   ██╗ ██╗██████╗ ██████╗  ██╗
#                      ╚════██╗██║     ████╗  ██║███║██╔══██╗██╔══██╗███║
#                       █████╔╝██║     ██╔██╗ ██║╚██║██████╔╝██████╔╝╚██║
#                       ╚═══██╗██║     ██║╚██╗██║ ██║██╔═══╝ ██╔══██╗ ██║
#                      ██████╔╝███████╗██║ ╚████║ ██║██║     ██║  ██║ ██║
#                      ╚═════╝ ╚══════╝╚═╝  ╚═══╝ ╚═╝╚═╝     ╚═╝  ╚═╝ ╚═╝
#                                    -----------------------
#                             https://3ln1pr1.github.io/Bitacora/
#===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@

clear
echo "Debes ejecutar como sudo o no va a funcionar \r\n Empezamos en 3s"
echo "Ctrl+c para salir en caso que no estes elevado"
sleep 2
clear
echo "1.Paramos el servicio network-manager"
service network-manager stop
echo "2.Borramos el fichero de NetworkManager.state"
rm -f /var/lib/NetworkManager/NetworkManager.state
sleep 2
echo "3.Iniciamos de nuevo el servicio Network-manager"
service network-manager start
sleep 1
echo "Finalizando "
sleep 1
clear
echo "Finalizando .."
sleep 1
clear
echo "Gracias,  Servicio restablecido"
