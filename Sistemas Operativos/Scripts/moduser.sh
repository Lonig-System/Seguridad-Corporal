#!/bin/bash
clear
op=77
	while [ $op != "0" ]
	do
		echo "Has accedido a la opcion de modificacion de usuarios."
        	echo "Lista con los usuarios del sistema: "
        	cat /etc/passwd | cut -d':' -f1,7 | grep "/bin/bash" | cut -d':' -f1
		echo ""
		echo "1) Contraseña."
		echo "2) Grupos."
		echo "3) Comentario del usuario."
		echo "4) Directorio home del usuario."
		echo "0) Salir."
		read -p "Ingrese el numero de la opcion que quiere modificar: " op
	case $op in
		1)
			clear
			echo "Lista con los usuarios del sistema: "
                	cat /etc/passwd | cut -d':' -f1,7 | grep "/bin/bash" | cut -d':' -f1
                	cat /etc/passwd | cut -d':' -f1,7 | grep "/bin/sh" | cut -d':' -f1
			read -p "Ingrese el nombre del usuario: " nom
			passwd $nom
			;;
		2)
			clear
			echo "Lista de usuarios con UID y GID."
			cat /etc/passwd | cut -d':' -f1,3,4,7 | grep "/bin/bash" | cut -d':' -f1,2,3
			cat /etc/passwd | cut -d':' -f1,3,4,7 | grep "/bin/sh" | cut -d':' -f1,2,3
			read -p "Ingrese el nombre del usuario: " nom
			read -p "Ingrese el nombre del primer grupo: " gronom
			read -p "Ingrese el nombre del segundo grupo: " sgronom
			usermod -g $gronom -G $sgronom $nom
			;;
		3)
			clear
			echo "Lista de usuarios del sistema: "
			cat /etc/passwd | cut -d':' -f1,7 | grep "/bin/bash" | cut -d':' -f1
                        cat /etc/passwd | cut -d':' -f1,7 | grep "/bin/sh" | cut -d':' -f1
			read -p "Ingrese el nombre del usuario: " nom
			read -p "Ingrese el comentario a asignar: " com
			usermod -c "$com" $nom
			;;
		4)
			clear
			echo "Lista de usuarios del sistema: "
                        cat /etc/passwd | cut -d':' -f1,7 | grep "/bin/bash" | cut -d':' -f1
                        cat /etc/passwd | cut -d':' -f1,7 | grep "/bin/sh" | cut -d':' -f1
                        read -p "Ingrese el nombre del usuario: " nom
                        read -p "Ingrese el direcotorio a asignar como home: " dir
			usermod -d "/home/$dir" $nom
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
