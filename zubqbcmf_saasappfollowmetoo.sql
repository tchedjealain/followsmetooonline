-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 09 juil. 2023 à 01:43
-- Version du serveur : 10.5.21-MariaDB
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `zubqbcmf_saasappfollowmetoo`
--

-- --------------------------------------------------------

--
-- Structure de la table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `short_name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `website` varchar(191) DEFAULT NULL,
  `light_logo` varchar(191) DEFAULT NULL,
  `dark_logo` varchar(191) DEFAULT NULL,
  `small_dark_logo` varchar(191) DEFAULT NULL,
  `small_light_logo` varchar(191) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `app_layout` varchar(10) NOT NULL DEFAULT 'sidebar',
  `rtl` tinyint(1) NOT NULL DEFAULT 0,
  `mysqldump_command` varchar(191) NOT NULL DEFAULT '/usr/bin/mysqldump',
  `shortcut_menus` varchar(20) NOT NULL DEFAULT 'top_bottom',
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lang_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `left_sidebar_theme` varchar(20) NOT NULL DEFAULT 'dark',
  `primary_color` varchar(20) NOT NULL DEFAULT '#1890ff',
  `date_format` varchar(20) NOT NULL DEFAULT 'DD-MM-YYYY',
  `time_format` varchar(20) NOT NULL DEFAULT 'hh:mm a',
  `auto_detect_timezone` tinyint(1) NOT NULL DEFAULT 1,
  `timezone` varchar(191) NOT NULL DEFAULT 'Asia/Kolkata',
  `session_driver` varchar(20) NOT NULL DEFAULT 'file',
  `app_debug` tinyint(1) NOT NULL DEFAULT 0,
  `update_app_notification` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `login_image` varchar(191) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `companies`
--

INSERT INTO `companies` (`id`, `name`, `short_name`, `email`, `phone`, `website`, `light_logo`, `dark_logo`, `small_dark_logo`, `small_light_logo`, `address`, `app_layout`, `rtl`, `mysqldump_command`, `shortcut_menus`, `currency_id`, `lang_id`, `warehouse_id`, `left_sidebar_theme`, `primary_color`, `date_format`, `time_format`, `auto_detect_timezone`, `timezone`, `session_driver`, `app_debug`, `update_app_notification`, `created_at`, `updated_at`, `login_image`) VALUES
(1, 'Stockifly', 'Stockifly', 'company@example.com', '+9199999999', NULL, NULL, NULL, NULL, NULL, '7 street, city, state, 762782', 'sidebar', 0, '/usr/bin/mysqldump', 'top_bottom', 1, 1, 1, 'dark', '#1890ff', 'DD-MM-YYYY', 'hh:mm a', 1, 'Asia/Kolkata', 'file', 0, 1, '2023-07-01 02:57:08', '2023-07-01 02:57:08', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `symbol` varchar(191) NOT NULL,
  `position` varchar(191) NOT NULL,
  `is_deletable` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `position`, `is_deletable`, `created_at`, `updated_at`) VALUES
(1, 'Dollar', 'USD', '$', 'front', 0, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(2, 'Rupee', 'INR', '₹', 'front', 0, '2023-07-01 02:57:08', '2023-07-01 02:57:08');

-- --------------------------------------------------------

--
-- Structure de la table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `value` varchar(191) DEFAULT NULL,
  `type` varchar(191) NOT NULL DEFAULT 'text',
  `active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bill` varchar(191) DEFAULT NULL,
  `expense_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `notes` varchar(1000) DEFAULT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `front_product_cards`
--

CREATE TABLE `front_product_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `subtitle` varchar(191) DEFAULT NULL,
  `products` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `front_website_settings`
--

CREATE TABLE `front_website_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `featured_categories` text NOT NULL,
  `featured_categories_title` varchar(191) DEFAULT 'Featured Categories',
  `featured_categories_subtitle` varchar(191) DEFAULT '',
  `featured_products` text NOT NULL,
  `featured_products_title` varchar(191) DEFAULT 'Featured Products',
  `featured_products_subtitle` varchar(191) DEFAULT '',
  `features_lists` text NOT NULL,
  `facebook_url` varchar(191) DEFAULT '',
  `twitter_url` varchar(191) DEFAULT '',
  `instagram_url` varchar(191) DEFAULT '',
  `linkedin_url` varchar(191) DEFAULT '',
  `youtube_url` varchar(191) DEFAULT '',
  `pages_widget` text NOT NULL,
  `contact_info_widget` text NOT NULL,
  `links_widget` text NOT NULL,
  `footer_company_description` varchar(1000) NOT NULL DEFAULT 'Stockify have many propular products wiht high discount and special offers.',
  `footer_copyright_text` varchar(1000) NOT NULL DEFAULT 'Copyright 2021 @ Stockify, All rights reserved.',
  `top_banners` text NOT NULL,
  `bottom_banners_1` text NOT NULL,
  `bottom_banners_2` text NOT NULL,
  `bottom_banners_3` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `front_website_settings`
--

INSERT INTO `front_website_settings` (`id`, `warehouse_id`, `featured_categories`, `featured_categories_title`, `featured_categories_subtitle`, `featured_products`, `featured_products_title`, `featured_products_subtitle`, `features_lists`, `facebook_url`, `twitter_url`, `instagram_url`, `linkedin_url`, `youtube_url`, `pages_widget`, `contact_info_widget`, `links_widget`, `footer_company_description`, `footer_copyright_text`, `top_banners`, `bottom_banners_1`, `bottom_banners_2`, `bottom_banners_3`, `created_at`, `updated_at`) VALUES
(1, 1, '[]', 'Featured Categories', '', '[]', 'Featured Products', '', '[]', '', '', '', '', '', '[]', '[]', '[]', 'Stockify have many propular products wiht high discount and special offers.', 'Copyright 2021 @ Stockify, All rights reserved.', '[]', '[]', '[]', '[]', '2023-07-01 02:57:09', '2023-07-01 02:57:09');

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `langs`
--

CREATE TABLE `langs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `langs`
--

INSERT INTO `langs` (`id`, `image`, `name`, `key`, `enabled`, `created_at`, `updated_at`) VALUES
(1, NULL, 'English', 'en', 1, '2023-07-01 02:57:07', '2023-07-01 02:57:07');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_08_19_000000_create_failed_jobs_table', 1),
(2, '2021_01_02_193004_create_langs_table', 1),
(3, '2021_01_02_193005_create_translations_table', 1),
(4, '2021_02_01_040700_create_payment_modes_table', 1),
(5, '2021_03_01_040700_create_currencies_table', 1),
(6, '2021_03_02_130932_create_warehouses_table', 1),
(7, '2021_03_03_114417_create_companies_table', 1),
(8, '2021_04_04_000000_create_users_table', 1),
(9, '2021_04_05_190756_entrust_setup_tables', 1),
(10, '2021_05_06_151454_create_brands_table', 1),
(11, '2021_05_06_162224_create_categories_table', 1),
(12, '2021_05_07_033806_create_taxes_table', 1),
(13, '2021_05_07_033823_create_units_table', 1),
(14, '2021_05_08_052842_create_expense_categories_table', 1),
(15, '2021_05_08_052858_create_expenses_table', 1),
(16, '2021_05_08_144116_custom_fields_table', 1),
(17, '2021_05_09_153334_create_products_table', 1),
(18, '2021_05_13_072501_create_orders_table', 1),
(19, '2021_05_13_072518_create_order_items_table', 1),
(20, '2021_05_23_060918_create_payments_table', 1),
(21, '2021_05_23_060919_create_order_payments_table', 1),
(22, '2021_05_28_120405_create_warehouse_stocks_table', 1),
(23, '2021_10_10_100006_create_stock_history_table', 1),
(24, '2022_01_10_115820_create_stock_adjustments_table', 1),
(25, '2022_02_01_094402_create_settings_table', 1),
(26, '2022_02_24_075933_create_notifications_table', 1),
(27, '2022_02_24_122754_create_jobs_table', 1),
(28, '2022_03_07_110707_create_warehouse_history_table', 1),
(29, '2022_04_11_105713_add_login_image_column_in_companies_table', 1),
(30, '2022_04_14_141740_create_order_shipping_address_table', 1),
(31, '2022_04_15_141741_create_user_address_table', 1),
(32, '2022_04_16_054851_create_front_product_cards_table', 1),
(33, '2022_04_17_092949_create_front_website_settings_table', 1),
(34, '2022_04_30_044824_add_rtl_in_companies_warehouses_table', 1),
(35, '2022_05_05_044824_add_setting_records_in_settings_table', 1),
(36, '2022_05_22_004926_add_from_warehouse_id_column_in_orders_table', 1),
(37, '2022_06_24_094848_add_staff_user_id_in_payments_warehouse_history_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_id` varchar(20) NOT NULL,
  `invoice_number` varchar(20) NOT NULL,
  `invoice_type` varchar(20) DEFAULT NULL,
  `order_type` varchar(20) NOT NULL DEFAULT 'sales',
  `order_date` datetime NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `from_warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax_rate` double(8,2) DEFAULT NULL,
  `tax_amount` double NOT NULL DEFAULT 0,
  `discount` double DEFAULT NULL,
  `shipping` double DEFAULT NULL,
  `subtotal` double NOT NULL,
  `total` double NOT NULL,
  `paid_amount` double NOT NULL DEFAULT 0,
  `due_amount` double NOT NULL DEFAULT 0,
  `order_status` varchar(20) NOT NULL,
  `notes` text DEFAULT NULL,
  `document` varchar(191) DEFAULT NULL,
  `staff_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'unpaid',
  `total_items` double(8,2) NOT NULL DEFAULT 0.00,
  `total_quantity` double(8,2) NOT NULL DEFAULT 0.00,
  `terms_condition` text DEFAULT NULL,
  `is_deletable` tinyint(1) NOT NULL DEFAULT 1,
  `cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `cancelled_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_custom_fields`
--

CREATE TABLE `order_custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `field_name` varchar(191) NOT NULL,
  `field_value` varchar(191) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` double(8,2) NOT NULL,
  `unit_price` double NOT NULL,
  `single_unit_price` double NOT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax_rate` double(8,2) NOT NULL DEFAULT 0.00,
  `tax_type` varchar(10) DEFAULT NULL,
  `discount_rate` double(8,2) DEFAULT NULL,
  `total_tax` double DEFAULT NULL,
  `total_discount` double DEFAULT NULL,
  `subtotal` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_payments`
--

CREATE TABLE `order_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_shipping_address`
--

CREATE TABLE `order_shipping_address` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `shipping_address` varchar(1000) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `zipcode` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_type` varchar(20) NOT NULL DEFAULT 'out',
  `payment_number` varchar(191) DEFAULT NULL,
  `date` date NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `unused_amount` double NOT NULL DEFAULT 0,
  `paid_amount` double NOT NULL DEFAULT 0,
  `payment_mode_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_receipt` varchar(191) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `staff_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payment_modes`
--

CREATE TABLE `payment_modes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `payment_modes`
--

