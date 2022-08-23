#!/bin/bash
clear
op=77
	while [ $op != "0" ]
	do
		echo "Estas en el menu principal."
		echo "1) Usuarios"
		echo "2) Grupos."
		echo "0) Salir."
		read -p "Elija el numero de la opcion que quiera seleccionar: " op
	case $op in
	1)
		clear
		./usuarios.sh
		;;
	2)
		clear
		./grupos.sh
		;;
	0)
		echo "Salida exitosa."
		;;
	*)
		clear
		echo "Opcion invalida."
		;;
	esac
	done
