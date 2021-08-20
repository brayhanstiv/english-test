<?php 

include 'conexion.php';
if ($_POST) {
	$username = $_POST['username'];
	$pass = $_POST['pass'];
	$tipousu = $_POST['tipousu'];

	$_SESSION['usernameS'] = $username;

	if ($tipousu == "STD") {
		

		$sqllogin = "SELECT * FROM estudiante WHERE Estudiante_usuario='$username' AND Estudiante_contrasenia='$pass'";
		$resultsqllogin = mysqli_query($con,$sqllogin);

		if ($file=mysqli_fetch_array($resultsqllogin)) {

			echo "<script> window.location.href='../nivel_1.html';</script>";
			
		}else {
			echo "<script>alert('Incorrect data.');</script>";
			echo "<script> window.location.href='../index.html';</script>";

		}

	}elseif ($tipousu=="ADM") {

		$sqllogin = "SELECT * FROM administrador WHERE Administrador_usuario='$username' AND Administrador_contrasenia='$pass'";
		$resultsqllogin = mysqli_query($con,$sqllogin);
		
		if ($file=mysqli_fetch_array($resultsqllogin)) {

			echo "<script> window.location.href='../panelADM.html';</script>";
			
		}else {
			echo "<script>alert('Incorrect data.');</script>";
			echo "<script> window.location.href='../index.html';</script>";

		}
		
	}elseif ($tipousu=="HOS") {
		
		$sqllogin = "SELECT * FROM jefesalon WHERE JefeSalon_usuario='$username' AND JefeSalon_contrasenia='$pass'";
		$resultsqllogin = mysqli_query($con,$sqllogin);
		
		if ($file=mysqli_fetch_array($resultsqllogin)) {

			echo "<script> window.location.href='../menudocentes.html';</script>";
			
		}else {
			echo "<script>alert('Incorrect data.');</script>";
			echo "<script> window.location.href='../index.html';</script>";

		}
		
	}else {
		echo "<script>alert('Choose an user type.');</script>";
		echo "<script> window.location.href='../index.html';</script>";
	}



	

}


 ?>