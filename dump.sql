-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for tailadmin_laravel
CREATE DATABASE IF NOT EXISTS `tailadmin_laravel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tailadmin_laravel`;

-- Dumping structure for table tailadmin_laravel.brands
CREATE TABLE IF NOT EXISTS `brands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.brands: ~0 rows (approximately)
INSERT INTO `brands` (`id`, `name`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, '', '', NULL, '2024-09-02 09:56:24', '2024-09-02 09:56:24'),
	(2, 'Westmed', 'westmed', NULL, '2024-09-02 09:56:24', '2024-09-02 09:56:24'),
	(3, 'Unbranded', 'unbranded', NULL, '2024-09-02 10:07:59', '2024-09-02 10:07:59'),
	(4, 'VixOne', 'vixone', NULL, '2024-09-02 10:07:59', '2024-09-02 10:07:59'),
	(5, 'BATTLER SOLUTIONS', 'battler-solutions', NULL, '2024-09-02 10:07:59', '2024-09-02 10:07:59'),
	(6, 'Comfort Soft Plus', 'comfort-soft-plus', NULL, '2024-09-02 10:07:59', '2024-09-02 10:07:59'),
	(7, 'Ultra Soft', 'ultra-soft', NULL, '2024-09-02 10:07:59', '2024-09-02 10:07:59'),
	(8, 'Salter Labs', 'salter-labs', NULL, '2024-09-02 10:07:59', '2024-09-02 10:07:59'),
	(9, 'Responsive Respiratory', 'responsive-respiratory', NULL, '2024-09-02 10:07:59', '2024-09-02 10:07:59'),
	(10, 'ResOne', 'resone', NULL, '2024-09-02 10:08:00', '2024-09-02 10:08:00'),
	(11, 'Car Mate', 'car-mate', NULL, '2024-09-02 10:08:00', '2024-09-02 10:08:00'),
	(12, 'Generic', 'generic', NULL, '2024-09-02 10:08:00', '2024-09-02 10:08:00'),
	(13, 'Microspacer', 'microspacer', NULL, '2024-09-02 10:08:00', '2024-09-02 10:08:00'),
	(14, 'Microchamber', 'microchamber', NULL, '2024-09-02 10:08:00', '2024-09-02 10:08:00'),
	(15, 'CALSLA', 'calsla', NULL, '2024-09-02 10:08:00', '2024-09-02 10:08:00'),
	(16, 'B-Sure', 'b-sure', NULL, '2024-09-02 10:08:00', '2024-09-02 10:08:00'),
	(17, 'Sunset Healthcare Solutions', 'sunset-healthcare-solutions', NULL, '2024-09-02 10:08:00', '2024-09-02 10:08:00'),
	(18, 'Sunset Healthcare', 'sunset-healthcare', NULL, '2024-09-02 10:08:02', '2024-09-02 10:08:02');

-- Dumping structure for table tailadmin_laravel.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.cache: ~0 rows (approximately)
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
	('spatie.permission.cache', 'a:3:{s:5:"alias";a:0:{}s:11:"permissions";a:0:{}s:5:"roles";a:0:{}}', 1725409898);

-- Dumping structure for table tailadmin_laravel.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.cache_locks: ~0 rows (approximately)

-- Dumping structure for table tailadmin_laravel.catalogs
CREATE TABLE IF NOT EXISTS `catalogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_source` enum('api','report','csv') COLLATE utf8mb4_unicode_ci NOT NULL,
  `import_state` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.catalogs: ~0 rows (approximately)
INSERT INTO `catalogs` (`id`, `name`, `description`, `initial_source`, `import_state`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'catalog1', 'desc', 'csv', 'none', 1, 1, '2024-09-02 05:06:48', NULL, NULL);

-- Dumping structure for table tailadmin_laravel.channels
CREATE TABLE IF NOT EXISTS `channels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channels_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.channels: ~0 rows (approximately)
INSERT INTO `channels` (`id`, `name`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'amazon', 'amazon', NULL, '2024-09-02 09:56:24', '2024-09-02 09:56:24');

-- Dumping structure for table tailadmin_laravel.demo_contents
CREATE TABLE IF NOT EXISTS `demo_contents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `main_product_id` bigint unsigned DEFAULT NULL,
  `production_date` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.demo_contents: ~0 rows (approximately)

-- Dumping structure for table tailadmin_laravel.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table tailadmin_laravel.instructions
CREATE TABLE IF NOT EXISTS `instructions` (
  `contents` json NOT NULL,
  `image_id` bigint unsigned DEFAULT NULL,
  `product_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `instructions_product_id_foreign` (`product_id`),
  CONSTRAINT `instructions_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.instructions: ~0 rows (approximately)
INSERT INTO `instructions` (`contents`, `image_id`, `product_id`, `created_at`, `updated_at`, `id`) VALUES
	('21', NULL, NULL, NULL, '2024-09-03 00:33:48', 1);

-- Dumping structure for table tailadmin_laravel.instructions_print_template
CREATE TABLE IF NOT EXISTS `instructions_print_template` (
  `print_template_id` bigint unsigned NOT NULL,
  `instruction_id` bigint unsigned NOT NULL,
  KEY `instructions_print_template_print_template_id_foreign` (`print_template_id`),
  KEY `instructions_print_template_instruction_id_foreign` (`instruction_id`),
  CONSTRAINT `instructions_print_template_instruction_id_foreign` FOREIGN KEY (`instruction_id`) REFERENCES `instructions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `instructions_print_template_print_template_id_foreign` FOREIGN KEY (`print_template_id`) REFERENCES `print_templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.instructions_print_template: ~0 rows (approximately)

-- Dumping structure for table tailadmin_laravel.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.jobs: ~0 rows (approximately)

-- Dumping structure for table tailadmin_laravel.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.job_batches: ~0 rows (approximately)

-- Dumping structure for table tailadmin_laravel.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.migrations: ~0 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2021_07_16_121843_create_permission_tables', 1),
	(5, '2021_11_10_062603_create_demo_contents_table', 1),
	(6, '2022_01_20_204151_add_group_columns_to_permissions_table', 1),
	(7, '2022_01_20_204743_create_permission_groups_table', 1),
	(8, '2024_07_03_194214_add_two_factor_columns_to_users_table', 1),
	(9, '2024_07_03_194232_create_personal_access_tokens_table', 1),
	(10, '2024_07_03_194233_create_teams_table', 1),
	(11, '2024_07_03_194234_create_team_user_table', 1),
	(12, '2024_07_03_194235_create_team_invitations_table', 1),
	(13, '2024_07_07_190651_add_personalization_fields_to_users_table', 1),
	(14, '2024_08_29_004556_create_brands_table', 1),
	(15, '2024_08_29_004606_create_channels_table', 1),
	(16, '2024_08_30_004046_create_prep_details_table', 1),
	(17, '2024_08_30_040448_create_print_templates_table', 1),
	(18, '2024_08_31_001321_products_table', 1),
	(19, '2024_08_31_001554_product_component_table', 1),
	(20, '2024_08_31_001946_create_packlists_table', 1),
	(21, '2024_08_31_003009_create_packlist_product_table', 1),
	(22, '2024_08_31_145341_001_create_instructions_table', 1),
	(23, '2024_08_31_185340_001_create_products_print_template_table', 1),
	(24, '2024_08_31_185340_002_create_instructions_print_template_table', 1),
	(25, '2024_08_31_185340_004_update_products_table', 1),
	(26, '2024_08_31_233914_001_create_catalogs_table', 1),
	(27, '2024_08_31_234820_002_update_products_table', 1);

-- Dumping structure for table tailadmin_laravel.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.model_has_permissions: ~0 rows (approximately)

-- Dumping structure for table tailadmin_laravel.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.model_has_roles: ~0 rows (approximately)

-- Dumping structure for table tailadmin_laravel.packlists
CREATE TABLE IF NOT EXISTS `packlists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `channel_id` bigint unsigned NOT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `packlists_user_id_foreign` (`user_id`),
  KEY `packlists_created_by_foreign` (`created_by`),
  KEY `packlists_updated_by_foreign` (`updated_by`),
  KEY `packlists_channel_id_foreign` (`channel_id`),
  CONSTRAINT `packlists_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `packlists_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `packlists_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `packlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.packlists: ~0 rows (approximately)

-- Dumping structure for table tailadmin_laravel.packlist_product
CREATE TABLE IF NOT EXISTS `packlist_product` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `packlist_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `packlist_product_packlist_id_product_id_unique` (`packlist_id`,`product_id`),
  KEY `packlist_product_product_id_foreign` (`product_id`),
  CONSTRAINT `packlist_product_packlist_id_foreign` FOREIGN KEY (`packlist_id`) REFERENCES `packlists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `packlist_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.packlist_product: ~0 rows (approximately)

-- Dumping structure for table tailadmin_laravel.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table tailadmin_laravel.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_group_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.permissions: ~0 rows (approximately)

-- Dumping structure for table tailadmin_laravel.permission_groups
CREATE TABLE IF NOT EXISTS `permission_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.permission_groups: ~0 rows (approximately)

-- Dumping structure for table tailadmin_laravel.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table tailadmin_laravel.prep_details
CREATE TABLE IF NOT EXISTS `prep_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instructions` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prep_details_created_by_foreign` (`created_by`),
  KEY `prep_details_updated_by_foreign` (`updated_by`),
  CONSTRAINT `prep_details_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `prep_details_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.prep_details: ~0 rows (approximately)

-- Dumping structure for table tailadmin_laravel.print_templates
CREATE TABLE IF NOT EXISTS `print_templates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avery_id` int unsigned DEFAULT NULL,
  `labels_per_page` int NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `print_templates_name_unique` (`name`),
  KEY `print_templates_user_id_foreign` (`user_id`),
  CONSTRAINT `print_templates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.print_templates: ~0 rows (approximately)

