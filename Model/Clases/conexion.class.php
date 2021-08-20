<?php
	/**
	* Conexion a la base de datos MYDB
	* @package 
    * @author Equipo de Desarrollo
    * @copyright 2018
    * @version 1.0
    * @access private
	*/
	class conexion{

		//Estas son las variables de clase
		private $db= 'mysql';
		private $host = 'localhost';
	  	private $dbname = '';
	  	private $usuario = '';
	  	private $contrasena = ''; 
	  	private static $instancia;
	  	private $consulta;
	  	private $objCon;

	  	//Inicializamos en el constructor creando un objeto PDO
		private function __construct(){
			try {

				//sobre escribo el metodo constructos PDO
				$this->objCon = new PDO($this->db.':host='.$this->host.';dbname='.$this->dbname, $this->usuario, $this->contrasena);
				$this->objCon->exec("SET CHARACTER SET utf-8");

			} catch (PDOException $e){
				echo 'Ha surgido un error y no se puede conectar a la base de datos. Detalle: ' . $e->getMessage();
				 die();
        		 exit;
			}
		}

		//Preparamos una consulta preparada para cualquier consulta Mysql
		public function conPrepare($sql)
		{
			try {
				$this->consulta = $sql;
			 	return $this->objCon->prepare($this->consulta);
			} catch (Exception $e) {
				echo 'Ha surgido un error ' . $e->getMessage();
				 die();
        		 exit;
			}
		}

		//Esto es un patron de Diseño SINGLETON
		public static function singleton_conexion()
		{

			if (!isset(self::$instancia)) {
				$miclase = __ClASS__;
				self::$instancia = new $miclase;
			}
			return self::$instancia;
		}
	}
?>