INSERT INTO `payment_modes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Cash', '2023-07-01 02:57:08', '2023-07-01 02:57:08');

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `display_name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `module_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `module_name`, `created_at`, `updated_at`) VALUES
(1, 'brands_view', 'Brand View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(2, 'brands_create', 'Brand Create', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(3, 'brands_edit', 'Brand Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(4, 'brands_delete', 'Brand Delete', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(5, 'categories_view', 'Category View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(6, 'categories_create', 'Category Create', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(7, 'categories_edit', 'Category Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(8, 'categories_delete', 'Category Delete', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(9, 'products_view', 'Product View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(10, 'products_create', 'Product Create', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(11, 'products_edit', 'Product Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(12, 'products_delete', 'Product Delete', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(13, 'purchases_view', 'Purchase View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(14, 'purchases_create', 'Purchase Create', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(15, 'purchases_edit', 'Purchase Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(16, 'purchases_delete', 'Purchase Delete', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(17, 'purchase_returns_view', 'Purchase Return View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(18, 'purchase_returns_create', 'Purchase Return Create', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(19, 'purchase_returns_edit', 'Purchase Return Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(20, 'purchase_returns_delete', 'Purchase Return Delete', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(21, 'payment_out_view', 'Payment Out View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(22, 'payment_out_create', 'Payment Out Create', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(23, 'payment_out_edit', 'Payment Out Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(24, 'payment_out_delete', 'Payment Out Delete', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(25, 'payment_in_view', 'Payment In View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(26, 'payment_in_create', 'Payment In Create', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(27, 'payment_in_edit', 'Payment In Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(28, 'payment_in_delete', 'Payment In Delete', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(29, 'sales_view', 'Sales View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(30, 'sales_create', 'Sales Create', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(31, 'sales_edit', 'Sales Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(32, 'sales_delete', 'Sales Delete', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(33, 'sales_returns_view', 'Sales Return View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(34, 'sales_returns_create', 'Sales Return Create', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(35, 'sales_returns_edit', 'Sales Return Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(36, 'sales_returns_delete', 'Sales Return Delete', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(37, 'order_payments_view', 'Order Payments View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(38, 'order_payments_create', 'Order Payments Create', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(39, 'stock_adjustments_view', 'Stock Adjustment View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(40, 'stock_adjustments_create', 'Stock Adjustment Create', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(41, 'stock_adjustments_edit', 'Stock Adjustment Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(42, 'stock_adjustments_delete', 'Stock Adjustment Delete', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(43, 'stock_transfers_view', 'Stock Transfer View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(44, 'stock_transfers_create', 'Stock Transfer Create', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(45, 'stock_transfers_edit', 'Stock Transfer Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(46, 'stock_transfers_delete', 'Stock Transfer Delete', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(47, 'expense_categories_view', 'Expense Category View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(48, 'expense_categories_create', 'Expense Category Create', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(49, 'expense_categories_edit', 'Expense Category Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(50, 'expense_categories_delete', 'Expense Category Delete', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(51, 'expenses_view', 'Expense View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(52, 'expenses_create', 'Expense Create', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(53, 'expenses_edit', 'Expense Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(54, 'expenses_delete', 'Expense Delete', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(55, 'units_view', 'Unit View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(56, 'units_create', 'Unit Create', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(57, 'units_edit', 'Unit Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(58, 'units_delete', 'Unit Delete', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(59, 'custom_fields_view', 'Custom Field View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(60, 'custom_fields_create', 'Custom Field Create', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(61, 'custom_fields_edit', 'Custom Field Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(62, 'custom_fields_delete', 'Custom Field Delete', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(63, 'payment_modes_view', 'Payment Mode View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(64, 'payment_modes_create', 'Payment Mode Create', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(65, 'payment_modes_edit', 'Payment Mode Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(66, 'payment_modes_delete', 'Payment Mode Delete', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(67, 'currencies_view', 'Currency View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(68, 'currencies_create', 'Currency Create', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(69, 'currencies_edit', 'Currency Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(70, 'currencies_delete', 'Currency Delete', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(71, 'taxes_view', 'Tax View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(72, 'taxes_create', 'Tax Create', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(73, 'taxes_edit', 'Tax Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(74, 'taxes_delete', 'Tax Delete', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(75, 'modules_view', 'Modules View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(76, 'roles_view', 'Role View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(77, 'roles_create', 'Role Create', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(78, 'roles_edit', 'Role Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(79, 'roles_delete', 'Role Delete', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(80, 'warehouses_view', 'Warehouse View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(81, 'warehouses_create', 'Warehouse Create', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(82, 'warehouses_edit', 'Warehouse Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(83, 'warehouses_delete', 'Warehouse Delete', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(84, 'companies_edit', 'Company Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(85, 'translations_view', 'Translation View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(86, 'translations_create', 'Translation Create', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(87, 'translations_edit', 'Translation Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(88, 'translations_delete', 'Translation Delete', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(89, 'users_view', 'Staff Member View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(90, 'users_create', 'Staff Member Create', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(91, 'users_edit', 'Staff Member Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(92, 'users_delete', 'Staff Member Delete', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(93, 'customers_view', 'Customer View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(94, 'customers_create', 'Customer Create', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(95, 'customers_edit', 'Customer Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(96, 'customers_delete', 'Customer Delete', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(97, 'suppliers_view', 'Supplier View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(98, 'suppliers_create', 'Supplier Create', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(99, 'suppliers_edit', 'Supplier Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(100, 'suppliers_delete', 'Supplier Delete', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(101, 'storage_edit', 'Storage Settings Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(102, 'email_edit', 'Email Settings Edit', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(103, 'pos_view', 'POS View', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(104, 'update_app', 'Update App', NULL, NULL, '2023-07-01 02:57:08', '2023-07-01 02:57:08');

-- --------------------------------------------------------

--
-- Structure de la table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(1000) NOT NULL,
  `slug` varchar(1000) NOT NULL,
  `barcode_symbology` varchar(10) NOT NULL,
  `item_code` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_custom_fields`
--

CREATE TABLE `product_custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `field_name` varchar(191) NOT NULL,
  `field_value` varchar(191) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_details`
--

CREATE TABLE `product_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `current_stock` double(8,2) NOT NULL DEFAULT 0.00,
  `mrp` double DEFAULT NULL,
  `purchase_price` double NOT NULL,
  `sales_price` double NOT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `purchase_tax_type` varchar(10) DEFAULT 'exclusive',
  `sales_tax_type` varchar(10) DEFAULT 'exclusive',
  `stock_quantitiy_alert` int(11) DEFAULT NULL,
  `opening_stock` int(11) DEFAULT NULL,
  `opening_stock_date` date DEFAULT NULL,
  `wholesale_price` double DEFAULT NULL,
  `wholesale_quantity` int(11) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'in_stock',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `display_name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'Admin is allowed to manage everything of the app.', '2023-07-01 02:57:08', '2023-07-01 02:57:08');

-- --------------------------------------------------------

--
-- Structure de la table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `setting_type` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `name_key` varchar(191) NOT NULL,
  `credentials` text DEFAULT NULL,
  `other_data` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `settings`
--