-- Dumping structure for table tailadmin_laravel.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sku` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `id_type` enum('ASIN','UPC','FNSKU') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sellable_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `gtin` int DEFAULT NULL,
  `fnsku` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `active_flag` int DEFAULT NULL,
  `hide_upc` int DEFAULT NULL,
  `brand` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `kit` int DEFAULT NULL,
  `default_label_template` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `prep_detail_id` int unsigned DEFAULT NULL,
  `channel` enum('amazon','walmart','unknown','shop') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=945 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table tailadmin_laravel.products: ~472 rows (approximately)
INSERT INTO `products` (`id`, `sku`, `title`, `id_type`, `sellable_id`, `gtin`, `fnsku`, `active_flag`, `hide_upc`, `brand`, `kit`, `default_label_template`, `prep_detail_id`, `channel`, `deleted_at`) VALUES
	(473, '120-1040C', '15 LPM Oxygen Oxygen Regulator CGA-870 with Barb Outlet by Responsive Respiratory #120-1040C', 'FNSKU', NULL, NULL, 'X002VIS28H', 1, 0, 'Responsive Respiratory', 0, '', 2, 'amazon', NULL),
	(474, 'CW-150-5', 'ResOne Nylon Medical Oxygen Cylinder Wrench with Bungee Cord & 2 Yoke Washers 5-Pack - Hardened Nylon Plastic, Fits Oxygen CGA-870 Post Valves - Oxygen Tank Key Wrench, Oxygen Regulator Seal', 'UPC', '810058517166', NULL, 'B0B4PWJZX4', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(475, '120-1060C', '15 LPM Oxygen Regulator CGA-540 with DISS Outlet by Responsive Respiratory #120-1060C', 'FNSKU', NULL, NULL, 'X002VIVACH', 1, 0, 'Responsive Respiratory', 0, '', 2, 'amazon', NULL),
	(476, '120-1061C', '15 LPM Oxygen Regulator CGA-540 with Barb Outlet by Responsive Respiratory #120-1061C', 'FNSKU', NULL, NULL, 'X002VIS967', 1, 0, 'Responsive Respiratory', 0, '', 2, 'amazon', NULL),
	(477, 'CW-500-1', 'ResOne Metal Medical Oxygen Cylinder Wrench - Heavy Duty Steel, Fits Oxygen CGA-870 Post Valves - Oxygen Tank Key Wrench, Oxygen Wrench - Medical Oxygen Cylinders, Oxygen Regulator', 'UPC', '810058518835', NULL, 'B0BNF9JM81', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(478, 'CW-500-5', 'ResOne Metal Medical Oxygen Cylinder Wrench 5-Pack - Heavy Duty Steel, Fits Oxygen CGA-870 Post Valves - Oxygen Tank Key Wrench, Oxygen Wrench - Medical Oxygen Cylinders, Oxygen Regulator', 'UPC', '810058518842', NULL, 'B0BNF9GZ37', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(479, '120-1070C-CONV', '3 LPM Pediatric Oxygen Regulator CGA-540 with DISS Outlet and Decimal Flows & Conversion by Responsive Respiratory #120-1070C-CONV', 'FNSKU', NULL, NULL, 'X002VIOCJP', 1, 0, 'Responsive Respiratory', 0, '', 2, 'amazon', NULL),
	(480, 'CW-510-1', 'ResOne Metal Medical Oxygen Cylinder Wrench with Bungee Cord - Heavy Duty Steel, Fits Oxygen CGA-870 Post Valves - Oxygen Tank Key Wrench, Oxygen Wrench - Medical Oxygen Cylinders', 'UPC', '810058518859', NULL, 'B0BNF7Z2TK', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(481, '120-1200', '25 LPM EMS Oxygen Regulator CGA-870 with Dual Barb and DISS Outlets by Responsive Respiratory #120-1200', 'FNSKU', NULL, NULL, 'X002VIY4ZR', 1, 0, 'Responsive Respiratory', 0, '', 2, 'amazon', NULL),
	(482, '120-1205', '25 LPM EMS Oxygen Regulator CGA-540 with Dual Barb and DISS Outlets by Responsive Respiratory #120-1205', 'FNSKU', NULL, NULL, 'X002VIY91L', 1, 0, 'Responsive Respiratory', 0, '', 2, 'amazon', NULL),
	(483, 'CW-510-5', 'ResOne Metal Medical Oxygen Cylinder Wrench with Bungee Cord 5-Pack - Heavy Duty Steel, Fits Oxygen CGA-870 Post Valves - Oxygen Tank Key Wrench, Oxygen Wrench - Medical Oxygen Cylinders', 'UPC', '810058518866', NULL, 'B0BNFBQW6G', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(484, 'CW-520-1', 'ResOne Metal Medical Oxygen Cylinder Wrench with Bungee Cord & 2 Yoke Washers - Heavy Duty Steel, Fits Oxygen CGA-870 Post Valves - Oxygen Tank Key Wrench, Oxygen Wrench, Oxygen Regulator Seal', 'UPC', '810058518873', NULL, 'B0BNF7Y479', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(485, '120-1210', '25 LPM EMS Oxygen Regulator CGA-870 with Barb and DISS Outlets by Responsive Respiratory #120-1210', 'FNSKU', NULL, NULL, 'X002VIY9V1', 1, 0, 'Responsive Respiratory', 0, '', 2, 'amazon', NULL),
	(486, '120-1230', '25 LPM EMS Oxygen Regulator CGA-870 Brass Dual Barb and DISS Outlets by Responsive Respiratory #120-1230', 'FNSKU', NULL, NULL, 'X002VFXZ3H', 1, 0, 'Responsive Respiratory', 0, '', 2, 'amazon', NULL),
	(487, 'CW-520-5', 'ResOne Metal Medical Oxygen Cylinder Wrench with Bungee Cord & 2 Yoke Washers 5-Pack - Heavy Duty Steel, Fits Oxygen CGA-870 Post Valves - Oxygen Tank Key Wrench, Oxygen Wrench - Oxygen Regulator Seal', 'UPC', '810058518880', NULL, 'B0BNF9C3LR', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(488, '120-1260', 'Preset 50 PSI EMS Oxygen Regulator CGA-540 with DISS Outlet by Responsive Respiratory #120-1260', 'FNSKU', NULL, NULL, 'X002VIYNZN', 1, 0, 'Responsive Respiratory', 0, '', 2, 'amazon', NULL),
	(489, 'CW-900-1', 'ResOne Large Metal Oxygen Regulator Wrench, Fits 1-1/8in CGA-540 Nuts - Oxygen Tank Key', 'UPC', '810058518897', NULL, 'B0BNF9CNFQ', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(490, '120-1270MRI', '25 LPM MRI Conditional Oxygen Regulator CGA-870 with Barb Outlet by Responsive Respiratory #120-1270MRI', 'FNSKU', NULL, NULL, 'X002VIYEQ1', 1, 0, 'Responsive Respiratory', 0, '', 2, 'amazon', NULL),
	(491, 'CW-901-1', 'ResOne Small Metal Oxygen Regulator Wrench, Fits 1-1/8in CGA-540 Nuts - Oxygen Tank Key', 'UPC', '810058517807', NULL, 'B09YZ1VCQW', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(492, 'ES-0100-1', '1pk Sterile Ear Syringe 1oz / 30ml Green Rubber Bulb for Washing & Wax Removal', 'UPC', '810058517722', NULL, 'B0BG39CVDV', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(493, '120-2050', '15 LPM Oxygen Regulator CGA-540 with DISS Outlet by Responsive Respiratory #120-2050', 'FNSKU', NULL, NULL, 'X002VIVBBH', 1, 0, 'Responsive Respiratory', 0, '', 2, 'amazon', NULL),
	(494, '120-3030', '8 LPM Oxygen Regulator CGA-540 with DISS Outlet by Responsive Respiratory #120-3030', 'FNSKU', NULL, NULL, 'X002VIU81B', 1, 0, 'Responsive Respiratory', 0, '', 2, 'amazon', NULL),
	(495, '120-3031', '8 LPM Oxygen Regulator CGA-540 with Barb Outlet by Responsive Respiratory #120-3031', 'FNSKU', NULL, NULL, 'X002VIYLNH', 1, 0, 'Responsive Respiratory', 0, '', 2, 'amazon', NULL),
	(496, 'ES-0100-2', '2pk Sterile Ear Syringe 1oz / 30ml Green Rubber Bulb for Washing & Wax Removal', 'UPC', '810058517753', NULL, 'B0BG3BSTDH', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(497, '120-3040F', '15 LPM Oxygen Oxygen Regulator CGA-870 with Barb Outlet by Responsive Respiratory #120-1040C', 'FNSKU', NULL, NULL, 'X00387OIQP', 1, 0, 'Responsive Respiratory', 0, '', 2, 'amazon', NULL),
	(498, 'ES-0200-1', '1pk Sterile Ear Syringe 2oz / 60ml Blue Rubber Bulb for Washing & Wax Removal', 'UPC', '810058517739', NULL, 'B0BG3C5M5Q', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(499, '120-3060', '15 LPM Oxygen Regulator CGA-540 with DISS Outlet by Responsive Respiratory #120-3060', 'FNSKU', NULL, NULL, 'X002VIO8DF', 1, 0, 'Responsive Respiratory', 0, '', 2, 'amazon', NULL),
	(500, 'ES-0200-2', '2pk Sterile Ear Syringe 2oz / 60ml Blue Rubber Bulb for Washing & Wax Removal', 'UPC', '810058517760', NULL, 'B0BG3CPM6L', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(501, 'ES-0300-1', '1pk Sterile Ear Syringe 3oz / 90ml Green Rubber Bulb for Washing & Wax Removal', 'UPC', '810058517746', NULL, 'B0BG3FVMGR', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(502, 'ES-0300-2', '2pk Sterile Ear Syringe 3oz / 90ml Green Rubber Bulb for Washing & Wax Removal', 'UPC', '810058517777', NULL, 'B0BG3C2XSR', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(503, '120-3061', '15 LPM Oxygen Regulator CGA-540 with Barb Outlet by Responsive Respiratory #120-3061', 'FNSKU', NULL, NULL, 'X002VIXZBB', 1, 0, 'Responsive Respiratory', 0, '', 2, 'amazon', NULL),
	(504, '1220-0-1A', 'Salter Labs Oxygen Tubing Connector (Each)', 'FNSKU', NULL, NULL, 'X003S49TRL', 1, 0, 'Salter Labs', 0, '', 35, 'amazon', NULL),
	(505, 'GA-0100', '9pc Guedel Oral Airway Kit, Sizes #4-#12', 'UPC', '810058517654', NULL, 'B0BFGVPTXP', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(506, '1220-0-1F', 'Oxygen Tubing Swivel Connector, Swivel Connector 1220, 1 pack', 'FNSKU', NULL, NULL, 'X003RBZZEV', 1, 0, 'Salter Labs', 0, '', 35, 'amazon', NULL),
	(507, 'HB-100-1', 'ResOne 1pk Oxygen Humidifier Bottle, 350ml with Pressure Relief Valve - Oxygen Concentrator Humidifier Bottle for Therapy - Portable, Medical Grade for Clinic or Home Use - Plastic', 'UPC', '810058518903', NULL, 'B0BNF7VYW9', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(508, '1220-0-2', 'Salter Labs Oxygen Tubing Swivel Connector, Swivel Connector 1220 - Pack of 2', 'FNSKU', NULL, NULL, 'X003QV02GX', 1, 0, 'Salter Labs', 0, '', 17, 'amazon', NULL),
	(509, 'HB-100-6', 'ResOne 6pk Oxygen Humidifier Bottle, 350ml with Pressure Relief Valve - Oxygen Concentrator Humidifier Bottle for Therapy - Portable, Medical Grade for Clinic or Home Use - Plastic', 'UPC', '810058519993', NULL, 'B0CM7JC51Y', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(510, '1220-0-25', 'Salter Labs Tubing Swivel Connector - 25/case by Salter Labs', 'FNSKU', NULL, NULL, 'X003QV8PDZ', 1, 0, 'Salter Labs', 0, '', 3, 'amazon', NULL),
	(511, 'HB-110-1', 'ResOne 1pk Oxygen Humidifier Bottle, 350ml with Pressure Relief Valve & 12in. Adapter Tubing - Oxygen Concentrator Humidifier Bottle for Therapy - Portable', 'UPC', '810058518910', NULL, 'B0BNF9YJNK', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(512, 'HB-110-6', 'ResOne 6pk Oxygen Humidifier Bottle, 350ml with Pressure Relief Valve & 12in. Adapter Tubing - Oxygen Concentrator Humidifier Bottle for Therapy - Portable', 'UPC', '810058519948', NULL, 'B0CLWY2B7W', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(513, '1220-0-3', 'Oxygen Tubing Swivel Connector, Swivel Connector 1220 - Pack of 3', 'FNSKU', NULL, NULL, 'B09FYFL3LJ', 1, 0, 'Salter Labs', 0, '', 65, 'amazon', NULL),
	(514, '1220-0-4', 'Oxygen Tubing Swivel Connector, Swivel Connector 1220 - Pack of 4', 'FNSKU', NULL, NULL, 'X003S4FEB1', 1, 0, 'Salter Labs', 0, '', 66, 'amazon', NULL),
	(515, '1225-0-1', 'Salter Male/Female Swivel Connector', 'FNSKU', NULL, NULL, 'X003QVFCNV', 1, 0, 'Salter Labs', 0, '', 35, 'amazon', NULL),
	(516, 'HBA-100-1', '1pk 12in. Oxygen Humidifier Bottle Adapter Tubing', 'UPC', '810058518927', NULL, 'B0BNF9PSPF', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(517, '1225-0-1B', 'Salter Labs Oxygen Swivel Tubing Connector, 1225-0-25 - Sold by: Pack of One', 'FNSKU', NULL, NULL, 'X003QVFBUF', 1, 0, 'Salter Labs', 0, '', 35, 'amazon', NULL),
	(518, 'HBA-100-5', '5pk 12in. Oxygen Humidifier Bottle Adapter Tubing', 'UPC', '810058519726', NULL, 'B0CLWTSBW1', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(519, '1249C-0-1', 'ResOne 1pk Medical Oxygen Cylinder Wrench with Security Cord', 'UPC', '810058519658', NULL, 'B0C5Z8T1SR', 1, 0, 'ResOne', 0, '', 22, 'amazon', NULL),
	(520, 'JWYN00000125', 'High Flow O2 Liter Meter (2-15 LPM) to Measure Oxygen by Responsive Respiratory', 'UPC', '850007762988', NULL, 'B07VJ1VCYR', 0, 0, 'Responsive Respiratory', 0, '', NULL, 'amazon', NULL),
	(521, 'JWYN00000191X', 'Standard Flow O2 Liter Meter (1-8 LPM) to Measure Oxygen by Responsive Respiratory', 'UPC', '850007762995', NULL, 'X002CSZXKL', 0, 0, 'Responsive Respiratory', 0, '', NULL, 'amazon', NULL),
	(522, 'JWYN00000192X', 'Pediatric Flow O2 Liter Meter (0-2.5 LPM) to Measure Oxygen by Responsive Respiratory', 'UPC', '860000771962', NULL, 'X002CSX0ZL', 0, 0, 'Responsive Respiratory', 0, '', NULL, 'amazon', NULL),
	(523, '1249C-0-1B', 'SA1249C - Fiberglass Cylinder Wrench', 'FNSKU', NULL, NULL, 'X003YWCUZF', 1, 0, 'Salter Labs', 0, '', 22, 'amazon', NULL),
	(524, '1249C-0-5', '5pk Medical Oxygen Cylinder Wrenches with Security Cord', 'UPC', '810058519665', NULL, 'B0C5ZD14NM', 1, 0, 'ResOne', 0, '', 21, 'amazon', NULL),
	(525, '130-0100-1', '1-Pack Oxymizer Disposable Mustache Style Oxygen Conserver', 'FNSKU', NULL, NULL, 'X002VFU3I7', 1, 0, 'Oxymizer', 0, '', 5, 'amazon', NULL),
	(526, 'JWYN00000235', '50-Pack Westmed #0556 Adult Comfort Soft Plus Cannula with 7\' Kink Resistant Tubing', 'FNSKU', NULL, NULL, 'X002E628TF', 0, 0, 'Westmed', 0, '', 3, 'amazon', NULL),
	(527, '130-0150-1', '1-Pack Oxymizer Disposable Pendant Style Oxygen Conserver', 'FNSKU', NULL, NULL, 'X002VFU4MH', 1, 0, 'Oxymizer', 0, '', 5, 'amazon', NULL),
	(528, 'JWYN00000427', '1-Pack Westmed #0210 VixOne Nebulizer Mouthpiece, Tee, Flex Hose, and 7\' Kink Resistant Tubing', 'FNSKU', NULL, NULL, 'X002B46ZD5', 0, 0, 'VixOne', 0, '', NULL, 'amazon', NULL),
	(529, '14-3250-40-1', 'Birchwood Laboratories A-E-R Pre-Moistened Witch Hazel Pads, 40 Count', 'FNSKU', NULL, NULL, 'X0036WJ1RN', 1, 0, 'Birchwood Laboratories', 0, '', 1, 'amazon', NULL),
	(530, 'LM-025-1', 'ResOne Pediatric Liter Meter Pen: Measure Oxygen Flow Rates Up to 2.5 LPM - Compact Oxygen Flow Meter for Quick, Precise Flow Checks', 'FNSKU', NULL, NULL, 'B09NN98M11', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(531, 'LM-080-1', 'ResOne Standard Liter Meter Pen: Measure Oxygen Flow Rates Up to 8 LPM - Compact Oxygen Flow Meter for Quick, Precise Flow Checks', 'FNSKU', NULL, NULL, 'B09NN8VF3V', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(532, 'LM-150-1', 'ResOne High Flow Liter Meter Pen: Measure Oxygen Flow Rates 2-15 LPM - Compact Oxygen Flow Meter for Quick, Precise Flow Checks', 'FNSKU', NULL, NULL, 'B09NN9NM4B', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(533, '14-3250-40-2', 'Birchwood Laboratories A-E-R Pre-Moistened Witch Hazel Pads, 80 Count (Two Pack)', 'FNSKU', NULL, NULL, 'X0036WSP2P', 1, 1, 'Birchwood Laboratories', 0, '', 73, 'amazon', NULL),
	(534, '14-4200-50-1', 'Birchwood Laboratories 14-4200-50 A.E.R. Witch Hazel Towelettes , Box, 50, Towelettes, 5in. x 5', 'FNSKU', NULL, NULL, 'X0037SNWZN', 1, 1, 'Birchwood Laboratories', 0, '', 5, 'amazon', NULL),
	(535, '14-7031-224-1', 'B-Sure Anal Leakage Pads, Box/24 Pads', 'FNSKU', NULL, NULL, 'X0036MBFWH', 1, 1, 'Birchwood Laboratories', 0, '', 1, 'amazon', NULL),
	(536, 'LM-900-1', 'ResOne 3pk Liter Meter Pens: Measure Oxygen Flow 0-15 LPM for Pediatric, Standard, High Flow- Compact Oxygen Flow Meter for Quick, Precise Flow Checks', 'UPC', '810058517814', NULL, 'B09YZ4WP3X', 0, 1, 'ResOne', 0, '', 4, 'amazon', NULL),
	(537, '14-7031-224-12', 'B-Sure Anal Leakage Pads, Case/288 (12 Boxes of 24 Pads)', 'FNSKU', NULL, NULL, 'X003CACJQJ', 1, 0, 'Birchwood Laboratories', 0, '', 3, 'amazon', NULL),
	(538, 'MR540-15B', 'ResOne 15LPM Oxygen Regulator CGA-540#MR540-15B, Adjustable Flow 0-15 LPM - ASTM G175-03 - Aluminum/Brass, Max Inlet: 3000 PSI, Outlet: 50 PSI - Compact 1.38 inches X 6.29 inches', 'UPC', '810058519771', NULL, 'B0CQDC6N3Y', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(539, '14-7031-224-1B', 'B-Sure Incontinence Liner, Light Absorbency One Size Fits Most Unisex Disposable, 14-7031-224 - Box of 24', 'FNSKU', NULL, NULL, 'X003CACAU9', 1, 1, 'Birchwood Laboratories', 0, '', 1, 'amazon', NULL),
	(540, 'MR540-15B-20', 'ResOne 15LPM Oxygen Regulator CGA-540#MR540-15B, Adjustable Flow 0-15 LPM - ASTM G175-03 - Aluminum/Brass, Max Inlet: 3000 PSI, Outlet: 50 PSI - Compact 1.38 inches X 6.29 inches - 20 Pcs', 'UPC', '810058514264', NULL, 'B0CQD9XCB2', 0, 0, 'ResOne', 0, '', 3, 'amazon', NULL),
	(541, 'MR540-25B', 'ResOne 25LPM Oxygen Regulator CGA-540#MR540-25B, Adjustable Flow 0-25 LPM - ASTM G175-03 - Aluminum/Brass, Max Inlet: 3000 PSI, Outlet: 50 PSI - Compact 1.38 inches X 6.29 inches', 'UPC', '810058519788', NULL, 'B0CQDBC2HR', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(542, '150-0100', 'Single Cylinder D/E Oxygen Cylinder Cart', 'FNSKU', NULL, NULL, 'X002X7OV45', 1, 0, 'Responsive Respiratory', 0, '', 6, 'amazon', NULL),
	(543, '150-0102', '2 Cylinder D/E Oxygen Cylinder Cart', 'FNSKU', NULL, NULL, 'X00387MLRX', 1, 0, 'Responsive Respiratory', 0, '', 7, 'amazon', NULL),
	(544, 'MR540-25B-20', 'ResOne 25LPM Oxygen Regulator CGA-540#MR540-25B, Adjustable Flow 0-25 LPM - ASTM G175-03 - Aluminum/Brass, Max Inlet: 3000 PSI, Outlet: 50 PSI - Compact 1.38 inches X 6.29 inches - 20 Pcs', 'UPC', '810058514271', NULL, 'B0CQD9D1CK', 0, 0, 'ResOne', 0, '', 3, 'amazon', NULL),
	(545, '150-0110', 'Metal Oxygen Cylinder Wheelchair holder for D/E Cylinders', 'FNSKU', NULL, NULL, 'X002VW4SQN', 1, 0, 'Responsive Respiratory', 0, '', 8, 'amazon', NULL),
	(546, '150-0113', 'CarMate Cylinder Carrier - Holds 3 D or E Oxygen cylinders', 'FNSKU', NULL, NULL, 'X002VFSSHF', 1, 0, 'Responsive Respiratory', 0, '', 9, 'amazon', NULL),
	(547, 'MR870-15B', 'ResOne 15LPM Oxygen Regulator CGA-870#MR870-15B, Adjustable Flow 0-15 LPM - ASTM G175-03 - Aluminum/Brass, Max Inlet: 3000 PSI, Outlet: 50 PSI - Compact 1.38 inches X 4.65 inches', 'UPC', '810058518798', NULL, 'B0BFFTPGKZ', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(548, '150-0115', 'CarMate Cylinder Carrier - Holds 3 M6 Oxygen cylinders', 'FNSKU', NULL, NULL, 'X002VFZIRD', 1, 0, 'Responsive Respiratory', 0, '', 9, 'amazon', NULL),
	(549, 'MR870-25BF', 'ResOne 25LPM Oxygen Regulator CGA-870#MR870-25B, Adjustable Flow 0-25 LPM - ASTM G175-03 - Aluminum/Brass, Max Inlet: 3000 PSI, Outlet: 50 PSI - Compact 1.38 inches X 4.65 inches', 'UPC', '810058517012', NULL, 'B0B4PY41PG', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(550, 'NC-0100-10', 'ResOne Padded Nose Clips - Stops Nosebleeds Fast - for Use in Spirometry Testing and Breathing Treatments - Universal Fit - Disposable - Blue, Pack of 10', 'UPC', '810058517562', NULL, 'B0BFC4WW28', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(551, 'NK-210-100-3F', 'ResOne 3pk Nebulizer Replacement Accessories with Cup, Mouthpiece, Tee, Flex, 7\' Tubing, Connector', 'UPC', '810058519689', NULL, 'B0C9776242', 1, 1, 'ResOne', 1, '', 48, 'amazon', NULL),
	(552, '150-0240', 'D/E Oxygen Cylinder Stand', 'FNSKU', NULL, NULL, 'X002VQGIUX', 1, 0, 'Responsive Respiratory', 0, '', 10, 'amazon', NULL),
	(553, '150-0261F', '6 Cylinder Metal Rack for D/E / M9 Oxygen Cylinders (Rack Only)', 'FNSKU', NULL, NULL, 'X0037NQ8Z9', 1, 0, 'Responsive Respiratory', 0, '', 1, 'amazon', NULL),
	(554, '150-0262', '6 Cylinder Metal Rack for M6 Oxygen Cylinders', 'FNSKU', NULL, NULL, 'X002VQJZDP', 1, 0, 'Responsive Respiratory', 0, '', 1, 'amazon', NULL),
	(555, 'NK-310-100-3F', 'ResOne 3pk Nebulizer Replacement Accessories with Cup, Adult Mask, 7\' Tubing, Connector', 'UPC', '810058519696', NULL, 'B0C977623Y', 1, 1, 'ResOne', 1, '', 51, 'amazon', NULL),
	(556, '150-0265', '8 Cylinder Composite Plastic Rack for D / E /M9 /M7 Oxygen Cylinders', 'FNSKU', NULL, NULL, 'X002VFPSPP', 1, 0, 'Responsive Respiratory', 0, '', 1, 'amazon', NULL),
	(557, 'NK-311-100-3F', 'ResOne 3pk Nebulizer Replacement Accessories with Cup, Kids (Pediatric) Mask, 7\' Tubing, Connector', 'UPC', '810058519702', NULL, 'B0C9748RP6', 1, 1, 'ResOne', 1, '', 48, 'amazon', NULL),
	(558, '150-1100', 'Oxygen Cylinder Tank Shoulder Carry Case for D Oxygen Cylinder', 'FNSKU', NULL, NULL, 'X002WQC49V', 1, 0, 'Responsive Respiratory', 0, '', 11, 'amazon', NULL),
	(559, 'NK-312-100-3F', 'ResOne 3pk Nebulizer Replacement Accessories with Cup, Kids (Pediatric) Dog Mask, 7\' Tubing, Connector', 'UPC', '810058519719', NULL, 'B0C977277R', 1, 1, 'ResOne', 1, '', 51, 'amazon', NULL),
	(560, 'O2U2007C-5', '3B Medical Ultra-Soft 7 Foot Oxygen Cannula (5 Pack) (A) (A) (A)', 'FNSKU', NULL, NULL, 'X003SCH3LH', 1, 0, 'React Health', 0, '', 59, 'amazon', NULL),
	(561, 'OB-870-DP', 'ResOne Portable Aluminum Medical Oxygen Cylinder, D Size, with CGA-870 Post Valve for Medical Use - Non-Sparking, Green Dome, Brushed Finish, 14.3 cf, Ships Empty, Prescription Required to Fill', 'UPC', '810058519177', NULL, 'B0CB9D9ZZ2', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(562, '150-1101', 'Oxygen Cylinder Backpack Carrier for D Oxygen Tanks', 'FNSKU', NULL, NULL, 'X002VFV985', 1, 0, 'Responsive Respiratory', 0, '', 11, 'amazon', NULL),
	(563, '150-1121F', 'M6 / M9 Oxygen Cylinder/Tank Shoulder Carry Case', 'FNSKU', NULL, NULL, 'X002WQ2TUZ', 1, 0, 'Responsive Respiratory', 0, '', 1, 'amazon', NULL),
	(564, '150-1151', 'Backpack Carry Case for M6 and M9 Oxygen Cylinders/tanks', 'FNSKU', NULL, NULL, 'X00387F7G5', 1, 0, 'Responsive Respiratory', 0, '', 11, 'amazon', NULL),
	(565, 'OB-870-DP-US', 'ResOne D Size Aluminum Medical Oxygen Cylinder 14.3 cf with CGA-870 Post Valve (Empty Tank) Made in The USA', 'UPC', '810058516862', NULL, 'B0D1PCYN68', 0, 0, 'ResOne', 0, '', 91, 'amazon', NULL),
	(566, '150-1153', 'Fanny Pack (waist pack) Carry Case for M4 / M6 Oxygen Cylinders', 'FNSKU', NULL, NULL, 'X002VVQH6X', 1, 0, 'Responsive Respiratory', 0, '', 1, 'amazon', NULL),
	(567, '1600HF-14-1', 'SALTER LABS 1600HF-14-25 Salter Labs- Respiratory Division - Cannula, Adult, high Flow, Oxygen with 3-channel Tube 14\' - Product # 1600HF-14-25', 'FNSKU', NULL, NULL, 'X003YWG95H', 1, 0, 'Salter Labs', 0, '', 35, 'amazon', NULL),
	(568, 'OB-870-DT', 'ResOne Portable Aluminum Medical Oxygen Cylinder, D Size, with CGA-870 Toggle Valve for Medical Use - Non-Sparking, Green Dome, Brushed Finish, 14.3 cf, Ships Empty, Prescription Required to Fill', 'UPC', '810058519184', NULL, 'B0CB9D2BQ5', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(569, 'OB-870-DT-US', 'ResOne D Size Aluminum Medical Oxygen Cylinder 14.3 cf with CGA-870 Toggle Valve (Empty Tank) Made in The USA', 'UPC', '810058516879', NULL, 'B0D1P9GWVV', 0, 0, 'ResOne', 0, '', 91, 'amazon', NULL),
	(570, 'OB-870-EP', 'ResOne Portable Aluminum Medical Oxygen Cylinder, E Size, with CGA-870 Post Valve for Medical Use - Non-Sparking, Green Dome, Brushed Finish, 24.1 cf, Ships Empty, Prescription Required to Fill', 'UPC', '810058519795', NULL, 'B0CQDBYCX8', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(571, 'OB-870-EP-US', 'ResOne E Size Aluminum Medical Oxygen Cylinder 24.1 cf with CGA-870 Post Valve (Empty Tank) Made in The USA', 'UPC', '810058516886', NULL, 'B0D1PB7VY9', 0, 0, 'ResOne', 0, '', 92, 'amazon', NULL),
	(572, '1600HF-25-1', 'Salter 1600HF High Flow Nesal Canula with 25 Foot Tubeng', 'FNSKU', NULL, NULL, 'X003YW46CF', 1, 0, 'Salter Labs', 0, '', 1, 'amazon', NULL),
	(573, '1600HF-4-1', 'Salter 1600HF High Flow Canu-ula with 4 Foot Supply Tubng', 'FNSKU', NULL, NULL, 'X003YWCPUP', 1, 0, 'Salter Labs', 0, '', 35, 'amazon', NULL),
	(574, '1600HF-4-1B', 'Salter Labs Nasal Cannula High Flow with 4\' Supply Tube', 'FNSKU', NULL, NULL, 'X003YW46ON', 1, 0, 'Salter Labs', 0, '', 35, 'amazon', NULL),
	(575, 'OB-870-ET', 'ResOne Portable Aluminum Medical Oxygen Cylinder, E Size, with CGA-870 Toggle Valve for Medical Use - Non-Sparking, Green Dome, Brushed Finish, 24.1 cf, Ships Empty, Prescription Required to Fill', 'UPC', '810058519801', NULL, 'B0CQDC6XN8', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(576, '1600HF-4-25', '25pk 4Ft Salter Style High Flow Adult Oxygen Nasal Cannula with Safe 3-Channel Design, Standard Connector #1600HF-4-25', 'FNSKU', NULL, NULL, 'B0CK2P6XSN', 1, 0, 'Salter Labs', 0, '', 3, 'amazon', NULL),
	(577, '1600HF-50-1', 'SALTER LABS 1600HF-14-25 Salter Labs- Respiratory Division - Cannula, Adult, high Flow, Oxygen with 3-channel Tube 14\' - Product # 1600HF-14-25', 'FNSKU', NULL, NULL, 'X003YWCPDR', 1, 0, 'Salter Labs', 0, '', 1, 'amazon', NULL),
	(578, 'OB-870-ET-US', 'ResOne E Size Aluminum Medical Oxygen Cylinder 24.1 cf with CGA-870 Toggle Valve (Empty Tank) Made in The USA', 'UPC', '810058516893', NULL, 'B0D1P9NJZN', 0, 0, 'ResOne', 0, '', 92, 'amazon', NULL),
	(579, 'OC-0100-1', '1pk Adult Oxygen Cannula with Tabbed Nose Piece, Soft Straight Prongs & 6.5Ft Crush Resistant Tubing', 'UPC', '810058517463', NULL, 'B0BFC3ZG38', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(580, 'OC-0100-5', '5pk Adult Oxygen Cannula with Tabbed Nose Piece, Soft Straight Prongs & 6.5Ft Crush Resistant Tubing', 'UPC', '810058517470', NULL, 'B0BFGH38BY', 1, 1, 'ResOne', 0, '', 59, 'amazon', NULL),
	(581, '1600HF-7-1', 'SALTER LABS 1600HF-7-10 Salter Labs- Respiratory Division - Cannula, Adult, high Flow, Oxygen with 3-channel Tube 7\' - Product # 1600HF-7-10', 'FNSKU', NULL, NULL, 'X003YWCORJ', 1, 0, 'Salter Labs', 0, '', 35, 'amazon', NULL),
	(582, '1600HF-7-1B', 'Salter Adult High Flow Cannula 7 FT Tubing 1600HF Y', 'FNSKU', NULL, NULL, 'X003YWG70J', 1, 0, 'Salter Labs', 0, '', 35, 'amazon', NULL),
	(583, 'OC-0200-1', '1pk Pediatric Oxygen Cannula, with Tabbed Nose Piece, Soft Straight Prongs & 6.5Ft Crush Resistant Tubing', 'UPC', '810058517487', NULL, 'B0BFC8KPB1', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(584, '1600HF-7-25', '25pk 7Ft Salter Style High Flow Adult Oxygen Nasal Cannula with Safe 3-Channel Design, Standard Connector #1600HF-7-25', 'FNSKU', NULL, NULL, 'B0CK2MHFWR', 1, 0, 'Salter Labs', 0, '', 3, 'amazon', NULL),
	(585, 'OC-0200-5', '5pk Pediatric Oxygen Cannula, with Tabbed Nose Piece, Soft Straight Prongs & 6.5Ft Crush Resistant Tubing', 'UPC', '810058517494', NULL, 'B0BFGG5WBN', 1, 1, 'ResOne', 0, '', 59, 'amazon', NULL),
	(586, '16SOFT-1-1', '1Ft Salter Style Adult Oxygen Nasal Cannula with Safe 3-Channel Design, Standard Connector #16SOFT-1', 'UPC', '607411919930', NULL, 'B0CK2NDLDH', 1, 0, 'Salter Labs', 0, '', 24, 'amazon', NULL),
	(587, '16SOFT-1-50', '50pk 1Ft Salter Style Adult Oxygen Nasal Cannula with Safe 3-Channel Design, Standard Connector #16SOFT-1-50', 'FNSKU', NULL, NULL, 'B0CK2NF1HJ', 1, 0, 'Salter Labs', 0, '', 3, 'amazon', NULL),
	(588, 'OC-0300-1', '1pk Infant Oxygen Cannula, with Tabbed Nose Piece, Soft Straight Prongs & 6.5Ft Crush Resistant Tubing', 'UPC', '810058517500', NULL, 'B0BFC7F5RQ', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(589, 'OC-0300-100', '100pk Infant Oxygen Cannula, with Tabbed Nose Piece, Soft Straight Prongs & 6.5Ft Crush Resistant Tubing', 'UPC', '810058519863', NULL, 'B0BFC7F5RQ', 1, 0, 'ResOne', 0, '', 3, 'amazon', NULL),
	(590, 'OC-0300-5', '5pk Infant Oxygen Cannula, with Tabbed Nose Piece, Soft Straight Prongs & 6.5Ft Crush Resistant Tubing', 'UPC', '810058517517', NULL, 'B0BFGDTZCC', 1, 1, 'ResOne', 0, '', 59, 'amazon', NULL),
	(591, 'OC-0400-1', '1pk Adult Oxygen Cannula with Soft Curved Prongs & 6.5Ft Crush Resistant Tubing', 'UPC', '810058517289', NULL, 'B0BFC9JB4G', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(592, '16SOFT-14-1', 'Super Soft Nesal Cannula with 14 Foot Oxgn Supply Tubing 6 LPM', 'FNSKU', NULL, NULL, 'X003WPT7D7', 1, 0, 'Salter Labs', 0, '', 24, 'amazon', NULL),
	(593, '16SOFT-14-2', 'Salter 16SOFT Nasal Cannula with 14 Foot Oxgn Supply Tubing (Pack 2)', 'FNSKU', NULL, NULL, 'X003S49OAX', 1, 0, 'Salter Labs', 0, '', 63, 'amazon', NULL),
	(594, '16SOFT-25-1', 'Salter-StyleÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â ÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÂ¢Ã¢â‚¬Å¾Ã‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€šÃ‚Â ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¾Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â ÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã¢â‚¬Â¦Ãƒâ€šÃ‚Â¡ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€šÃ‚Â¦ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¡ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â ÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÂ¢Ã¢â‚¬Å¾Ã‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€¦Ã‚Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¦ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¡ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â ÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã¢â‚¬Â¦Ãƒâ€šÃ‚Â¡ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€¦Ã‚Â¡ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â® 16SOFT Adult Nasal Cannula with 25\' Foot Tubing', 'FNSKU', NULL, NULL, 'X003S3VXET', 1, 0, 'Salter Labs', 0, '', 35, 'amazon', NULL),
	(595, 'OC-0400-100', '100pk Adult Oxygen Cannula with Soft Curved Prongs & 6.5Ft Crush Resistant Tubing', 'UPC', '810058519870', NULL, 'B0BFC9JB4G', 1, 0, 'ResOne', 0, '', 3, 'amazon', NULL),
	(596, '16SOFT-4-1', 'Salter 16SOFT Nasal Cannula with 4 Foot Oxgn Supply Tubing', 'FNSKU', NULL, NULL, 'X003S470E5', 1, 0, 'Salter Labs', 0, '', 24, 'amazon', NULL),
	(597, 'OC-0400-5', '5pk Adult Oxygen Cannula with Soft Curved Prongs & 6.5Ft Crush Resistant Tubing', 'UPC', '810058517296', NULL, 'B0BFGBZSFV', 1, 1, 'ResOne', 0, '', 59, 'amazon', NULL),
	(598, '16SOFT-4-10', 'Salter 16SOFT Nesal Canula with 4 Foot O2 Supply Tubing - 10 Pack Supply Tubing', 'FNSKU', NULL, NULL, 'X003S494G7', 1, 0, 'Salter Labs', 0, '', 46, 'amazon', NULL),
	(599, 'OC-0452-1', 'ResOne Soft Nasal Cannula 1-Pack - Oxygen Cannula, Curved Prongs, 2Ft Crush-Resistant Tubing - Nasal Tubes, Oxygen Concentrator Supplies - Soft Curved Nose Piece, Standard Size, Standard Flow 6 LPM', 'UPC', '810058519733', NULL, 'B0CLWL3L5Y', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(600, 'OC-0452-100', '100pk Adult Oxygen Cannula with Soft Curved Prongs & 2Ft Crush Resistant Tubing', 'UPC', '810058516633', NULL, 'B0D6GQT462', 1, 0, 'ResOne', 0, '', 3, 'amazon', NULL),
	(601, 'OC-0452-5', 'ResOne Soft Nasal Cannula 5-Pack - Oxygen Cannula, Curved Prongs, 2Ft Crush-Resistant Tubing - Nasal Tubes, Oxygen Concentrator Supplies - Soft Curved Nose Piece, Standard Size, Standard Flow 6 LPM', 'UPC', '810058519900', NULL, 'B0CLWH7878', 1, 1, 'ResOne', 0, '', 59, 'amazon', NULL),
	(602, '16SOFT-4-5', 'Salter 16SOFT Nesal Canula with 4 Foot o2 Supply Tubing - 5 Pack', 'FNSKU', NULL, NULL, 'X003S49999', 1, 0, 'Salter Labs', 0, '', 27, 'amazon', NULL),
	(603, '16SOFT-7-5', 'Soft Touch 16SOFT Salter Nasal Cannula with 7 Foot Oxgn Supply Tubing - 5 Pack', 'FNSKU', NULL, NULL, 'X003R7PS7T', 1, 0, 'Salter Labs', 0, '', 27, 'amazon', NULL),
	(604, 'OC-0454-1', 'ResOne Soft Nasal Cannula 1-Pack - Oxygen Cannula, Curved Prongs, 4Ft Crush-Resistant Tubing - Nasal Tubes, Oxygen Concentrator Supplies - Soft Curved Nose Piece, Standard Size, Standard Flow 6 LPM', 'UPC', '810058519740', NULL, 'B0CLWPCZM4', 1, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(605, '16SOFT-HF-14-1', '14Ft Salter Style High Flow Adult Oxygen Nasal Cannula with Safe 3-Channel Design, Standard Connector #16SOFT-HF-14', 'UPC', '607411915864', NULL, 'B0CK2LQJBF', 1, 0, 'Salter Labs', 0, '', 35, 'amazon', NULL),
	(606, '16SOFT-HF-25-1F', 'Salter-StyleÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â ÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÂ¢Ã¢â‚¬Å¾Ã‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€šÃ‚Â ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¾Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â ÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã¢â‚¬Â¦Ãƒâ€šÃ‚Â¡ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€šÃ‚Â¦ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¡ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â ÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÂ¢Ã¢â‚¬Å¾Ã‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€¦Ã‚Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¦ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¡ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â ÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã¢â‚¬Â¦Ãƒâ€šÃ‚Â¡ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€¦Ã‚Â¡ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â®High Flow 16SOFT-HF Adult Nasal Soft Cannula with 25\' Tubing', 'FNSKU', NULL, NULL, 'X003SQJ72V', 1, 0, 'Salter Labs', 0, '', 1, 'amazon', NULL),
	(607, '16SOFT-HF-7-1F', 'High Flow Plus Nesal Cannula with 7 Foot Green Oxgn Supply Tubing', 'FNSKU', NULL, NULL, 'X003S4EYYT', 1, 0, 'Salter Labs', 0, '', 1, 'amazon', NULL),
	(608, 'OC-0454-100', '100pk Adult Oxygen Cannula with Soft Curved Prongs & 4Ft Crush Resistant Tubing', 'UPC', '810058516640', NULL, 'B0D6GSTJYM', 1, 0, 'ResOne', 0, '', 3, 'amazon', NULL),
	(609, 'OC-0454-5', 'ResOne Soft Nasal Cannula 5-Pack - Oxygen Cannula, Curved Prongs, 4Ft Crush-Resistant Tubing - Nasal Tubes, Oxygen Concentrator Supplies - Soft Curved Nose Piece, Standard Size, Standard Flow 6 LPM', 'UPC', '810058519917', NULL, 'B0CLWLMSHH', 1, 1, 'ResOne', 0, '', 59, 'amazon', NULL),
	(610, 'OC-0457-1', 'ResOne Soft Adult Oxygen Nasal Cannula 1-Pack - Curved Prongs, 7Ft Crush-Resistant Tubing - Nasal Tubes, Oxygen Concentrator Supplies - Soft Curved Nose Piece, Standard Size, Standard Flow 6 LPM', 'UPC', '810058514226', NULL, 'X0045MAGSV', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(611, '16SOFT-HF-7-25', '25pk 7Ft Salter Style High Flow Adult Oxygen Nasal Cannula with Safe 3-Channel Design, Standard Connector #16SOFT-HF-7-25', 'FNSKU', NULL, NULL, 'B0CK2PG769', 1, 0, 'Salter Labs', 0, '', 3, 'amazon', NULL),
	(612, 'OC-0457-5', 'ResOne Soft Adult Oxygen Nasal Cannula 5-Pack - Curved Prongs, 7Ft Crush-Resistant Tubing - Nasal Tubes, Oxygen Concentrator Supplies - Soft Curved Nose Piece, Standard Size, Standard Flow 6 LPM', 'UPC', '810058514387', NULL, 'B0CWHKSMHB', 1, 1, 'ResOne', 0, '', 59, 'amazon', NULL),
	(613, '16SOFT-INF-7-1', '7Ft Salter Style Infant Oxygen Nasal Cannula with Safe 3-Channel Design, Standard Connector #16SOFT-INF', 'UPC', '607411952609', NULL, 'B0CJZZHGX9', 1, 0, 'Salter Labs', 0, '', 24, 'amazon', NULL),
	(614, '16SOFT-INF-7-50', '50pk 7Ft Salter Style Infant Oxygen Nasal Cannula with Safe 3-Channel Design, Standard Connector #16SOFT-INF-7-50', 'FNSKU', NULL, NULL, 'B0CK2RMXHS', 1, 0, 'Salter Labs', 0, '', 3, 'amazon', NULL),
	(615, '16SOFT-PED-7-1', '7Ft Salter Style Pediatric Oxygen Nasal Cannula with Safe 3-Channel Design, Standard Connector #16SOFT-PED', 'UPC', '607411918483', NULL, 'B0CK125QHQ', 1, 0, 'Salter Labs', 0, '', 24, 'amazon', NULL),
	(616, '16SOFT-PED-7-50', '50pk 7Ft Salter Style Pediatric Oxygen Nasal Cannula with Safe 3-Channel Design, Standard Connector #16SOFT-PED-7-50', 'FNSKU', NULL, NULL, 'B0CK2P6DFH', 1, 0, 'Salter Labs', 0, '', 3, 'amazon', NULL),
	(617, '16SOFTTG-7-1', '7Ft Salter Style Adult Oxygen Nasal Cannula with Safe 3-Channel Design, Thread Grip Connector #16SOFTTG-7', 'UPC', '607411102288', NULL, 'B0CK18BR3M', 1, 0, 'Salter Labs', 0, '', 24, 'amazon', NULL),
	(618, '16SOFTTG-7-50', '50pk 7Ft Salter Style Adult Oxygen Nasal Cannula with Safe 3-Channel Design, Thread Grip Connector #16SOFTTG-7-50', 'FNSKU', NULL, NULL, 'B0CK2M22BD', 1, 0, 'Salter Labs', 0, '', 3, 'amazon', NULL),
	(619, '180-4205-5', 'No Smoking Oxygen In Use Static cling - 5 PACK', 'FNSKU', NULL, NULL, 'X002WQ744V', 1, 0, 'Responsive Respiratory', 0, '', 13, 'amazon', NULL),
	(620, '180-4215-10', 'Responsive Respiratory No Smoking Door Frame Magnet PK 10 - 180-4215', 'FNSKU', NULL, NULL, 'X002WQC8Z1', 1, 0, 'Responsive Respiratory', 0, '', 1, 'amazon', NULL),
	(621, '0101-1', '1-Pack Westmed #0101 Biflo Nasal Mask with 7\' Kink Resistant Tubing', 'FNSKU', NULL, NULL, 'X002VVOIAF', 1, 0, 'Westmed', 0, '', 35, 'amazon', NULL),
	(622, '0101-5', 'Adult Bi-Flow Oxygen Mask, 5 PACK (Westmed #0101)', 'FNSKU', NULL, NULL, 'X002VFMZ7J', 1, 0, 'Westmed', 0, '', 25, 'amazon', NULL),
	(623, '0106-1', '1-Pack Westmed #0106 Pediflo Nasal Mask with 7\' Kink Resistant Tubing', 'FNSKU', NULL, NULL, 'X002VVUVHJ', 1, 0, 'Westmed', 0, '', 35, 'amazon', NULL),
	(624, '0106-5', 'Pediatric Bi-Flow Oxygen Mask, 5 PACK (Westmed #0106)', 'FNSKU', NULL, NULL, 'X002VVUVXN', 1, 0, 'Westmed', 0, '', 25, 'amazon', NULL),
	(625, '0137-1', '1pk Westmed #0137 Comfort Plus Micro Cannula with 7\' Kink Resistant Tubing', 'FNSKU', NULL, NULL, 'X002VFLYS5', 1, 0, 'Westmed', 0, '', 24, 'amazon', NULL),
	(626, '0137-5', '5-Pack Westmed #0137 Micro Cannula with 7\' Kink Resistant Tubing', 'FNSKU', NULL, NULL, 'X002W4EHD9', 1, 0, 'Westmed', 0, '', 25, 'amazon', NULL),
	(627, '0137-50', '50pk Westmed #0137 Comfort Plus Micro Cannula with 7\' Kink Resistant Tubing', 'FNSKU', NULL, NULL, 'X002VVUXH7', 1, 0, 'Westmed', 0, '', 3, 'amazon', NULL),
	(628, '0210-1', '1-Pack Westmed #0210 VixOne Nebulizer Mouthpiece, Tee, Flex Hose, and 7\' Kink Resistant Tubing', 'FNSKU', NULL, NULL, 'X002VFTGGH', 1, 0, 'VixOne', 0, '', 24, 'amazon', NULL),
	(629, '0210-1S', '1-Pack Westmed #0210 VixOne Nebulizer Mouthpiece, Tee, Flex Hose, and 7\' Kink Resistant Tubing', 'FNSKU', NULL, NULL, 'X003DLSSOJ', 1, 0, 'VixOne', 0, '', 24, 'amazon', NULL),
	(630, '0210-50', 'VixOne, mouthpiece, tee, flex hose, 7 ft. KROT (50 per Case)', 'FNSKU', NULL, NULL, 'X002IPNSVT', 1, 0, 'VixOne', 0, '', 3, 'amazon', NULL),
	(631, '0360-1', '1pk Westmed #0360 Adult Trach Collar Mask', 'FNSKU', NULL, NULL, 'X00387MYMP', 1, 0, 'Westmed', 0, '', 24, 'amazon', NULL),
	(632, 'RES037-1', 'Sunset in-Line Water Trap with Removable End-Caps (RES037)', 'UPC', '848530080433', NULL, 'X0038B1K0N', 1, 0, 'Sunset Healthcare Solutions', 0, '', 83, 'amazon', NULL),
	(633, 'RES037T-1', 'Sunset in-Line Water Trap with Threaded End-Caps (RES037T)', 'UPC', '848530093280', NULL, 'X0038B1K1R', 1, 0, 'Sunset Healthcare Solutions', 0, '', 83, 'amazon', NULL),
	(634, 'RES037T-5', '5pk Sunset in-Line Water Trap with Threaded End-Caps (RES037T)', 'UPC', '810058517920', NULL, 'X0038LRJML', 1, 1, 'ResOne', 0, '', 75, 'amazon', NULL),
	(635, 'RES1007V-1', 'Sunset Healthcare Solutions 7Ft Tabbed Adult Oxygen Nasal Cannula with Kink-Free Supply Tubing (RES1007V Ventlab), Green', 'UPC', '810058517845', NULL, 'X0038LYR1H', 1, 0, 'ResOne', 0, '', 83, 'amazon', NULL),
	(636, 'RES1007V-5', 'Sunset Healthcare Solutions 5pk Sunset 7Ft Tabbed Adult Oxygen Nasal Cannula with Kink-Free Supply Tubing (RES1007V Ventlab) Green', 'UPC', '810058517852', NULL, 'X0038LRJMV', 1, 1, 'ResOne', 0, '', 27, 'amazon', NULL),
	(637, 'RES1104-5', 'Sunset Healthcare Solutions 5pk Sunset 4Ft Adult Oxygen Nasal Cannula with Kink-Free Supply Tubing (RES1104), Clear', 'UPC', '810058517944', NULL, 'X0038LYR0N', 1, 1, 'ResOne', 0, '', 27, 'amazon', NULL),
	(638, 'RES1104S-5', 'Sunset Healthcare Solutions 5pk 4Ft Soft Adult Oxygen Nasal Cannula with Kink-Free Supply Tubing (RES1104S), Clear, 5.0 Count', 'UPC', '810058514202', NULL, 'X003CN4GL7', 1, 1, 'ResOne', 0, '', 27, 'amazon', NULL),
	(639, 'RES1104SHF-1', 'Sunset 4Ft Soft Adult High Flow Oxygen Nasal Cannula with Kink-Free Supply Tubing (RES1104SHF)', 'UPC', '848530089696', NULL, 'X0038B3P0B', 1, 0, 'Sunset Healthcare Solutions', 0, '', 84, 'amazon', NULL),
	(640, 'RES1104SHF-5', 'Sunset Healthcare Solutions 5pk Sunset 4Ft Soft Adult High Flow Oxygen Nasal Cannula with Kink-Free Supply Tubing (RES1104SHF), Green', 'UPC', '810058517982', NULL, 'X0038LRJM1', 1, 1, 'ResOne', 0, '', 60, 'amazon', NULL),
	(641, 'RES1107-5', 'Sunset Healthcare Solutions 5pk Sunset 7Ft Standard Adult Oxygen Nasal Cannula with Kink-Free Supply Tubing (RES1107)', 'UPC', '810058518163', NULL, 'X003A7LJQF', 1, 1, 'ResOne', 0, '', 27, 'amazon', NULL),
	(642, 'RES1107SHF-1', 'Sunset Healthcare Solutions 7Ft Soft Adult High Flow Oxygen Nasal Cannula with Kink-Free Supply Tubing (RES1107SHF), Green', 'UPC', '848530089702', NULL, 'B0B415CSMN', 1, 0, 'Sunset Healthcare Solutions', 0, '', 84, 'amazon', NULL),
	(643, 'RES1107SHF-1F', 'Sunset Healthcare Solutions 7Ft Soft Adult High Flow Oxygen Nasal Cannula with Kink-Free Supply Tubing (RES1107SHF), Green', 'FNSKU', NULL, NULL, 'X0042MNTNX', 1, 0, 'Sunset Healthcare Solutions', 0, '', 84, 'amazon', NULL),
	(644, 'RES1107SHF-5', 'Sunset Healthcare Solutions 5pk 7Ft Soft Adult High Flow Oxygen Nasal Cannula with Kink-Free Supply Tubing (RES1107SHF), Green', 'UPC', '810058518187', NULL, 'X003A7P2F9', 1, 1, 'ResOne', 0, '', 27, 'amazon', NULL),
	(645, 'RES3007-1', 'Sunset 7Ft Clear Kink-Free Safety Oxygen Supply Tubing (RES3007)', 'UPC', '810058518248', NULL, 'B0B413LTRB', 1, 0, 'ResOne', 0, '', 83, 'amazon', NULL),
	(646, 'RES3007-5', '5pk Sunset 7Ft Clear Kink-Free Safety Oxygen Supply Tubing (RES3007)', 'UPC', '810058518200', NULL, 'X003A7P2GN', 1, 0, 'ResOne', 0, '', 27, 'amazon', NULL),
	(647, 'RES3007G-1', 'Sunset 7Ft Green Kink-Free Safety Oxygen Supply Tubing (RES3007G)', 'UPC', '848530061043', NULL, 'X003AB739D', 1, 0, 'Sunset Healthcare Solutions', 0, '', 83, 'amazon', NULL),
	(648, 'RES3007G-1F', 'Sunset 7Ft Green Kink-Free Safety Oxygen Supply Tubing (RES3007G)', 'FNSKU', NULL, NULL, 'B0B41CSJVJ', 1, 0, 'Sunset Healthcare Solutions', 0, '', 83, 'amazon', NULL),
	(649, 'RES3007G-5', '5pk Sunset 7Ft Green Kink-Free Safety Oxygen Supply Tubing (RES3007G)', 'UPC', '810058518224', NULL, 'X003A7QYMT', 1, 1, 'ResOne', 0, '', 27, 'amazon', NULL),
	(650, 'RES3015-1', 'Sunset 15Ft Clear Kink-Free Safety Oxygen Supply Tubing (RES3015)', 'UPC', '848530061050', NULL, 'X0038B738V', 1, 0, 'Sunset Healthcare Solutions', 0, '', 83, 'amazon', NULL),
	(651, 'RES3015-5', '5pk Sunset 15Ft Clear Kink-Free Safety Oxygen Supply Tubing (RES3015)', 'UPC', '810058517968', NULL, 'X0038LW8GN', 1, 0, 'ResOne', 0, '', 28, 'amazon', NULL),
	(652, 'RES3015G-1', 'Sunset 15Ft Green Kink-Free Safety Oxygen Supply Tubing (RES3015G)', 'UPC', '848530061067', NULL, 'X0038AWVQL', 1, 0, 'Sunset Healthcare Solutions', 0, '', 83, 'amazon', NULL),
	(653, 'RES3015G-5', '5pk Sunset 15Ft Green Kink-Free Safety Oxygen Supply Tubing (RES3015G)', 'UPC', '810058517876', NULL, 'X0038LRJNP', 1, 1, 'ResOne', 0, '', 28, 'amazon', NULL),
	(654, 'RES3025-1', 'Sunset 25Ft Clear Kink-Free Safety Oxygen Supply Tubing (RES3025)', 'UPC', '848530061074', NULL, 'X0038B1JUJ', 1, 0, 'Sunset Healthcare Solutions', 0, '', 84, 'amazon', NULL),
	(655, 'RES3025-5', '5pk Sunset 25Ft Clear Kink-Free Safety Oxygen Supply Tubing (RES3025)', 'UPC', '810058518002', NULL, 'X0038M23XZ', 1, 1, 'ResOne', 0, '', 33, 'amazon', NULL),
	(656, 'RES3025G-1', 'Sunset 25Ft Green Kink-Free Safety Oxygen Supply Tubing (RES3025G)', 'UPC', '810058518286', NULL, 'X003AXAFX7', 1, 0, 'ResOne', 0, '', 84, 'amazon', NULL),
	(657, 'RES3025G-5', '5pk Sunset 25Ft Green Kink-Free Safety Oxygen Supply Tubing (RES3025G)', 'UPC', '810058518293', NULL, 'X003AXAHZX', 1, 1, 'ResOne', 0, '', 28, 'amazon', NULL),
	(658, 'RES3040-1', 'Sunset 40Ft Clear Kink-Free Safety Oxygen Supply Tubing (RES3040)', 'UPC', '848530061098', NULL, 'X0038B1K0X', 1, 0, 'Sunset Healthcare Solutions', 0, '', 84, 'amazon', NULL),
	(659, 'RES3040G-1', 'Sunset 40Ft Green Kink-Free Safety Oxygen Supply Tubing (RES3040G)', 'UPC', '848530061104', NULL, 'X0038B706V', 1, 0, 'Sunset Healthcare Solutions', 0, '', 84, 'amazon', NULL),
	(660, 'RES3040G-5', '5pk Sunset 40Ft Green Kink-Free Safety Oxygen Supply Tubing (RES3040G)', 'UPC', '810058518040', NULL, 'X0038LW8IV', 1, 1, 'ResOne', 0, '', 40, 'amazon', NULL),
	(661, 'RES3050G-1', 'Sunset 50Ft Green Kink-Free Safety Oxygen Supply Tubing (RES3050G)', 'UPC', '848530061128', NULL, 'X0038B3P0L', 1, 0, 'Sunset Healthcare Solutions', 0, '', 72, 'amazon', NULL),
	(662, 'RES3050G-5', '5pk Sunset 50Ft Green Kink-Free Safety Oxygen Supply Tubing (RES3050G)', 'UPC', '810058518088', NULL, 'X0038M012Z', 1, 1, 'ResOne', 0, '', 85, 'amazon', NULL),
	(663, 'SO-676-1', 'Salter Labs Oxygen Supply Tubing by Salter Labs, Sltso676, 1 Pound', 'FNSKU', NULL, NULL, 'X003S4F9A7', 1, 0, 'Salter Labs', 0, '', 24, 'amazon', NULL),
	(664, 'SO-676-1A', 'Humidifier adapter 3 channel oxygen tubing, 15in. part no. so-676 (1/ea)', 'FNSKU', NULL, NULL, 'X003S46TYR', 1, 0, 'Salter Labs', 0, '', 24, 'amazon', NULL),
	(665, 'SO-676-5', 'Humidifier Connector Adapter Tube For O2 Concentrator 15in. (Pack of 5)', 'FNSKU', NULL, NULL, 'X003S46L63', 1, 0, 'Salter Labs', 0, '', 59, 'amazon', NULL),
	(666, 'TC-100-3', '3pk Oxygen Tubing Straight Connectors', 'UPC', '810058519054', NULL, 'B0C5SRHVTX', 0, 0, 'ResOne', 0, '', 93, 'amazon', NULL),
	(667, 'TC-100-5', '5pk Oxygen Tubing Straight Connectors', 'UPC', '810058517197', NULL, 'B09YYZ4H8K', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(668, 'TC-110-1', 'ResOne Oxygen Tubing Swivel Connectors 1-Pack - Cannula, Hose, Tube Connectors - Oxygen Line Splitter, Concentrator Supplies - 360-Degree Rotation - Medical, Home, Marine Use - Standard Size', 'UPC', '810058517203', NULL, 'B09YZ39D7N', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(669, 'TC-110-5', 'ResOne Oxygen Tubing Swivel Connectors 5-Pack - Cannula, Hose, Tube Connectors - Oxygen Line Splitter, Concentrator Supplies - 360-Degree Rotation - Medical, Home, Marine Use - Standard Size', 'UPC', '810058517210', NULL, 'B09YYZQVG1', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(670, 'TC-120-1', '1pk Oyxgen Tubing Y Connector', 'UPC', '810058517227', NULL, 'B09YZ3QTYV', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(671, 'TC-120-5', '5pk Oyxgen Tubing Y Connectors', 'UPC', '810058517234', NULL, 'B09YZ3XVHB', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(672, 'TC-130-1', '1pk Oxygen Tubing Swivel Nipple Christmas Tree Connector', 'UPC', '810058517241', NULL, 'B09YZ1SG7V', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(673, 'TC-130-10F', '10pk Oxygen Tubing Swivel Nipple Christmas Tree Connectors', 'UPC', '810058518132', NULL, 'B0B2KT3FYB', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(674, 'TC-130-5', '5pk Oxygen Tubing Swivel Nipple Christmas Tree Connectors', 'UPC', '810058517258', NULL, 'B09YZ12J47', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(675, 'TC-140-1', 'ResOne Oxygen Tubing Swivel Connectors 1-Pack - Nasal Cannula, Hose, Tube Connectors, Oxygen Line Splitter, Concentrator Supplies, 360-Degree Rotation, Medical, Home Use, Standard Size - Male/Female', 'UPC', '810058519009', NULL, 'B0BLDN75YV', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(676, 'TC-140-10', 'ResOne Oxygen Tubing Swivel Connectors 10-Pack, Cannula, Hose, Tube Connectors, Oxygen Line Splitter, Concentrator Supplies, 360-Degree Rotation, Medical, Home, Marine Use, Standard Size - Male/Female', 'UPC', '810058519016', NULL, 'B0BLFNPGCJ', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(677, 'TC-140-5', 'ResOne Oxygen Tubing Swivel Connectors 5-Pack, Cannula, Hose, Tube Connectors, Oxygen Line Splitter, Concentrator Supplies, 360-Degree Rotation, Medical, Home, Marine Use, Standard Size - Male/Female', 'UPC', '810058519023', NULL, 'B0BLDXZ74D', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(678, 'TC-150-1', '1pk Metal Oxygen Tubing Swivel Nipple Christmas Tree Connector', 'UPC', '810058517265', NULL, 'B0B4RTT6NZ', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(679, 'TC-190-1', '8pk Oxygen Tubing Connector Kit (2ea Straight, Swivel, Y, Christmas Tree)', 'UPC', '810058517272', NULL, 'B09YZ3V5P3', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(680, 'TC-200-1', '1pk Oxygen Tubing to 22mm Tubing Adapter Male/Female', 'UPC', '810058519085', NULL, 'B0BW248HGV', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(681, 'TC-200-5', '5pk Oxygen Tubing to 22mm Tubing Adapter Male/Female', 'UPC', '810058519092', NULL, 'B0BW1XK1LD', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(682, 'TC-300-1', '1pk Oxygen Tubing in-Line Water Trap with Removable End Caps', 'UPC', '810058519146', NULL, 'B0BW26GWJW', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(683, 'TC-300-5', '5pk Oxygen Tubing in-Line Water Trap with Removable End Caps', 'UPC', '810058519153', NULL, 'B0BW1XKNTP', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(684, 'TK-1104S-110-5', '5pk 4Ft Sunset-Soft Adult Oxygen Cannula with Swivel Connectors', 'UPC', '810058519481', NULL, 'B0C5F46DMN', 1, 1, 'ResOne', 1, '', 45, 'amazon', NULL),
	(685, 'TK-1104SHF-110-5', '5pk 4Ft Sunset-Soft Adult High Flow Oxygen Cannula with Swivel Connectors', 'UPC', '810058519498', NULL, 'B0C5F2MJY3', 1, 1, 'ResOne', 1, '', 45, 'amazon', NULL),
	(686, 'TK-1107SHF-110-5', '5pk 7Ft Sunset-Soft Adult High Flow Oxygen Cannula with Swivel Connectors', 'UPC', '810058519474', NULL, 'B0C5F4TFS9', 1, 1, 'ResOne', 1, '', 45, 'amazon', NULL),
	(687, 'TK-1600-50-110-2', '2pk 50Ft Salter-Style Soft Adult Oxygen Cannula with Swivel Connectors', 'UPC', '810058519238', NULL, 'B0C47RM6W3', 1, 1, 'ResOne', 1, '', 41, 'amazon', NULL),
	(688, 'TK-16S-1-110-5', '5pk 1Ft Salter-Style Adult Oxygen Cannula with Swivel Connectors', 'UPC', '810058519214', NULL, 'B0C47WH1L4', 1, 1, 'ResOne', 1, '', 45, 'amazon', NULL),
	(689, 'TK-16S-14-110-5', '5pk 14Ft Salter-Style Adult Oxygen Cannula with Swivel Connectors', 'UPC', '810058519344', NULL, 'B0C47NM9KV', 1, 1, 'ResOne', 1, '', 61, 'amazon', NULL),
	(690, 'TK-16S-25-110-2', '2pk 25Ft Salter-Style Adult Oxygen Cannula with Swivel Connectors', 'UPC', '810058519382', NULL, 'B0C4V7NQFJ', 1, 1, 'ResOne', 1, '', 37, 'amazon', NULL),
	(691, 'TK-16S-4-110-5', '5pk 4Ft Salter-Style Adult Oxygen Cannula with Swivel Connectors', 'UPC', '810058519429', NULL, 'B0C5F3S1QL', 1, 1, 'ResOne', 1, '', 27, 'amazon', NULL),
	(692, 'TK-16S-7-110-5', '5pk 7Ft Salter-Style Adult Oxygen Cannula with Swivel Connectors', 'UPC', '810058519443', NULL, 'B0C5F3JBCC', 1, 1, 'ResOne', 1, '', 27, 'amazon', NULL),
	(693, 'TK-16S-HF-14-110-2', '2pk 14Ft Salter-Style Adult High Flow Oxygen Cannula with Swivel Connectors', 'UPC', '810058519368', NULL, 'B0C477TZ8Q', 1, 1, 'ResOne', 1, '', 37, 'amazon', NULL),
	(694, 'TK-16S-HF-25-110-2', '2pk 25Ft Salter-Style Adult High Flow Oxygen Cannula with Swivel Connectors', 'UPC', '810058519375', NULL, 'B0C47LX3SY', 1, 1, 'ResOne', 1, '', 37, 'amazon', NULL),
	(695, 'TK-16S-HF-7-110-5', '5pk 7Ft Salter-Style Adult High Flow Oxygen Cannula with Swivel Connectors', 'UPC', '810058519351', NULL, 'B0C47NP4G3', 1, 1, 'ResOne', 1, '', 61, 'amazon', NULL),
	(696, 'TK-194-110-5', '5pk 4Ft Comfort-Soft-Plus Adult Oxygen Cannula with Swivel Connectors', 'UPC', '810058519412', NULL, 'B0C5F6RDT9', 1, 1, 'ResOne', 1, '', 26, 'amazon', NULL),
	(697, 'TK-2015-110-5', '5pk 15Ft Clear Oxygen Supply Tubing with Swivel Connectors', 'UPC', '810058519320', NULL, 'B0C47T7NP4', 1, 1, 'ResOne', 1, '', 34, 'amazon', NULL),
	(698, 'TK-2025G-110-2', '2pk 25Ft Green Oxygen Supply Tubing with Swivel Connectors', 'UPC', '810058519399', NULL, 'B0C5F5KJ46', 1, 1, 'ResOne', 1, '', 37, 'amazon', NULL),
	(699, 'TK-2050-110-2', '2pk 50Ft Clear Oxygen Supply Tubing with Swivel Connectors', 'UPC', '810058519306', NULL, 'B0C47CQ72T', 1, 1, 'ResOne', 1, '', 41, 'amazon', NULL),
	(700, 'TK-2050G-110-2', '2pk 50Ft Green Oxygen Supply Tubing with Swivel Connectors', 'UPC', '810058519313', NULL, 'B0C47J1MS9', 1, 1, 'ResOne', 1, '', 41, 'amazon', NULL),
	(701, 'TK-25-110-2', '2pk 25Ft Clear Oxygen Supply Tubing with Swivel Connectors', 'UPC', '810058519405', NULL, 'B0C5F6MJVW', 1, 1, 'ResOne', 1, '', 36, 'amazon', NULL),
	(702, 'TK-3007-110-5', '5pk 7Ft Clear Oxygen Supply Tubing with Swivel Connectors', 'UPC', '810058519535', NULL, 'B0C5F5V855', 1, 1, 'ResOne', 1, '', 45, 'amazon', NULL),
	(703, 'TK-3007G-110-5', '5pk 7Ft Green Oxygen Supply Tubing with Swivel Connectors', 'UPC', '810058519542', NULL, 'B0C5F6MJVS', 1, 1, 'ResOne', 1, '', 45, 'amazon', NULL),
	(704, 'TK-3015-110-5', '5pk 15Ft Clear Oxygen Supply Tubing with Swivel Connectors', 'UPC', '810058519559', NULL, 'B0C5F59TBP', 1, 1, 'ResOne', 1, '', 61, 'amazon', NULL),
	(705, 'TK-3015G-110-5', '5pk 15Ft Green Oxygen Supply Tubing with Swivel Connectors', 'UPC', '810058519566', NULL, 'B0C5F6LJJ5', 1, 1, 'ResOne', 1, '', 61, 'amazon', NULL),
	(706, 'TK-3025-110-2', '2pk 25Ft Clear Oxygen Supply Tubing with Swivel Connectors', 'UPC', '810058519573', NULL, 'B0C5F43CJL', 1, 1, 'ResOne', 1, '', 37, 'amazon', NULL),
	(707, 'TK-3025G-110-2', '2pk 25Ft Green Oxygen Supply Tubing with Swivel Connectors', 'UPC', '810058519580', NULL, 'B0C5F3SQYJ', 1, 1, 'ResOne', 1, '', 37, 'amazon', NULL),
	(708, 'TK-3040-110-2', '2pk 40Ft Clear Oxygen Supply Tubing with Swivel Connectors', 'UPC', '810058519597', NULL, 'B0C5F5JJS1', 1, 1, 'ResOne', 1, '', 37, 'amazon', NULL),
	(709, 'TK-3040G-110-2', '2pk 40Ft Green Oxygen Supply Tubing with Swivel Connectors', 'UPC', '810058519603', NULL, 'B0C5F4ZX4L', 1, 1, 'ResOne', 1, '', 37, 'amazon', NULL),
	(710, 'TK-3050-110-2', '2pk 50Ft Clear Oxygen Supply Tubing with Swivel Connectors', 'UPC', '810058519610', NULL, 'B0C5F36Z55', 1, 1, 'ResOne', 1, '', 37, 'amazon', NULL),
	(711, 'TK-3050G-110-2', '2pk 50Ft Green Oxygen Supply Tubing with Swivel Connectors', 'UPC', '810058519627', NULL, 'B0C5F5D57S', 1, 1, 'ResOne', 1, '', 37, 'amazon', NULL),
	(712, 'TK-35-110-2', 'ResOne 2pk 25Ft Oxygen Supply Tubing - Swivel Connectors, Crush Resistant - 360 degree rotation, for Nasal Cannulas, Cannula Nasal Tubing, Oxygen Concentrator - Purple', 'UPC', '810058519207', NULL, 'B0C47JXTNW', 1, 1, 'ResOne', 1, '', 39, 'amazon', NULL),
	(713, 'TK-35-187-110-1F', 'ResOne 5pc 25+7\' Pediatric Soft Oxygen Tubing Replacement Kit, Purple with Swivel Connectors', 'UPC', '810058518637', NULL, 'B0B7R363SS', 1, 0, 'ResOne', 1, '', 4, 'amazon', NULL),
	(714, 'TK-35-194-110-1', 'ResOne 5pc 25+4\' Adult Soft Oxygen Tubing Replacement Kit, Purple with Swivel Connectors', 'UPC', '810058518316', NULL, 'X003BKUCRN', 1, 0, 'ResOne', 1, '', 98, 'amazon', NULL),
	(715, 'TK-35-194-110-1F', 'ResOne 5pc 25+4\' Adult Soft Oxygen Tubing Replacement Kit, Purple with Swivel Connectors', 'UPC', '810058518316', NULL, 'B0B744D1HD', 1, 0, 'ResOne', 1, '', 4, 'amazon', NULL),
	(716, 'TK-35-550-110-1F', 'ResOne 5pc 25+7\' Adult High Flow Soft Oxygen Tubing Replacement Kit, Purple with Swivel Connectors', 'UPC', '810058518552', NULL, 'B0B7PX1JSW', 1, 0, 'ResOne', 1, '', 4, 'amazon', NULL),
	(717, 'TK-35-554-110-1F', 'ResOne 5pc 25+4\' Adult High Flow Soft Oxygen Tubing Replacement Kit, Purple with Swivel Connectors', 'UPC', '810058518477', NULL, 'B0B7QSK994', 1, 0, 'ResOne', 1, '', 4, 'amazon', NULL),
	(718, 'TK-35-556-110-1F', 'ResOne 5pc 25+7\' Adult Soft Oxygen Tubing Replacement Kit, Purple with Swivel Connectors', 'UPC', '810058518392', NULL, 'B0B7QCGKHP', 1, 0, 'ResOne', 1, '', 4, 'amazon', NULL),
	(719, 'TK-400-110-5', '5pk 7Ft ResOne-Soft Adult Oxygen Cannula with Swivel Connectors', 'UPC', '810058519511', NULL, 'B0C5F32W8L', 1, 1, 'ResOne', 1, '', 59, 'amazon', NULL),
	(720, 'TK-55-110-2', 'ResOne 2pk 50Ft Oxygen Supply Tubing - Swivel Connectors, Crush Resistant - 360 degree rotation, for Nasal Cannulas, Cannula Nasal Tubing, Oxygen Concentrator - Purple', 'UPC', '810058519191', NULL, 'B0C47YJDXL', 1, 1, 'ResOne', 1, '', 43, 'amazon', NULL),
	(721, 'TK-55-187-110-1', 'ResOne 5pc 50+7\' Pediatric Soft Oxygen Tubing Replacement Kit, Purple with Swivel Connectors', 'UPC', '810058518675', NULL, 'X003BWI8OF', 1, 0, 'ResOne', 1, '', 98, 'amazon', NULL),
	(722, 'TK-55-194-110-1F', 'ResOne 5pc 50+4\' Adult Soft Oxygen Tubing Replacement Kit, Purple with Swivel Connectors', 'UPC', '810058518354', NULL, 'B0B7P6CTCL', 1, 0, 'ResOne', 1, '', 4, 'amazon', NULL),
	(723, 'TK-55-554-110-1F', 'ResOne 5pc 50+4\' Adult High Flow Soft Oxygen Tubing Replacement Kit, Purple with Swivel Connectors', 'UPC', '810058518514', NULL, 'B0B7R4M4ZX', 1, 0, 'ResOne', 1, '', 4, 'amazon', NULL),
	(724, 'TK-55-556-110-1F', 'ResOne 5pc 50+7\' Adult Soft Oxygen Tubing Replacement Kit, Purple with Swivel Connectors', 'UPC', '810058518439', NULL, 'B0B7P7GCPT', 1, 0, 'ResOne', 1, '', 4, 'amazon', NULL),
	(725, 'TK-556-110-5', '5pk 7Ft Comfort-Soft-Plus Adult Oxygen Cannula with Swivel Connectors', 'UPC', '810058519436', NULL, 'B0C5F5DV6Q', 1, 1, 'ResOne', 1, '', 27, 'amazon', NULL),
	(726, 'TK-589-110-2', '2pk 25Ft Comfort-Soft-Plus Adult Oxygen Cannula with Swivel Connectors', 'UPC', '810058519450', NULL, 'B0C5F6FW8H', 1, 1, 'ResOne', 1, '', 39, 'amazon', NULL),
	(727, 'TK-7-110-5', '5pk 7Ft Clear Oxygen Supply Tubing with Swivel Connectors', 'UPC', '810058519634', NULL, 'B0C5F3VXQ9', 1, 1, 'ResOne', 1, '', 26, 'amazon', NULL),
	(728, 'TK-HCS4504B-110-5', '5pk 4Ft Soft-Touch Adult Oxygen Cannula with Swivel Connectors', 'UPC', '810058519290', NULL, 'B0C47PBT2F', 1, 1, 'ResOne', 1, '', 27, 'amazon', NULL),
	(729, 'TK-HCS4514-110-5', '5pk 7Ft Soft-Touch Adult Oxygen Cannula with Swivel Connectors', 'UPC', '810058519641', NULL, 'B0C5RW1PSQ', 1, 1, 'ResOne', 1, '', 27, 'amazon', NULL),
	(730, 'TK-O2U2007C-110-5', '5pk 7Ft Ultra-Soft Adult Oxygen Cannula with Swivel Connectors', 'UPC', '810058519504', NULL, 'B0C5F44S86', 1, 1, 'ResOne', 1, '', 103, 'amazon', NULL),
	(731, 'TK-O2U2012C-110-5', '5pk 12Ft Ultra-Soft Adult Oxygen Cannula with Swivel Connectors', 'UPC', '810058519337', NULL, 'B0C47L7QHH', 1, 1, 'ResOne', 1, '', 26, 'amazon', NULL),
	(732, 'TK-OT100-110-5', '5pk 7Ft Green Oxygen Supply Tubing with Swivel Connectors', 'UPC', '810058519528', NULL, 'B0C5F5SK71', 1, 1, 'ResOne', 1, '', 81, 'amazon', NULL),
	(733, 'TM-0100-1', '1pk Adult Oxygen Tracheostomy Collar Mask with Swivel Connector', 'UPC', '810058517319', NULL, 'B0BFC5PX72', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(734, 'TM-0100-5', '5pk Adult Oxygen Tracheostomy Collar Mask with Swivel Connector', 'UPC', '810058517326', NULL, 'B0BFGJ3SHD', 1, 1, 'ResOne', 0, '', 4, 'amazon', NULL),
	(735, 'TM-0101-1', '1pk Adult Oxygen Tracheostomy Collar Mask with Swivel Connector & Tubing Adapter', 'UPC', '810058518965', NULL, 'B0BFC6H2T3', 0, 0, 'ResOne', 1, '', 4, 'amazon', NULL),
	(736, 'TM-0101-5', '5pk Adult Oxygen Tracheostomy Collar Mask with Swivel Connector & Tubing Adapter', 'UPC', '810058518972', NULL, 'B0BFGD89X9', 1, 1, 'ResOne', 1, '', 4, 'amazon', NULL),
	(737, 'TM-0200-1', '1pk Pediatric Oxygen Tracheostomy Collar Mask with Swivel Connector', 'UPC', '810058517333', NULL, 'B0BFC7NHZW', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(738, 'TM-0200-5', '5pk Pediatric Oxygen Tracheostomy Collar Mask with Swivel Connector', 'UPC', '810058517340', NULL, 'B0BFGDJ6WY', 1, 1, 'ResOne', 0, '', 75, 'amazon', NULL),
	(739, 'TM-0201-1', '1pk Pediatric Oxygen Tracheostomy Collar Mask with Swivel Connector & Tubing Adapter', 'UPC', '810058518989', NULL, 'B0BFC41P4D', 0, 0, 'ResOne', 1, '', 76, 'amazon', NULL),
	(740, 'TM-0201-5', '5pk Pediatric Oxygen Tracheostomy Collar Mask with Swivel Connector & Tubing Adapter', 'UPC', '810058518996', NULL, 'B0BFGF9JBP', 1, 1, 'ResOne', 1, '', 77, 'amazon', NULL),
	(741, 'TUB0018-1', '18in Durable CPAP Tubing - Gray', 'FNSKU', NULL, NULL, 'X003CD6CRD', 1, 1, 'Sunset Healthcare Solutions', 0, '', 72, 'amazon', NULL),
	(742, 'TUB010-1', '10ft Durable CPAP Tubing - Gray', 'FNSKU', NULL, NULL, 'X003CR1JF9', 1, 0, 'Sunset Healthcare Solutions', 0, '', 4, 'amazon', NULL),
	(743, 'TUB06-1', 'CPAP Tubing 6 Foot Corrugated', 'FNSKU', NULL, NULL, 'B00NH2C2LI', 1, 1, 'Sunset Healthcare Solutions', 0, '', 72, 'amazon', NULL),
	(744, 'TUB06-1F', 'CPAP Tubing 6 Foot Corrugated', 'FNSKU', NULL, NULL, 'X003TKFO1T', 1, 1, 'Sunset Healthcare Solutions', 0, '', 4, 'amazon', NULL),
	(745, 'TUB06-3', '3pk Sunset 6Ft CPAP Tubing 19mm ID with 22mm Cuffs Gray (TUB06)', 'FNSKU', NULL, NULL, 'X003A7P2E5', 1, 1, 'Sunset Healthcare Solutions', 0, '', 97, 'amazon', NULL),
	(746, 'YW-200-25', '25pk Oxygen Regulator Yoke Washer Seals', 'UPC', '810058519030', NULL, 'B0BLDZZQ8W', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(747, 'YW-200-5', '5pk Oxygen Regulator Yoke Washer Seals', 'UPC', '810058519047', NULL, 'B0BLDX339L', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(748, 'YW-300-25', 'ResOne Premium Blue Viton Oxygen Regulator Yoke Washer Seals 25-Pack', 'UPC', '810058519962', NULL, 'B0CST9JBR6', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(749, 'YW-300-5', 'ResOne Premium Blue Viton Oxygen Regulator Yoke Washer Seals 5-Pack', 'UPC', '810058519955', NULL, 'B0CSTCSQHV', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(750, '0360-5', '5-Pack Westmed #0360 Adult Trach Collar Mask', 'FNSKU', NULL, NULL, 'X002W4P841', 1, 0, 'Westmed', 0, '', 27, 'amazon', NULL),
	(751, '0361-1', '1pk Westmed #0361 Pediatric Trach Collar Mask', 'FNSKU', NULL, NULL, 'X00387L94J', 1, 0, 'Westmed', 0, '', 24, 'amazon', NULL),
	(752, '0361-5', 'Westmed 5-Pack 0361 Pediatric Trach Collar Mask', 'FNSKU', NULL, NULL, 'X002W4STJR', 1, 0, 'Westmed', 0, '', 4, 'amazon', NULL),
	(753, '0370-1', '1-Pack Westmed #0370 Medium Concentration Oxygen Mask, Adult with 7\' Kink Resistant Tubing', 'FNSKU', NULL, NULL, 'X002WQC06N', 1, 0, 'Westmed', 0, '', 24, 'amazon', NULL),
	(754, '0370-5', '5-Pack Westmed #0370 Medium Concentration Oxygen Mask, Adult with 7\' Kink Resistant Tubing', 'FNSKU', NULL, NULL, 'X002W3I3L7', 1, 0, 'Westmed', 0, '', 52, 'amazon', NULL),
	(755, '0371-1', '1pk Westmed #0371 Medium Concentration Oxygen Mask, Pediatric with 7\' Kink Resistant Tubing', 'FNSKU', NULL, NULL, 'X00387N5DH', 1, 0, 'Westmed', 0, '', 24, 'amazon', NULL),
	(756, '0375-1', '1-Pack Westmed #0375 Pediatric Super Spike Vented Areosol Mask', 'FNSKU', NULL, NULL, 'X00387CZ0L', 1, 0, 'Westmed', 0, '', 24, 'amazon', NULL),
	(757, '0375-2', 'Pediatric Dog Mask with Pen Included (2 Pack)', 'FNSKU', NULL, NULL, 'X002VW0B5P', 1, 0, 'Westmed', 0, '', 49, 'amazon', NULL),
	(758, '0380-1', '1pk Westmed #0380 Medium Concentration Oxygen Mask, Adult with 8\' Kink Resistant Tubing', 'FNSKU', NULL, NULL, 'X002W3LQVB', 1, 0, 'Westmed', 0, '', 24, 'amazon', NULL),
	(759, '0409-5', 'Westmed #0409 Swivel Barb Nipple Nut (Christmas Tree) Green Oxygen Tubing Connector - Pack of 5', 'FNSKU', NULL, NULL, 'X002VFM3LR', 1, 0, 'Westmed', 0, '', 12, 'amazon', NULL),
	(760, '0409-50', '50pk Westmed #0409 Swivel Barb Nipple Nut (Christmas Tree) Green Oxygen Tubing Connector', 'FNSKU', NULL, NULL, 'X002WNNEL1', 1, 0, 'Westmed', 0, '', 3, 'amazon', NULL),
	(761, '0470-1', '1-Pack Westmed #0470 6\' Corrugated Aerosol Tubing', 'FNSKU', NULL, NULL, 'X002VNEDHL', 1, 0, 'Westmed', 0, '', 24, 'amazon', NULL),
	(762, '0480-0485-1', 'Westmed 6 LPM Humidifier Bottle with 15in. Adapter Tubing', 'FNSKU', NULL, NULL, 'X002W2WNMN', 1, 0, 'Westmed', 1, '', 56, 'amazon', NULL),
	(763, '0480-0485-2', '2-Pack Westmed 6 LPM Dry Humidifier Bottle with 15in. Adapter Tubing', 'FNSKU', NULL, NULL, 'X002W32I3B', 1, 0, 'Westmed', 1, '', 57, 'amazon', NULL),
	(764, '0480-1', '1pk Westmed #0480 Oxygen Humidifier Bottle for Standard Flow up to 6 LPM', 'FNSKU', NULL, NULL, 'X002W3N1IH', 1, 0, 'Westmed', 0, '', 24, 'amazon', NULL),
	(765, '0480-5', '5-Pack Westmed #0480 Dry Humidifier Bottle, up to 6 LPM for Oxygen', 'FNSKU', NULL, NULL, 'X002VVX2G1', 1, 0, 'Westmed', 0, '', 30, 'amazon', NULL),
	(766, '0485-1', '1pk Westmed #0485 Concentrator Humidifier Adapter: 15in. O2 Tubing with Threaded Connector', 'FNSKU', NULL, NULL, 'X002WNLKJJ', 1, 0, 'Westmed', 0, '', 24, 'amazon', NULL),
	(767, '0485-5', '5-Pack Westmed #0485 Concentrator Humidifier Adapter: 15 O2 Tubing with Threaded Connector', 'FNSKU', NULL, NULL, 'X002VNI6ZB', 1, 0, 'Westmed', 0, '', 58, 'amazon', NULL),
	(768, '0485-50', '50pk Westmed #0485 Concentrator Humidifier Adapter: 15in. O2 Tubing with Threaded Connector', 'FNSKU', NULL, NULL, 'X002VFSCUN', 1, 0, 'Westmed', 0, '', 3, 'amazon', NULL),
	(769, '0556-1', '1pk Westmed #0556 Adult Comfort Soft Plus Cannula with 7\' Kink Resistant Tubing', 'FNSKU', NULL, NULL, 'X002VN3B1Z', 1, 0, 'Westmed', 0, '', 24, 'amazon', NULL),
	(770, '0556-10', '10-Pack Westmed #0556 Adult Cannula with 7\' Kink Resistant Tubing', 'FNSKU', NULL, NULL, 'X002W5Z7AZ', 1, 0, 'Westmed', 0, '', 62, 'amazon', NULL),
	(771, '0556-5', 'Adult Ultra Soft Oxygen Cannula, green tubing - 7 Ft (Westmed #0556) pk 5', 'FNSKU', NULL, NULL, 'X002VO96M7', 1, 0, 'Westmed', 0, '', 25, 'amazon', NULL),
	(772, '0556-50', '50-Pack Westmed #0556 Adult Comfort Soft Plus Cannula with 7\' Kink Resistant Tubing', 'FNSKU', NULL, NULL, 'X003RAO5GV', 1, 0, 'Westmed', 0, '', 3, 'amazon', NULL),
	(773, '0556-5A', 'Pretrada WES0556 Westmed Super Soft Nasal Cannula, 7\' Tubing, Pack of 5', 'FNSKU', NULL, NULL, 'X002WMCYPT', 1, 0, 'Westmed', 0, '', 25, 'amazon', NULL),
	(774, '0568-1', '1pk Westmed #0568 Adult Comfort Soft Plus Cannula with 14\' Kink Resistant Tubing & Threaded Nut', 'FNSKU', NULL, NULL, 'X00387T4IH', 1, 0, 'Westmed', 0, '', 24, 'amazon', NULL),
	(775, '0589-1', '1-Pack Westmed #0589 Adult Comfort Soft Plus Cannula with 25\' Kink Resistant Tubing', 'FNSKU', NULL, NULL, 'X002W3HXOF', 1, 0, 'Westmed', 0, '', 35, 'amazon', NULL),
	(776, '0589-5', '5pk Westmed #0589 Adult Comfort Soft Plus Cannula with 25\' Kink Resistant Tubing', 'FNSKU', NULL, NULL, 'X002W3QZP3', 1, 0, 'Westmed', 0, '', 33, 'amazon', NULL),
	(777, '0795-0485-2', '2-Pack Westmed High Flow 6-15 LPM Dry Humidifier Bottle with 15in. Adapter Tubing', 'FNSKU', NULL, NULL, 'X002W2ZPKZ', 1, 0, 'Westmed', 1, '', 71, 'amazon', NULL),
	(778, '0795-1', '1pk Westmed #0795 High Flow Dry Humidifier Bottle, 6 to 15 LPM for Oxygen', 'FNSKU', NULL, NULL, 'X002VW0DNF', 1, 0, 'Westmed', 0, '', 35, 'amazon', NULL),
	(779, '0795-5', '5-Pack Westmed #0795 High Flow Dry Humidifier Bottle, 6 to 15 LPM for Oxygen', 'FNSKU', NULL, NULL, 'X002VVQEIJ', 1, 0, 'Westmed', 0, '', 30, 'amazon', NULL),
	(780, '1016-0-10', '10 Packs of Salter Labs EZ Wrap TLC Nasal Oxygen Cannula Ear Cushions REF# 1016', 'FNSKU', NULL, NULL, 'X003QV0COF', 1, 0, 'Salter Labs', 0, '', 55, 'amazon', NULL),
	(781, '1016-0-2', 'Salter Labs Sa1016 E-Z Wrap,Soft, Closed Cell Foam Tubes, Gray Color,Salter Labs - Pair 2', 'FNSKU', NULL, NULL, 'X003S42NSD', 1, 0, 'Salter Labs', 0, '', 53, 'amazon', NULL),
	(782, '1016-0-5', '5 Packs of Salter Labs EZ Wrap TLC Nasal Oxygen Cannula Ear Cushions REF# 1016', 'FNSKU', NULL, NULL, 'X003YQYZGN', 1, 0, 'Salter Labs', 0, '', 54, 'amazon', NULL),
	(783, '1016-0-50', '50pk Salter Labs E-Z Wraps for Oxygen Nasal Cannula, Prevents Ear Chafing and Soreness #1016-0-50', 'FNSKU', NULL, NULL, 'B0CK2QL556', 1, 0, 'Salter Labs', 0, '', 3, 'amazon', NULL),
	(784, '120-1000C-CONV', '3 LPM Pediatric Oxygen Regulator CGA-870 with Barb Outlet and Decimal Flows & Conversion by Responsive Respiratory #120-1000C-CONV', 'FNSKU', NULL, NULL, 'X002VIYDHV', 1, 0, 'Responsive Respiratory', 0, '', 2, 'amazon', NULL),
	(785, '120-1010C', '8 LPM Oxygen Regulator CGA-870 with Barb Outlet by Responsive Respiratory #120-1010C', 'FNSKU', NULL, NULL, 'X002VIYS3F', 1, 0, 'Responsive Respiratory', 0, '', 2, 'amazon', NULL),
	(786, '120-1030C', '8 LPM Oxygen Oxygen Regulator CGA-540 with DISS Outlet by Responsive Respiratory #120-1030C', 'FNSKU', NULL, NULL, 'X002VIYJY3', 1, 0, 'Responsive Respiratory', 0, '', 2, 'amazon', NULL),
	(787, '120-1031C', '8 LPM Oxygen Regulator CGA-540 with Barb Outlet by Responsive Respiratory #120-1031C', 'FNSKU', NULL, NULL, 'X002VIQD0B', 1, 0, 'Responsive Respiratory', 0, '', 2, 'amazon', NULL),
	(788, '180-4215-5', 'No Smoking Oxygen In Use Magnet - 5 PACK', 'FNSKU', NULL, NULL, 'X002VFVEY9', 1, 0, 'Responsive Respiratory', 0, '', 14, 'amazon', NULL),
	(789, '180-5004', 'Pediatric Flow O2 Liter Meter (0-2.5 LPM) to Measure Oxygen by Responsive Respiratory', 'FNSKU', NULL, NULL, 'X002VFNIJN', 1, 0, 'Responsive Respiratory', 0, '', 1, 'amazon', NULL),
	(790, '180-5005', 'Standard Flow O2 Liter Meter (1-8 LPM) to Measure Oxygen by Responsive Respiratory', 'FNSKU', NULL, NULL, 'X002VFVH4V', 1, 0, 'Responsive Respiratory', 0, '', 1, 'amazon', NULL),
	(791, '180-5006F', 'High Flow O2 Liter Meter (2-15 LPM) to Measure Oxygen by Responsive Respiratory', 'FNSKU', NULL, NULL, 'X002VWGR49', 1, 0, 'Responsive Respiratory', 0, '', 1, 'amazon', NULL),
	(792, '200-0122-25', 'Oxygen Tank Regulator Brass Yoke Washer Seals by Responsive Respiratory - Pack of 25', 'FNSKU', NULL, NULL, 'X002VOKFAT', 1, 0, 'Responsive Respiratory', 0, '', 5, 'amazon', NULL),
	(793, '200-0122-5', 'Yoke Washer - O Ring Brass/viton for use with Oxygen Regulators, 5 Pack', 'FNSKU', NULL, NULL, 'X002WNKBFD', 1, 0, 'Responsive Respiratory', 0, '', 16, 'amazon', NULL),
	(794, '200-0150-1', '1-Pack Metal Oxygen Cylinder E Wrench with On/Off Arrows', 'FNSKU', NULL, NULL, 'X002VVS3CT', 1, 0, 'Responsive Respiratory', 0, '', 19, 'amazon', NULL),
	(795, '200-0150-5', 'Responsive Respiratory 5pk Metal Oxygen Cylinder E Wrench with On/Off Arrows', 'FNSKU', NULL, NULL, 'X002VFZ7H9', 1, 0, 'Responsive Respiratory', 0, '', 20, 'amazon', NULL),
	(796, '200-0160-1', 'Oxygen Cylinder Wrench Made with Durable ABS Plastic by Responsive Respiratory-1', 'FNSKU', NULL, NULL, 'X00387MXDZ', 1, 0, 'Responsive Respiratory', 0, '', 19, 'amazon', NULL),
	(797, '200-0160-5', '5-Pack Oxygen Cylinder Wrench Made with Durable ABS Plastic by Responsive Respiratory', 'FNSKU', NULL, NULL, 'X002WNR9H1', 1, 0, 'Responsive Respiratory', 0, '', 12, 'amazon', NULL),
	(798, '200-0172-5', '5-Pack Oxygen Cylinder Wrench with Chain and 2 Brass Viton Yoke Washer Seals', 'FNSKU', NULL, NULL, 'X002UL8181', 1, 0, 'Responsive Respiratory', 0, '', 12, 'amazon', NULL),
	(799, '200-0175-1', 'Oxygen Cylinder Wrenches with Bungee Cords Made with Durable ABS Plastic', 'FNSKU', NULL, NULL, 'X002UFPBUX', 1, 0, 'Responsive Respiratory', 0, '', 22, 'amazon', NULL),
	(800, '200-0175-5F', 'Plastic E Cylinder Oxygen Wrench - with on/Off Arrows and Bungee Cord, 5 PK', 'FNSKU', NULL, NULL, 'X002VWGFHD', 1, 0, 'Responsive Respiratory', 0, '', 21, 'amazon', NULL),
	(801, '200-0177-1F', 'Oxygen Cylinder Wrench with Bungee & 2 Brass Yoke Washer Seals for O-Ring Replacement on O2 Regulators', 'FNSKU', NULL, NULL, 'X002VWGEI3', 1, 0, 'Responsive Respiratory', 0, '', 22, 'amazon', NULL),
	(802, '200-0177-5', '5-Pack Oxygen Cylinder Wrenches, Each with Bungee & 2 Brass Yoke Washer Seals for O-Ring Replacement on O2 Regulators', 'FNSKU', NULL, NULL, 'X002VFUBK7', 1, 0, 'Responsive Respiratory', 0, '', 21, 'amazon', NULL),
	(803, '200-0180-1', 'Metal Oxygen CGA-540 Cylinder Wrench by Responsive Respiratory', 'FNSKU', NULL, NULL, 'X002VVSCI9', 1, 0, 'Responsive Respiratory', 0, '', 5, 'amazon', NULL),
	(804, '2002-7-20F', 'Salter Labs Oxygen Tubing 7\'- 2002-7 (20 Pack)', 'FNSKU', NULL, NULL, 'X0041FM25R', 1, 0, 'Salter Labs', 0, '', 31, 'amazon', NULL),
	(805, '2002-7-20M', 'Salter Labs Oxygen Tubing 7\'- 2002-7 (20 Pack)', 'FNSKU', NULL, NULL, 'X0041FM25R', 0, 0, 'Salter Labs', 0, '', 31, 'amazon', NULL),
	(806, '2002-7-50', '50pk 7Ft Salter Style Oxygen Supply Tubing with Safe 3-Channel Design, Standard Connectors #2002-7-50', 'FNSKU', NULL, NULL, 'B0CK2MYYSJ', 1, 0, 'Salter Labs', 0, '', 3, 'amazon', NULL),
	(807, '2014-14-1', 'SA2014EA - Salter Labs 14 Oxygen Supply Tubing', 'FNSKU', NULL, NULL, 'X003YWGDD5', 1, 0, 'Salter Labs', 0, '', 24, 'amazon', NULL),
	(808, '2025-25-1', '25\' Oxygen Tubing,Safety Channel,Clear,Each', 'FNSKU', NULL, NULL, 'X003YW9ENB', 1, 0, 'Salter Labs', 0, '', 35, 'amazon', NULL),
	(809, '2025G-25-1', 'Salter Labs Three-Channel Oxygen Supply Tubing-Tubing Length: 25\' (7.32 m) Color: Green - UOM = Each 1', 'FNSKU', NULL, NULL, 'X003QVA7YF', 1, 0, 'Salter Labs', 0, '', 35, 'amazon', NULL),
	(810, '2050-50-1', '50\' Oxygen Supply Tube, Safety Channel', 'FNSKU', NULL, NULL, 'X003S42J7D', 1, 0, 'Salter Labs', 0, '', 1, 'amazon', NULL),
	(811, '220-1570-5', 'Tubing Connector for Oxygen Tubing - Straight, Male to Male - 5 Pack', 'FNSKU', NULL, NULL, 'X002WMNMR3', 1, 0, 'Responsive Respiratory', 0, '', 16, 'amazon', NULL),
	(812, 'OC-0464-1', 'ResOne Soft Adult Oxygen Nasal Cannula 1-Pack - Curved Prongs, 14Ft Crush-Resistant Tubing - Nasal Tubes, Oxygen Concentrator Supplies - Soft Curved Nose Piece, Standard Size, Standard Flow 6 LPM', 'UPC', '810058514318', NULL, 'B0D1ZZW6RX', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(813, 'OC-0464-5', 'ResOne Soft Adult Oxygen Nasal Cannula 5-Pack - Curved Prongs, 14Ft Crush-Resistant Tubing - Nasal Tubes, Oxygen Concentrator Supplies - Soft Curved Nose Piece, Standard Size, Standard Flow 6 LPM', 'UPC', '810058516800', NULL, 'B0D1ZZMKXR', 1, 1, 'ResOne', 0, '', 27, 'amazon', NULL),
	(814, 'OC-0475-1', 'ResOne Soft Adult Oxygen Nasal Cannula 1-Pack - Curved Prongs, 25Ft Crush-Resistant Tubing - Nasal Tubes, Oxygen Concentrator Supplies - Soft Curved Nose Piece, Standard Size, Standard Flow 6 LPM', 'UPC', '810058514325', NULL, 'B0D219SPSH', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(815, 'OC-0475-5', 'ResOne Soft Adult Oxygen Nasal Cannula 5-Pack - Curved Prongs, 25Ft Crush-Resistant Tubing - Nasal Tubes, Oxygen Concentrator Supplies - Soft Curved Nose Piece, Standard Size, Standard Flow 6 LPM', 'UPC', '810058516817', NULL, 'B0D21173CL', 1, 1, 'ResOne', 0, '', 79, 'amazon', NULL),
	(816, 'OC-0500-1', '1pk Pediatric Oxygen Cannula with Soft Curved Prongs & 6.5Ft Crush Resistant Tubing', 'UPC', '810058517524', NULL, 'B0BFC86MKQ', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(817, 'OC-0500-100', '100pk Pediatric Oxygen Cannula with Soft Curved Prongs & 6.5Ft Crush Resistant Tubing', 'UPC', '810058519887', NULL, 'B0BFC86MKQ', 1, 0, 'ResOne', 0, '', 3, 'amazon', NULL),
	(818, 'OC-0500-5', '5pk Pediatric Oxygen Cannula with Soft Curved Prongs & 6.5Ft Crush Resistant Tubing', 'UPC', '810058517531', NULL, 'B0BFGF194Y', 1, 1, 'ResOne', 0, '', 59, 'amazon', NULL),
	(819, 'OC-0557-1', 'ResOne Soft Pediatric Oxygen Nasal Cannula 1-Pack - Curved Prongs, 7Ft Crush-Resistant Tubing - Nasal Tubes, Oxygen Concentrator Supplies - Soft Curved Nose Piece, Standard Size, Standard Flow 6 LPM', 'UPC', '810058514233', NULL, 'B0CWJ1XH4J', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(820, 'OC-0557-5', 'ResOne Soft Pediatric Oxygen Nasal Cannula 5-Pack - Curved Prongs, 7Ft Crush-Resistant Tubing - Nasal Tubes, Oxygen Concentrator Supplies - Soft Curved Nose Piece, Standard Size, Standard Flow 6 LPM', 'UPC', '810058514394', NULL, 'B0CWHJY9VP', 1, 1, 'ResOne', 0, '', 59, 'amazon', NULL),
	(821, 'OC-0600-1', '1pk Infant Oxygen Cannula with Soft Curved Prongs & 6.5Ft Crush Resistant Tubing', 'UPC', '810058517548', NULL, 'B0BFC6L97R', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(822, 'OC-0600-100', '100pk Infant Oxygen Cannula with Soft Curved Prongs & 6.5Ft Crush Resistant Tubing', 'UPC', '810058519894', NULL, 'B0BFC6L97R', 1, 0, 'ResOne', 0, '', 3, 'amazon', NULL),
	(823, '220-1571-1', 'Y Oxygen Tubing Connector (Each)', 'FNSKU', NULL, NULL, 'X00387CR5T', 1, 0, 'Responsive Respiratory', 0, '', 18, 'amazon', NULL),
	(824, 'OC-0600-5', '5pk Infant Oxygen Cannula with Soft Curved Prongs & 6.5Ft Crush Resistant Tubing', 'UPC', '810058517555', NULL, 'B0BFGD92DK', 1, 1, 'ResOne', 0, '', 59, 'amazon', NULL),
	(825, 'OC-0657-1', 'ResOne Soft Infant Oxygen Nasal Cannula 1-Pack - Curved Prongs, 7Ft Crush-Resistant Tubing - Nasal Tubes, Oxygen Concentrator Supplies - Soft Curved Nose Piece, Standard Size, Standard Flow 6 LPM', 'UPC', '810058514240', NULL, 'B0CWHL9NZS', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(826, 'OC-0657-5', 'ResOne Soft Infant Oxygen Nasal Cannula 5-Pack - Curved Prongs, 7Ft Crush-Resistant Tubing - Nasal Tubes, Oxygen Concentrator Supplies - Soft Curved Nose Piece, Standard Size, Standard Flow 6 LPM', 'UPC', '810058514400', NULL, 'B0CWHL1GZR', 1, 1, 'ResOne', 0, '', 59, 'amazon', NULL),
	(827, 'OC-0702-1', 'ResOne High Flow Adult Oxygen Cannula - Soft Curved Prongs, 2Ft Tubing - Nasal Cannula for Oxygen Concentrator, Soft Nasal Cannula, Oxygen Cannula, Oxygen Tubing Accessories - 1 Pack', 'UPC', '810058519757', NULL, 'B0CLWPNS1P', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(828, 'OC-0702-100', '100pk High Flow Adult Oxygen Cannula with Soft Curved Prongs & 2Ft Crush Resistant Tubing', 'UPC', '810058516657', NULL, 'B0D6GT3HBH', 1, 0, 'ResOne', 0, '', 3, 'amazon', NULL),
	(829, '34-7021-12-1', 'Scopettes Jr. 8in. Large Tip Applicator Swabs 100/bx', 'FNSKU', NULL, NULL, 'X0037EYXCN', 1, 1, 'Birchwood Laboratories', 0, '', 5, 'amazon', NULL),
	(830, 'OC-0702-5', 'ResOne High Flow Adult Oxygen Cannula - Soft Curved Prongs, 2Ft Tubing - Nasal Cannula for Oxygen Concentrator, Soft Nasal Cannula, Oxygen Cannula, Oxygen Tubing Accessories - 5 Pack', 'UPC', '810058519924', NULL, 'B0D6GT3HBH', 1, 1, 'ResOne', 0, '', 59, 'amazon', NULL),
	(831, '34-7023-12-1', 'Birchwood Laboratories 34-7023-12 Single Ended Swab, Plastic Handle , Box, 100, Swabs, Box of 100 Swabs, 16in.', 'FNSKU', NULL, NULL, 'X0037ETK8Z', 1, 1, 'Birchwood Laboratories', 0, '', 5, 'amazon', NULL),
	(832, 'OC-0704-1', 'ResOne 4Ft High Flow Adult Oxygen Nasal Cannula 1-Pack - Soft Curved Prongs, Crush-Resistant Tubing - Oxygen Concentrator Supplies - Soft Curved Nose Piece, Standard Size, High Flow 15 LPM', 'UPC', '810058519764', NULL, 'B0CLWR99B3', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(833, 'OC-0704-100', '100pk High Flow Adult Oxygen Cannula with Soft Curved Prongs & 4Ft Crush Resistant Tubing', 'UPC', '810058516664', NULL, 'B0D6GSP5VR', 1, 0, 'ResOne', 0, '', 3, 'amazon', NULL),
	(834, 'OC-0704-5', 'ResOne High Flow Adult Oxygen Cannula - Soft Curved Prongs, 4Ft Tubing - Nasal Cannula for Oxygen Concentrator, Soft Nasal Cannula, Oxygen Cannula, Oxygen Tubing Accessories - 5 Pack', 'UPC', '810058519931', NULL, 'B0D6GSP5VR', 1, 1, 'ResOne', 0, '', 59, 'amazon', NULL),
	(835, '47360-0172-01-1', 'Microspacer Spacer for Kids and Adults', 'FNSKU', NULL, NULL, 'X003NZ0UDH', 1, 1, 'Microspacer', 0, '', 72, 'amazon', NULL),
	(836, 'OC-0707-1', 'ResOne 7Ft High Flow Adult Oxygen Nasal Cannula 1-Pack - Soft Curved Prongs, Crush-Resistant Tubing - Oxygen Concentrator Supplies - Soft Curved Nose Piece, Standard Size, High Flow 15 LPM', 'UPC', '810058514257', NULL, 'B0CWHYDBL7', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(837, '47360-0172-02-1', 'MicroChamber for Metered Dose Inhalers (MDI)', 'FNSKU', NULL, NULL, 'X0048WT94F', 1, 1, 'Microchamber', 0, '', 72, 'amazon', NULL),
	(838, 'OC-0707-5', 'ResOne 7Ft High Flow Adult Oxygen Nasal Cannula 5-Pack - Soft Curved Prongs, Crush-Resistant Tubing - Oxygen Concentrator Supplies - Soft Curved Nose Piece, Standard Size, High Flow 15 LPM', 'UPC', '810058514417', NULL, 'B0CX74XBJC', 1, 1, 'ResOne', 0, '', 59, 'amazon', NULL),
	(839, 'OC-0714-1', 'ResOne 14Ft High Flow Adult Oxygen Nasal Cannula 1-Pack - Soft Curved Prongs, Crush-Resistant Tubing - Oxygen Concentrator Supplies - Soft Curved Nose Piece, Standard Size, High Flow 15 LPM', 'UPC', '810058514332', NULL, 'B0D1ZVNQ8Y', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(840, '7001-0-1', 'Water Trap For O2 Tubing Threaded End Cap Part No 7001 0 25 1ea', 'FNSKU', NULL, NULL, 'X003QVAT1V', 1, 0, 'Salter Labs', 0, '', 35, 'amazon', NULL),
	(841, 'OC-0714-5', 'ResOne 14Ft High Flow Adult Oxygen Nasal Cannula 5-Pack - Soft Curved Prongs, Crush-Resistant Tubing - Oxygen Concentrator Supplies - Soft Curved Nose Piece, Standard Size, High Flow 15 LPM', 'UPC', '810058516787', NULL, 'B0D21B22Q9', 1, 1, 'ResOne', 0, '', 80, 'amazon', NULL),
	(842, '7001-0-25', '25pk Salter Labs Inline Water Trap with Threaded End-Caps #7001-0-25', 'FNSKU', NULL, NULL, 'B0CK2QWQPH', 1, 0, 'Salter Labs', 0, '', 3, 'amazon', NULL),
	(843, 'OC-0725-1', 'ResOne 25Ft High Flow Adult Oxygen Nasal Cannula 1-Pack - Soft Curved Prongs, Crush-Resistant Tubing - Oxygen Concentrator Supplies - Soft Curved Nose Piece, Standard Size, High Flow 15 LPM', 'UPC', '810058514349', NULL, 'B0D218H9YM', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(844, '7001-0-5', 'Salter Inline Water Trap - pack of 5', 'FNSKU', NULL, NULL, 'X003QV6NAR', 1, 0, 'Salter Labs', 0, '', 25, 'amazon', NULL),
	(845, 'OC-0725-5', 'ResOne 25Ft High Flow Adult Oxygen Nasal Cannula 5-Pack - Soft Curved Prongs, Crush-Resistant Tubing - Oxygen Concentrator Supplies - Soft Curved Nose Piece, Standard Size, High Flow 15 LPM', 'UPC', '810058516794', NULL, 'B0D1ZSCJKH', 1, 1, 'ResOne', 0, '', 79, 'amazon', NULL),
	(846, 'OC-16S-0-10', 'ResOne 10pk Adult Oxygen Nasal Cannula Harness Only, Salter Style 2 Inch Male Connector', 'UPC', '810058516619', NULL, 'B0D7N2TKPR', 1, 0, 'ResOne', 0, '', 60, 'amazon', NULL),
	(847, 'OM-0100-1', '1pk Adult Oxygen Mask with 6.8Ft Crush Resistant Tubing', 'UPC', '810058517593', NULL, 'B0BFC5T82W', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(848, '7600-0-1', 'Salter Labs 350 Cc Bubble Humidifier - Dry', 'FNSKU', NULL, NULL, 'X003S495C5', 1, 0, 'Salter Labs', 0, '', 24, 'amazon', NULL),
	(849, '7600-676-2', '2pk Oxygen Therapy Bubble Humidifier Standard Flow with 15in. Adapter Tubing', 'UPC', '810058519245', NULL, 'B0C47956KM', 1, 0, 'ResOne', 1, '', 57, 'amazon', NULL),
	(850, 'OM-0100-5', '5pk Adult Oxygen Mask with 6.8Ft Crush Resistant Tubing', 'UPC', '810058517609', NULL, 'B0BFGBYWV8', 1, 1, 'ResOne', 0, '', 28, 'amazon', NULL),
	(851, '7900-0-1', 'Salter Labs HIGH FLOW Oxygen Bubbler Bottle - Humidity for Oxygen Therapy', 'FNSKU', NULL, NULL, 'X003S49BLZ', 1, 0, 'Salter Labs', 0, '', 1, 'amazon', NULL),
	(852, 'OM-0150-1', '1 Pack Adult Elongated Oxygen Mask with 6.8 ft. Crush-Resistant Tubing', 'UPC', '810058517579', NULL, 'B0BFC61KST', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(853, '7900-676-2', '2pk Oxygen Therapy Bubble Humidifier High Flow with 15in. Adapter Tubing', 'UPC', '810058519269', NULL, 'B0C47PMFSV', 1, 0, 'ResOne', 1, '', 57, 'amazon', NULL),
	(854, 'OM-0150-5', '5pk Adult Elongated Oxygen Mask with 6.8Ft Crush Resistant Tubing', 'UPC', '810058517586', NULL, 'B0BFGF1B6B', 1, 1, 'ResOne', 0, '', 28, 'amazon', NULL),
	(855, '8660-7-1', 'SALTER LABS 8660-7-50 Salter Labs- Respiratory Division - Nebulizer, NebuTech HDN, with  2 one-Way valves, Mouthpiece, 7\' Tube - Product # 8660-7-50', 'FNSKU', NULL, NULL, 'X002J6DQUP', 1, 0, 'Salter Labs', 0, '', 24, 'amazon', NULL),
	(856, 'OM-0200-1', '1pk Pediatric Oxygen Mask with 6.8Ft Crush Resistant Tubing', 'UPC', '810058517630', NULL, 'B0BFC31Z7B', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(857, 'OM-0200-5', '5pk Pediatric Oxygen Mask with 6.8Ft Crush Resistant Tubing', 'UPC', '810058517647', NULL, 'B0BFGF42PV', 1, 1, 'ResOne', 0, '', 27, 'amazon', NULL),
	(858, 'OM-0250-1', '1pk Pediatric Elongated Oxygen Mask with 6.8Ft Crush Resistant Tubing', 'UPC', '810058517616', NULL, 'B0BFC7FY9M', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(859, '92501-1', 'B-Sure Pre-Moistened Witch Hazel Towelettes - (20 Pack)', 'FNSKU', NULL, NULL, 'X0037SGBWJ', 1, 1, 'Birchwood Laboratories', 0, '', 1, 'amazon', NULL),
	(860, '92505-1', 'B-Sure Pre-Moistened Witch Hazel Pads, 40 Count', 'FNSKU', NULL, NULL, 'X0037SKYI1', 1, 1, 'Birchwood Laboratories', 0, '', 1, 'amazon', NULL),
	(861, '94201-1', 'LiquiCell Shear Point Bandages, CPAP Nasal Pads, Box, 100 Bandages, Small', 'FNSKU', NULL, NULL, 'X003CD0XUF', 1, 1, 'Birchwood Laboratories', 0, '', 2, 'amazon', NULL),
	(862, '94204-1', 'LiquiCell Shear Point Bandages, CPAP Nasal Pads, Box, 100 Bandages, Medium', 'FNSKU', NULL, NULL, 'X003CD0YIL', 1, 1, 'Birchwood Laboratories', 0, '', 2, 'amazon', NULL),
	(863, '9996-1-1', '1Ft Salter Style Oxygen Humidifier Bottle Adapter Tubing with Safe 3-Channel Design #9996-1', 'UPC', '607411005480', NULL, 'X003CD0YIL', 1, 0, 'Salter Labs', 0, '', 35, 'amazon', NULL),
	(864, '9996-1-25', '25pk 1Ft Salter Style Oxygen Humidifier Bottle Adapter Tubing with Safe 3-Channel Design #9996-1-25', 'FNSKU', NULL, NULL, 'X003CD0YIL', 1, 0, 'Salter Labs', 0, '', 3, 'amazon', NULL),
	(865, '9996-1-5', 'Salter Labs 9996-1 Humidifier Connector Adapter Tube For O2 Concentrator 12in. (Pack of 5)', 'FNSKU', NULL, NULL, 'X003CD0YIL', 1, 0, 'Salter Labs', 0, '', 59, 'amazon', NULL),
	(866, 'AM-0105-1', 'ResOne Large Adult Cushion Face Mask with Hook Ring & Valve #AM-0105', 'UPC', '810058517678', NULL, 'B0CSTB1BSL', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(867, 'AM-0105-100', 'ResOne Large Adult Cushion Face Mask with Hook Ring & Valve #AM-0105-100pk', 'UPC', '810058514356', NULL, 'B0CSV54YFQ', 0, 0, 'ResOne', 0, '', 3, 'amazon', NULL),
	(868, 'BA-0100', '8pc Vented Berman Oral Airway Kit, Sizes #4-#11', 'UPC', '810058517661', NULL, 'B0BFGP3H6C', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(869, 'BF1001-1', 'EverFlo Intake Filter', 'FNSKU', NULL, NULL, 'X0041J1GNH', 1, 1, 'Sunset Healthcare Solutions', 0, '', 83, 'amazon', NULL),
	(870, 'OM-0250-5', '5pk Pediatric Elongated Oxygen Mask with 6.8Ft Crush Resistant Tubing', 'UPC', '810058517623', NULL, 'B0BFGF7X7T', 1, 1, 'ResOne', 0, '', 27, 'amazon', NULL),
	(871, 'CB-100-DSF', 'ResOne D Oxygen Cylinder Shoulder Bag #CB-100-DS', 'UPC', '810058517029', NULL, 'B0B5NQFLQW', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(872, 'CB-200-DEC', 'ResOne Medical Oxygen Cylinder Auto-Transport Carrier Bag - Holds 3 D or E Oxygen Cylinders', 'UPC', '810058519108', NULL, 'B0C5ZC424S', 0, 1, 'ResOne', 0, '', 11, 'amazon', NULL),
	(873, 'OM-0300-1', '1pk Adult Oxygen Mask with Swivel Adpater & 6.8Ft Crush Resistant Tubing', 'UPC', '810058517357', NULL, 'B0BFC51QBF', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(874, 'OM-0300-5', '5pk Adult Oxygen Mask with Swivel Adpater & 6.8Ft Crush Resistant Tubing', 'UPC', '810058517302', NULL, 'B0BFGBYCLB', 1, 1, 'ResOne', 0, '', 27, 'amazon', NULL),
	(875, 'OM-0400-1', '1pk Pediatric Oxygen Mask with Swivel Adpater & 6.8Ft Crush Resistant Tubing', 'UPC', '810058517364', NULL, 'B0BFC5RXBQ', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(876, 'CC-100-DE', 'ResOne Lightweight Single D/E Oxygen Cylinder Cart, Adjustable Handle, Durable Powder-Coated Finish, Portable Oxygen Tank Cart with Wheels, Holds 1 D Size or E Size Cylinder, Medical Oxygen Transport', 'UPC', '810058518934', NULL, 'B0BNF7JBW7', 0, 0, 'ResOne', 0, '', 6, 'amazon', NULL),
	(877, 'OM-0400-5', '5pk Pediatric Oxygen Mask with Swivel Adpater & 6.8Ft Crush Resistant Tubing', 'UPC', '810058517371', NULL, 'B0BFH6F7QK', 1, 1, 'ResOne', 0, '', 27, 'amazon', NULL),
	(878, 'CC-100-DE-4', 'ResOne Lightweight Single D/E Oxygen Cylinder Cart, Adjustable Handle, Durable Powder-Coated Finish, Portable Oxygen Tank Cart with Wheels, Holds 1 D Size or E Size Cylinder, Medical Oxygen Transport', 'UPC', '810058518804', NULL, 'B0BNF9D2M3', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(879, 'CC-200-DE', 'ResOne Lightweight Dual D/E Oxygen Cylinder Cart, Adjustable Handle, Durable Powder-Coated Finish, Portable Oxygen Tank Cart with Wheels, Holds 2 D Size or E Size Cylinders, Medical Oxygen Transport', 'UPC', '810058518941', NULL, 'B0BNF8YHTR', 0, 0, 'ResOne', 0, '', 7, 'amazon', NULL),
	(880, 'OM-0500-1', '1pk Adult Non-Rebreather Oxygen Mask with 6.8Ft Crush Resistant Tubing', 'UPC', '810058517401', NULL, 'B0BFC5YCX8', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(881, 'CC-200-DE-4', 'ResOne Lightweight Dual D/E Oxygen Cylinder Cart, Adjustable Handle, Durable Powder-Coated Finish, Portable Oxygen Tank Cart with Wheels, Holds 2 D Size or E Size Cylinders, Medical Oxygen Transport', 'UPC', '810058518811', NULL, 'B0BNFBDWL3', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(882, 'OM-0500-5', '5pk Adult Non-Rebreather Oxygen Mask with 6.8Ft Crush Resistant Tubing', 'UPC', '810058517418', NULL, 'B0BFGGJWJX', 1, 1, 'ResOne', 0, '', 27, 'amazon', NULL),
	(883, 'CHB-6300-AF', 'StrengthTape Ankle/Foot Kinesiology Taping Kit', 'FNSKU', NULL, NULL, 'X003ZG39JV', 1, 1, 'Carex', 0, '', 1, 'amazon', NULL),
	(884, 'OM-0550-1', '1pk Adult Elongated Non-Rebreather Oxygen Mask with 6.8Ft Crush Resistant Tubing', 'UPC', '810058517388', NULL, 'B0BFC6J3BJ', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(885, 'OM-0550-5', '5pk Adult Elongated Non-Rebreather Oxygen Mask with 6.8Ft Crush Resistant Tubing', 'UPC', '810058517395', NULL, 'B0BFGFWHFJ', 1, 1, 'ResOne', 0, '', 27, 'amazon', NULL),
	(886, 'OM-0600-1', '1pk Pediatric Non-Rebreather Oxygen Mask with 6.8Ft Crush ResistantTubing', 'UPC', '810058517449', NULL, 'B0BFC96SS7', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(887, 'CHB-6300-BN', 'StrengthTape Kinesiology Tape, K Tape Taping Kit, Premium Sports Tape Provides Support and Stability to The Target Area, Back & Neck, Blue, StrengthTape Kinesiology Taping Kit', 'FNSKU', NULL, NULL, 'X003ZFUN87', 1, 1, 'Carex', 0, '', 1, 'amazon', NULL),
	(888, 'CHB-6300-KN', 'StrengthTape Knee Kinesiology Taping Kit', 'FNSKU', NULL, NULL, 'X003ZFUNU5', 1, 1, 'Carex', 0, '', 1, 'amazon', NULL),
	(889, 'OM-0600-5', '5pk Pediatric Non-Rebreather Oxygen Mask with 6.8Ft Crush ResistantTubing', 'UPC', '810058517456', NULL, 'B0BFGFN6JB', 1, 1, 'ResOne', 0, '', 27, 'amazon', NULL),
	(890, 'CHB-BG5010', 'Roscoe Medical Gel Ice Packs Reusable and Cold Packs for Injuries Reusable, Shoulder Ice Pack, Knee Ice Pack, Hot and Cold Pack, Ice Pack for Back, 5 x 10 Inches, Small Ice Pack', 'FNSKU', NULL, NULL, 'X003ZG3N7J', 1, 1, 'Carex', 0, '', 1, 'amazon', NULL),
	(891, 'CHB-EASY-FLEX10', 'Carex Easy-Flex Lightweight CPAP Tubing - 10 Feet - Universal Flexible CPAP Hose, 22mm Opening', 'FNSKU', NULL, NULL, 'X003ZG66BJ', 1, 1, 'Carex', 0, '', 1, 'amazon', NULL),
	(892, 'OM-0650-1', '1pk Pediatric Elongated Non-Rebreather Oxygen Mask with 6.8Ft Crush Resistant Tubing', 'UPC', '810058517425', NULL, 'B0BFC6P2H5', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(893, 'CHB-FGC13800-0000', 'CAREX CPAP Mask Wipes - 62 Count of Citrus Scented CPAP Wipes for CPAP Masks', 'FNSKU', NULL, NULL, 'X003ZG38BF', 1, 1, 'Carex', 0, '', 1, 'amazon', NULL),
	(894, 'OM-0650-5', '5pk Pediatric Elongated Non-Rebreather Oxygen Mask with 6.8Ft Crush Resistant Tubing', 'UPC', '810058517432', NULL, 'B0BFGDXX87', 1, 1, 'ResOne', 0, '', 27, 'amazon', NULL),
	(895, 'OT-0100-1', 'ResOne 7Ft Oxygen Supply Tubing, Crush Resistant, Standard Connectors for Nasal Cannulas, Cannula Nasal Tubing, Oxygen Concentrator - Green', 'UPC', '810058517784', NULL, 'B0BFC73LFP', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(896, 'OT-0100-5', 'ResOne 5pk 7Ft Oxygen Supply Tubing, Crush Resistant, Standard Connectors for Nasal Cannulas, Cannula Nasal Tubing, Oxygen Concentrator - Green', 'UPC', '810058517791', NULL, 'B0BFGG1LH9', 1, 1, 'ResOne', 0, '', 59, 'amazon', NULL),
	(897, 'OT-C007-1', 'ResOne 7Ft Clear Oxygen Supply Tubing, Crush Resistant, Standard Connectors', 'UPC', '810058516671', NULL, 'B0D6DPNWRD', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(898, 'OT-C007-5', 'ResOne 5pk 7Ft Clear Oxygen Supply Tubing, Crush Resistant, Standard Connectors', 'UPC', '810058516688', NULL, 'B0D6D5Y9SB', 1, 1, 'ResOne', 0, '', 60, 'amazon', NULL),
	(899, 'OT-C014-1', 'ResOne 14Ft Clear Oxygen Supply Tubing, Crush Resistant, Standard Connectors', 'UPC', '810058516695', NULL, 'B0D6DG1FKC', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(900, 'OT-C014-5', 'ResOne 5pk 14Ft Clear Oxygen Supply Tubing, Crush Resistant, Standard Connectors', 'UPC', '810058516701', NULL, 'B0D6D9D7WP', 1, 1, 'ResOne', 0, '', 80, 'amazon', NULL),
	(901, 'OT-C025-1', 'ResOne 25Ft Clear Oxygen Supply Tubing, Crush Resistant, Standard Connectors', 'UPC', '810058516718', NULL, 'B0D6D9RQ65', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(902, 'OT-C025-5', 'ResOne 5pk 25Ft Clear Oxygen Supply Tubing, Crush Resistant, Standard Connectors', 'UPC', '810058516725', NULL, 'B0D6CZ1YGL', 1, 1, 'ResOne', 0, '', 4, 'amazon', NULL),
	(903, 'OT-C050-1', 'ResOne 50Ft Clear Oxygen Supply Tubing, Crush Resistant, Standard Connectors', 'UPC', '810058516732', NULL, 'B0D6DCYQD4', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(904, 'OT-C050-5', 'ResOne 5pk 50Ft Clear Oxygen Supply Tubing, Crush Resistant, Standard Connectors', 'UPC', '810058516749', NULL, 'B0D6DCYQD7', 1, 1, 'ResOne', 0, '', 42, 'amazon', NULL),
	(905, 'OT-G014-1', 'ResOne 14Ft Oxygen Supply Tubing, Crush Resistant, Standard Connectors for Nasal Cannulas, Cannula Nasal Tubing, Oxygen Concentrator - Green', 'UPC', '810058516909', NULL, 'B0D21H45XS', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(906, 'CR-100-DE', 'Metal Oxygen Cylinder Rack- Holds 6 D, E, or M9 Medical Oxygen Tanks, Portable Oxygen Storage Rack, Durable Powder-Coated Finish', 'UPC', '810058518828', NULL, 'B0BSTNPQ4V', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(907, 'CR-100-WB', 'ResOne 1pk Oxygen Cylinder Wall Mount Bracket with 2 Expansion Screws & 59in. Strap (Black)', 'UPC', '810058518958', NULL, 'B0BNF9SG5M', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(908, 'CR-100-WB-2', 'ResOne 2pk Oxygen Cylinder Wall Mount Bracket with 2 Expansion Screws & 59in. Strap (Black)', 'UPC', '810058516626', NULL, 'B0D7KMYY9Y', 0, 1, 'ResOne', 0, '', 87, 'amazon', NULL),
	(909, 'CR-200-DE', 'Metal Oxygen Cylinder Stand - Holds 1 D, E, M9, or M7 Medical Oxygen Tank, Portable Oxygen Storage Rack, Durable Powder-Coated Finish', 'UPC', '810058519061', NULL, 'B0C5Z6KFG5', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(910, 'CR-300-DE', 'Medical Oxygen Cylinder Wheelchair Bracket - Holds 1 D or E Oxygen Cylinder', 'UPC', '810058519078', NULL, 'B0C5ZDSQ8M', 0, 0, 'ResOne', 0, '', 88, 'amazon', NULL),
	(911, 'CR-300-DE-4', '4pk Medical Oxygen Cylinder Wheelchair Bracket - Holds 1 D or E Oxygen Cylinder', 'UPC', '810058519160', NULL, 'B0C5ZCYSCQ', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(912, 'CT-102-2', 'ResOne 2-Pack 2Ft CPAP Tubing with 22mm Cuffs, Compatible with Most Machines', 'UPC', '810058519979', NULL, 'B0CST956P7', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(913, 'OT-G014-5', 'ResOne 5pk 14Ft Oxygen Supply Tubing, Crush Resistant, Standard Connectors for Nasal Cannulas, Cannula Nasal Tubing, Oxygen Concentrator - Green', 'UPC', '810058516756', NULL, 'B0D1ZX614S', 1, 1, 'ResOne', 0, '', 80, 'amazon', NULL),
	(914, 'CT-102-2-70', 'ResOne 140-Pack 2Ft CPAP Tubing with 22mm Cuffs, Compatible with Most Machines', 'UPC', '810058514288', NULL, 'B0CST9RNYV', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(915, 'OT-G025-1', 'ResOne 25Ft Oxygen Supply Tubing, Crush Resistant, Standard Connectors for Nasal Cannulas, Cannula Nasal Tubing, Oxygen Concentrator - Green', 'UPC', '810058516916', NULL, 'B0D214ZTCR', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(916, 'CT-104-2', 'ResOne 2-Pack 4Ft CPAP Tubing with 22mm Cuffs, Compatible with Most Machines', 'UPC', '810058519986', NULL, 'B0CST9HNFH', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(917, 'CT-104-2-40', 'ResOne 80-Pack 4Ft CPAP Tubing with 22mm Cuffs, Compatible with Most Machines', 'UPC', '810058514295', NULL, 'B0CST9WGCJ', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(918, 'OT-G025-5', 'ResOne 5pk 25Ft Oxygen Supply Tubing, Crush Resistant, Standard Connectors for Nasal Cannulas, Cannula Nasal Tubing, Oxygen Concentrator - Green', 'UPC', '810058516763', NULL, 'B0D216FZ9F', 1, 1, 'ResOne', 0, '', 79, 'amazon', NULL),
	(919, 'OT-G050-1', 'ResOne 50Ft Oxygen Supply Tubing, Crush Resistant, Standard Connectors for Nasal Cannulas, Cannula Nasal Tubing, Oxygen Concentrator - Green', 'UPC', '810058516923', NULL, 'B0D21C28BV', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(920, 'OT-G050-5', 'ResOne 5pk 50Ft Oxygen Supply Tubing, Crush Resistant, Standard Connectors for Nasal Cannulas, Cannula Nasal Tubing, Oxygen Concentrator - Green', 'UPC', '810058516770', NULL, 'B0D215NZVS', 1, 1, 'ResOne', 0, '', 42, 'amazon', NULL),
	(921, 'OT-P007-1', 'ResOne 7Ft Oxygen Supply Tubing, Crush Resistant, Standard Connectors for Nasal Cannulas, Cannula Nasal Tubing, Oxygen Concentrator - Purple', 'UPC', '810058516930', NULL, 'B0CVJBL2J7', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(922, 'CT-106-2', 'ResOne 2-Pack 6Ft CPAP Tubing with 22mm Cuffs, Compatible with Most Machines', 'UPC', '810058519818', NULL, 'B0CQDF2D59', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(923, 'CT-106-2-25', 'ResOne 50-Pack 6Ft CPAP Tubing with 22mm Cuffs, Compatible with Most Machines', 'UPC', '810058514301', NULL, 'B0CQD8T1P6', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(924, 'CW-100-1', 'ResOne Plastic Medical Oxygen Cylinder Wrench - Durable ABS Plastic, Fits Oxygen CGA-870 Post Valves - Oxygen Tank Key Wrench, Oxygen Wrench - Medical Oxygen Cylinders, Oxygen Regulator', 'UPC', '810058517050', NULL, 'B0B4PWBTHX', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(925, 'OT-P007-5', 'ResOne 5pk 7Ft Oxygen Supply Tubing, Crush Resistant, Standard Connectors for Nasal Cannulas, Cannula Nasal Tubing, Oxygen Concentrator - Purple', 'UPC', '810058514363', NULL, 'B0CVJ6PCMY', 1, 1, 'ResOne', 0, '', 60, 'amazon', NULL),
	(926, 'CW-100-5', 'ResOne Plastic Medical Oxygen Cylinder Wrench 5-Pack - Durable ABS Plastic, Fits Oxygen CGA-870 Post Valves - Oxygen Tank Key Wrench, Oxygen Wrench - Medical Oxygen Cylinders, Oxygen Regulator', 'UPC', '810058517067', NULL, 'B0B4PWJ9X6', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(927, 'OT-P014-1', 'ResOne 14Ft Oxygen Supply Tubing, Crush Resistant, Standard Connectors for Nasal Cannulas, Cannula Nasal Tubing, Oxygen Concentrator - Purple', 'UPC', '810058516947', NULL, 'B0CVJDX1BT', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(928, 'OT-P014-5', 'ResOne 5pk 14Ft Oxygen Supply Tubing, Crush Resistant, Standard Connectors for Nasal Cannulas, Cannula Nasal Tubing, Oxygen Concentrator - Purple', 'UPC', '810058514370', NULL, 'B0CVL8VZHF', 1, 1, 'ResOne', 0, '', 80, 'amazon', NULL),
	(929, 'CW-110-1', 'ResOne Plastic Medical Oxygen Cylinder Wrench with Bungee Cord - Durable ABS Plastic, Fits Oxygen CGA-870 Post Valves - Oxygen Tank Key Wrench - Medical Oxygen Cylinders, Oxygen Regulator', 'UPC', '810058517074', NULL, 'B0B4PVR1JC', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(930, 'OT-P025-1', 'ResOne 25Ft Oxygen Supply Tubing, Crush Resistant, Standard Connectors for Nasal Cannulas, Cannula Nasal Tubing, Oxygen Concentrator - Purple', 'UPC', '810058516954', NULL, 'B0CVJ2GVKS', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(931, 'CW-110-5', 'ResOne Plastic Medical Oxygen Cylinder Wrench with Bungee Cord 5-Pack - Durable ABS Plastic, Fits Oxygen CGA-870 Post Valves - Oxygen Tank Key Wrench, Oxygen Wrench - Medical Oxygen Cylinders', 'UPC', '810058517081', NULL, 'B0B4PV9KCQ', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(932, 'OT-P025-5', 'ResOne 5pk 25Ft Oxygen Supply Tubing, Crush Resistant, Standard Connectors for Nasal Cannulas, Cannula Nasal Tubing, Oxygen Concentrator - Purple', 'UPC', '810058517685', NULL, 'B0D1ZXLFNS', 1, 1, 'ResOne', 0, '', 4, 'amazon', NULL),
	(933, 'CW-120-1', 'ResOne Plastic Medical Oxygen Cylinder Wrench with Bungee Cord & 2 Yoke Washers - Durable ABS Plastic, Fits Oxygen CGA-870 Post Valves - Oxygen Tank Key Wrench, Oxygen Wrench, Oxygen Regulator Seal', 'UPC', '810058517098', NULL, 'B0B4PY1RX8', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(934, 'OT-P050-1', 'ResOne 50Ft Oxygen Supply Tubing, Crush Resistant, Standard Connectors for Nasal Cannulas, Cannula Nasal Tubing, Oxygen Concentrator - Purple', 'UPC', '810058516961', NULL, 'B0CVJ7SSJ2', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(935, 'CW-120-5', 'ResOne Plastic Medical Oxygen Cylinder Wrench with Bungee Cord & 2 Yoke Washers 5-Pack - Durable ABS Plastic, Fits Oxygen CGA-870 Post Valves - Oxygen Tank Key Wrench, Oxygen Regulator Seal', 'UPC', '810058517104', NULL, 'B0B4PXCT59', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(936, 'CW-130-1', 'ResOne 1pk Hardened Medical Oxygen Cylinder Wrench', 'UPC', '810058517111', NULL, 'B0B4PXDBDM', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(937, 'OT-P050-5', 'ResOne 5pk 50Ft Oxygen Supply Tubing, Crush Resistant, Standard Connectors for Nasal Cannulas, Cannula Nasal Tubing, Oxygen Concentrator - Purple', 'UPC', '810058517692', NULL, 'B0D213FBS3', 1, 1, 'ResOne', 0, '', 42, 'amazon', NULL),
	(938, 'CW-130-5', 'ResOne Nylon Medical Oxygen Cylinder Wrench 5-Pack - Hardened Nylon Plastic, Fits Oxygen CGA-870 Post Valves - Oxygen Tank Key Wrench, Oxygen Wrench - Medical Oxygen Cylinders, Oxygen Regulator', 'UPC', '810058517128', NULL, 'B0B4PWVZWV', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(939, 'RES010-1', 'Fire Safe Adapters', 'UPC', '848530061296', NULL, 'X0042GQ1W5', 1, 0, 'Sunset Healthcare Solutions', 0, '', 72, 'amazon', NULL),
	(940, 'RES010KIT-1', 'Sunset Firesafe Thermal Shut-Off Valve Kit', 'FNSKU', NULL, NULL, 'B09TQ57RGB', 1, 0, 'Sunset Healthcare Solutions', 0, '', 72, 'amazon', NULL),
	(941, 'RES020-5', 'Sunset Ear Cushions for Oxygen Nasal Cannula (RES020)', 'UPC', '848530061210', NULL, 'X0038M0139', 1, 1, 'Sunset Healthcare Solutions', 0, '', 67, 'amazon', NULL),
	(942, 'CW-140-1', 'ResOne Nylon Medical Oxygen Cylinder Wrench with Bungee Cord - Hardened Nylon Plastic, Fits Oxygen CGA-870 Post Valves - Oxygen Tank Key Wrench, Oxygen Wrench - Medical Oxygen Cylinders', 'UPC', '810058517135', NULL, 'B0B4PXN5JB', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(943, 'CW-140-5', 'ResOne Nylon Medical Oxygen Cylinder Wrench with Bungee Cord 5-Pack - Hardened Nylon Plastic, Fits Oxygen CGA-870 Post Valves - Oxygen Tank Key Wrench, Oxygen Wrench - Medical Oxygen Cylinders', 'UPC', '810058517142', NULL, 'B0B4PWCKD3', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL),
	(944, 'CW-150-1', 'ResOne Nylon Medical Oxygen Cylinder Wrench with Bungee Cord & 2 Yoke Washers - Hardened Nylon Plastic, Fits Oxygen CGA-870 Post Valves - Oxygen Tank Key Wrench, Oxygen Wrench, Oxygen Regulator Seal', 'UPC', '810058517159', NULL, 'B0B4PX61DX', 0, 0, 'ResOne', 0, '', 4, 'amazon', NULL);

-- Dumping structure for table tailadmin_laravel.products_print_template
CREATE TABLE IF NOT EXISTS `products_print_template` (
  `product_id` bigint unsigned NOT NULL,
  `print_template_id` bigint unsigned NOT NULL,
  KEY `products_print_template_product_id_foreign` (`product_id`),
  KEY `products_print_template_print_template_id_foreign` (`print_template_id`),
  CONSTRAINT `products_print_template_print_template_id_foreign` FOREIGN KEY (`print_template_id`) REFERENCES `print_templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `products_print_template_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.products_print_template: ~0 rows (approximately)

-- Dumping structure for table tailadmin_laravel.product_components
CREATE TABLE IF NOT EXISTS `product_components` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `component_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_components_product_id_component_id_unique` (`product_id`,`component_id`),
  KEY `product_components_component_id_foreign` (`component_id`),
  CONSTRAINT `product_components_component_id_foreign` FOREIGN KEY (`component_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_components_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.product_components: ~0 rows (approximately)

