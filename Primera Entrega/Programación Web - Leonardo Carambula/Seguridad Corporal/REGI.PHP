<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seguridad Corporal</title>
</head>
<body>
<?php

if (isset ($_POST['nombres'])) {
  $nombres = $_POST['nombres'];
}

if (isset ($_POST['apellidos'])){
  $apellidos = $_POST['apellidos'];
}

if (isset ($_POST['correo'])){
  $correo = $_POST['correo'];
}

if (isset ($_POST['contraseñas'])) {
  $contraseñas = $_POST['contraseñas'];
  if ($nombres =="Santiago" && $apellidos == "Alvarez") {
  header ("Location: JEFE.html");
}
}
 $datos = " Nombre : $nombres
           Apellido: $apellidos
           Correo : $correo
           Contraseña : $contraseñas ";

           $archivo = fopen("$nombres.txt" , "w");
           $archivo = fopen("$apellidos.txt" , "w");
           $archivo = fopen("$correo.txt" , "w");
           $archivo = fopen("$contraseñas.txt" , "w");
           fwrite ($archivo,$datos);

           echo "Archivo.txt: $datos";

if (isset ($_POST['nombres'])) {
$nombre = $_POST['nombres'];
	echo "Gracias por Ingresar: " . $nombre . "<br>";
}

if(isset ($_POST['nombres'])){

if(empty($nombres)) {
  echo ("  Agregue el nombre");
}else {
if(strlen($nombres) > 15){
  echo ("  El nombre es muy largo");
}
}
}
if(isset ($_POST['apellidos'])){
if(empty($apellidos)){
  echo ("  Agregue el apellido");
}
}
if(isset ($_POST['correo'])){
  if(empty($correo)){
    echo ("  Agregue el correo:");
  }
  }
if(isset ($_POST['contraseñas'])){
if (empty ($contraseñas) ) {
  echo ("  Agregue su contraseña:");
}
}

?>
</body>
</html>