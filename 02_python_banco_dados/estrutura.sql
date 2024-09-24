-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dev_motors
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `dev_motors` ;

-- -----------------------------------------------------
-- Schema dev_motors
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dev_motors` DEFAULT CHARACTER SET utf8 ;
USE `dev_motors` ;

-- -----------------------------------------------------
-- Table `dev_motors`.`marcas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dev_motors`.`marcas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `cnpj` CHAR(18) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dev_motors`.`modelos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dev_motors`.`modelos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_marca` INT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_veiculos_marcas_idx` (`id_marca` ASC) VISIBLE,
  CONSTRAINT `fk_veiculos_marcas`
    FOREIGN KEY (`id_marca`)
    REFERENCES `dev_motors`.`marcas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dev_motors`.`versoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dev_motors`.`versoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_modelo` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `motor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_versoes_modelos1_idx` (`id_modelo` ASC) VISIBLE,
  CONSTRAINT `fk_versoes_modelos1`
    FOREIGN KEY (`id_modelo`)
    REFERENCES `dev_motors`.`modelos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dev_motors`.`cores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dev_motors`.`cores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dev_motors`.`proprietarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dev_motors`.`proprietarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `cpf_cnpj` CHAR(18) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `celular` VARCHAR(45) NOT NULL,
  `estado` CHAR(2) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `logradouro` VARCHAR(45) NOT NULL,
  `cep` CHAR(10) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dev_motors`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dev_motors`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `cpf_cnpj` CHAR(18) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `celular` VARCHAR(45) NOT NULL,
  `estado` CHAR(2) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `logradouro` VARCHAR(45) NOT NULL,
  `cep` CHAR(10) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dev_motors`.`vendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dev_motors`.`vendas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `clientes_id` INT NOT NULL,
  `valor` DOUBLE NOT NULL,
  `data` DATE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_vendas_clientes1_idx` (`clientes_id` ASC) VISIBLE,
  CONSTRAINT `fk_vendas_clientes1`
    FOREIGN KEY (`clientes_id`)
    REFERENCES `dev_motors`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dev_motors`.`veiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dev_motors`.`veiculos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_proprietario` INT NOT NULL,
  `id_versao` INT NOT NULL,
  `id_cor` INT NOT NULL,
  `id_venda` INT NULL,
  `preco_inicial` DOUBLE NOT NULL,
  `preco_fipe` DOUBLE NOT NULL,
  `km` INT NOT NULL,
  `chassi` VARCHAR(20) NOT NULL,
  `placa` CHAR(7) NOT NULL,
  `renavam` VARCHAR(45) NOT NULL,
  `ano_fabricacao` YEAR NOT NULL,
  `ano_modelo` YEAR NOT NULL,
  `novo` BIT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_veiculos_proprietarios1_idx` (`id_proprietario` ASC) VISIBLE,
  INDEX `fk_veiculos_versoes1_idx` (`id_versao` ASC) VISIBLE,
  INDEX `fk_veiculos_cores1_idx` (`id_cor` ASC) VISIBLE,
  INDEX `fk_veiculos_vendas1_idx` (`id_venda` ASC) VISIBLE,
  CONSTRAINT `fk_veiculos_proprietarios1`
    FOREIGN KEY (`id_proprietario`)
    REFERENCES `dev_motors`.`proprietarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_veiculos_versoes1`
    FOREIGN KEY (`id_versao`)
    REFERENCES `dev_motors`.`versoes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_veiculos_cores1`
    FOREIGN KEY (`id_cor`)
    REFERENCES `dev_motors`.`cores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_veiculos_vendas1`
    FOREIGN KEY (`id_venda`)
    REFERENCES `dev_motors`.`vendas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dev_motors`.`opcionais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dev_motors`.`opcionais` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dev_motors`.`veiculos_opcionais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dev_motors`.`veiculos_opcionais` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_veiculo` INT NOT NULL,
  `id_opcional` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_veiculos_opcionais_veiculos1_idx` (`id_veiculo` ASC) VISIBLE,
  INDEX `fk_veiculos_opcionais_opcionais1_idx` (`id_opcional` ASC) VISIBLE,
  CONSTRAINT `fk_veiculos_opcionais_veiculos1`
    FOREIGN KEY (`id_veiculo`)
    REFERENCES `dev_motors`.`veiculos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_veiculos_opcionais_opcionais1`
    FOREIGN KEY (`id_opcional`)
    REFERENCES `dev_motors`.`opcionais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
