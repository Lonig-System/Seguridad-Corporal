#!/bin/bash
clear
op=77
	while [ $op != "0" ]
	do
		echo "Estas en el menu de grupos."
		echo "1) Crear grupo."
		echo "2) Eliminar grupo."
		echo "3) Modificar grupo."
		echo "0) Salir."
		read -p "Ingrese el nombre de la opcion a elegir: " op

	case $op in
	1)
		clear
		echo "Has seleccionado la creacion de grupo."
		read -p "Escriba el nombre del grupo a crear: " gronom
		groupadd $gronom
		;;
	2)
		clear
		echo "Has seleccionado la eliminacion de grupo."
		read -p "Ingrese el nombre del grupo a eliminar: " gronom
		groupdel $gronom
		;;
	3)
		clear
		./modgrupos.sh
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
