#!/bin/bash
#===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@
#titulo         :Limpiar.sh
#descripcion    :Este Script Limpia la Swap de Temporales para mejorar el rendimiento.
#autor	        :3Ln1Pr1
#fecha          :2019-06-06
#version        :0.6
#uso		:./Limpiar.sh
#notas          :Install Nano and Emacs para editar el Script
#bash_version   :4.1.5(1)-version
#e-mail         :3ln1pr1(Arroba)keemail(dot)me
#Empresa        :https://3ln1pr1.github.io/Bitacora/
#Telefono       :@3ln1pr1 (Telegram) @3l_n1 (Twitter)  3ln1pr1@mastodon.social  @3ln1pr1 en GNUsocial(https://is.gd/lPELkX)
#
                      ██████╗ ██╗     ███╗   ██╗ ██╗██████╗ ██████╗  ██╗
                      ╚════██╗██║     ████╗  ██║███║██╔══██╗██╔══██╗███║
                       █████╔╝██║     ██╔██╗ ██║╚██║██████╔╝██████╔╝╚██║
                       ╚═══██╗██║     ██║╚██╗██║ ██║██╔═══╝ ██╔══██╗ ██║
                      ██████╔╝███████╗██║ ╚████║ ██║██║     ██║  ██║ ██║
                      ╚═════╝ ╚══════╝╚═╝  ╚═══╝ ╚═╝╚═╝     ╚═╝  ╚═╝ ╚═╝
                                    -----------------------
#                             https://3ln1pr1.github.io/Bitacora/
#===3=====l======N=======1=========P=======r========1======@===3=====l======N=======1=========P=======r========1======@

echo "Este script limpia tu sistema y la swap"
echo "<---------------------------------------------------------->"
sleep 2s; echo "1.Deshabilitando Swap"
swapoff -a
echo "<---------------------------------------------------------->"
sleep 2s; echo "2.Limpiando el sistema"
sync;sysctl -w vm.drop_caches=3;sync
echo "<---------------------------------------------------------->"
sleep 2s; echo "3.Habilitando la swap"
swapon -a
echo "<---------------------------------------------------------->"

