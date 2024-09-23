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
-- Table `mydb`.`marcas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`marcas` (
  `id` INT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `cnpj` CHAR(18) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`modelos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`modelos` (
  `id` INT NOT NULL,
  `id_marca` INT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_veiculos_marcas_idx` (`id_marca` ASC) VISIBLE,
  CONSTRAINT `fk_veiculos_marcas`
    FOREIGN KEY (`id_marca`)
    REFERENCES `mydb`.`marcas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`versoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`versoes` (
  `id` INT NOT NULL,
  `id_modelo` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `motor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_versoes_modelos1_idx` (`id_modelo` ASC) VISIBLE,
  CONSTRAINT `fk_versoes_modelos1`
    FOREIGN KEY (`id_modelo`)
    REFERENCES `mydb`.`modelos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cores` (
  `id` INT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`proprietarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`proprietarios` (
  `id` INT NOT NULL,
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
-- Table `mydb`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clientes` (
  `id` INT NOT NULL,
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
-- Table `mydb`.`vendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vendas` (
  `id` INT NOT NULL,
  `clientes_id` INT NOT NULL,
  `valor` DOUBLE NOT NULL,
  `data` DATE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_vendas_clientes1_idx` (`clientes_id` ASC) VISIBLE,
  CONSTRAINT `fk_vendas_clientes1`
    FOREIGN KEY (`clientes_id`)
    REFERENCES `mydb`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`veiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`veiculos` (
  `id` INT NOT NULL,
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
    REFERENCES `mydb`.`proprietarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_veiculos_versoes1`
    FOREIGN KEY (`id_versao`)
    REFERENCES `mydb`.`versoes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_veiculos_cores1`
    FOREIGN KEY (`id_cor`)
    REFERENCES `mydb`.`cores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_veiculos_vendas1`
    FOREIGN KEY (`id_venda`)
    REFERENCES `mydb`.`vendas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`opcionais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`opcionais` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`veiculos_opcionais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`veiculos_opcionais` (
  `id` INT NOT NULL,
  `id_veiculo` INT NOT NULL,
  `id_opcional` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_veiculos_opcionais_veiculos1_idx` (`id_veiculo` ASC) VISIBLE,
  INDEX `fk_veiculos_opcionais_opcionais1_idx` (`id_opcional` ASC) VISIBLE,
  CONSTRAINT `fk_veiculos_opcionais_veiculos1`
    FOREIGN KEY (`id_veiculo`)
    REFERENCES `mydb`.`veiculos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_veiculos_opcionais_opcionais1`
    FOREIGN KEY (`id_opcional`)
    REFERENCES `mydb`.`opcionais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
