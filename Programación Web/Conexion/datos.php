<!DOCTYPE html>
<html>
<head>
	<title>Datos de Contacto</title>
</head>
<body>
	<H1>Datos de Contacto</H1>
	<?php		
			$conexion = mysqli_connect('localhost','prueba','prueba','agenda');
			if(!$conexion){
				die('Error en la conexion. ' . mysqli_connect_error());			
			}
			if (isset($_GET['mod'])){
				//Vamos a modificar
				$telefono = $_GET['mod'];
				$accion = "modificar";
				
			}else {
				if (isset($_GET['del'])){
					//vamos a eliminar
					$telefono = $_GET['del'];
					$accion = "eliminar";
				}
			}
			if(isset($telefono)){
				//Obtengo los datos del contacto a modificar o a eliminar
				$sentencia = $conexion->prepare("SELECT * FROM datos WHERE telefono =  ?");
				$sentencia->bind_param("i",$telefono);
				$sentencia->execute();	//ejecutar la sentencia
				$sentencia->store_result();	//almacenar el resultado
				$sentencia->bind_result($tel,$nombre,$apellido,$fechanac); //obtener los datos de cada columna
				$sentencia->fetch();
				
	?>
	<form action="conexion.php" method="POST">
		Telefono:<input type="number" name="tel" value="<?php echo $tel;	?>"><br>
		Nombre: <input type="text" name="nombre" value="<?php echo $nombre; ?>"><br>
		Apellido: <input type="text" name="apellido" value="<?php echo $apellido; ?>"><br>
		F.Nacimiento:<input type="text" name="fechanac" value="<?php echo $fechanac; ?>"><br>
							<input type="hidden" name="accion" value="<?php echo $accion; ?>">
							<input type="hidden" name="telefono" value="<?php echo $telefono; ?>">
							<input type="submit" value="Enviar">
	</form>
	<?php
		}else{
			//El usuario va ingresar uno nuevo	
	?>
	<form action="conexion.php" method="POST">
		Telefono: 		<input type="number" name="telefono"><br>
		Nombre: 			<input type="text" 	name="nombre"><br>
		Apellido: 		<input type="text" 	name="apellido"><br>
		F.Nacimiento: 	<input type="date" 	name="fechanac"><br>
							<input type="submit" value="Enviar">
	</form>
	<?php
		}	
	?>
</body>
</head>
</html>
