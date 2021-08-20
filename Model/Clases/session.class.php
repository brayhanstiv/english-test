<?php 
/**
* 
*/
	class Session
	{

		function __construct(){
		}

		public function init()
		{
			@session_start();
		}

		public function set($name, $valor)
		{
			$_SESSION[$name] = $valor;
		}

		public function destroy()
		{
			session_unset();
			session_destroy();
		}
	}
 ?>