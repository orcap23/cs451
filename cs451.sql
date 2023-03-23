-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cs451_final_project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cs451_final_project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cs451_final_project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `cs451_final_project` ;

-- -----------------------------------------------------
-- Table `cs451_final_project`.`author1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs451_final_project`.`author1` (
  `author_code` INT NOT NULL,
  `author_fname` VARCHAR(45) NULL DEFAULT NULL,
  `author_lname` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`author_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cs451_final_project`.`author2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs451_final_project`.`author2` (
  `auth_code` INT NOT NULL,
  `author_fname` VARCHAR(45) NOT NULL,
  `author_lname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`auth_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cs451_final_project`.`library1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs451_final_project`.`library1` (
  `library_code` INT NOT NULL,
  `library_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`library_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cs451_final_project`.`book1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs451_final_project`.`book1` (
  `ISBN` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `genre` VARCHAR(45) NOT NULL,
  `sub-genre` VARCHAR(45) NULL DEFAULT NULL,
  `library_code` INT NOT NULL,
  `author_code` INT NOT NULL,
  PRIMARY KEY (`ISBN`),
  INDEX `author_code_idx` (`author_code` ASC) VISIBLE,
  INDEX `library_code_idx` (`library_code` ASC) VISIBLE,
  CONSTRAINT `book1_author_code`
    FOREIGN KEY (`author_code`)
    REFERENCES `cs451_final_project`.`author1` (`author_code`),
  CONSTRAINT `book1_library_code`
    FOREIGN KEY (`library_code`)
    REFERENCES `cs451_final_project`.`library1` (`library_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cs451_final_project`.`library2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs451_final_project`.`library2` (
  `lib_code` INT NOT NULL,
  `library_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`lib_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cs451_final_project`.`book2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs451_final_project`.`book2` (
  `ISBN` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `genre` VARCHAR(45) NOT NULL,
  `sub-genre` VARCHAR(45) NULL DEFAULT NULL,
  `auth_code` INT NOT NULL,
  `lib_code` INT NOT NULL,
  PRIMARY KEY (`ISBN`),
  INDEX `author_code_idx` (`auth_code` ASC) VISIBLE,
  INDEX `library_code_idx` (`lib_code` ASC) VISIBLE,
  CONSTRAINT `book2_author_code`
    FOREIGN KEY (`auth_code`)
    REFERENCES `cs451_final_project`.`author2` (`auth_code`),
  CONSTRAINT `book2_library_code`
    FOREIGN KEY (`lib_code`)
    REFERENCES `cs451_final_project`.`library2` (`lib_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cs451_final_project`.`staff1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs451_final_project`.`staff1` (
  `staff1_id` INT NOT NULL,
  `staff_fname` VARCHAR(45) NULL DEFAULT NULL,
  `staff_lname` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `library_code` INT NOT NULL,
  PRIMARY KEY (`staff1_id`),
  INDEX `library_code_idx` (`library_code` ASC) VISIBLE,
  CONSTRAINT `staff1_library_code`
    FOREIGN KEY (`library_code`)
    REFERENCES `cs451_final_project`.`library1` (`library_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cs451_final_project`.`staff2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs451_final_project`.`staff2` (
  `staff2_id` INT NOT NULL,
  `staff_fname` VARCHAR(45) NULL DEFAULT NULL,
  `staff_lname` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `library_code` INT NOT NULL,
  PRIMARY KEY (`staff2_id`),
  INDEX `library_staff2_idx` (`library_code` ASC) VISIBLE,
  CONSTRAINT `staff2_library_code`
    FOREIGN KEY (`library_code`)
    REFERENCES `cs451_final_project`.`library2` (`lib_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cs451_final_project`.`user2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs451_final_project`.`user2` (
  `user2_id` INT NOT NULL,
  `user_fname` VARCHAR(45) NULL DEFAULT NULL,
  `user_lname` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `lib_code` INT NOT NULL,
  PRIMARY KEY (`user2_id`),
  INDEX `library_idx` (`lib_code` ASC) VISIBLE,
  CONSTRAINT `user2_library_code`
    FOREIGN KEY (`lib_code`)
    REFERENCES `cs451_final_project`.`library2` (`lib_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cs451_final_project`.`user1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs451_final_project`.`user1` (
  `user1_id` INT NOT NULL,
  `user_fname` VARCHAR(45) NULL DEFAULT NULL,
  `user_lname` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `library_code` INT NOT NULL,
  PRIMARY KEY (`user1_id`),
  INDEX `l_code_idx` (`library_code` ASC) VISIBLE,
  CONSTRAINT `user1_library_code`
    FOREIGN KEY (`library_code`)
    REFERENCES `cs451_final_project`.`library1` (`library_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cs451_final_project`.`transfer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs451_final_project`.`transfer` (
  `transfer_id` INT NOT NULL,
  `book2_ISBN` INT NOT NULL,
  `book1_ISBN` INT NOT NULL,
  `library2_lib_code` INT NOT NULL,
  `user2_user2_id` INT NOT NULL,
  `user1_user1_id` INT NOT NULL,
  `library1_library_code` INT NOT NULL,
  PRIMARY KEY (`transfer_id`),
  UNIQUE INDEX `transfer_id_UNIQUE` (`transfer_id` ASC) VISIBLE,
  INDEX `fk_transfer_book21_idx` (`book2_ISBN` ASC) VISIBLE,
  INDEX `fk_transfer_book11_idx` (`book1_ISBN` ASC) VISIBLE,
  INDEX `fk_transfer_library21_idx` (`library2_lib_code` ASC) VISIBLE,
  INDEX `fk_transfer_user21_idx` (`user2_user2_id` ASC) VISIBLE,
  INDEX `fk_transfer_user11_idx` (`user1_user1_id` ASC) VISIBLE,
  INDEX `fk_transfer_library11_idx` (`library1_library_code` ASC) VISIBLE,
  CONSTRAINT `fk_transfer_book21`
    FOREIGN KEY (`book2_ISBN`)
    REFERENCES `cs451_final_project`.`book2` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transfer_book11`
    FOREIGN KEY (`book1_ISBN`)
    REFERENCES `cs451_final_project`.`book1` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transfer_library21`
    FOREIGN KEY (`library2_lib_code`)
    REFERENCES `cs451_final_project`.`library2` (`lib_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transfer_user21`
    FOREIGN KEY (`user2_user2_id`)
    REFERENCES `cs451_final_project`.`user2` (`user2_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transfer_user11`
    FOREIGN KEY (`user1_user1_id`)
    REFERENCES `cs451_final_project`.`user1` (`user1_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transfer_library11`
    FOREIGN KEY (`library1_library_code`)
    REFERENCES `cs451_final_project`.`library1` (`library_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
