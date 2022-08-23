	#!/bin/bash
clear
op=99
	while [ $op != "0" ]
	do
	echo "Has seleccionado la opcion de modificar grupo."
	echo "1) Modificar nombre."
	echo "2) Modificar GID."
	echo "0) Salir."
	read -p "Ingrese la opcion a elegir: " op
	case $op in
		1)
			clear
			echo "Has seleccionado modificar nombre."
			read -p "Ingrese el nombre del grupo: " gronom
			read -p "Ingrese el nuevo nombre del grupo: " gronom2
			groupmod -n $gronom2 $gronom
			echo "Cambio de nombre exitoso."
			;;
		2)
			clear
			echo "Has seleccionado modificar GID."
			read -p "Ingrese el nombre del grupo: " gronom
			read -p "Ingrese el GID a asignar: " gid
			groupmod -g $gid $gronom
			echo "Cambio de GID exitoso."
			;;
		0)
			clear
			echo "Salida exitosa."
			;;
		*)
			clear
			echo "Opcion invalida."
			;;
	esac
	done

