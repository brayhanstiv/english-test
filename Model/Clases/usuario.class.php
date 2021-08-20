<?php 
	/**
	* 
	*/
	//Importamos las librerias necesarias
	require_once 'conexion.class.php';
	require_once 'session.class.php';

	class usuario
	{
		private $username;
		private $password;
		private $conexion;
		private $session;


		private function __construct()
		{
			$this->conexion = new conexion();
			$this->session = new Session();
		}

		//Esto es un patrón de diseño
		public static function singleton_usuario(){
 
	        if (!isset(self::$instancia)) {
	 
	            $miclase = __CLASS__;
	            self::$instancia = new $miclase;
	 
	        }
	        return self::$instancia;
    	}

		//Acá se realiza la consulta a la base de datos
		public function loginUser($email, $clave){
    		try {

    			$query = $this->conexion->conPrepare("");
    			$query->bindParam(1, $email);
    			$query->bindParam(2, $clave);
    			$query->execute();
    			$this->conexion = NULL;

    			//Si existe el usuario
    			if($query->rowCount() == 1){
    				if ($reg = $query->fetch()) {
    					$this->Objsession->init();
						$this->Objsession->set("usernameS", true);
    				}
				 return true;
				 }
    		} catch (PDOException $e) {
    			print "Error!: " . $e->getMessage();
    		}
    	}

		public function __clone()
    	{
    		trigger_error('La clonación de este objeto no está permitida', E_USER_ERROR);
    	}
	}
 ?>