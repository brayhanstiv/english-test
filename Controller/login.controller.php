<?php 
	
	require_once '../Model/Clases/usuario.class.php';

	if (isset($_POST['btn_login'])) {
		//Capturamos las variables pasadas por el formulario del index por el metodo post
		$username = $_POST['username'];
		$pass = $_POST['pass'];
		$tipousu = $_POST['tipousu'];
		$usuario = true;
		//Acá validamos el usuario
		//$usuario = usuario::loginUser($username, $pass);

		if ($usuario==true) {
			switch ($tipousu) {
				case 'STD':
					header('Location: ../View/modulo_1/nivel_1.html');
					/*header('Location: ../View/modulo_2/nivel_2.html');
					header('Location: ../View/modulo_3/nivel_3.html');
					header('Location: ../View/modulo_4/nivel_4.html');*/
					break;
				case 'ADM':
					header('Location: ../View/panelADM.html');
					break;
				case 'HOS':
					header('Location: ../View/menudocentes.html');
					break;
				default:
					header('Location: ../View/index.html');
					break;
			}
		} else {
			echo "<script>alert('[Error!!! incorrect data]');</script>";
			echo "<script>window.location.replace('../View/index.html');</script>";
		}
	} else {
		print "No tienes permiso a este archivo";
	}
 ?>