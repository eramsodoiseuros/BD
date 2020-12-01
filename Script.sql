-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`ginásio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ginásio` (
  `id_ginásio` INT NOT NULL,
  `nome_ginásio` VARCHAR(45) NULL,
  PRIMARY KEY (`id_ginásio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tipo_de_inscrição`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipo_de_inscrição` (
  `id_tipo` INT NOT NULL,
  `nome_tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id_tipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`membro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`membro` (
  `id_membro` INT NOT NULL,
  `nome_membro` VARCHAR(45) NULL,
  `ginásio_id_ginásio` INT NOT NULL,
  `peso_membro` DECIMAL NULL,
  `altura_membro` DECIMAL NULL,
  `localidade_membro` VARCHAR(45) NULL,
  `data_nascimento_membro` INT NULL,
  `tipo_de_inscrição_id_tipo` INT NOT NULL,
  PRIMARY KEY (`id_membro`),
  INDEX `fk_membro_ginásio1_idx` (`ginásio_id_ginásio` ASC) VISIBLE,
  CONSTRAINT `fk_membro_tipo de inscrição`
    FOREIGN KEY (`tipo_de_inscrição_id_tipo`)
    REFERENCES `mydb`.`tipo_de_inscrição` (`id_tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_membro_ginásio1`
    FOREIGN KEY (`ginásio_id_ginásio`)
    REFERENCES `mydb`.`ginásio` (`id_ginásio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pt` (
  `id_pt` INT NOT NULL,
  `nome_pt` VARCHAR(45) NULL,
  `ginásio_id_ginásio` INT NOT NULL,
  PRIMARY KEY (`id_pt`),
  INDEX `fk_pt_ginásio1_idx` (`ginásio_id_ginásio` ASC) VISIBLE,
  CONSTRAINT `fk_pt_ginásio1`
    FOREIGN KEY (`ginásio_id_ginásio`)
    REFERENCES `mydb`.`ginásio` (`id_ginásio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`aulas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`aulas` (
  `id_aulas` INT NOT NULL,
  `nome_aulas` VARCHAR(45) NULL,
  `pt_id_pt` INT NOT NULL,
  `ginasio_id_ginasio` INT NOT NULL,
  `membro_id_membro` INT NOT NULL,
  `data_aulas` DATE NOT NULL,
  PRIMARY KEY (`id_aulas`),
  INDEX `fk_aulas_membro1_idx` (`membro_id_membro` ASC) VISIBLE,
  INDEX `fk_aulas_pt1_idx` (`pt_id_pt` ASC) VISIBLE,
  CONSTRAINT `fk_aulas_pt1`
    FOREIGN KEY (`pt_id_pt`)
    REFERENCES `mydb`.`pt` (`id_pt`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aulas_membro1`
    FOREIGN KEY (`membro_id_membro`)
    REFERENCES `mydb`.`membro` (`id_membro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`staff` (
  `id_staff` INT NOT NULL,
  `nome_staff` VARCHAR(45) NULL,
  `ginásio_id_ginásio` INT NOT NULL,
  PRIMARY KEY (`id_staff`),
  INDEX `fk_staff_ginásio1_idx` (`ginásio_id_ginásio` ASC) VISIBLE,
  CONSTRAINT `fk_staff_ginásio1`
    FOREIGN KEY (`ginásio_id_ginásio`)
    REFERENCES `mydb`.`ginásio` (`id_ginásio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`nutricionista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`nutricionista` (
  `id_nutricionista` INT NOT NULL,
  `nome_nutricionista` VARCHAR(45) NULL,
  `ginásio_id_ginásio` INT NOT NULL,
  PRIMARY KEY (`id_nutricionista`),
  INDEX `fk_nutricionista_ginásio1_idx` (`ginásio_id_ginásio` ASC) VISIBLE,
  CONSTRAINT `fk_nutricionista_ginásio1`
    FOREIGN KEY (`ginásio_id_ginásio`)
    REFERENCES `mydb`.`ginásio` (`id_ginásio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`consulta` (
  `id_consulta` INT NOT NULL,
  `tipo_consulta` VARCHAR(45) NULL,
  `data_consulta` DATE NOT NULL,
  `nutricionista_id_nutricionista` INT NOT NULL,
  `membro_id_membro` INT NOT NULL,
  PRIMARY KEY (`id_consulta`),
  INDEX `fk_consulta_nutricionista1_idx` (`nutricionista_id_nutricionista` ASC) VISIBLE,
  CONSTRAINT `fk_consulta_membro1`
    FOREIGN KEY (`membro_id_membro`)
    REFERENCES `mydb`.`membro` (`id_membro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_consulta_nutricionista1`
    FOREIGN KEY (`nutricionista_id_nutricionista`)
    REFERENCES `mydb`.`nutricionista` (`id_nutricionista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
