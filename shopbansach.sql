/*
 Navicat Premium Data Transfer

 Source Server         : shop
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : shopnuochoa

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 11/06/2023 16:32:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_category
-- ----------------------------
DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE `tbl_category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `description` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `parent_id` int NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `seo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_internal_idx`(`parent_id` ASC) USING BTREE,
  CONSTRAINT `fk_internal` FOREIGN KEY (`parent_id`) REFERENCES `tbl_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Bảng dữ liệu chứa danh mục sản phẩm';

-- ----------------------------
-- Records of tbl_category
-- ----------------------------
BEGIN;
INSERT INTO `tbl_category` (`id`, `name`, `description`, `created_date`, `updated_date`, `created_by`, `updated_by`, `parent_id`, `status`, `seo`, `code`) VALUES (24, 'Nước hoa nam', 'Sản phầm dành cho nam giới hiện đại', '2023-06-11 15:50:01', '2023-06-11 15:50:01', NULL, NULL, NULL, 1, NULL, 'NHN'), (25, 'Nước hoa nữ', 'Nước hoa dành cho nữ giới cuốn hút', '2023-06-11 15:50:25', '2023-06-11 15:50:25', NULL, NULL, NULL, 1, NULL, 'NHNN');
COMMIT;

-- ----------------------------
-- Table structure for tbl_comment
-- ----------------------------
DROP TABLE IF EXISTS `tbl_comment`;
CREATE TABLE `tbl_comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `comment` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_cmt_product_idx`(`product_id` ASC) USING BTREE,
  INDEX `fk_cmt_user_idx`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_cmt_product` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cmt_user` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin;

-- ----------------------------
-- Records of tbl_comment
-- ----------------------------
BEGIN;
INSERT INTO `tbl_comment` (`id`, `product_id`, `user_id`, `updated_date`, `created_by`, `created_date`, `updated_by`, `status`, `comment`) VALUES (4, 101, NULL, '2023-06-11 15:57:45', NULL, '2023-06-11 15:57:45', NULL, 0, 'a'), (5, 101, NULL, '2023-06-11 15:58:03', NULL, '2023-06-11 15:58:03', NULL, 0, 'a\n\n'), (6, 101, NULL, '2023-06-11 16:04:25', NULL, '2023-06-11 16:04:25', NULL, 0, 'kk'), (7, 101, NULL, '2023-06-11 16:04:29', NULL, '2023-06-11 16:04:29', NULL, 0, 'kk\n'), (8, 101, NULL, '2023-06-11 16:04:33', NULL, '2023-06-11 16:04:33', NULL, 0, 'l');
COMMIT;

-- ----------------------------
-- Table structure for tbl_contact
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contact`;
CREATE TABLE `tbl_contact`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `message` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Bảng dữ liệu chứa thông tin liên hệ';

-- ----------------------------
-- Records of tbl_contact
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tbl_order
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order`;
CREATE TABLE `tbl_order`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `total` decimal(13, 2) NOT NULL,
  `customer_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `customer_address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `customer_phone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `seo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `status_order` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `customer_email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Bảng dữ liệu chứa phiếu mua hàng';

-- ----------------------------
-- Records of tbl_order
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tbl_order_products
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order_products`;
CREATE TABLE `tbl_order_products`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `quality` int NOT NULL,
  `created_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `code` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_saleorder_product_idx`(`order_id` ASC) USING BTREE,
  CONSTRAINT `fk_saleorder_product` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 124 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Bảng dữ liệu chứa phiếu mua hàng';

-- ----------------------------
-- Records of tbl_order_products
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tbl_products
-- ----------------------------
DROP TABLE IF EXISTS `tbl_products`;
CREATE TABLE `tbl_products`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `price` decimal(13, 2) NULL DEFAULT NULL,
  `short_description` varchar(3000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `detail_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `category_id` int NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `seo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `code` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_category_products_idx`(`category_id` ASC) USING BTREE,
  CONSTRAINT `fk_category_products` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Bảng dữ liệu chứa danh mục sản phẩm';

-- ----------------------------
-- Records of tbl_products
-- ----------------------------
BEGIN;
INSERT INTO `tbl_products` (`id`, `title`, `price`, `short_description`, `detail_description`, `avatar`, `category_id`, `created_date`, `updated_date`, `created_by`, `updated_by`, `status`, `seo`, `code`, `year`, `style`, `size`) VALUES (101, 'Dior Sauvage', 1500000.00, 'Nước hoa dành cho nam giới siêu cuốn hút', '<p>aaaaaaaaaaaaaaaaaaaaaaa</p><p>aaaaaaaaaaaaaaaaaa</p><p>aaaaaaaaaaa</p>', NULL, 24, '2023-06-11 15:53:23', '2023-06-11 15:53:23', NULL, NULL, 1, 'dior-sauvage-1686473603116', 'DS', '2015', 'Hiện đại, cuốn hút', '10 ml');
COMMIT;

-- ----------------------------
-- Table structure for tbl_products_images
-- ----------------------------
DROP TABLE IF EXISTS `tbl_products_images`;
CREATE TABLE `tbl_products_images`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `product_id` int NOT NULL,
  `created_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_product_images_idx`(`product_id` ASC) USING BTREE,
  CONSTRAINT `fk_product_images` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Bảng dữ liệu danh sách ảnh sản phẩm';

-- ----------------------------
-- Records of tbl_products_images
-- ----------------------------
BEGIN;
INSERT INTO `tbl_products_images` (`id`, `title`, `path`, `product_id`, `created_date`, `updated_date`, `created_by`, `updated_by`, `status`) VALUES (81, 'Nuoc-hoa-Dior-Sauvage-EDT.png', 'Nuoc-hoa-Dior-Sauvage-EDT.png', 101, '2023-06-11 15:53:23', '2023-06-11 15:53:23', NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for tbl_roles
-- ----------------------------
DROP TABLE IF EXISTS `tbl_roles`;
CREATE TABLE `tbl_roles`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Bảng dữ liệu chứa thông tin roles';

-- ----------------------------
-- Records of tbl_roles
-- ----------------------------
BEGIN;
INSERT INTO `tbl_roles` (`id`, `name`, `description`, `created_date`, `updated_date`, `created_by`, `updated_by`, `status`) VALUES (10, 'ROLE_ADMIN', 'Quản trị viên', '2023-06-11 15:40:21', NULL, NULL, NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for tbl_sale
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sale`;
CREATE TABLE `tbl_sale`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` decimal(13, 2) NOT NULL,
  `quantity` int NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tbl_sale
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tbl_users
-- ----------------------------
DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE `tbl_users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `address` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Bảng dữ liệu chứa thông tin người dùng';

-- ----------------------------
-- Records of tbl_users
-- ----------------------------
BEGIN;
INSERT INTO `tbl_users` (`id`, `username`, `password`, `address`, `phone`, `email`, `created_date`, `updated_date`, `created_by`, `updated_by`, `status`) VALUES (44, 'admin', '$2a$16$BjSNtCEOZDSQQjKfDV2FYuK9kxZ/hyePiQ97t/K3z/L4khEPgJ4Zi', 'Hà Nội', '0999999999', 'admin@gmail.com', '2023-06-11 15:39:49', '2023-06-11 15:39:49', NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for tbl_users_roles
-- ----------------------------
DROP TABLE IF EXISTS `tbl_users_roles`;
CREATE TABLE `tbl_users_roles`  (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `fk_roles_idx`(`role_id` ASC) USING BTREE,
  CONSTRAINT `fk_roles` FOREIGN KEY (`role_id`) REFERENCES `tbl_roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_users` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'bảng trung gian thể hiện quan hệ n-n của users và roles';

-- ----------------------------
-- Records of tbl_users_roles
-- ----------------------------
BEGIN;
INSERT INTO `tbl_users_roles` (`user_id`, `role_id`) VALUES (44, 10);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
