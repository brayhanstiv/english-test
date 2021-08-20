<?php 

if ($_POST) {
	
	$contsi=0;
	$contno=0;

	$respuesta = array('pregunta1' => $_POST['firstquestion'] ,'pregunta2' => $_POST['secondquestion'],'pregunta3' => $_POST['thirdquestion'],'pregunta4' => $_POST['fourquestion'],'pregunta5' => $_POST['quintaquestion'],'pregunta6' => $_POST['sextaquestion'],'pregunta7' => $_POST['septimaquestion'],'pregunta8' => $_POST['ocatavaquestion']);

	foreach ($respuesta as $valor) {
		if ($valor == "si") {
			$contsi++;
		}elseif ($valor == "no") {
			$contno++;
		}
	}

	$cali = (5/8)*$contsi;

	if ($cali >= 3.0) {
		echo "<script> window.location.href='../modulo2.html';</script>";
	}else{
		echo "<script>alert('Your score has not been enough to move to module 2');</script>";
		echo "<script> window.location.href='../index.html';</script>";
	}


}

 ?>