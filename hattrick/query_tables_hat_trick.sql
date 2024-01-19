-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bd_proyecto_hat_trick
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_proyecto_hat_trick
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_proyecto_hat_trick` DEFAULT CHARACTER SET utf8 ;
USE `bd_proyecto_hat_trick` ;

-- -----------------------------------------------------
-- Table `bd_proyecto_hat_trick`.`metodos_pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_proyecto_hat_trick`.`metodos_pagos` (
  `id_metodo_pago` INT NOT NULL,
  `efectivo` VARCHAR(45) NOT NULL,
  `pse` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_metodo_pago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_proyecto_hat_trick`.`carrito_compras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_proyecto_hat_trick`.`carrito_compras` (
  `idcarrito_compras` INT NOT NULL,
  `total_pagar` DECIMAL(10) NOT NULL,
  `cantidad` INT NOT NULL,
  `metodos_pagos_id_metodo_pago` INT NOT NULL,
  PRIMARY KEY (`idcarrito_compras`, `metodos_pagos_id_metodo_pago`),
  INDEX `fk_carrito_compras_metodos_pagos1_idx` (`metodos_pagos_id_metodo_pago` ASC) VISIBLE,
  CONSTRAINT `fk_carrito_compras_metodos_pagos1`
    FOREIGN KEY (`metodos_pagos_id_metodo_pago`)
    REFERENCES `bd_proyecto_hat_trick`.`metodos_pagos` (`id_metodo_pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_proyecto_hat_trick`.`tipos_suelas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_proyecto_hat_trick`.`tipos_suelas` (
  `idtipo_suela` INT NOT NULL,
  `tipo_goma` VARCHAR(45) NOT NULL,
  `tipo_colores` VARCHAR(45) NOT NULL,
  `tipo_negra` VARCHAR(45) NOT NULL,
  `tipo_torretin` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipo_suela`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_proyecto_hat_trick`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_proyecto_hat_trick`.`empresa` (
  `id_empresa` INT NOT NULL,
  `nombre_empresa` VARCHAR(45) NOT NULL,
  `vision` VARCHAR(45) NOT NULL,
  `mision` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(10) NOT NULL,
  `nit_empresa` INT(20) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `direccion_empresa` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_empresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_proyecto_hat_trick`.`vendedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_proyecto_hat_trick`.`vendedores` (
  `id_vendedor` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `empresa_idempresa` INT NOT NULL,
  PRIMARY KEY (`id_vendedor`, `empresa_idempresa`),
  INDEX `fk_vendedor_empresa1_idx` (`empresa_idempresa` ASC) VISIBLE,
  CONSTRAINT `fk_vendedor_empresa1`
    FOREIGN KEY (`empresa_idempresa`)
    REFERENCES `bd_proyecto_hat_trick`.`empresa` (`id_empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_proyecto_hat_trick`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_proyecto_hat_trick`.`usuarios` (
  `id_usuario` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(10) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `vendedor_idvendedor` INT NOT NULL,
  PRIMARY KEY (`id_usuario`, `vendedor_idvendedor`),
  INDEX `fk_usuarios_vendedor1_idx` (`vendedor_idvendedor` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_vendedor1`
    FOREIGN KEY (`vendedor_idvendedor`)
    REFERENCES `bd_proyecto_hat_trick`.`vendedores` (`id_vendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_proyecto_hat_trick`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_proyecto_hat_trick`.`productos` (
  `id_producto` INT NOT NULL,
  `talla` VARCHAR(2) NOT NULL,
  `precio` DECIMAL(10) NOT NULL,
  `nombre_producto` VARCHAR(45) NOT NULL,
  `carrito_compras_idcarrito_compras` INT NOT NULL,
  `producto_disponible` INT NOT NULL,
  `imagen` VARCHAR(100) NULL,
  `tipo_suelas_idtipo_suela` INT NOT NULL,
  `usuarios_id_usuario` INT NOT NULL,
  `usuarios_vendedor_idvendedor` INT NOT NULL,
  `vendedores_id_vendedor` INT NOT NULL,
  `vendedores_empresa_idempresa` INT NOT NULL,
  `descripcion_producto` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_producto`, `carrito_compras_idcarrito_compras`, `tipo_suelas_idtipo_suela`, `usuarios_id_usuario`, `usuarios_vendedor_idvendedor`, `vendedores_id_vendedor`, `vendedores_empresa_idempresa`),
  INDEX `fk_producto_carrito_compras1_idx` (`carrito_compras_idcarrito_compras` ASC) VISIBLE,
  INDEX `fk_producto_tipo_suelas1_idx` (`tipo_suelas_idtipo_suela` ASC) VISIBLE,
  INDEX `fk_producto_usuarios1_idx` (`usuarios_id_usuario` ASC, `usuarios_vendedor_idvendedor` ASC) VISIBLE,
  INDEX `fk_producto_vendedores1_idx` (`vendedores_id_vendedor` ASC, `vendedores_empresa_idempresa` ASC) VISIBLE,
  CONSTRAINT `fk_producto_carrito_compras1`
    FOREIGN KEY (`carrito_compras_idcarrito_compras`)
    REFERENCES `bd_proyecto_hat_trick`.`carrito_compras` (`idcarrito_compras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_tipo_suelas1`
    FOREIGN KEY (`tipo_suelas_idtipo_suela`)
    REFERENCES `bd_proyecto_hat_trick`.`tipos_suelas` (`idtipo_suela`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_usuarios1`
    FOREIGN KEY (`usuarios_id_usuario` , `usuarios_vendedor_idvendedor`)
    REFERENCES `bd_proyecto_hat_trick`.`usuarios` (`id_usuario` , `vendedor_idvendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_vendedores1`
    FOREIGN KEY (`vendedores_id_vendedor` , `vendedores_empresa_idempresa`)
    REFERENCES `bd_proyecto_hat_trick`.`vendedores` (`id_vendedor` , `empresa_idempresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_proyecto_hat_trick`.`facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_proyecto_hat_trick`.`facturas` (
  `id_factura` INT NOT NULL,
  `empresa_idempresa` INT NOT NULL,
  `carrito_compras_idcarrito_compras` INT NOT NULL,
  `carrito_compras_metodos_pagos_id_metodo_pago` INT NOT NULL,
  PRIMARY KEY (`empresa_idempresa`, `carrito_compras_idcarrito_compras`, `carrito_compras_metodos_pagos_id_metodo_pago`),
  INDEX `fk_facturas_carrito_compras1_idx` (`carrito_compras_idcarrito_compras` ASC, `carrito_compras_metodos_pagos_id_metodo_pago` ASC) VISIBLE,
  CONSTRAINT `fk_facturas_empresa1`
    FOREIGN KEY (`empresa_idempresa`)
    REFERENCES `bd_proyecto_hat_trick`.`empresa` (`id_empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_facturas_carrito_compras1`
    FOREIGN KEY (`carrito_compras_idcarrito_compras` , `carrito_compras_metodos_pagos_id_metodo_pago`)
    REFERENCES `bd_proyecto_hat_trick`.`carrito_compras` (`idcarrito_compras` , `metodos_pagos_id_metodo_pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
