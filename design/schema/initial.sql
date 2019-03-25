-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema xehar_platform
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema xehar_platform
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `xehar_platform` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema xeharold
-- -----------------------------------------------------
USE `xehar_platform` ;

-- -----------------------------------------------------
-- Table `xehar_platform`.`warehouses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehar_platform`.`warehouses` (
  `warehouse_id` INT NOT NULL AUTO_INCREMENT,
  `warehouse_name` VARCHAR(45) NULL,
  PRIMARY KEY (`warehouse_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xehar_platform`.`warehouse_locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehar_platform`.`warehouse_locations` (
  `warehouse_location_id` INT NOT NULL AUTO_INCREMENT,
  `warehouse_location_name` VARCHAR(20) NULL,
  `stock_item_type` INT NOT NULL,
  `priority` INT NOT NULL,
  `max_quantity` INT NOT NULL,
  `status` INT NOT NULL,
  PRIMARY KEY (`warehouse_location_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xehar_platform`.`purchase_orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehar_platform`.`purchase_orders` (
  `purchase_order_id` INT NOT NULL AUTO_INCREMENT,
  `vendor_id` INT NOT NULL,
  `purchase_order_date` DATETIME NULL,
  `created_on` DATETIME NULL,
  `updated_on` DATETIME NULL,
  `status` SMALLINT NULL,
  `buyer_user_id` INT NULL,
  PRIMARY KEY (`purchase_order_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xehar_platform`.`vendor_styles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehar_platform`.`vendor_styles` (
  `vendor_styles_id` INT NOT NULL,
  `vendor_id` INT NOT NULL,
  `vendor_style` VARCHAR(45) NOT NULL,
  `product_style_id` INT NOT NULL,
  `created_on` DATETIME NULL,
  `updated_on` DATETIME NULL,
  `stock_item_type` INT NOT NULL,
  PRIMARY KEY (`vendor_styles_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xehar_platform`.`vendors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehar_platform`.`vendors` (
  `vendor_id` INT NOT NULL AUTO_INCREMENT,
  `vendor_name` VARCHAR(45) NOT NULL,
  `address_line_1` VARCHAR(80) NULL,
  `address_line_2` VARCHAR(80) NULL,
  `city` VARCHAR(80) NULL,
  `stateprovince` VARCHAR(80) NULL,
  `country` VARCHAR(80) NULL,
  `postalcode` VARCHAR(20) NULL,
  `status` INT NULL,
  PRIMARY KEY (`vendor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xehar_platform`.`purchase_order_line_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehar_platform`.`purchase_order_line_items` (
  `purchase_order_line_item_id` INT NOT NULL AUTO_INCREMENT,
  `purchase_order_id` INT NOT NULL,
  `vendor_style_id` INT NOT NULL,
  `unit_price` DECIMAL(6,2) NOT NULL,
  `quantity` INT NOT NULL,
  `status` SMALLINT NOT NULL,
  PRIMARY KEY (`purchase_order_line_item_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xehar_platform`.`product_styles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehar_platform`.`product_styles` (
  `product_style_id` INT NOT NULL,
  `style_name` VARCHAR(15) NOT NULL,
  `vendor_style_id` INT NULL,
  `status` SMALLINT NULL,
  PRIMARY KEY (`product_style_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xehar_platform`.`stock_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehar_platform`.`stock_item` (
  `stock_item_id` BIGINT NOT NULL AUTO_INCREMENT,
  `product_sku_id` INT NOT NULL,
  `barcode_value` CHAR(25) NOT NULL,
  `status` SMALLINT NOT NULL,
  `warehouse_location_id` INT NOT NULL,
  `recieved_on` DATETIME NOT NULL,
  `sold_on` DATETIME NOT NULL,
  `liquidated_on` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`stock_item_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xehar_platform`.`parent_sku`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehar_platform`.`parent_sku` (
  `parent_sku_id` INT NOT NULL AUTO_INCREMENT,
  `product_style_id` INT NOT NULL,
  `color_id` INT NOT NULL,
  `status` SMALLINT NOT NULL,
  PRIMARY KEY (`parent_sku_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xehar_platform`.`product_sku`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehar_platform`.`product_sku` (
  `product_sku_id` INT NOT NULL AUTO_INCREMENT,
  `parent_sku_id` VARCHAR(45) NOT NULL,
  `size_id` VARCHAR(45) NULL,
  PRIMARY KEY (`product_sku_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xehar_platform`.`sizes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehar_platform`.`sizes` (
  `size_id` INT NOT NULL AUTO_INCREMENT,
  `size_name` VARCHAR(20) NOT NULL,
  `size_code` CHAR(4) NOT NULL,
  `size_category` INT NOT NULL,
  PRIMARY KEY (`size_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `xehar_platform`.`colors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `xehar_platform`.`colors` (
  `color_id` INT NOT NULL AUTO_INCREMENT,
  `color_code` CHAR(4) NOT NULL,
  `color_name` VARCHAR(20) NULL,
  PRIMARY KEY (`color_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

