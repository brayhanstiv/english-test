<?php 
	
	require_once 'seguridadCapa1.php';
	require_once '../Clases/session.class.php';

	$Objsession = new Session();
	$Objsession->init();
	$Objsession->destroy();
	
	header("Location: ../index.html");
 ?>