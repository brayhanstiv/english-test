<?php 

if ($_POST) {
	include 'conexion.php';
$documento = $_POST[''];
$primerNombre = $_POST[''];
$segundoNombre = $_POST[''];
$primerApellido = $_POST[''];
$segundoApellido = $_POST[''];
$correo = $_POST[''];
$telefono = $_POST[''];
$username = $_POST[''];
$pass = $_POST[''];

$sqlinsert ="INSERT INTO JefeSalon ('idJefeSalon','JefeSalon_primerNombre','JefeSalon_segundoNombre','JefeSalon_primerApellido','JefeSalon_segundoApellido','JefeSalon_correo','JefeSalon_telefono','JefeSalon_usuario','JefeSalon_contrasenia') VALUES ('$documento','$primerNombre','$segundoNombre','$primerApellido','$segundoApellido','$correo','$telefono','$username','$pass')";
$queryConsulta = "SELECT * FROM JefeSalon WHERE JefeSalon_usuario='$username' AND JefeSalon_contrasenia='$pass'";
$resultqueryConsulta= mysqli_query($con,$queryConsulta);

if ($fila = mysqli_fetch_array($resultqueryConsulta)) {
	echo "<script>alert('This user already exist, try with another one.');</script>";
}else{

	$resultinsert = mysqli_query($con,$sqlinsert);
	if ($resultinsert) {
		echo "<script>alert('Successful registration.');</script>";
		echo "<script> window.location.href='../registroJS.html';</script>";

	}


}
}


 ?>