-- Dumping structure for table tailadmin_laravel.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.roles: ~0 rows (approximately)

-- Dumping structure for table tailadmin_laravel.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.role_has_permissions: ~0 rows (approximately)

-- Dumping structure for table tailadmin_laravel.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.sessions: ~1 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('fvuej5s5FDDputwRslmKZMTCx5tWqbBSQNH8Ow2a', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiZVA1M0Jzc0Jqa09WeW9UV2FDNmw2SjBOWXhpRXgwTW9CR05ERlIzdiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQzOiJodHRwczovL3RhaWxhZG1pbi1sYXJhdmVsLnRlc3QvbGFiZWwvcmVuZGVyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMiR2YWNUeHBFaEFBUk9ZU3NCS3RlSDdPMi9LdTJxWEh0azk3MnBXcXNHU1gvT0tRck1nZTZpUyI7czoxMDoibGFiZWxfZGF0YSI7YToyOntzOjg6InRlbXBsYXRlIjtzOjc6ImRlZmF1bHQiO3M6ODoicHJvZHVjdHMiO2E6MTp7aTowO2E6Mjp7czozOiJza3UiO3M6MTE6IlRLLTM1LTExMC0yIjtzOjU6ImNvdW50IjtpOjE7fX19fQ==', 1725343787);

-- Dumping structure for table tailadmin_laravel.teams
CREATE TABLE IF NOT EXISTS `teams` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.teams: ~1 rows (approximately)
INSERT INTO `teams` (`id`, `user_id`, `name`, `personal_team`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Gregory\'s Team', 1, '2024-09-03 05:31:39', '2024-09-03 05:31:39');

-- Dumping structure for table tailadmin_laravel.team_invitations
CREATE TABLE IF NOT EXISTS `team_invitations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint unsigned NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_invitations_team_id_email_unique` (`team_id`,`email`),
  CONSTRAINT `team_invitations_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.team_invitations: ~0 rows (approximately)

-- Dumping structure for table tailadmin_laravel.team_user
CREATE TABLE IF NOT EXISTS `team_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.team_user: ~0 rows (approximately)

-- Dumping structure for table tailadmin_laravel.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `dark_mode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'auto',
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'anemon',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tailadmin_laravel.users: ~1 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `language`, `dark_mode`, `theme`, `created_at`, `updated_at`) VALUES
	(1, 'Gregory Patton', 'gregory@patton.dev', NULL, '$2y$12$vacTxpEhAAROYSsBKteH7O2/Ku2qXHtk972pWqsGSX/OKQrMge6iS', NULL, NULL, NULL, NULL, 1, NULL, 'en', 'light', 'anemon', '2024-09-03 05:31:39', '2024-09-03 05:33:36');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
