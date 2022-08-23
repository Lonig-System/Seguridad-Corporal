<!DOCTYPE html>
<html>
<head>
	<title>Conexion con Bases de Datos</title>
</head>
<body>
	<h1>Datos de la tabla "datos"</h1>
		<table border=1>
		<tr>
			<th>Telefono</th>
			<th>Nombre</th>
			<th>Apellido</th>
			<th>FechaNac.</th>
			<th>Modificar</th>
			<th>Eliminar</th>
		</tr>
		
		<?php
		
			$conexion = mysqli_connect('localhost','prueba','prueba','agenda');
			if(!$conexion){
				die('Error en la conexion. ' . mysqli_connect_error());			
			}

			//Vamos a ingresar un nuevo contacto			
			if (isset($_POST['telefono']) ){
				$telefono = $_POST['telefono'];
				$nombre = $_POST['nombre'];
				$apellido = $_POST['apellido'];
				$fechanac = $_POST['fechanac'];
				if(isset($_POST['accion']) ){
					$accion = $_POST['accion'];
					if ($accion == "modificar"){
						//modificar
						$tel = $_POST['tel']; //telefono nuevo
						$sentencia = $conexion->prepare("UPDATE datos set telefono = ? , nombre = ? , apellido = ? , fechanac = ? WHERE telefono = ?");
						$sentencia->bind_param("isssi",$tel,$nombre,$apellido,$fechanac,$tel);	
					}else {
						//eliminar
						$sentencia = $conexion->prepare("DELETE FROM datos WHERE telefono = ?");
						$sentencia->bind_param("i",$telefono);
					}
				}else{
					//ingresar
					$sentencia = $conexion->prepare("INSERT INTO datos VALUES ( ? , ? , ? , ? )");
					$sentencia->bind_param("isss",$telefono,$nombre,$apellido,$fechanac);				
				}
				$sentencia->execute();
			}			
			
			//echo "Conexion exitosa!";
			
			//Mostramos los datos ingresados			
			$resultado = $conexion->query('SELECT * FROM datos');
			
			while (($fila = $resultado->fetch_assoc())){
				echo "<tr>";
				echo "<td>" . $fila['telefono'] . "</td>";
				echo "<td>" . $fila['nombre'] . "</td>";
				echo "<td>" . $fila['apellido'] . "</td>";
				echo "<td>" . $fila['fechanac'] . "</td>";
				echo "<td><a href='datos.php?mod=" . $fila['telefono'] . "'>M</a></td>";
				echo "<td><a href='datos.php?del=" . $fila['telefono'] . "'>X</a></td>";
				echo "</tr>";
			}
		?>
		</table>
		
</body>
</html>