INSERT INTO `settings` (`id`, `setting_type`, `name`, `name_key`, `credentials`, `other_data`, `status`, `verified`, `created_at`, `updated_at`) VALUES
(1, 'storage', 'Local', 'local', NULL, NULL, 1, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(2, 'storage', 'AWS', 'aws', '{\"driver\":\"s3\",\"key\":\"\",\"secret\":\"\",\"region\":\"\",\"bucket\":\"\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(3, 'email', 'SMTP', 'smtp', '{\"from_name\":\"\",\"from_email\":\"\",\"host\":\"\",\"port\":\"\",\"encryption\":\"\",\"username\":\"\",\"password\":\"\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(4, 'send_mail_settings', 'Send mail to warehouse', 'warehouse', '[]', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(5, 'email_templates', 'Stock adjustment created', 'stock_adjustment_create', '{\"title\":\"Stock adjustment created\",\"content\":\"Stock adjustment created by ##staff_member_name## for warehouse ##warehouse_name## for product ##product_name## with ##stock_adjustment_quantity## (##stock_adjustment_type##) quantity\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(6, 'email_templates', 'Stock adjustment updated', 'stock_adjustment_update', '{\"title\":\"Stock adjustment updated\",\"content\":\"Stock adjustment updated by ##staff_member_name## for warehouse ##warehouse_name## for product ##product_name## with ##stock_adjustment_quantity## (##stock_adjustment_type##) quantity\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(7, 'email_templates', 'Stock adjustment deleted', 'stock_adjustment_delete', '{\"title\":\"Stock adjustment deleted\",\"content\":\"Stock adjustment deleted by ##staff_member_name## for warehouse ##warehouse_name## for product ##product_name## with ##stock_adjustment_quantity## (##stock_adjustment_type##) quantity\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(8, 'email_templates', 'Staff Member created', 'staff_member_create', '{\"title\":\"Staff Member created\",\"content\":\"A new staff Member added with ##staff_member_name## name in your warehouse ##warehouse_name##.\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(9, 'email_templates', 'Staff Member updated', 'staff_member_update', '{\"title\":\"Staff Member updated\",\"content\":\"Staff Member with name ##staff_member_name## updated in your warehouse ##warehouse_name##.\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(10, 'email_templates', 'Staff Member deleted', 'staff_member_delete', '{\"title\":\"Staff Member deleted\",\"content\":\"Staff member with name ##staff_member_name## deleted from your warehouse ##warehouse_name##.\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(11, 'email_templates', 'Purchase created', 'purchases_create', '{\"title\":\"Purchase created\",\"content\":\"A new purhcase added by ##staff_member_name## in your warehouse ##warehouse_name## with invoice number ##invoice_number##.\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(12, 'email_templates', 'Purchase updated', 'purchases_update', '{\"title\":\"Purchase updated\",\"content\":\"Purchase with invoice number ##invoice_number## updated by ##staff_member_name## in your warehouse ##warehouse_name##.\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(13, 'email_templates', 'Purchase deleted', 'purchases_delete', '{\"title\":\"Purchase deleted\",\"content\":\"Purchase with invoice number ##invoice_number## deleted by ##staff_member_name## from your warehouse ##warehouse_name##.\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(14, 'email_templates', 'Purchase created', 'purchase_returns_create', '{\"title\":\"Purchase created\",\"content\":\"A new purhcase return added by ##staff_member_name## in your warehouse ##warehouse_name## with invoice number ##invoice_number##.\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(15, 'email_templates', 'Purchase updated', 'purchase_returns_update', '{\"title\":\"Purchase updated\",\"content\":\"Purchase return with invoice number ##invoice_number## updated by ##staff_member_name## in your warehouse ##warehouse_name##.\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(16, 'email_templates', 'Purchase return deleted', 'purchase_returns_delete', '{\"title\":\"Purchase return deleted\",\"content\":\"Purchase return with invoice number ##invoice_number## deleted by ##staff_member_name## from your warehouse ##warehouse_name##.\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(17, 'email_templates', 'Sales created', 'sales_create', '{\"title\":\"Sales created\",\"content\":\"A new sales added by ##staff_member_name## name in your warehouse ##warehouse_name## with invoice number ##invoice_number##.\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(18, 'email_templates', 'Sales updated', 'sales_update', '{\"title\":\"Sales updated\",\"content\":\"Sales with invoice number ##invoice_number## updated by ##staff_member_name## in your warehouse ##warehouse_name##.\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(19, 'email_templates', 'Sales deleted', 'sales_delete', '{\"title\":\"Sales deleted\",\"content\":\"Sales with invoice number ##invoice_number## deleted by ##staff_member_name## from your warehouse ##warehouse_name##.\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(20, 'email_templates', 'Sales return created', 'sales_returns_create', '{\"title\":\"Sales return created\",\"content\":\"A new sales return added by ##staff_member_name## in your warehouse ##warehouse_name## with invoice number ##invoice_number##.\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(21, 'email_templates', 'Sales return updated', 'sales_returns_update', '{\"title\":\"Sales return updated\",\"content\":\"Sales return with invoice number ##invoice_number## updated by ##staff_member_name## in your warehouse ##warehouse_name##.\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(22, 'email_templates', 'Sales return deleted', 'sales_returns_delete', '{\"title\":\"Sales return deleted\",\"content\":\"Sales return with invoice number ##invoice_number## deleted by ##staff_member_name## from your warehouse ##warehouse_name##.\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(23, 'email_templates', 'Quotations created', 'quotations_create', '{\"title\":\"Quotations created\",\"content\":\"A new quotations added by ##staff_member_name## name in your warehouse ##warehouse_name## with invoice number ##invoice_number##.\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(24, 'email_templates', 'Quotations updated', 'quotations_update', '{\"title\":\"Quotations updated\",\"content\":\"Quotations with invoice number ##invoice_number## updated by ##staff_member_name## in your warehouse ##warehouse_name##.\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(25, 'email_templates', 'Quotations deleted', 'quotations_delete', '{\"title\":\"Quotations deleted\",\"content\":\"Quotations with invoice number ##invoice_number## deleted by ##staff_member_name## from your warehouse ##warehouse_name##.\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(26, 'email_templates', 'Expense created', 'expense_create', '{\"title\":\"Expense created\",\"content\":\"A new expense added by ##staff_member_name## in your warehouse ##warehouse_name## with amount ##expense_amount##.\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(27, 'email_templates', 'Expense updated', 'expense_update', '{\"title\":\"Expense updated\",\"content\":\"Expense updated by ##staff_member_name## in your warehouse ##warehouse_name## with amount ##expense_amount##.\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(28, 'email_templates', 'Expense deleted', 'expense_delete', '{\"title\":\"Expense deleted\",\"content\":\"Expense deleted by ##staff_member_name## from your warehouse ##warehouse_name## with amount ##expense_amount##.\"}', NULL, 0, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09'),
(29, 'shortcut_menus', 'Add Menu', 'shortcut_menus', '[\"staff_member\",\"customer\",\"supplier\",\"brand\",\"category\",\"product\",\"purchase\",\"sales\",\"expense_category\",\"expense\",\"warehouse\",\"currency\",\"unit\",\"language\",\"role\",\"tax\",\"payment_mode\"]', NULL, 1, 0, '2023-07-01 02:57:09', '2023-07-01 02:57:09');

-- --------------------------------------------------------

--
-- Structure de la table `stock_adjustments`
--

CREATE TABLE `stock_adjustments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` double(8,2) NOT NULL,
  `adjustment_type` varchar(20) NOT NULL DEFAULT 'add',
  `notes` text DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `stock_history`
--

CREATE TABLE `stock_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` double(8,2) NOT NULL,
  `old_quantity` double(8,2) NOT NULL DEFAULT 0.00,
  `order_type` varchar(20) DEFAULT 'sales',
  `stock_type` varchar(20) NOT NULL DEFAULT 'in',
  `action_type` varchar(20) NOT NULL DEFAULT 'add',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `rate` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `rate`, `created_at`, `updated_at`) VALUES
(1, 'GST', 18.00, '2023-07-01 02:57:08', '2023-07-01 02:57:08');

-- --------------------------------------------------------

--
-- Structure de la table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lang_id` bigint(20) UNSIGNED DEFAULT NULL,
  `group` varchar(191) NOT NULL,
  `key` text NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `translations`
--

INSERT INTO `translations` (`id`, `lang_id`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'common', 'enabled', 'Enabled', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(2, 1, 'common', 'disabled', 'Disabled', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(3, 1, 'common', 'id', 'Id', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(4, 1, 'common', 'action', 'Action', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(5, 1, 'common', 'placeholder_default_text', 'Please Enter {0}', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(6, 1, 'common', 'placeholder_social_text', 'Please Enter {0} Url', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(7, 1, 'common', 'placeholder_search_text', 'Search By {0}', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(8, 1, 'common', 'select_default_text', 'Select {0}...', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(9, 1, 'common', 'create', 'Create', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(10, 1, 'common', 'edit', 'Edit', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(11, 1, 'common', 'update', 'Update', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(12, 1, 'common', 'cancel', 'Cancel', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(13, 1, 'common', 'delete', 'Delete', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(14, 1, 'common', 'success', 'Success', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(15, 1, 'common', 'error', 'Error', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(16, 1, 'common', 'yes', 'Yes', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(17, 1, 'common', 'no', 'No', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(18, 1, 'common', 'fix_errors', 'Please Fix Below Errors.', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(19, 1, 'common', 'cancelled', 'Cancelled', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(20, 1, 'common', 'pending', 'Pending', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(21, 1, 'common', 'paid', 'Paid', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(22, 1, 'common', 'completed', 'Completed', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(23, 1, 'common', 'save', 'Save', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(24, 1, 'common', 'all', 'All', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(25, 1, 'common', 'name', 'Name', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(26, 1, 'common', 'back', 'Back', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(27, 1, 'common', 'max_amount', 'Max. Amount', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(28, 1, 'common', 'date_time', 'Date Time', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(29, 1, 'common', 'select_time', 'Select Time', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(30, 1, 'common', 'start_date', 'Start Date', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(31, 1, 'common', 'end_date', 'End Date', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(32, 1, 'common', 'search', 'Search', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(33, 1, 'common', 'date', 'Date', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(34, 1, 'common', 'out_of_stock', 'Out Of Stock', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(35, 1, 'common', 'pay', 'Pay', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(36, 1, 'common', 'received', 'Received', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(37, 1, 'common', 'with_tax', 'With Tax', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(38, 1, 'common', 'without_tax', 'Without Tax', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(39, 1, 'common', 'invoice_number', 'Invoice Number', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(40, 1, 'common', 'ordered', 'Ordered', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(41, 1, 'common', 'confirmed', 'Confirmed', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(42, 1, 'common', 'processing', 'Processing', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(43, 1, 'common', 'shipping', 'Shipping', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(44, 1, 'common', 'delivered', 'Delivered', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(45, 1, 'common', 'confirm', 'Confirm', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(46, 1, 'common', 'title', 'Title', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(47, 1, 'common', 'value', 'Value', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(48, 1, 'common', 'add', 'Add', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(49, 1, 'common', 'view', 'View', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(50, 1, 'common', 'download', 'Download', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(51, 1, 'common', 'change_order_status', 'Change Order Status', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(52, 1, 'common', 'total', 'Total', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(53, 1, 'common', 'print_invoice', 'Print Invoice', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(54, 1, 'common', 'email', 'Email', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(55, 1, 'common', 'phone', 'Phone', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(56, 1, 'common', 'item', 'Item', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(57, 1, 'common', 'items', 'Items', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(58, 1, 'common', 'qty', 'Qty', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(59, 1, 'common', 'rate', 'Rate', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(60, 1, 'common', 'purchase_code', 'Purchase Code', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(61, 1, 'common', 'verify_purchase', 'Verify Purchase', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(62, 1, 'common', 'buy_now', 'Buy Now', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(63, 1, 'common', 'install', 'Install', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(64, 1, 'common', 'installing', 'Installing', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(65, 1, 'common', 'updating', 'Updating', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(66, 1, 'common', 'free', 'Free', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(67, 1, 'common', 'domain', 'Domain', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(68, 1, 'common', 'verify', 'Verify', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(69, 1, 'common', 'send', 'Send', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(70, 1, 'common', 'upload', 'Upload', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(71, 1, 'common', 'view_all', 'View All', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(72, 1, 'common', 'unpaid', 'Unpaid', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(73, 1, 'common', 'loading', 'Loading', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(74, 1, 'common', 'update_app', 'Update App', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(75, 1, 'common', 'welcome_back', 'Welcome {0}', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(76, 1, 'common', 'off', 'Off', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(77, 1, 'common', 'on_create', 'On Create', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(78, 1, 'common', 'on_update', 'On Update', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(79, 1, 'common', 'on_delete', 'On Delete', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(80, 1, 'common', 'demo_account_credentials', 'Demo account login credentials', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(81, 1, 'common', 'balance', 'Balance', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(82, 1, 'common', 'party', 'Party', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(83, 1, 'common', 'created_by', 'Created By', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(84, 1, 'common', 'import', 'Import', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(85, 1, 'common', 'file', 'File', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(86, 1, 'common', 'copy_url', 'Copy Url', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(87, 1, 'common', 'print', 'Print', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(88, 1, 'common', 'pdf', 'Pdf', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(89, 1, 'common', 'excel', 'Excel', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(90, 1, 'common', 'particulars', 'Particulars', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(91, 1, 'common', 'amount', 'Amount', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(92, 1, 'common', 'profit', 'Profit', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(93, 1, 'common', 'profit_reports_by_orders', 'Profit Reports By Orders', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(94, 1, 'common', 'profit_reports_by_payments', 'Profit Reports By Payments', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(95, 1, 'menu', 'dashboard', 'Dashboard', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(96, 1, 'menu', 'stock_management', 'Stock Manager', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(97, 1, 'menu', 'purchase', 'Purchase', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(98, 1, 'menu', 'purchases', 'Purchases', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(99, 1, 'menu', 'purchase_returns', 'Purchase Return / Dr. Note', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(100, 1, 'menu', 'sales', 'Sales', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(101, 1, 'menu', 'sales_returns', 'Sales Return / Cr. Note', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(102, 1, 'menu', 'product_manager', 'Product Manager', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(103, 1, 'menu', 'brands', 'Brands', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(104, 1, 'menu', 'categories', 'Categories', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(105, 1, 'menu', 'products', 'Products', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(106, 1, 'menu', 'expense_manager', 'Expenses', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(107, 1, 'menu', 'expense_categories', 'Expense Categories', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(108, 1, 'menu', 'expenses', 'Expenses', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(109, 1, 'menu', 'users', 'Users', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(110, 1, 'menu', 'parties', 'Parties', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(111, 1, 'menu', 'staff_members', 'Staff Members', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(112, 1, 'menu', 'customers', 'Customers', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(113, 1, 'menu', 'suppliers', 'Suppliers', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(114, 1, 'menu', 'settings', 'Settings', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(115, 1, 'menu', 'company', 'Company Settings', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(116, 1, 'menu', 'profile', 'Profile', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(117, 1, 'menu', 'translations', 'Translations', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(118, 1, 'menu', 'languages', 'Languages', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(119, 1, 'menu', 'warehouses', 'Warehouses', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(120, 1, 'menu', 'roles', 'Role & Permissions', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(121, 1, 'menu', 'taxes', 'Taxes', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(122, 1, 'menu', 'currencies', 'Currencies', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(123, 1, 'menu', 'payment_modes', 'Payment Modes', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(124, 1, 'menu', 'units', 'Units', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(125, 1, 'menu', 'login', 'Login', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(126, 1, 'menu', 'logout', 'Logout', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(127, 1, 'menu', 'reports', 'Reports', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(128, 1, 'menu', 'order_payments', 'Order Payments', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(129, 1, 'menu', 'payments', 'Payments', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(130, 1, 'menu', 'stock_alert', 'Stock Alert', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(131, 1, 'menu', 'users_reports', 'Users Reports', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(132, 1, 'menu', 'warehouses_reports', 'Warehouses Reports', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(133, 1, 'menu', 'pos', 'POS', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(134, 1, 'menu', 'stock_adjustment', 'Stock Adjustment', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(135, 1, 'menu', 'verify_product', 'Verify Product', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(136, 1, 'menu', 'modules', 'Modules', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(137, 1, 'menu', 'storage_settings', 'Storage Settings', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(138, 1, 'menu', 'email_settings', 'Email Settings', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(139, 1, 'menu', 'update_app', 'Update App', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(140, 1, 'menu', 'custom_fields', 'Custom Fields', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(141, 1, 'menu', 'payment_in', 'Payment In', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(142, 1, 'menu', 'payment_out', 'Payment Out', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(143, 1, 'menu', 'cash_bank', 'Cash & Bank', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(144, 1, 'menu', 'sales_summary', 'Sales Summary', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(145, 1, 'menu', 'stock_summary', 'Stock Summary', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(146, 1, 'menu', 'rate_list', 'Rate List', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(147, 1, 'menu', 'product_sales_summary', 'Product Sales Summary', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(148, 1, 'menu', 'homepage', 'Buy online products', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(149, 1, 'menu', 'online_orders', 'Online Orders', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(150, 1, 'menu', 'website_setup', 'Website Setup', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(151, 1, 'menu', 'product_cards', 'Product Cards', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(152, 1, 'menu', 'front_settings', 'Front Settings', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(153, 1, 'menu', 'orders', 'Orders', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(154, 1, 'menu', 'quotations', 'Quotations', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(155, 1, 'menu', 'quotation', 'Quotation', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(156, 1, 'menu', 'quotation_estimate', 'Quotation / Estimate', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(157, 1, 'menu', 'database_backup', 'Database Backup', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(158, 1, 'menu', 'stock_transfer', 'Stock Transfer', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(159, 1, 'menu', 'stock_transfers', 'Stock Transfers', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(160, 1, 'menu', 'profit_loss', 'Profit & Loss', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(161, 1, 'dashboard', 'dashboard', 'Dashboard', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(162, 1, 'dashboard', 'recent_stock_history', 'Recent Stock History', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(163, 1, 'dashboard', 'top_selling_product', 'Top Selling Product', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(164, 1, 'dashboard', 'sales_purchases', 'Sales & Purchases', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(165, 1, 'dashboard', 'total_sales', 'Total Sales', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(166, 1, 'dashboard', 'top_customers', 'Top Customers', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(167, 1, 'dashboard', 'total_expenses', 'Total Expenses', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(168, 1, 'dashboard', 'payment_sent', 'Payment Sent', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(169, 1, 'dashboard', 'payment_received', 'Payment Received', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(170, 1, 'dashboard', 'total_sales_items', 'Total Sales Items', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(171, 1, 'dashboard', 'total_sales_returns_items', 'Total Sales Returns Items', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(172, 1, 'dashboard', 'total_purchases_items', 'Total Purchase Items', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(173, 1, 'dashboard', 'total_purchase_returns_items', 'Total Purchase Returns Items', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(174, 1, 'user', 'email_phone', 'Email or Phone', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(175, 1, 'user', 'user', 'User', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(176, 1, 'user', 'name', 'Name', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(177, 1, 'user', 'created_at', 'Created At', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(178, 1, 'user', 'email', 'Email', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(179, 1, 'user', 'password', 'Password', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(180, 1, 'user', 'login_enabled', 'Login Enabled', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(181, 1, 'user', 'profile_image', 'Profile Image', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(182, 1, 'user', 'company_name', 'Company Name', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(183, 1, 'user', 'phone', 'Phone Number', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(184, 1, 'user', 'address', 'Address', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(185, 1, 'user', 'city', 'City', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(186, 1, 'user', 'state', 'State', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(187, 1, 'user', 'country', 'Country', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(188, 1, 'user', 'zipcode', 'Zipcode', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(189, 1, 'user', 'billing_address', 'Billing Address', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(190, 1, 'user', 'shipping_address', 'Shipping Address', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(191, 1, 'user', 'opening_balance', 'Opening Balance', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(192, 1, 'user', 'credit_period', 'Credit Period', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(193, 1, 'user', 'credit_limit', 'Credit Limit', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(194, 1, 'user', 'to_receive', 'To Collect', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(195, 1, 'user', 'to_pay', 'To Pay', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(196, 1, 'user', 'receive', 'Receive', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(197, 1, 'user', 'pay', 'Pay', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(198, 1, 'user', 'status', 'Status', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(199, 1, 'user', 'role', 'Role', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(200, 1, 'user', 'days', 'Day(s)', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(201, 1, 'user', 'profile_updated', 'Profile Updated Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(202, 1, 'user', 'password_blank', 'Leave blank if you don\'t want to update password.', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(203, 1, 'user', 'total_sales', 'Total Sales', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(204, 1, 'user', 'total_purchases', 'Total Purchases', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(205, 1, 'user', 'walk_in_customer', 'Walk In Customer', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(206, 1, 'user', 'staff_members_details', 'Staff Member Details', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(207, 1, 'user', 'customers_details', 'Customer Details', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(208, 1, 'user', 'suppliers_details', 'Supplier Details', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(209, 1, 'staff_member', 'add', 'Add New Staff Member', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(210, 1, 'staff_member', 'edit', 'Edit Staff Member', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(211, 1, 'staff_member', 'created', 'Staff Member Created Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(212, 1, 'staff_member', 'updated', 'Staff Member Updated Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(213, 1, 'staff_member', 'deleted', 'Staff Member Deleted Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(214, 1, 'staff_member', 'staff_member_details', 'Staff Member Details', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(215, 1, 'staff_member', 'staff_member', 'Staff Member', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(216, 1, 'staff_member', 'delete_message', 'Are you sure you want to delete this staff member?', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(217, 1, 'staff_member', 'import_staff_members', 'Import Staff Members', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(218, 1, 'customer', 'add', 'Add New Customer', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(219, 1, 'customer', 'edit', 'Edit Customer', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(220, 1, 'customer', 'created', 'Customer Created Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(221, 1, 'customer', 'updated', 'Customer Updated Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(222, 1, 'customer', 'deleted', 'Customer Deleted Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(223, 1, 'customer', 'customer_details', 'Customer Details', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(224, 1, 'customer', 'delete_message', 'Are you sure you want to delete this customer?', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(225, 1, 'customer', 'import_customers', 'Import Customers', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(226, 1, 'supplier', 'add', 'Add New Supplier', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(227, 1, 'supplier', 'edit', 'Edit Supplier', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(228, 1, 'supplier', 'created', 'Supplier Created Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(229, 1, 'supplier', 'updated', 'Supplier Updated Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(230, 1, 'supplier', 'deleted', 'Supplier Deleted Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(231, 1, 'supplier', 'supplier_details', 'Supplier Details', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(232, 1, 'supplier', 'delete_message', 'Are you sure you want to delete this supplier?', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(233, 1, 'supplier', 'import_suppliers', 'Import Suppliers', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(234, 1, 'warehouse', 'add', 'Add New Warehouse', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(235, 1, 'warehouse', 'edit', 'Edit Warehouse', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(236, 1, 'warehouse', 'created', 'Warehouse Created Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(237, 1, 'warehouse', 'updated', 'Warehouse Updated Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(238, 1, 'warehouse', 'deleted', 'Warehouse Deleted Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(239, 1, 'warehouse', 'warehouse_details', 'Warehouse Details', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(240, 1, 'warehouse', 'warehouse', 'Warehouse', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(241, 1, 'warehouse', 'logo', 'Logo', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(242, 1, 'warehouse', 'dark_logo', 'Dark Logo', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(243, 1, 'warehouse', 'name', 'Name', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(244, 1, 'warehouse', 'slug', 'Slug', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(245, 1, 'warehouse', 'email', 'Email', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(246, 1, 'warehouse', 'phone', 'Phone', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(247, 1, 'warehouse', 'address', 'Billing Address', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(248, 1, 'warehouse', 'show_email_on_invoice', 'Show email on invoice', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(249, 1, 'warehouse', 'show_phone_on_invoice', 'Show phone on invoice', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(250, 1, 'warehouse', 'terms_condition', 'Terms & Conditions', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(251, 1, 'warehouse', 'bank_details', 'Bank Details', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(252, 1, 'warehouse', 'signature', 'Signature', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(253, 1, 'warehouse', 'delete_message', 'Are you sure you want to delete this warehouse?', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(254, 1, 'warehouse', 'details_will_be_shown_on_invoice', 'Note: Details added below will be shown on your invoices', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(255, 1, 'warehouse', 'online_store', 'Online Store', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(256, 1, 'warehouse', 'online_store_status_updated', 'Online store status updated successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(257, 1, 'warehouse', 'no_online_store_exists', 'No online store exists for this url. Please contact to admin for support.', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(258, 1, 'warehouse', 'view_online_store', 'View Online Store', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(259, 1, 'role', 'add', 'Add New Role', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(260, 1, 'role', 'edit', 'Edit Role', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(261, 1, 'role', 'created', 'Role Created Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(262, 1, 'role', 'updated', 'Role Updated Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(263, 1, 'role', 'deleted', 'Role Deleted Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(264, 1, 'role', 'role_details', 'Role Details', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(265, 1, 'role', 'delete_message', 'Are you sure you want to delete this role?', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(266, 1, 'role', 'display_name', 'Display Name', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(267, 1, 'role', 'role_name', 'Role Name', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(268, 1, 'role', 'description', 'Description', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(269, 1, 'role', 'user_management', 'User Management', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(270, 1, 'role', 'permissions', 'Permissions', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(271, 1, 'company', 'updated', 'Company Updated Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(272, 1, 'company', 'name', 'Company Name', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(273, 1, 'company', 'short_name', 'Company Short Name', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(274, 1, 'company', 'email', 'Company Email', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(275, 1, 'company', 'phone', 'Company Phone', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(276, 1, 'company', 'address', 'Company Address', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(277, 1, 'company', 'currency', 'Currency', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(278, 1, 'company', 'logo', 'Company Logo', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(279, 1, 'company', 'left_sidebar_theme', 'Left Sidebar Theme', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(280, 1, 'company', 'dark', 'Dark', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(281, 1, 'company', 'light', 'Light', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(282, 1, 'company', 'dark_logo', 'Dark Logo', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(283, 1, 'company', 'light_logo', 'Light Logo', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(284, 1, 'company', 'small_dark_logo', 'Small Dark Logo', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(285, 1, 'company', 'small_light_logo', 'Small Light Logo', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(286, 1, 'company', 'primary_color', 'Primary Color', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(287, 1, 'company', 'default_timezone', 'Default Timezone', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(288, 1, 'company', 'date_format', 'Date Format', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(289, 1, 'company', 'time_format', 'Time Format', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(290, 1, 'company', 'auto_detect_timezone', 'Auto Detect Timezone', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(291, 1, 'company', 'app_debug', 'App Debug', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(292, 1, 'company', 'update_app_notification', 'Update App Notitication', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(293, 1, 'company', 'login_image', 'Login Image', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(294, 1, 'company', 'layout', 'Layout', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(295, 1, 'company', 'rtl', 'RTL', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(296, 1, 'company', 'ltr', 'LTR', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(297, 1, 'company', 'shortcut_menu_Placement', 'Add Menu Placement', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(298, 1, 'company', 'top_and_bottom', 'Top & Bottom', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(299, 1, 'company', 'top_header', 'Top Header', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(300, 1, 'company', 'bottom_corner', 'Bottom Conrer', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(301, 1, 'company', 'shortcut_menu_setting', 'Add Menu Settings', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(302, 1, 'company', 'menu_setting_updated', 'Menu Setting Updated', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(303, 1, 'tax', 'add', 'Add New Tax', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(304, 1, 'tax', 'edit', 'Edit Tax', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(305, 1, 'tax', 'created', 'Tax Created Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(306, 1, 'tax', 'updated', 'Tax Updated Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(307, 1, 'tax', 'deleted', 'Tax Deleted Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(308, 1, 'tax', 'tax_details', 'Tax Details', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(309, 1, 'tax', 'delete_message', 'Are you sure you want to delete this tax?', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(310, 1, 'tax', 'display_name', 'Display Name', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(311, 1, 'tax', 'name', 'Name', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(312, 1, 'tax', 'rate', 'Tax Rate', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(313, 1, 'tax', 'no_tax', 'No Tax', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(314, 1, 'currency', 'add', 'Add New Currency', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(315, 1, 'currency', 'edit', 'Edit Currency', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(316, 1, 'currency', 'created', 'Currency Created Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(317, 1, 'currency', 'updated', 'Currency Updated Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(318, 1, 'currency', 'deleted', 'Currency Deleted Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(319, 1, 'currency', 'currency_details', 'Currency Details', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(320, 1, 'currency', 'delete_message', 'Are you sure you want to delete this currency?', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(321, 1, 'currency', 'name', 'Currency Name', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(322, 1, 'currency', 'symbol', 'Currency Symbol', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(323, 1, 'currency', 'position', 'Currency Position', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(324, 1, 'currency', 'front', 'Front', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(325, 1, 'currency', 'front_position_example', 'Example : $100', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(326, 1, 'currency', 'behind', 'Behind', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(327, 1, 'currency', 'behind_position_example', 'Example : 100$', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(328, 1, 'currency', 'code', 'Currency Code', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(329, 1, 'payment_mode', 'add', 'Add New Payment Mode', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(330, 1, 'payment_mode', 'edit', 'Edit Payment Mode', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(331, 1, 'payment_mode', 'created', 'Payment Mode Created Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(332, 1, 'payment_mode', 'updated', 'Payment Mode Updated Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(333, 1, 'payment_mode', 'deleted', 'Payment Mode Deleted Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(334, 1, 'payment_mode', 'payment_mode_details', 'Payment Mode Details', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(335, 1, 'payment_mode', 'delete_message', 'Are you sure you want to delete this payment mode?', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(336, 1, 'payment_mode', 'name', 'Payment Mode Name', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(337, 1, 'unit', 'add', 'Add New Unit', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(338, 1, 'unit', 'edit', 'Edit Unit', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(339, 1, 'unit', 'created', 'Unit Created Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(340, 1, 'unit', 'updated', 'Unit Updated Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(341, 1, 'unit', 'deleted', 'Unit Deleted Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(342, 1, 'unit', 'delete_message', 'Are you sure you want to delete this unit?', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(343, 1, 'unit', 'unit_details', 'Unit Details', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(344, 1, 'unit', 'name', 'Unit Name', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(345, 1, 'unit', 'short_name', 'Short Name', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(346, 1, 'unit', 'base_unit', 'Base Unit', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(347, 1, 'unit', 'operator', 'Operator', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(348, 1, 'unit', 'multiply', 'Multiply (*)', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(349, 1, 'unit', 'divide', 'Divide (/)', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(350, 1, 'unit', 'operator_value', 'Operator Value', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(351, 1, 'custom_field', 'add', 'Add New Custom Field', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(352, 1, 'custom_field', 'edit', 'Edit Custom Field', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(353, 1, 'custom_field', 'created', 'Custom Field Created Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(354, 1, 'custom_field', 'updated', 'Custom Field Updated Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(355, 1, 'custom_field', 'deleted', 'Custom Field Deleted Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(356, 1, 'custom_field', 'delete_message', 'Are you sure you want to delete this custom field?', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(357, 1, 'custom_field', 'name', 'Field Name', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(358, 1, 'custom_field', 'value', 'Default Value', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(359, 1, 'custom_field', 'type', 'Field Type', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(360, 1, 'module', 'name', 'Module Name', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(361, 1, 'module', 'verified', 'Verified', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(362, 1, 'module', 'verify_purchase_code', 'Verify Purchase Code', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(363, 1, 'module', 'current_version', 'Current Version', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(364, 1, 'module', 'latest_version', 'Latest Version', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(365, 1, 'module', 'status', 'Status', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(366, 1, 'module', 'installed_modules', 'Installed Modules', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(367, 1, 'module', 'other_modules', 'Other Modules', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(368, 1, 'module', 'module_status_updated', 'Modules Status Updated', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(369, 1, 'module', 'downloading_completed', 'Download Completed', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(370, 1, 'module', 'extract_zip_file', 'Extract Zip File', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(371, 1, 'module', 'file_extracted', 'Zip File Extracted', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(372, 1, 'update_app', 'app_details', 'App Details', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(373, 1, 'update_app', 'name', 'Name', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(374, 1, 'update_app', 'value', 'Value', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(375, 1, 'update_app', 'php_version', 'PHP Version', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(376, 1, 'update_app', 'app_version', 'App Version', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(377, 1, 'update_app', 'laravel_version', 'Laravel Version', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(378, 1, 'update_app', 'mysql_version', 'MySQL Version', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(379, 1, 'update_app', 'vue_version', 'Vue Version', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(380, 1, 'update_app', 'update_app', 'Update App', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(381, 1, 'update_app', 'update_now', 'Update Now', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(382, 1, 'update_app', 'update_available', 'Update Available', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(383, 1, 'update_app', 'verify_again', 'Verify Again', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(384, 1, 'update_app', 'verify_failed', 'Verification Failed', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(385, 1, 'update_app', 'verify_failed_message', 'Your application is not registerd with us. Please verify it', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(386, 1, 'update_app', 'verified_with_other_domain', 'Your purchase code is registerd with other doamin. Please verfiy your purhcase code', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(387, 1, 'expense_category', 'add', 'Add New Expense Category', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(388, 1, 'expense_category', 'edit', 'Edit Expense Category', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(389, 1, 'expense_category', 'created', 'Expense Category Created Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(390, 1, 'expense_category', 'updated', 'Expense Category Updated Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(391, 1, 'expense_category', 'deleted', 'Expense Category Deleted Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(392, 1, 'expense_category', 'delete_message', 'Are you sure you want to delete this expense category?', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(393, 1, 'expense_category', 'expense_category_details', 'Expense Category Details', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(394, 1, 'expense_category', 'name', 'Expense Category Name', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(395, 1, 'expense_category', 'description', 'Description', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(396, 1, 'expense', 'add', 'Add New Expense', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(397, 1, 'expense', 'edit', 'Edit Expense', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(398, 1, 'expense', 'created', 'Expense Created Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(399, 1, 'expense', 'updated', 'Expense Updated Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(400, 1, 'expense', 'deleted', 'Expense Deleted Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(401, 1, 'expense', 'delete_message', 'Are you sure you want to delete this expense?', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(402, 1, 'expense', 'details', 'Expense Details', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(403, 1, 'expense', 'warehouse', 'Warehouse', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(404, 1, 'expense', 'expense_category', 'Expense Category', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(405, 1, 'expense', 'date', 'Date', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(406, 1, 'expense', 'amount', 'Amount', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(407, 1, 'expense', 'bill', 'Expense Bill', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(408, 1, 'expense', 'user', 'User', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(409, 1, 'expense', 'created_by_user', 'User', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(410, 1, 'expense', 'notes', 'Notes', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(411, 1, 'brand', 'add', 'Add New Brand', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(412, 1, 'brand', 'edit', 'Edit Brand', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(413, 1, 'brand', 'created', 'Brand Created Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(414, 1, 'brand', 'updated', 'Brand Updated Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(415, 1, 'brand', 'deleted', 'Brand Deleted Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(416, 1, 'brand', 'delete_message', 'Are you sure you want to delete this brand?', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(417, 1, 'brand', 'details', 'Brand Details', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(418, 1, 'brand', 'name', 'Name', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(419, 1, 'brand', 'slug', 'Slug', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(420, 1, 'brand', 'logo', 'Brand Logo', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(421, 1, 'brand', 'import_brands', 'Import Brands', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(422, 1, 'category', 'add', 'Add New Category', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(423, 1, 'category', 'edit', 'Edit Category', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(424, 1, 'category', 'created', 'Category Created Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(425, 1, 'category', 'updated', 'Category Updated Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(426, 1, 'category', 'deleted', 'Category Deleted Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(427, 1, 'category', 'delete_message', 'Are you sure you want to delete this category?', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(428, 1, 'category', 'details', 'Category Details', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(429, 1, 'category', 'category', 'Category', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(430, 1, 'category', 'name', 'Name', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(431, 1, 'category', 'slug', 'Slug', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(432, 1, 'category', 'logo', 'Category Logo', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(433, 1, 'category', 'parent_category', 'Parent Category', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(434, 1, 'category', 'no_parent_category', 'No Parent Category', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(435, 1, 'category', 'import_categories', 'Import Categories', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(436, 1, 'product', 'add', 'Add New Product', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(437, 1, 'product', 'edit', 'Edit Product', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(438, 1, 'product', 'created', 'Product Created Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(439, 1, 'product', 'updated', 'Product Updated Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(440, 1, 'product', 'deleted', 'Product Deleted Successfully', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(441, 1, 'product', 'delete_message', 'Are you sure you want to delete this product?', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(442, 1, 'product', 'details', 'Product Details', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(443, 1, 'product', 'name', 'Name', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(444, 1, 'product', 'slug', 'Slug', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(445, 1, 'product', 'sku', 'SKU', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(446, 1, 'product', 'image', 'Image', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(447, 1, 'product', 'quantitiy_alert', 'Quantity Alert', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(448, 1, 'product', 'brand', 'Brand', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(449, 1, 'product', 'category', 'Category', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(450, 1, 'product', 'price', 'Price', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(451, 1, 'product', 'mrp', 'MRP', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(452, 1, 'product', 'purchase_price', 'Purchase Price', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(453, 1, 'product', 'sales_price', 'Sales Price', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(454, 1, 'product', 'tax_type', 'Tax Type', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(455, 1, 'product', 'description', 'Description', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(456, 1, 'product', 'product', 'Product', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(457, 1, 'product', 'quantity', 'Quantity', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(458, 1, 'product', 'discount', 'Discount', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(459, 1, 'product', 'tax', 'Tax', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(460, 1, 'product', 'subtotal', 'SubTotal', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(461, 1, 'product', 'unit', 'Unit', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(462, 1, 'product', 'unit_price', 'Unit Price', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(463, 1, 'product', 'avl_qty', 'Avl. qty:', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(464, 1, 'product', 'order_items', 'Order Items', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(465, 1, 'product', 'inclusive', 'Inclusive', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(466, 1, 'product', 'exclusive', 'Exclusive', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(467, 1, 'product', 'stocks', 'Stocks', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(468, 1, 'product', 'stock_quantity', 'Stock Quantity', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(469, 1, 'product', 'product_orders', 'Product Orders', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(470, 1, 'product', 'stock_history', 'Stock History', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(471, 1, 'product', 'current_stock', 'Current Stock', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(472, 1, 'product', 'item_code', 'Item Code', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(473, 1, 'product', 'barcode_symbology', 'Barcode Symbology', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(474, 1, 'product', 'barcode', 'Barcode', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(475, 1, 'product', 'view_barcode', 'View Barcode', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(476, 1, 'product', 'generate_barcode', 'Generate Barcode', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(477, 1, 'product', 'print_barcode', 'Print Barcode', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(478, 1, 'product', 'price_tax', 'Price & Tax', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(479, 1, 'product', 'custom_fields', 'Custom Fields', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(480, 1, 'product', 'wholesale_rate', 'Wholesale Rate', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(481, 1, 'product', 'wholesale_price', 'Wholesale Price', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(482, 1, 'product', 'wholesale_quantity', 'Wholesale Quantity', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(483, 1, 'product', 'enter_min_quantity', 'Enter Minimum Quantity', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(484, 1, 'product', 'opening_stock', 'Opening Stock', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(485, 1, 'product', 'opening_stock_date', 'Opening Stock Date', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(486, 1, 'product', 'stock_value', 'Stock Value', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(487, 1, 'product', 'by_purchase', 'By Purchase', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(488, 1, 'product', 'by_sales', 'By Sales', '2023-07-01 02:57:07', '2023-07-01 02:57:07'),
(489, 1, 'product', 'unit_sold', 'Unit Sold', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(490, 1, 'product', 'import_products', 'Import Products', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(491, 1, 'stock', 'order_type', 'Order Type', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(492, 1, 'stock', 'order_date', 'Order Date', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(493, 1, 'stock', 'warehouse', 'Warehouse', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(494, 1, 'stock', 'supplier', 'Supplier', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(495, 1, 'stock', 'customer', 'Customer', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(496, 1, 'stock', 'product', 'Product', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(497, 1, 'stock', 'invoice_number', 'Invoice Number', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(498, 1, 'stock', 'invoie_number_blank', 'Leave it blank to generate automatically', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(499, 1, 'stock', 'notes', 'Notes', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(500, 1, 'stock', 'status', 'Order Status', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(501, 1, 'stock', 'order_tax', 'Order Tax', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(502, 1, 'stock', 'discount', 'Discount', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(503, 1, 'stock', 'shipping', 'Shipping', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(504, 1, 'stock', 'grand_total', 'Grand Total', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(505, 1, 'stock', 'remarks', 'Remarks', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(506, 1, 'stock', 'pay_now', 'Pay Now', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(507, 1, 'stock', 'reset', 'Reset', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(508, 1, 'stock', 'total_items', 'Total Items', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(509, 1, 'stock', 'paying_amount', 'Paying Amount', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(510, 1, 'stock', 'payable_amount', 'Payable Amount', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(511, 1, 'stock', 'change_return', 'Change Return', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(512, 1, 'stock', 'order_details', 'Order Details', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(513, 1, 'stock', 'order_canceled', 'Order Canceled Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(514, 1, 'stock', 'order_cancel_message', 'Are you sure you want to cancel this order?', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(515, 1, 'stock', 'view_order', 'View Order', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(516, 1, 'stock', 'order_id', 'Order Id', '2023-07-01 02:57:08', '2023-07-01 02:57:08');
INSERT INTO `translations` (`id`, `lang_id`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(517, 1, 'stock', 'shipping_address', 'Shipping Address', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(518, 1, 'stock', 'billing_address', 'Billing Address', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(519, 1, 'stock', 'order_taken_by', 'Order Taken By', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(520, 1, 'stock', 'no_product_found', 'No product found for selected resource', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(521, 1, 'purchase', 'add', 'Add New Purchase', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(522, 1, 'purchase', 'edit', 'Edit Purchase', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(523, 1, 'purchase', 'details', 'Purchase Details', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(524, 1, 'purchase', 'created', 'Purchase Created Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(525, 1, 'purchase', 'updated', 'Purchase Updated Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(526, 1, 'purchase', 'deleted', 'Purchase Deleted Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(527, 1, 'purchase', 'delete_message', 'Are you sure you want to delete this purchase?', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(528, 1, 'purchase', 'purchase_date', 'Purchase Date', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(529, 1, 'purchase', 'purchase_status', 'Purchase Status', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(530, 1, 'purchase', 'user', 'Supplier', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(531, 1, 'sales', 'add', 'Add New Sales', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(532, 1, 'sales', 'edit', 'Edit Sales', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(533, 1, 'sales', 'details', 'Sales Details', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(534, 1, 'sales', 'created', 'Sales Created Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(535, 1, 'sales', 'updated', 'Sales Updated Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(536, 1, 'sales', 'deleted', 'Sales Deleted Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(537, 1, 'sales', 'delete_message', 'Are you sure you want to delete this sales?', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(538, 1, 'sales', 'sales_date', 'Sales Date', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(539, 1, 'sales', 'sales_status', 'Sales Status', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(540, 1, 'sales', 'user', 'Customer', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(541, 1, 'sales', 'tax_invoice', 'TAX INVOICE', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(542, 1, 'sales', 'invoice', 'Invoice', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(543, 1, 'purchase_returns', 'add', 'Add New Purchase Return', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(544, 1, 'purchase_returns', 'edit', 'Edit Purchase Return', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(545, 1, 'purchase_returns', 'details', 'Purchase Return Details', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(546, 1, 'purchase_returns', 'created', 'Purchase Return Created Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(547, 1, 'purchase_returns', 'updated', 'Purchase Return Updated Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(548, 1, 'purchase_returns', 'deleted', 'Purchase Return Deleted Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(549, 1, 'purchase_returns', 'delete_message', 'Are you sure you want to delete this purchase return?', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(550, 1, 'purchase_returns', 'purchase_returns_date', 'Return Date', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(551, 1, 'purchase_returns', 'purchase_returns_status', 'Return Status', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(552, 1, 'purchase_returns', 'user', 'Supplier', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(553, 1, 'sales_returns', 'add', 'Add New Sales Return', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(554, 1, 'sales_returns', 'edit', 'Edit Sales Return', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(555, 1, 'sales_returns', 'details', 'Sales Return Details', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(556, 1, 'sales_returns', 'created', 'Sales Return Created Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(557, 1, 'sales_returns', 'updated', 'Sales Return Updated Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(558, 1, 'sales_returns', 'deleted', 'Sales Return Deleted Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(559, 1, 'sales_returns', 'delete_message', 'Are you sure you want to delete this sales return?', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(560, 1, 'sales_returns', 'sales_returns_date', 'Return Date', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(561, 1, 'sales_returns', 'sales_returns_status', 'Return Status', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(562, 1, 'sales_returns', 'user', 'Customer', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(563, 1, 'quotation', 'add', 'Add New Quotation', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(564, 1, 'quotation', 'edit', 'Edit Quotation', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(565, 1, 'quotation', 'details', 'Quotation Details', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(566, 1, 'quotation', 'created', 'Quotation Created Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(567, 1, 'quotation', 'updated', 'Quotation Updated Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(568, 1, 'quotation', 'deleted', 'Quotation Deleted Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(569, 1, 'quotation', 'delete_message', 'Are you sure you want to delete this quotation/estimate?', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(570, 1, 'quotation', 'quotation_date', 'Quotation Date', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(571, 1, 'quotation', 'quotation_status', 'Quotation Status', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(572, 1, 'quotation', 'user', 'Customer', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(573, 1, 'quotation', 'tax_invoice', 'TAX INVOICE', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(574, 1, 'quotation', 'invoice', 'Invoice', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(575, 1, 'quotation', 'convert_to_sale', 'Convert to sale', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(576, 1, 'quotation', 'convert_message', 'Are you really want to convert this quotation to sales?', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(577, 1, 'quotation', 'quotation_converted_to_sales', 'Quotation converted to sales successfully.', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(578, 1, 'payments', 'add', 'Add New Payment', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(579, 1, 'payments', 'edit', 'Edit Payment', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(580, 1, 'payments', 'details', 'Payment Details', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(581, 1, 'payments', 'created', 'Payment Created Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(582, 1, 'payments', 'updated', 'Payment Updated Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(583, 1, 'payments', 'deleted', 'Payment Deleted Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(584, 1, 'payments', 'delete_message', 'Are you sure you want to delete this payment?', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(585, 1, 'payments', 'user', 'User', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(586, 1, 'payments', 'amount', 'Amount', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(587, 1, 'payments', 'invoice_amount', 'Invoice Amount', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(588, 1, 'payments', 'payment_number', 'Reference Number', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(589, 1, 'payments', 'payments', 'Payments', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(590, 1, 'payments', 'date', 'Payment Date', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(591, 1, 'payments', 'due_amount', 'Due Amount', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(592, 1, 'payments', 'paid_amount', 'Paid Amount', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(593, 1, 'payments', 'total_amount', 'Total Amount', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(594, 1, 'payments', 'unused_amount', 'Unused Amount', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(595, 1, 'payments', 'settled_amount', 'Settled Amount', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(596, 1, 'payments', 'payment_mode', 'Payment Mode', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(597, 1, 'payments', 'paid_total_amount', 'Paid/Total Amount', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(598, 1, 'payments', 'notes', 'Notes', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(599, 1, 'payments', 'payment_status', 'Payment Status', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(600, 1, 'payments', 'unpaid', 'Unpaid', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(601, 1, 'payments', 'paid', 'Paid', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(602, 1, 'payments', 'transactions', 'Transactions', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(603, 1, 'payments', 'transaction_number', 'Txns No.', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(604, 1, 'payments', 'partially_paid', 'Partially Paid', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(605, 1, 'payments', 'order_payment', 'Order Payment', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(606, 1, 'payments', 'settle_invoice_using_payment', 'Settle below invoices using this payment', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(607, 1, 'payments', 'payment_type', 'Payment Type', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(608, 1, 'payments', 'you_will_pay', 'You Will Pay', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(609, 1, 'payments', 'you_will_receive', 'You Will Receive', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(610, 1, 'payments', 'cash', 'Cash', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(611, 1, 'payments', 'bank', 'Bank', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(612, 1, 'langs', 'add', 'Add New Language', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(613, 1, 'langs', 'edit', 'Edit Language', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(614, 1, 'langs', 'details', 'Language Details', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(615, 1, 'langs', 'created', 'Language Created Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(616, 1, 'langs', 'updated', 'Language Updated Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(617, 1, 'langs', 'deleted', 'Language Deleted Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(618, 1, 'langs', 'delete_message', 'Are you sure you want to delete this language?', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(619, 1, 'langs', 'view_all_langs', 'View All Languages', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(620, 1, 'langs', 'status_updated', 'Langugage status updated', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(621, 1, 'langs', 'name', 'Name', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(622, 1, 'langs', 'key', 'Key', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(623, 1, 'langs', 'flag', 'Flag', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(624, 1, 'langs', 'enabled', 'Enabled', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(625, 1, 'translations', 'fetch_new_translations', 'Fetch New Translations', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(626, 1, 'translations', 'reload_translations', 'Reload Translations', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(627, 1, 'translations', 'reload_successfully', 'Translations Reload Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(628, 1, 'translations', 'fetched_successfully', 'Translations Fetch Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(629, 1, 'storage_settings', 'updated', 'Storage Settings Updated', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(630, 1, 'storage_settings', 'storage', 'Storage', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(631, 1, 'storage_settings', 'local', 'Local', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(632, 1, 'storage_settings', 'aws', 'AWS S3 Storage', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(633, 1, 'storage_settings', 'aws_key', 'AWS Key', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(634, 1, 'storage_settings', 'aws_secret', 'AWS Secret', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(635, 1, 'storage_settings', 'aws_region', 'AWS Region', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(636, 1, 'storage_settings', 'aws_bucket', 'AWS Bucket', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(637, 1, 'mail_settings', 'updated', 'Mail Settings Updated', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(638, 1, 'mail_settings', 'mail_driver', 'Mail Driver', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(639, 1, 'mail_settings', 'none', 'None', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(640, 1, 'mail_settings', 'mail', 'Mail', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(641, 1, 'mail_settings', 'smtp', 'SMTP', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(642, 1, 'mail_settings', 'from_name', 'Mail From Name', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(643, 1, 'mail_settings', 'from_email', 'Mail From Email', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(644, 1, 'mail_settings', 'host', 'Host', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(645, 1, 'mail_settings', 'port', 'Port', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(646, 1, 'mail_settings', 'encryption', 'Encryption', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(647, 1, 'mail_settings', 'username', 'Username', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(648, 1, 'mail_settings', 'password', 'Password', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(649, 1, 'mail_settings', 'send_test_mail', 'Send Test Mail', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(650, 1, 'mail_settings', 'send_mail_setting_saved', 'Send mail setting saved', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(651, 1, 'mail_settings', 'enable_mail_queue', 'Enable Mail Queue', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(652, 1, 'mail_settings', 'send_mail_for', 'Send Mail For', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(653, 1, 'mail_settings', 'email', 'Email address for which you want to send test mail', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(654, 1, 'mail_settings', 'test_mail_sent_successfully', 'Test mail sent successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(655, 1, 'mail_settings', 'stock_adjustment_create', 'Stock Adjustment Create', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(656, 1, 'mail_settings', 'notificaiton_will_be_sent_to_warehouse', 'Notification will be sent to warehouse email', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(657, 1, 'online_orders', 'order_summary', 'Order Summary', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(658, 1, 'online_orders', 'cancel_order', 'Cancel Order', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(659, 1, 'online_orders', 'order_cancelled', 'Order cancelled successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(660, 1, 'online_orders', 'order_cancelled_message', 'This order has been cancelled.', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(661, 1, 'online_orders', 'cancel_message', 'Are you sure you want to cancel this online order', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(662, 1, 'online_orders', 'deliver_message', 'Are you sure you want to this order as delivered', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(663, 1, 'online_orders', 'order_confirmed', 'Order confirmed successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(664, 1, 'online_orders', 'order_status_changed', 'Order status changed successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(665, 1, 'online_orders', 'online_orders_date', 'Order Date', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(666, 1, 'online_orders', 'online_orders_status', 'Order Status', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(667, 1, 'online_orders', 'update_orders_status', 'Update Order Status', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(668, 1, 'online_orders', 'confirm_delivery', 'Confirm Delivery', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(669, 1, 'online_orders', 'order_delivered', 'Order delivered successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(670, 1, 'online_orders', 'user', 'Customer', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(671, 1, 'online_orders', 'online_store_url', 'Online Store Url', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(672, 1, 'product_card', 'add', 'Add New Product Card', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(673, 1, 'product_card', 'edit', 'Edit Product Card', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(674, 1, 'product_card', 'details', 'Product Card Details', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(675, 1, 'product_card', 'created', 'Product Card Created Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(676, 1, 'product_card', 'updated', 'Product Card Updated Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(677, 1, 'product_card', 'deleted', 'Product Card Deleted Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(678, 1, 'product_card', 'delete_message', 'Are you sure you want to delete this product card?', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(679, 1, 'product_card', 'title', 'Title', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(680, 1, 'product_card', 'subtitle', 'Subtitle', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(681, 1, 'product_card', 'products', 'Products', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(682, 1, 'front_setting', 'products', 'Products', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(683, 1, 'front_setting', 'featured_categories', 'Featured Categories', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(684, 1, 'front_setting', 'featured_categories_title', 'Featured Categories Title', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(685, 1, 'front_setting', 'featured_categories_subtitle', 'Featured Categories Subtitle', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(686, 1, 'front_setting', 'featured_products', 'Featured Products', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(687, 1, 'front_setting', 'featured_products_title', 'Featured Products Title', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(688, 1, 'front_setting', 'featured_products_subtitle', 'Featured Products Subtitle', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(689, 1, 'front_setting', 'social_links', 'Social Links', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(690, 1, 'front_setting', 'facebook', 'Facebook', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(691, 1, 'front_setting', 'twitter', 'Twitter', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(692, 1, 'front_setting', 'instagram', 'Instagram', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(693, 1, 'front_setting', 'linkedin', 'Linkedin', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(694, 1, 'front_setting', 'youtube', 'Youttube', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(695, 1, 'front_setting', 'footer', 'Footer', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(696, 1, 'front_setting', 'banners', 'Banners', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(697, 1, 'front_setting', 'placeholder_social_text', 'Please Enter {0} Url', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(698, 1, 'front_setting', 'footers', 'Footers', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(699, 1, 'front_setting', 'copyright_text', 'Copyright Text', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(700, 1, 'front_setting', 'addLink', 'Add Link', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(701, 1, 'front_setting', 'addContactLink', 'Add Contact Link', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(702, 1, 'front_setting', 'addPageDetails', 'Add Pages Details', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(703, 1, 'front_setting', 'required_text', '{0} Required', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(704, 1, 'front_setting', 'footer_page_widget', 'Footer Page Widget', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(705, 1, 'front_setting', 'footer_contact_widget', 'Footer Contact Widget', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(706, 1, 'front_setting', 'footer_links_widget', 'Footer Links Widget', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(707, 1, 'front_setting', 'bottom_banners', 'Bottom Banners', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(708, 1, 'front_setting', 'top_banners_1', 'Top Banner 1', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(709, 1, 'front_setting', 'top_banners_2', 'Top Banner 2', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(710, 1, 'front_setting', 'top_banners_3', 'Top Banner 3', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(711, 1, 'front_setting', 'add_to_cart', 'Add To Cart', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(712, 1, 'front_setting', 'footer_company_description', 'Footer Company Description', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(713, 1, 'front_setting', 'useful_links', 'Useful Links', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(714, 1, 'front_setting', 'pages', 'Pages', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(715, 1, 'front_setting', 'contact', 'Contact', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(716, 1, 'front_setting', 'all_categories', 'All Categories', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(717, 1, 'front_setting', 'no_results', 'No Results', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(718, 1, 'stock_adjustment', 'add', 'Add New Adjustment', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(719, 1, 'stock_adjustment', 'edit', 'Edit Adjustment', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(720, 1, 'stock_adjustment', 'details', 'Adjustment Details', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(721, 1, 'stock_adjustment', 'created', 'Adjustment Created Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(722, 1, 'stock_adjustment', 'updated', 'Adjustment Updated Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(723, 1, 'stock_adjustment', 'deleted', 'Adjustment Deleted Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(724, 1, 'stock_adjustment', 'delete_message', 'Are you sure you want to delete this stock adjustment?', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(725, 1, 'stock_adjustment', 'notes', 'Notes', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(726, 1, 'stock_adjustment', 'current_stock', 'Current Stock', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(727, 1, 'stock_adjustment', 'quantity', 'Quantity', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(728, 1, 'stock_adjustment', 'adjustment_type', 'Adjustment Type', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(729, 1, 'stock_adjustment', 'adjustment_add', 'Add', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(730, 1, 'stock_adjustment', 'adjustment_subtract', 'Subtract', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(731, 1, 'stock_transfer', 'add', 'Add New Transfer', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(732, 1, 'stock_transfer', 'edit', 'Edit Transfer', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(733, 1, 'stock_transfer', 'details', 'Transfer Details', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(734, 1, 'stock_transfer', 'created', 'Transfer Created Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(735, 1, 'stock_transfer', 'updated', 'Transfer Updated Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(736, 1, 'stock_transfer', 'deleted', 'Transfer Deleted Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(737, 1, 'stock_transfer', 'delete_message', 'Are you sure you want to delete this stock adjustment?', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(738, 1, 'stock_transfer', 'stock_transfer_date', 'Stock Transfer Date', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(739, 1, 'stock_transfer', 'stock_transfer_status', 'Stock Transfer Status', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(740, 1, 'stock_transfer', 'from_warehouse', 'From Warehouse', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(741, 1, 'stock_transfer', 'to_warehouse', 'To Warehouse', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(742, 1, 'stock_transfer', 'warehouse', 'Warehouse', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(743, 1, 'stock_transfer', 'products', 'Products', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(744, 1, 'stock_transfer', 'notes', 'Notes', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(745, 1, 'stock_transfer', 'quantity', 'Quantity', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(746, 1, 'stock_transfer', 'created_by', 'Created By', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(747, 1, 'stock_transfer', 'received', 'Received', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(748, 1, 'stock_transfer', 'transfered', 'Transfered', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(749, 1, 'database_backup', 'file', 'File', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(750, 1, 'database_backup', 'file_size', 'File Size', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(751, 1, 'database_backup', 'generate_backup', 'Generate Backup', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(752, 1, 'database_backup', 'delete_backup', 'Delete Backup', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(753, 1, 'database_backup', 'backup_generated_successfully', 'Backup Generated Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(754, 1, 'database_backup', 'are_you_sure_generate_backup', 'Are you sure you want to generate database backup?', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(755, 1, 'database_backup', 'are_you_sure_delete_backup', 'Are you sure you want to delete this database backup?', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(756, 1, 'database_backup', 'backup_locaion_is', 'All generated database file will be stored in storage/app/public/backup folder. ', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(757, 1, 'database_backup', 'settings', 'Command Settings', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(758, 1, 'database_backup', 'backup_command_setting', 'Backup Command Settings', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(759, 1, 'database_backup', 'mysqldump_command_path', 'mysqldump command path', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(760, 1, 'database_backup', 'command_updated', 'Command updated successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(761, 1, 'database_backup', 'window_command_path', 'If you use XAMPP then it will be => C:\\xampp\\mysql\\bin\\mysqldump.exe', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(762, 1, 'database_backup', 'laragon_command_path', 'If you use Laragon then it will be => C:\\laragon\\bin\\mysql\\mysql-5.7.24-winx64\\bin\\mysqldump.exe', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(763, 1, 'database_backup', 'linux_command_path', 'If you are on ubuntu or mac then run following command and enter output here => which mysqldump', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(764, 1, 'messages', 'product_out_of_stock', 'Product is out of stock. Current Stock is {0} while required stock is {1}.', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(765, 1, 'messages', 'leave_blank_to_create_parent_category', 'Leave it blank to create parent category', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(766, 1, 'messages', 'somehing_went_wrong', 'Something went wrong. Please contact to administrator.', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(767, 1, 'messages', 'verify_success', 'Successfully verified. Redirect to app...', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(768, 1, 'messages', 'login_success', 'Successfully login. Redirect to app...', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(769, 1, 'messages', 'login_success_dashboard', 'Successfully logged into app.', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(770, 1, 'messages', 'click_here_to_find_purchase_code', 'Click here to find your purchase code', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(771, 1, 'messages', 'verification_successfull', 'Verification successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(772, 1, 'messages', 'other_domain_linked', 'Other domain linked', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(773, 1, 'messages', 'other_domain_linked_with_purchase_code', 'Other domain is already linked with your purchase code. Please enter your purchase code for more details...', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(774, 1, 'messages', 'first_verify_module_message', 'To enable please \\n verify this module', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(775, 1, 'messages', 'are_you_sure_install_message', 'Are you sure you want to install?', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(776, 1, 'messages', 'downloading_started_message', 'Downloading started. Please wait ...', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(777, 1, 'messages', 'file_extracting_message', 'File extracteding. Please wait ...', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(778, 1, 'messages', 'installation_success', 'Installation successfully. Click here to reload page...', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(779, 1, 'messages', 'are_you_sure_update_message', 'Are you sure you want to update? Please take backup before update.', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(780, 1, 'messages', 'stmp_success_message', 'Your SMTP settings are correct..', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(781, 1, 'messages', 'stmp_error_message', 'Your SMTP settings are incorrect. Please update it to send mails', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(782, 1, 'messages', 'uploading_failed', 'Uploading failed', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(783, 1, 'messages', 'loading_app_message', 'Please wait... we are preparing something amazing for you', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(784, 1, 'messages', 'fetching_product_details', 'We are fetching product details. Please wait...', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(785, 1, 'messages', 'product_is_upto_date', 'You are on the latest version of app.', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(786, 1, 'messages', 'new_app_version_avaialbe', 'New app version {0} is available. Please update to get latest version.', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(787, 1, 'messages', 'not_able_to_edit_order', 'Only order status editable, other fields can not be editable becuase this order linked to some payments. Delete those payment(s) and try again.', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(788, 1, 'messages', 'click_here_to_download_sample_file', 'Click here to download sample csv file', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(789, 1, 'messages', 'imported_successfully', 'Imported Successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(790, 1, 'popover', 'quantitiy_alert', 'After this stock quanity it will enable low stock warning.', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(791, 1, 'popover', 'auto_detect_timezone', 'Allow auto detect timezone from browser for currently logged in user.', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(792, 1, 'popover', 'click_here_to_copy_credentials', 'Click here to copy {0} credentials', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(793, 1, 'invoice', 'purchase_invoice', 'Purchase Invoice', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(794, 1, 'invoice', 'purchase_return_invoice', 'Purchase Return Invoice', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(795, 1, 'invoice', 'sales_invoice', 'Sales Invoice', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(796, 1, 'invoice', 'sales_return_invoice', 'Sales Return Invoice', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(797, 1, 'invoice', 'invoice', 'Invoice', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(798, 1, 'invoice', 'order_date', 'Date', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(799, 1, 'invoice', 'order_status', 'Status', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(800, 1, 'invoice', 'payment_status', 'Payment Status', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(801, 1, 'invoice', 'bill_to', 'Bill To', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(802, 1, 'invoice', 'product', 'Product', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(803, 1, 'invoice', 'unit_price', 'Unit Price', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(804, 1, 'invoice', 'quantity', 'Quantity', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(805, 1, 'invoice', 'total', 'Total', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(806, 1, 'invoice', 'notes', 'Notes', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(807, 1, 'invoice', 'subtotal', 'Subtotal', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(808, 1, 'invoice', 'tax', 'Tax', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(809, 1, 'invoice', 'discount', 'Discount', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(810, 1, 'invoice', 'shipping', 'Shipping', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(811, 1, 'invoice', 'total_items', 'Total Items', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(812, 1, 'invoice', 'qty', 'Qty', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(813, 1, 'invoice', 'paid_amount', 'Paid Amount', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(814, 1, 'invoice', 'due_amount', 'Due Amount', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(815, 1, 'invoice', 'thanks_message', 'Thank You For Shopping With Us. Please Come Again', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(816, 1, 'front', 'home', 'Home', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(817, 1, 'front', 'profile', 'Profile', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(818, 1, 'front', 'dashboard', 'Dashboard', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(819, 1, 'front', 'my_orders', 'My Orders', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(820, 1, 'front', 'my_profile', 'My Profile', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(821, 1, 'front', 'logout', 'Logout', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(822, 1, 'front', 'total_orders', 'Total Orders', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(823, 1, 'front', 'pending_orders', 'Pending Orders', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(824, 1, 'front', 'processing_orders', 'Processing Orders', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(825, 1, 'front', 'completed_orders', 'Completed Orders', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(826, 1, 'front', 'recent_orders', 'Recent Orders', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(827, 1, 'front', 'order_history', 'Order History', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(828, 1, 'front', 'profile_settings', 'Profile Settings', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(829, 1, 'front', 'select_shipping_address', 'Select Shipping Address', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(830, 1, 'front', 'checkout_page', 'Checkout Page', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(831, 1, 'front', 'address_details', 'Address Details', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(832, 1, 'front', 'payment_details', 'Payment Details', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(833, 1, 'front', 'add_new_address', 'Add New Address', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(834, 1, 'front', 'cash_on_delivery', 'Cash On Delivery', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(835, 1, 'front', 'continue_shopping', 'Continue Shopping', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(836, 1, 'front', 'confirm_order', 'Confirm Order', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(837, 1, 'front', 'confirm_order_message', 'Are you sure you want to confirm this order?', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(838, 1, 'front', 'order_placed', 'Order placeded.', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(839, 1, 'front', 'order_placed_message', 'Order placed successfully.', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(840, 1, 'front', 'all_orders', 'All Orders', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(841, 1, 'front', 'follow_us', 'Follow Us', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(842, 1, 'front', 'categories', 'Categories', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(843, 1, 'front', 'pages', 'Pages', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(844, 1, 'front', 'address_deleted', 'Address Deleted', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(845, 1, 'front', 'address_saved', 'Address Saved', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(846, 1, 'front', 'address_delete_message', 'Are you sure you want to delete this address?', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(847, 1, 'front', 'setting_updated_successfully', 'Setting updated successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(848, 1, 'front', 'login', 'Login', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(849, 1, 'front', 'login_using_email_password', 'Login using email and password', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(850, 1, 'front', 'logged_in_successfully', 'Logged in successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(851, 1, 'front', 'dont_have_account', 'Don\'t have account?', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(852, 1, 'front', 'signup', 'Signup', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(853, 1, 'front', 'signup_using_email_password', 'Signup using email & password', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(854, 1, 'front', 'already_have_account', 'Already have account', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(855, 1, 'front', 'register_successfully', 'Registered successfully', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(856, 1, 'front', 'click_here_to_login', 'Click here to login', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(857, 1, 'topbar_add_button', 'add_staff_member', 'Add Staff Member', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(858, 1, 'topbar_add_button', 'add_customer', 'Add Customer', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(859, 1, 'topbar_add_button', 'add_supplier', 'Add Supplier', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(860, 1, 'topbar_add_button', 'add_brand', 'Add Brand', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(861, 1, 'topbar_add_button', 'add_category', 'Add Category', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(862, 1, 'topbar_add_button', 'add_product', 'Add Product', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(863, 1, 'topbar_add_button', 'add_sales', 'Add Sales', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(864, 1, 'topbar_add_button', 'add_purchase', 'Add Purchase', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(865, 1, 'topbar_add_button', 'add_expense_cateogory', 'Add Expense Category', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(866, 1, 'topbar_add_button', 'add_expense', 'Add Expense', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(867, 1, 'topbar_add_button', 'add_currency', 'Add Currency', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(868, 1, 'topbar_add_button', 'add_warehouse', 'Add Warehouse', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(869, 1, 'topbar_add_button', 'add_unit', 'Add Unit', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(870, 1, 'topbar_add_button', 'add_language', 'Add Language', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(871, 1, 'topbar_add_button', 'add_role', 'Add Role', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(872, 1, 'topbar_add_button', 'add_tax', 'Add Tax', '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(873, 1, 'topbar_add_button', 'add_payment_mode', 'Add Payment Mode', '2023-07-01 02:57:08', '2023-07-01 02:57:08');

-- --------------------------------------------------------

--
-- Structure de la table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `short_name` varchar(191) NOT NULL,
  `base_unit` varchar(191) DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `operator` varchar(191) NOT NULL,
  `operator_value` varchar(191) NOT NULL,
  `is_deletable` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `units`
--

INSERT INTO `units` (`id`, `name`, `short_name`, `base_unit`, `parent_id`, `operator`, `operator_value`, `is_deletable`, `created_at`, `updated_at`) VALUES
(1, 'piece', 'pc', NULL, NULL, 'multiply', '1', 0, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(2, 'meter', 'm', NULL, NULL, 'multiply', '1', 0, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(3, 'kilogram', 'kg', NULL, NULL, 'multiply', '1', 0, '2023-07-01 02:57:08', '2023-07-01 02:57:08'),
(4, 'liter', 'l', NULL, NULL, 'multiply', '1', 0, '2023-07-01 02:57:08', '2023-07-01 02:57:08');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_type` varchar(191) NOT NULL DEFAULT 'customers',
  `login_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `profile_image` varchar(191) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `shipping_address` varchar(1000) DEFAULT NULL,
  `email_verification_code` varchar(50) DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'enabled',
  `reset_code` varchar(191) DEFAULT NULL,
  `timezone` varchar(50) NOT NULL DEFAULT 'Asia/Kolkata',
  `date_format` varchar(20) NOT NULL DEFAULT 'd-m-Y',
  `date_picker_format` varchar(20) NOT NULL DEFAULT 'dd-mm-yyyy',
  `time_format` varchar(20) NOT NULL DEFAULT 'h:i a',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `warehouse_id`, `role_id`, `user_type`, `login_enabled`, `name`, `email`, `password`, `phone`, `profile_image`, `address`, `shipping_address`, `email_verification_code`, `status`, `reset_code`, `timezone`, `date_format`, `date_picker_format`, `time_format`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'staff_members', 1, 'Admin', 'admin@example.com', '$2y$10$yb6grtUfX6cPYgHblrVxNeigl0NKCeSyDMLXkMDOjtQjxmNnAh0Yu', NULL, NULL, NULL, NULL, NULL, 'enabled', NULL, 'Asia/Kolkata', 'd-m-Y', 'dd-mm-yyyy', 'h:i a', '2023-07-01 02:57:08', '2023-07-01 02:57:08');

-- --------------------------------------------------------

--
-- Structure de la table `user_address`
--

CREATE TABLE `user_address` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `shipping_address` varchar(1000) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `zipcode` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_details`
--

CREATE TABLE `user_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `opening_balance` double NOT NULL DEFAULT 0,
  `opening_balance_type` varchar(20) NOT NULL DEFAULT 'receive',
  `credit_period` int(11) NOT NULL DEFAULT 0,
  `credit_limit` double NOT NULL DEFAULT 0,
  `purchase_order_count` int(11) NOT NULL DEFAULT 0,
  `purchase_return_count` int(11) NOT NULL DEFAULT 0,
  `sales_order_count` int(11) NOT NULL DEFAULT 0,
  `sales_return_count` int(11) NOT NULL DEFAULT 0,
  `total_amount` double NOT NULL DEFAULT 0,
  `paid_amount` double NOT NULL DEFAULT 0,
  `due_amount` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_details`
--

INSERT INTO `user_details` (`id`, `warehouse_id`, `user_id`, `opening_balance`, `opening_balance_type`, `credit_period`, `credit_limit`, `purchase_order_count`, `purchase_return_count`, `sales_order_count`, `sales_return_count`, `total_amount`, `paid_amount`, `due_amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, 'receive', 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-07-01 02:57:08', '2023-07-01 02:57:08');

-- --------------------------------------------------------

--
-- Structure de la table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `dark_logo` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `show_email_on_invoice` tinyint(1) NOT NULL DEFAULT 0,
  `show_phone_on_invoice` tinyint(1) NOT NULL DEFAULT 0,
  `address` varchar(191) DEFAULT NULL,
  `terms_condition` text DEFAULT NULL,
  `bank_details` text DEFAULT NULL,
  `signature` varchar(191) DEFAULT NULL,
  `online_store_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `warehouses`
--

INSERT INTO `warehouses` (`id`, `logo`, `dark_logo`, `name`, `slug`, `email`, `phone`, `show_email_on_invoice`, `show_phone_on_invoice`, `address`, `terms_condition`, `bank_details`, `signature`, `online_store_enabled`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'Stockifly', 'stockifly', 'stockifly@example.com', '1410065407', 0, 0, NULL, '1. Goods once sold will not be taken back or exchanged \n2. All disputes are subject to [ENTER_YOUR_CITY_NAME] jurisdiction only', NULL, NULL, 1, '2023-07-01 02:57:08', '2023-07-01 02:57:09');

-- --------------------------------------------------------

--
-- Structure de la table `warehouse_history`
--

CREATE TABLE `warehouse_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `expense_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `quantity` double(8,2) NOT NULL DEFAULT 0.00,
  `status` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `transaction_number` varchar(191) DEFAULT NULL,
  `staff_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `warehouse_stocks`
--

CREATE TABLE `warehouse_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `stock_quantity` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Index pour la table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_currency_id_foreign` (`currency_id`),
  ADD KEY `companies_lang_id_foreign` (`lang_id`),
  ADD KEY `companies_warehouse_id_foreign` (`warehouse_id`);

--
-- Index pour la table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_expense_category_id_foreign` (`expense_category_id`),
  ADD KEY `expenses_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `expenses_user_id_foreign` (`user_id`);

--
-- Index pour la table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `front_product_cards`
--
ALTER TABLE `front_product_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `front_product_cards_warehouse_id_foreign` (`warehouse_id`);

--
-- Index pour la table `front_website_settings`
--
ALTER TABLE `front_website_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `front_website_settings_warehouse_id_foreign` (`warehouse_id`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Index pour la table `langs`
--
ALTER TABLE `langs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_tax_id_foreign` (`tax_id`),
  ADD KEY `orders_staff_user_id_foreign` (`staff_user_id`),
  ADD KEY `orders_cancelled_by_foreign` (`cancelled_by`),
  ADD KEY `orders_from_warehouse_id_foreign` (`from_warehouse_id`);

--
-- Index pour la table `order_custom_fields`
--
ALTER TABLE `order_custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_custom_fields_order_id_foreign` (`order_id`);

--
-- Index pour la table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_user_id_foreign` (`user_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_unit_id_foreign` (`unit_id`),
  ADD KEY `order_items_tax_id_foreign` (`tax_id`);

--
-- Index pour la table `order_payments`
--
ALTER TABLE `order_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_payments_payment_id_foreign` (`payment_id`),
  ADD KEY `order_payments_order_id_foreign` (`order_id`);

--
-- Index pour la table `order_shipping_address`
--
ALTER TABLE `order_shipping_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_shipping_address_order_id_foreign` (`order_id`);

--
-- Index pour la table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `payments_payment_mode_id_foreign` (`payment_mode_id`),
  ADD KEY `payments_user_id_foreign` (`user_id`),
  ADD KEY `payments_staff_user_id_foreign` (`staff_user_id`);

--
-- Index pour la table `payment_modes`
--
ALTER TABLE `payment_modes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_unit_id_foreign` (`unit_id`),
  ADD KEY `products_user_id_foreign` (`user_id`);

--
-- Index pour la table `product_custom_fields`
--
ALTER TABLE `product_custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_custom_fields_product_id_foreign` (`product_id`),
  ADD KEY `product_custom_fields_warehouse_id_foreign` (`warehouse_id`);

--
-- Index pour la table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_details_product_id_foreign` (`product_id`),
  ADD KEY `product_details_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `product_details_tax_id_foreign` (`tax_id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Index pour la table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `stock_adjustments`
--
ALTER TABLE `stock_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_adjustments_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `stock_adjustments_product_id_foreign` (`product_id`),
  ADD KEY `stock_adjustments_created_by_foreign` (`created_by`);

--
-- Index pour la table `stock_history`
--
ALTER TABLE `stock_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_history_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `stock_history_product_id_foreign` (`product_id`),
  ADD KEY `stock_history_created_by_foreign` (`created_by`);

--
-- Index pour la table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_lang_id_foreign` (`lang_id`);

--
-- Index pour la table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_parent_id_foreign` (`parent_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_warehouse_id_foreign` (`warehouse_id`);

--
-- Index pour la table `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_address_user_id_foreign` (`user_id`);

--
-- Index pour la table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_details_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `user_details_user_id_foreign` (`user_id`);

--
-- Index pour la table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `warehouse_history`
--
ALTER TABLE `warehouse_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_history_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `warehouse_history_user_id_foreign` (`user_id`),
  ADD KEY `warehouse_history_order_id_foreign` (`order_id`),
  ADD KEY `warehouse_history_order_item_id_foreign` (`order_item_id`),
  ADD KEY `warehouse_history_product_id_foreign` (`product_id`),
  ADD KEY `warehouse_history_payment_id_foreign` (`payment_id`),
  ADD KEY `warehouse_history_expense_id_foreign` (`expense_id`),
  ADD KEY `warehouse_history_staff_user_id_foreign` (`staff_user_id`);

--
-- Index pour la table `warehouse_stocks`
--
ALTER TABLE `warehouse_stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_stocks_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `warehouse_stocks_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `front_product_cards`
--
ALTER TABLE `front_product_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `front_website_settings`
--
ALTER TABLE `front_website_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `langs`
--
ALTER TABLE `langs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order_custom_fields`
--
ALTER TABLE `order_custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order_payments`
--
ALTER TABLE `order_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order_shipping_address`
--
ALTER TABLE `order_shipping_address`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `payment_modes`
--
ALTER TABLE `payment_modes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `product_custom_fields`
--
ALTER TABLE `product_custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `stock_adjustments`
--
ALTER TABLE `stock_adjustments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `stock_history`
--
ALTER TABLE `stock_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=874;

--
-- AUTO_INCREMENT pour la table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `user_address`
--
ALTER TABLE `user_address`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `warehouse_history`
--
ALTER TABLE `warehouse_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `warehouse_stocks`
--
ALTER TABLE `warehouse_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
