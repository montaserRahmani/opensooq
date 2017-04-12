-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2017 at 05:12 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `opensooq`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Cars'),
(2, 'Mobiles'),
(3, 'Tablets');

-- --------------------------------------------------------

--
-- Table structure for table `category_tag`
--

CREATE TABLE `category_tag` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `category_tag`
--

INSERT INTO `category_tag` (`id`, `category_id`, `tag_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 2, 10),
(11, 2, 11),
(12, 2, 12),
(13, 3, 13),
(14, 3, 14);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8_bin NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1491646212),
('m140209_132017_init', 1491772064),
('m140403_174025_create_account_table', 1491772066),
('m140504_113157_update_tables', 1491772073),
('m140504_130429_create_token_table', 1491772075),
('m140830_171933_fix_ip_field', 1491772076),
('m140830_172703_change_account_table_name', 1491772076),
('m141222_110026_update_ip_field', 1491772078),
('m141222_135246_alter_username_length', 1491772079),
('m150614_103145_update_social_account_table', 1491772083),
('m150623_212711_fix_username_notnull', 1491772083),
('m151218_234654_add_timezone_to_profile', 1491772084),
('m160929_103127_add_last_login_at_to_user_table', 1491772084),
('m170408_095843_create_category_table', 1491761584),
('m170408_100022_create_category_tag_table', 1491761586),
('m170409_221640_add_admin_user', 1491776783),
('m170409_223236_add_admin_user', 1491777177);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(10) NOT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `cat_id` int(10) DEFAULT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `description`, `cat_id`, `user_id`) VALUES
(4, '213213', 'asdfasfdasdf', 2, 5),
(5, 'second tag post', 'asdfasdfasdf', 1, 1),
(6, 'asdfasdfasdfas', 'dfasdfasdfasdf', 3, 1),
(10, 'asfasdas', 'dgafsgafgafdg', 1, 2),
(11, '', '', NULL, 1),
(12, 'zfczsfsf', 'asdasdasd', 2, 1),
(13, 'dfsgsdfgsdf', 'gsdfgsdf gsdf gsdfg sdfg sdfg sdfg sdfg sdfg sdfg sdfg sdfg sdfg sdfgsdf ', 1, 1),
(14, 'dfsgsdfgsdf', 'gsdfgsdf gsdf gsdfg sdfg sdfg sdfg sdfg sdfg sdfg sdfg sdfg sdfg sdfgsdf ', 1, 1),
(15, 'sfgsdfgsdfg', 'sdfgsdfgsdfgsdf', 1, 1),
(16, 'asdfasdfasg', 'sdafgasdgafg', 1, 1),
(17, 'asdfasdfasg', 'sdafgasdgafg', 1, 1),
(18, 'asdgasdgadfg', 'adfgasfgadf gadfs gsdafg asdg ', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `id` int(10) NOT NULL,
  `tag_id` int(10) NOT NULL,
  `post_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`id`, `tag_id`, `post_id`) VALUES
(12, 1, 5),
(13, 4, 5),
(14, 1, 4),
(15, 2, 4),
(16, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `bio`, `timezone`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `social_account`
--

CREATE TABLE `social_account` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `social_account`
--

INSERT INTO `social_account` (`id`, `user_id`, `provider`, `client_id`, `data`, `code`, `created_at`, `email`, `username`) VALUES
(1, 6, 'facebook', '1382700251788260', '{\"name\":\"Montaser Rahmani\",\"email\":\"alzaeem08@hotmail.com\",\"id\":\"1382700251788260\"}', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(10) NOT NULL,
  `text` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `text`) VALUES
(1, 'toyota'),
(2, 'honda'),
(3, 'gmc'),
(4, 'automatic'),
(5, 'manual'),
(6, 'hybrid'),
(7, 'gas'),
(8, 'iphone'),
(9, 'galaxy s'),
(10, 'galaxy note'),
(11, 'black'),
(12, 'white'),
(13, 'ipad'),
(14, 'galaxy tab');

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`user_id`, `code`, `created_at`, `type`) VALUES
(1, 'HjZVzyNYPqllkb9QcAFF_cG6A8-9T4yU', 1491772760, 0),
(2, 'QmkAyPbiM1JTdLF4kMOY6HIoEafU649F', 1491774293, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `last_login_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`, `last_login_at`) VALUES
(1, 'montaser', 'montaser.rah@gmail.com', '$2y$12$lcUxogFMYvtH5yaHtxmztO2famVFNoH9TPE4gi0knByxh/ckCPi0C', 'p8Mvc4a3uoZX1TCjs841fw7203WDZKuw', NULL, NULL, NULL, '::1', 1491772760, 1491772760, 0, 1491987673),
(2, 'ahma', 'ahma@ahma.com', '$2y$12$bJgK2mPf9u1zsMp6fNglg.eIDIGRiNkfAHuLm3pOszMqMoFfUqpDe', 'ctWB_lChKeeFlkxlJT59DP2aRbZrmmDp', NULL, NULL, NULL, '::1', 1491774293, 1491774293, 0, 1491776821),
(5, 'admin', 'admin@admin.com', '$2y$13$5o8JWVJSq0O8TnYneGlr5.BhKcO5gBDzUaS9.m6HACx95mIZzDP1e', 'FjYjJFVVYaGhGMmMwVFCYBkSBU6hpGu4', NULL, NULL, NULL, NULL, 0, 0, 0, 1492004060),
(6, 'montaser2', 'alzaeem08@hotmail.com', '$2y$12$0UIQ29IIKOCCdy/zDTpT1eldrxhuTf1ZXHIVnyODXoAh9Au37NFuG', 'FfKaU5YbLQAjmOXBEvpGrYi-zdQbDGvW', 1491932914, NULL, NULL, '::1', 1491932914, 1491932914, 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `category_tag`
--
ALTER TABLE `category_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category_tag_category` (`category_id`),
  ADD KEY `fk_category_tag_tag` (`tag_id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_catID` (`cat_id`),
  ADD KEY `post_userID` (`user_id`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post-tag_tag_id` (`tag_id`),
  ADD KEY `post-tag_post_id` (`post_id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `social_account`
--
ALTER TABLE `social_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_unique` (`provider`,`client_id`),
  ADD UNIQUE KEY `account_unique_code` (`code`),
  ADD KEY `fk_user_account` (`user_id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD UNIQUE KEY `token_unique` (`user_id`,`code`,`type`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_unique_username` (`username`),
  ADD UNIQUE KEY `user_unique_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `category_tag`
--
ALTER TABLE `category_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `social_account`
--
ALTER TABLE `social_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_tag`
--
ALTER TABLE `category_tag`
  ADD CONSTRAINT `fk_category_tag_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_category_tag_tag` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_catID` FOREIGN KEY (`cat_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `post_userID` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `post-tag_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `post-tag_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`);

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `social_account`
--
ALTER TABLE `social_account`
  ADD CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
