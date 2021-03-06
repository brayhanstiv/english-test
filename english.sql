-- MySQL Script generated by MySQL Workbench
-- Mon Mar  5 09:30:20 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Ingles
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ingles
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ingles` DEFAULT CHARACTER SET utf8 ;
USE `Ingles` ;

-- -----------------------------------------------------
-- Table `Ingles`.`Sede`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingles`.`Sede` (
  `idSede` INT NOT NULL,
  `Sede_nombre` VARCHAR(45) NOT NULL,
  `Sede_estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSede`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ingles`.`Facultad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingles`.`Facultad` (
  `idFacultad` INT NOT NULL,
  `Facultad_nombre` VARCHAR(45) NOT NULL,
  `Facultad_estado` VARCHAR(45) NOT NULL,
  `Sede_idSede` INT NOT NULL,
  PRIMARY KEY (`idFacultad`),
  INDEX `fk_Facultad_Sede1_idx` (`Sede_idSede` ASC),
  CONSTRAINT `fk_Facultad_Sede1`
    FOREIGN KEY (`Sede_idSede`)
    REFERENCES `Ingles`.`Sede` (`idSede`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ingles`.`Programa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingles`.`Programa` (
  `idPrograma` INT NOT NULL,
  `Programa_nombre` VARCHAR(45) NOT NULL,
  `Programa_estado` VARCHAR(45) NOT NULL,
  `Facultad_idFacultad` INT NOT NULL,
  PRIMARY KEY (`idPrograma`),
  INDEX `fk_Programa_Facultad1_idx` (`Facultad_idFacultad` ASC),
  CONSTRAINT `fk_Programa_Facultad1`
    FOREIGN KEY (`Facultad_idFacultad`)
    REFERENCES `Ingles`.`Facultad` (`idFacultad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ingles`.`Estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingles`.`Estudiante` (
  `idEstudiante` INT NOT NULL,
  `Estudiante_primerNombre` VARCHAR(45) NOT NULL,
  `Estudiante_segundoNombre` VARCHAR(45) NULL,
  `Estudiante_primerapellido` VARCHAR(45) NOT NULL,
  `Estudiante_segundoApellido` VARCHAR(45) NOT NULL,
  `Estudiante_correo` VARCHAR(45) NOT NULL,
  `Estudiante_telefono` VARCHAR(45) NOT NULL,
  `Estudiante_usuario` VARCHAR(45) NOT NULL,
  `Estudiante_contrase?a` VARCHAR(45) NOT NULL,
  `Programa_idPrograma` INT NOT NULL,
  PRIMARY KEY (`idEstudiante`),
  INDEX `fk_Estudiante_Programa1_idx` (`Programa_idPrograma` ASC),
  CONSTRAINT `fk_Estudiante_Programa1`
    FOREIGN KEY (`Programa_idPrograma`)
    REFERENCES `Ingles`.`Programa` (`idPrograma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ingles`.`Tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingles`.`Tipo` (
  `idTipo` INT NOT NULL,
  `Tipo_nombre` VARCHAR(45) NOT NULL,
  `Tipo_estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ingles`.`Modulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingles`.`Modulo` (
  `idModulo` INT NOT NULL,
  `Modulo_nombre` VARCHAR(45) NOT NULL,
  `Modulo_estado` VARCHAR(45) NOT NULL,
  `Modulo_cantidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idModulo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ingles`.`texto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingles`.`texto` (
  `idtexto` INT NOT NULL,
  `texto_descripcion` VARCHAR(45) NOT NULL,
  `texto_estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtexto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ingles`.`Pregunta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingles`.`Pregunta` (
  `idPregunta` INT NOT NULL,
  `Pregunta_imagen` BLOB NULL,
  `Pregunta_descripcion` VARCHAR(45) NOT NULL,
  `Pregunta_estado` VARCHAR(45) NOT NULL,
  `Tipo_idTipo` INT NOT NULL,
  `Modulo_idModulo` INT NOT NULL,
  `texto_idtexto` INT NOT NULL,
  PRIMARY KEY (`idPregunta`),
  INDEX `fk_Pregunta_Tipo_idx` (`Tipo_idTipo` ASC),
  INDEX `fk_Pregunta_Modulo1_idx` (`Modulo_idModulo` ASC),
  INDEX `fk_Pregunta_texto1_idx` (`texto_idtexto` ASC),
  CONSTRAINT `fk_Pregunta_Tipo`
    FOREIGN KEY (`Tipo_idTipo`)
    REFERENCES `Ingles`.`Tipo` (`idTipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pregunta_Modulo1`
    FOREIGN KEY (`Modulo_idModulo`)
    REFERENCES `Ingles`.`Modulo` (`idModulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pregunta_texto1`
    FOREIGN KEY (`texto_idtexto`)
    REFERENCES `Ingles`.`texto` (`idtexto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ingles`.`Respuesta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingles`.`Respuesta` (
  `idRespuesta` INT NOT NULL,
  `Respuesta_descripcion` VARCHAR(45) NOT NULL,
  `Respuesta_validez` VARCHAR(45) NOT NULL,
  `Pregunta_idPregunta` INT NOT NULL,
  PRIMARY KEY (`idRespuesta`),
  INDEX `fk_Respuesta_Pregunta1_idx` (`Pregunta_idPregunta` ASC),
  CONSTRAINT `fk_Respuesta_Pregunta1`
    FOREIGN KEY (`Pregunta_idPregunta`)
    REFERENCES `Ingles`.`Pregunta` (`idPregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ingles`.`Calificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingles`.`Calificacion` (
  `idCalificacion` INT NOT NULL,
  `Respuesta_idRespuesta` INT NOT NULL,
  `Estudiante_idEstudiante` INT NOT NULL,
  `Calificacion_estado` VARCHAR(45) NOT NULL,
  `Calificacion_` VARCHAR(45) NULL,
  PRIMARY KEY (`idCalificacion`),
  INDEX `fk_Calificacion_Respuesta1_idx` (`Respuesta_idRespuesta` ASC),
  INDEX `fk_Calificacion_Estudiante1_idx` (`Estudiante_idEstudiante` ASC),
  CONSTRAINT `fk_Calificacion_Respuesta1`
    FOREIGN KEY (`Respuesta_idRespuesta`)
    REFERENCES `Ingles`.`Respuesta` (`idRespuesta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Calificacion_Estudiante1`
    FOREIGN KEY (`Estudiante_idEstudiante`)
    REFERENCES `Ingles`.`Estudiante` (`idEstudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ingles`.`Calif_Modulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingles`.`Calif_Modulo` (
  `idCalif_Modulo` INT NOT NULL,
  `Modulo_idModulo` INT NOT NULL,
  `Calif_Modulo_tiempo` VARCHAR(45) NOT NULL,
  `Calif_Modulo_nota` VARCHAR(45) NOT NULL,
  `Estudiante_idEstudiante` INT NOT NULL,
  `Calif_Modulo_cantidad_respues_buenas` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCalif_Modulo`),
  INDEX `fk_Calif_Modulo_Modulo1_idx` (`Modulo_idModulo` ASC),
  INDEX `fk_Calif_Modulo_Estudiante1_idx` (`Estudiante_idEstudiante` ASC),
  CONSTRAINT `fk_Calif_Modulo_Modulo1`
    FOREIGN KEY (`Modulo_idModulo`)
    REFERENCES `Ingles`.`Modulo` (`idModulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Calif_Modulo_Estudiante1`
    FOREIGN KEY (`Estudiante_idEstudiante`)
    REFERENCES `Ingles`.`Estudiante` (`idEstudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ingles`.`Salon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingles`.`Salon` (
  `idSalon` INT NOT NULL,
  `Salon_number` VARCHAR(45) NOT NULL,
  `Salon_estado` VARCHAR(45) NOT NULL,
  `Facultad_idFacultad` INT NOT NULL,
  PRIMARY KEY (`idSalon`),
  INDEX `fk_Salon_Facultad1_idx` (`Facultad_idFacultad` ASC),
  CONSTRAINT `fk_Salon_Facultad1`
    FOREIGN KEY (`Facultad_idFacultad`)
    REFERENCES `Ingles`.`Facultad` (`idFacultad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ingles`.`Fechas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingles`.`Fechas` (
  `idFechas` INT NOT NULL,
  `Fechas_dia_mes_a?o` VARCHAR(45) NOT NULL,
  `Fechas_estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFechas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ingles`.`horas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingles`.`horas` (
  `idhoras` INT NOT NULL,
  `horas_min_seg` VARCHAR(45) NOT NULL,
  `horas_estado` VARCHAR(45) NOT NULL,
  `Fechas_idFechas` INT NOT NULL,
  PRIMARY KEY (`idhoras`),
  INDEX `fk_horas_Fechas1_idx` (`Fechas_idFechas` ASC),
  CONSTRAINT `fk_horas_Fechas1`
    FOREIGN KEY (`Fechas_idFechas`)
    REFERENCES `Ingles`.`Fechas` (`idFechas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ingles`.`JefeSalon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingles`.`JefeSalon` (
  `idJefeSalon` INT NOT NULL,
  `JefeSalon_primerNombre` VARCHAR(45) NOT NULL,
  `JefeSalon_segundoNombre` VARCHAR(45) NOT NULL,
  `JefeSalon_primerApellido` VARCHAR(45) NOT NULL,
  `JefeSalon_segundoApellido` VARCHAR(45) NOT NULL,
  `JefeSalon_correo` VARCHAR(45) NOT NULL,
  `JefeSalon_telefono` VARCHAR(45) NOT NULL,
  `JefeSalon_usuario` VARCHAR(45) NOT NULL,
  `JefeSalon_contrase?a` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idJefeSalon`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ingles`.`Asignacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingles`.`Asignacion` (
  `idAsignacion` INT NOT NULL,
  `Salon_idSalon` INT NOT NULL,
  `horas_idhoras` INT NOT NULL,
  `Estudiante_idEstudiante` INT NOT NULL,
  `JefeSalon_idJefeSalon` INT NOT NULL,
  PRIMARY KEY (`idAsignacion`),
  INDEX `fk_Asignacion_Salon1_idx` (`Salon_idSalon` ASC),
  INDEX `fk_Asignacion_horas1_idx` (`horas_idhoras` ASC),
  INDEX `fk_Asignacion_Estudiante1_idx` (`Estudiante_idEstudiante` ASC),
  INDEX `fk_Asignacion_JefeSalon1_idx` (`JefeSalon_idJefeSalon` ASC),
  CONSTRAINT `fk_Asignacion_Salon1`
    FOREIGN KEY (`Salon_idSalon`)
    REFERENCES `Ingles`.`Salon` (`idSalon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Asignacion_horas1`
    FOREIGN KEY (`horas_idhoras`)
    REFERENCES `Ingles`.`horas` (`idhoras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Asignacion_Estudiante1`
    FOREIGN KEY (`Estudiante_idEstudiante`)
    REFERENCES `Ingles`.`Estudiante` (`idEstudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Asignacion_JefeSalon1`
    FOREIGN KEY (`JefeSalon_idJefeSalon`)
    REFERENCES `Ingles`.`JefeSalon` (`idJefeSalon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ingles`.`Marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingles`.`Marca` (
  `idMarca` INT NOT NULL,
  `Marca_nombre` VARCHAR(45) NOT NULL,
  `Marca_estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMarca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ingles`.`Referencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingles`.`Referencia` (
  `idReferencia` INT NOT NULL,
  `Referencia_nombre` VARCHAR(45) NOT NULL,
  `Referencia_estado` VARCHAR(45) NOT NULL,
  `Marca_idMarca` INT NOT NULL,
  PRIMARY KEY (`idReferencia`),
  INDEX `fk_Referencia_Marca1_idx` (`Marca_idMarca` ASC),
  CONSTRAINT `fk_Referencia_Marca1`
    FOREIGN KEY (`Marca_idMarca`)
    REFERENCES `Ingles`.`Marca` (`idMarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ingles`.`Computador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingles`.`Computador` (
  `ipComputador` INT NOT NULL,
  `Salon_idSalon` INT NOT NULL,
  `Referencia_idReferencia` INT NOT NULL,
  PRIMARY KEY (`ipComputador`),
  INDEX `fk_Computador_Salon1_idx` (`Salon_idSalon` ASC),
  INDEX `fk_Computador_Referencia1_idx` (`Referencia_idReferencia` ASC),
  CONSTRAINT `fk_Computador_Salon1`
    FOREIGN KEY (`Salon_idSalon`)
    REFERENCES `Ingles`.`Salon` (`idSalon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Computador_Referencia1`
    FOREIGN KEY (`Referencia_idReferencia`)
    REFERENCES `Ingles`.`Referencia` (`idReferencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ingles`.`Prueba`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingles`.`Prueba` (
  `idPrueba` INT NOT NULL,
  `Estudiante_idEstudiante` INT NOT NULL,
  `Salon_idSalon` INT NOT NULL,
  `horas_idhoras` INT NOT NULL,
  `JefeSalon_idJefeSalon` INT NOT NULL,
  `Computador_ipComputador` INT NOT NULL,
  PRIMARY KEY (`idPrueba`),
  INDEX `fk_Prueba_Estudiante1_idx` (`Estudiante_idEstudiante` ASC),
  INDEX `fk_Prueba_Salon1_idx` (`Salon_idSalon` ASC),
  INDEX `fk_Prueba_horas1_idx` (`horas_idhoras` ASC),
  INDEX `fk_Prueba_JefeSalon1_idx` (`JefeSalon_idJefeSalon` ASC),
  INDEX `fk_Prueba_Computador1_idx` (`Computador_ipComputador` ASC),
  CONSTRAINT `fk_Prueba_Estudiante1`
    FOREIGN KEY (`Estudiante_idEstudiante`)
    REFERENCES `Ingles`.`Estudiante` (`idEstudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prueba_Salon1`
    FOREIGN KEY (`Salon_idSalon`)
    REFERENCES `Ingles`.`Salon` (`idSalon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prueba_horas1`
    FOREIGN KEY (`horas_idhoras`)
    REFERENCES `Ingles`.`horas` (`idhoras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prueba_JefeSalon1`
    FOREIGN KEY (`JefeSalon_idJefeSalon`)
    REFERENCES `Ingles`.`JefeSalon` (`idJefeSalon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prueba_Computador1`
    FOREIGN KEY (`Computador_ipComputador`)
    REFERENCES `Ingles`.`Computador` (`ipComputador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ingles`.`Adminitrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingles`.`Adminitrador` (
  `idAdminitrador` INT NOT NULL,
  `Adminitrador_primerNombre` VARCHAR(45) NOT NULL,
  `Adminitrador_segundoNombre` VARCHAR(45) NULL,
  `Adminitrador_primerApellido` VARCHAR(45) NOT NULL,
  `Adminitrador_segundoApellido` VARCHAR(45) NOT NULL,
  `Adminitrador_correo` VARCHAR(45) NOT NULL,
  `Adminitrador_telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAdminitrador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ingles`.`Tipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingles`.`Tipos` (
  `idTipos` INT NOT NULL,
  `Tipos_nombre` VARCHAR(45) NOT NULL,
  `Tipos_estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ingles`.`Accion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingles`.`Accion` (
  `idAccion` INT NOT NULL,
  `Adminitrador_idAdminitrador` INT NOT NULL,
  `Pregunta_idPregunta` INT NOT NULL,
  `Accion_fecha` VARCHAR(45) NOT NULL,
  `Accion_hora` VARCHAR(45) NOT NULL,
  `Tipos_idTipos` INT NOT NULL,
  PRIMARY KEY (`idAccion`),
  INDEX `fk_Accion_Adminitrador1_idx` (`Adminitrador_idAdminitrador` ASC),
  INDEX `fk_Accion_Pregunta1_idx` (`Pregunta_idPregunta` ASC),
  INDEX `fk_Accion_Tipos1_idx` (`Tipos_idTipos` ASC),
  CONSTRAINT `fk_Accion_Adminitrador1`
    FOREIGN KEY (`Adminitrador_idAdminitrador`)
    REFERENCES `Ingles`.`Adminitrador` (`idAdminitrador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Accion_Pregunta1`
    FOREIGN KEY (`Pregunta_idPregunta`)
    REFERENCES `Ingles`.`Pregunta` (`idPregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Accion_Tipos1`
    FOREIGN KEY (`Tipos_idTipos`)
    REFERENCES `Ingles`.`Tipos` (`idTipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ingles`.`Accion_Estudiantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ingles`.`Accion_Estudiantes` (
  `idAccion_Estudiantes` INT NOT NULL,
  `Accion_Estudiantes_fecha` VARCHAR(45) NOT NULL,
  `Accion_Estudiantes_hora` VARCHAR(45) NOT NULL,
  `Adminitrador_idAdminitrador` INT NOT NULL,
  `Tipos_idTipos` INT NOT NULL,
  `Estudiante_idEstudiante` INT NOT NULL,
  PRIMARY KEY (`idAccion_Estudiantes`),
  INDEX `fk_Accion_Estudiantes_Adminitrador1_idx` (`Adminitrador_idAdminitrador` ASC),
  INDEX `fk_Accion_Estudiantes_Tipos1_idx` (`Tipos_idTipos` ASC),
  INDEX `fk_Accion_Estudiantes_Estudiante1_idx` (`Estudiante_idEstudiante` ASC),
  CONSTRAINT `fk_Accion_Estudiantes_Adminitrador1`
    FOREIGN KEY (`Adminitrador_idAdminitrador`)
    REFERENCES `Ingles`.`Adminitrador` (`idAdminitrador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Accion_Estudiantes_Tipos1`
    FOREIGN KEY (`Tipos_idTipos`)
    REFERENCES `Ingles`.`Tipos` (`idTipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Accion_Estudiantes_Estudiante1`
    FOREIGN KEY (`Estudiante_idEstudiante`)
    REFERENCES `Ingles`.`Estudiante` (`idEstudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
