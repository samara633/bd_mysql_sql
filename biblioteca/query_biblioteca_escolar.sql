-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bibliotecaescolar
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bibliotecaescolar
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bibliotecaescolar` DEFAULT CHARACTER SET utf8 ;
USE `bibliotecaescolar` ;

-- -----------------------------------------------------
-- Table `bibliotecaescolar`.`Autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliotecaescolar`.`Autores` (
  `idAutores` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `nacionalidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAutores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliotecaescolar`.`Libros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliotecaescolar`.`Libros` (
  `idLibros` INT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `autor` VARCHAR(45) NOT NULL,
  `año_publicacion` DATETIME NOT NULL,
  `genero` VARCHAR(45) NOT NULL,
  `Autores_idAutores` INT NOT NULL,
  PRIMARY KEY (`idLibros`, `Autores_idAutores`),
  INDEX `fk_Libros_Autores1_idx` (`Autores_idAutores` ASC) VISIBLE,
  CONSTRAINT `fk_Libros_Autores1`
    FOREIGN KEY (`Autores_idAutores`)
    REFERENCES `bibliotecaescolar`.`Autores` (`idAutores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliotecaescolar`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliotecaescolar`.`usuarios` (
  `idusuarios` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `numero_telefono` INT(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idusuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bibliotecaescolar`.`Prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bibliotecaescolar`.`Prestamos` (
  `idPrestamos` INT NOT NULL,
  `fecha_prestamo` VARCHAR(45) NOT NULL,
  `fecha_devolucion` VARCHAR(45) NOT NULL,
  `Libros_idLibros` INT NOT NULL,
  `usuarios_idusuarios` INT NOT NULL,
  PRIMARY KEY (`idPrestamos`, `Libros_idLibros`, `usuarios_idusuarios`),
  INDEX `fk_Prestamos_Libros_idx` (`Libros_idLibros` ASC) VISIBLE,
  INDEX `fk_Prestamos_usuarios1_idx` (`usuarios_idusuarios` ASC) VISIBLE,
  CONSTRAINT `fk_Prestamos_Libros`
    FOREIGN KEY (`Libros_idLibros`)
    REFERENCES `bibliotecaescolar`.`Libros` (`idLibros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prestamos_usuarios1`
    FOREIGN KEY (`usuarios_idusuarios`)
    REFERENCES `bibliotecaescolar`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
