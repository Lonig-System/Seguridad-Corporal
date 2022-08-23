	#!/bin/bash
	clear
	op=77
	while [ $op != "0" ]
	do
		echo "Estas en el menu de usuarios."
		echo "Alta: Creacion de usuarios."
		echo "Baja: Eliminacion de usuarios."
		echo "Mod: Modificacion de usuarios."
		echo "0) Salir."
		read -p "Ingrese el nombre de la opcion a la cual quiere acceder: " op
	case $op in
	Alta)
		clear
		echo "Has accedido a la opcion de alta de usuarios."
		echo "Lista con los usuarios del sistema:"
                cat /etc/passwd | cut -d':' -f1,7 | grep "/bin/bash" | cut -d':' -f1
                cat /etc/passwd | cut -d':' -f1,7 | grep "/bin/sh" | cut -d':' -f1
		read -p "Ingrese el nombre del usuario a añadir: " nomadd
		read -p "Ingrese el nombre del grupo principal del usuario: " groadd
		useradd -g $groadd $nomadd
		;;
	alta)
		clear
		echo "Has accedido a la opcion de alta de usuarios."
		echo "Lista con los usuarios del sistema: "
                cat /etc/passwd | cut -d':' -f1,7 | grep "/bin/bash" | cut -d':' -f1
                cat /etc/passwd | cut -d':' -f1,7 | grep "/bin/sh" | cut -d':' -f1
        	read -p "Ingrese el nombre del usuario a añadir: " nomadd
        	read -p "Ingrese el nombre del grupo principal del usuario: " groadd
                useradd -g $groadd $nomadd
		;;
	Baja) 
		clear
		echo "Has accedido a la opcion de baja de usuarios."
		echo "Lista con los usuarios del sistema: "
		cat /etc/passwd | cut -d':' -f1,7 | grep "/bin/bash" | cut -d':' -f1
		cat /etc/passwd | cut -d':' -f1,7 | grep "/bin/sh" | cut -d':' -f1
		read -p "Ingrese el nombre del usuario a eliminar: " nomdel
		userdel $nomdel
		;;
	baja)
		clear
		echo "Has accedido a la opcion de baja de usuarios."
                echo "Lista con los usuarios del sistema: "
                cat /etc/passwd | cut -d':' -f1,7 | grep "/bin/bash" | cut -d':' -f1
                cat /etc/passwd | cut -d':' -f1,7 | grep "/bin/sh" | cut -d':' -f1
                read -p "Ingrese el nombre del usuario a eliminar: " nomdel
                userdel $nomdel
		;;
	Mod)
		clear
		./mod.sh
		;;
	mod)
		clear
		./mod.sh
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
