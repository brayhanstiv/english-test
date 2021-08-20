<?php
    $host='localhost';
    $port='5432';
    $user='root';
    $pass='';
    $dbname='ingles';

    $con = mysqli_connect("$host","$user","","$dbname");

    if(!$con){
      die("No hay conexion".mysqli_last_error());
    }else{
    	
    }

?>
