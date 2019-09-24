-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2019 at 04:24 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel-ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Kim O\'Reilly', 'admin@admin.com', NULL, '$2y$10$ZOqXIrIyDlQhJLeK0nHNJ.OjRmwSjk6NybOehTCwGsrwEXe1wYKq6', NULL, '2019-05-21 07:46:07', '2019-05-21 07:46:07');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frontend_type` enum('select','radio','text','text_area') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_filterable` tinyint(1) NOT NULL DEFAULT '0',
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `code`, `name`, `frontend_type`, `is_filterable`, `is_required`, `created_at`, `updated_at`) VALUES
(1, 'size', 'Size', 'select', 1, 1, '2019-07-02 10:50:49', '2019-07-02 10:50:49'),
(2, 'color', 'Color', 'select', 1, 1, '2019-07-02 10:50:49', '2019-07-02 10:50:49');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(2,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `attribute_id`, `value`, `price`, `created_at`, `updated_at`) VALUES
(5, 1, 'small', '0.99', '2019-07-02 10:51:02', '2019-07-02 10:51:02'),
(6, 1, 'medium', '0.41', '2019-07-02 10:51:02', '2019-07-18 13:08:23'),
(7, 1, 'large', '0.89', '2019-07-02 10:51:02', '2019-07-18 13:07:15'),
(9, 2, 'blue', NULL, '2019-07-02 10:51:02', '2019-07-02 10:51:02'),
(10, 2, 'red', NULL, '2019-07-02 10:51:03', '2019-07-02 10:51:03'),
(11, 2, 'orange', NULL, '2019-07-02 10:51:03', '2019-07-02 10:51:03'),
(13, 1, 'extra large', '0.34', '2019-07-18 12:49:19', '2019-07-18 13:08:52'),
(14, 2, 'yellow', NULL, '2019-07-19 05:19:45', '2019-07-19 05:19:45'),
(17, 2, 'green', NULL, '2019-07-19 11:13:28', '2019-07-19 11:13:39');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT '1',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `menu` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `parent_id`, `featured`, `menu`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Root', 'root', 'This is the root category, don\'t delete this one', NULL, 0, 0, NULL, '2019-06-13 11:08:24', '2019-06-13 11:08:24'),
(3, 'Mrs. Maya Schmidt V', 'mrs-maya-schmidt-v', 'Queen in front of the trees behind him. \'--or next day, maybe,\' the Footman remarked, \'till.', 1, 0, 1, NULL, '2019-06-13 11:08:25', '2019-06-13 11:08:25'),
(4, 'Rylan Terry', 'rylan-terry', 'I\'m never sure what I\'m going to do such a nice little dog near our house I should frighten them.', 1, 0, 1, NULL, '2019-06-13 11:08:25', '2019-06-13 11:08:25'),
(5, 'Dr. Scottie Lemke DDS', 'dr-scottie-lemke-dds', 'Dormouse shook itself, and began to repeat it, but her head pressing against the roof of the.', 1, 0, 1, NULL, '2019-06-13 11:08:25', '2019-06-13 11:08:25'),
(6, 'Mrs. Berneice Wilderman', 'mrs-berneice-wilderman', 'Dormouse. \'Write that down,\' the King added in an undertone to the garden door. Poor Alice! It was.', 1, 0, 1, NULL, '2019-06-13 11:08:25', '2019-06-13 11:08:25'),
(7, 'Dr. Bertha Feeney', 'dr-bertha-feeney', 'As she said to Alice; and Alice thought she had felt quite relieved to see you again, you dear old.', 1, 0, 1, NULL, '2019-06-13 11:08:25', '2019-06-13 11:08:25'),
(8, 'Meggie Grant', 'meggie-grant', 'Alice. \'I\'ve tried every way, and then at the end of every line: \'Speak roughly to your places!\'.', 1, 0, 1, NULL, '2019-06-13 11:08:25', '2019-06-13 11:08:25'),
(9, 'Hester Williamson', 'hester-williamson', 'Edgar Atheling to meet William and offer him the crown. William\'s conduct at first she would feel.', 1, 0, 1, NULL, '2019-06-13 11:08:25', '2019-06-13 11:08:25'),
(10, 'Dr. Flavie Stehr Jr.', 'dr-flavie-stehr-jr', 'Alice thought to herself, \'I don\'t much care where--\' said Alice. \'That\'s very curious!\' she.', 1, 0, 1, NULL, '2019-06-13 11:08:25', '2019-06-13 11:08:25'),
(11, 'Jerrod Kuhic', 'jerrod-kuhic', 'King. \'Nothing whatever,\' said Alice. \'Who\'s making personal remarks now?\' the Hatter hurriedly.', 1, 0, 1, 'categories/7rULWHnOrDvMisrzWD5qniP3N.jpg', '2019-06-13 11:08:25', '2019-07-12 09:45:43'),
(12, 'Cat55', 'cat55', 'testtewst', 10, 1, 1, 'categories/5eU7OGM3CJiYVRGwZJYv8agnD.jpg', '2019-09-24 12:13:51', '2019-09-24 12:14:32');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_05_21_092253_create_admins_table', 1),
(4, '2019_06_07_135550_create_settings_table', 2),
(5, '2019_06_11_135844_create_categories_table', 3),
(9, '2019_07_02_093438_create_attributes_table', 4),
(10, '2019_07_02_121301_create_attribute_values_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'site_name', 'E-Commerce2', NULL, '2019-09-24 12:18:41'),
(2, 'site_title', 'Some title', NULL, '2019-09-24 12:19:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attributes_code_unique` (`code`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_values_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
