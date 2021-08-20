<?php 
	require_once 'Clases/session.class.php';

	$Objsession = new Session();
	$Objsession->init();

	$user = isset($_SESSION['usernameS']) ? $_SESSION['usernameS'] : null ;

	if ($user == '') {
		header("Location: ../index.html");
	}
 ?>