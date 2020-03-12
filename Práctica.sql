-- MySQL Workbench Synchronization
-- Generated: 2020-03-12 12:16
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Carlos Roth

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `Cul d'Ampolla DB` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `Cul d'Ampolla DB`.`Supplier` (
  `idSupplier` INT(11) NOT NULL,
  `supplierName` VARCHAR(45) NOT NULL,
  `supplierAddress` VARCHAR(100) NOT NULL,
  `supplierPhoneNumber` VARCHAR(45) NOT NULL,
  `supplierFax` VARCHAR(45) NOT NULL,
  `supplierNIF` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSupplier`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Cul d'Ampolla DB`.`Glass` (
  `idGlass` INT(11) NOT NULL,
  `glassBrand` VARCHAR(45) NOT NULL,
  `lenseRefraction1` VARCHAR(45) NOT NULL,
  `lenseRefraction2` VARCHAR(45) NOT NULL,
  `glassFrame` VARCHAR(45) NOT NULL,
  `lenseColor1` VARCHAR(45) NOT NULL,
  `lenseColor2` VARCHAR(45) NOT NULL,
  `glassPrice` VARCHAR(45) NOT NULL,
  `Supplier_idSupplier` INT(11) NOT NULL,
  PRIMARY KEY (`idGlass`),
  INDEX `fk_Glass_Supplier1_idx` (`Supplier_idSupplier` ASC) VISIBLE,
  CONSTRAINT `fk_Glass_Supplier1`
    FOREIGN KEY (`Supplier_idSupplier`)
    REFERENCES `Cul d'Ampolla DB`.`Supplier` (`idSupplier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Cul d'Ampolla DB`.`Client` (
  `idClient` INT(11) NOT NULL,
  `clientName` VARCHAR(45) NOT NULL,
  `clientAddress` VARCHAR(45) NOT NULL,
  `clientPhoneNumber` VARCHAR(45) NOT NULL,
  `clientEmail` VARCHAR(45) NOT NULL,
  `clientRegistrationDate` VARCHAR(45) NOT NULL,
  `Sale_idSale` INT(11) NOT NULL,
  PRIMARY KEY (`idClient`),
  INDEX `fk_Client_Sale1_idx` (`Sale_idSale` ASC) VISIBLE,
  CONSTRAINT `fk_Client_Sale1`
    FOREIGN KEY (`Sale_idSale`)
    REFERENCES `Cul d'Ampolla DB`.`Sale` (`idSale`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Cul d'Ampolla DB`.`Employee` (
  `idEmployee` INT(11) NOT NULL,
  PRIMARY KEY (`idEmployee`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Cul d'Ampolla DB`.`Sale` (
  `idSale` INT(11) NOT NULL,
  `Employee_idEmployee` INT(11) NOT NULL,
  `Glass_idGlass` INT(11) NOT NULL,
  PRIMARY KEY (`idSale`),
  INDEX `fk_Sale_Employee1_idx` (`Employee_idEmployee` ASC) VISIBLE,
  INDEX `fk_Sale_Glass1_idx` (`Glass_idGlass` ASC) VISIBLE,
  CONSTRAINT `fk_Sale_Employee1`
    FOREIGN KEY (`Employee_idEmployee`)
    REFERENCES `Cul d'Ampolla DB`.`Employee` (`idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sale_Glass1`
    FOREIGN KEY (`Glass_idGlass`)
    REFERENCES `Cul d'Ampolla DB`.`Glass` (`idGlass`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
