-- MySQL Script generated by MySQL Workbench
-- Mon Apr 17 21:53:13 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`contact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`contact` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` VARCHAR(60) NOT NULL,
  `LAST_NAME` VARCHAR(45) NOT NULL,
  `BIRTH_DATE` DATE NOT NULL,
  `VERSION` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`hobby`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`hobby` (
  `HOBBY_ID` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`HOBBY_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`contact_hobby_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`contact_hobby_detail` (
  `HOBBY_ID` VARCHAR(20) NOT NULL,
  `CONTACT_ID` INT(11) NOT NULL,
  PRIMARY KEY (`HOBBY_ID`, `CONTACT_ID`),
  INDEX `FK_CONTACT_HOBBY_DETAIL_1_idx` (`CONTACT_ID` ASC),
  CONSTRAINT `FK_CONTACT_HOBBY_DETAIL_2`
    FOREIGN KEY (`HOBBY_ID`)
    REFERENCES `mydb`.`hobby` (`HOBBY_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CONTACT_HOBBY_DETAIL_1`
    FOREIGN KEY (`CONTACT_ID`)
    REFERENCES `mydb`.`contact` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`contact_tel_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`contact_tel_detail` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `CONTACT_ID` INT(11) NOT NULL,
  `TEL_TYPE` VARCHAR(20) NOT NULL DEFAULT 'HOME',
  `TEL_NUMBER` VARCHAR(20) NOT NULL DEFAULT 'WITHOUT TEL NUMBER',
  `VERSION` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`, `CONTACT_ID`),
  INDEX `ID_idx` (`CONTACT_ID` ASC),
  CONSTRAINT `FK_CONTACT_TEL_DETAIL`
    FOREIGN KEY (`CONTACT_ID`)
    REFERENCES `mydb`.`contact` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`CONTACT_AUDIT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CONTACT_AUDIT` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` VARCHAR(45) NOT NULL,
  `LAST_NAME` VARCHAR(45) NOT NULL,
  `Birth_date` DATE NOT NULL,
  `Created_BY` VARCHAR(45) NULL,
  `CREATED_DATE` TIMESTAMP NULL,
  `LAST_MODIFIED_BY` VARCHAR(45) NULL,
  `LAST_MODIFIED_DATE` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;