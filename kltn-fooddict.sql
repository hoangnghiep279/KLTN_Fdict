-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2025 at 05:01 AM
-- Server version: 11.5.2-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kltn-fooddict`
--

-- --------------------------------------------------------

--
-- Table structure for table `cooking_methods`
--

CREATE TABLE `cooking_methods` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cooking_methods`
--

INSERT INTO `cooking_methods` (`id`, `name`) VALUES
('765b04b8-0534-11f0-a1d9-60a82de70049', 'quay/rôti'),
('765b0b44-0534-11f0-a1d9-60a82de70049', 'nướng'),
('765b2b6f-0534-11f0-a1d9-60a82de70049', 'chiên'),
('765b2c22-0534-11f0-a1d9-60a82de70049', 'hấp'),
('765b2c4b-0534-11f0-a1d9-60a82de70049', 'gỏi/trộn'),
('765b2c66-0534-11f0-a1d9-60a82de70049', 'hầm'),
('765b2c92-0534-11f0-a1d9-60a82de70049', 'lẩu'),
('765b2cb5-0534-11f0-a1d9-60a82de70049', 'món xào'),
('765b2ce4-0534-11f0-a1d9-60a82de70049', 'canh/súp'),
('765b2d04-0534-11f0-a1d9-60a82de70049', 'om/rim'),
('765b2d19-0534-11f0-a1d9-60a82de70049', 'kho'),
('765b2d2e-0534-11f0-a1d9-60a82de70049', 'khác');

-- --------------------------------------------------------

--
-- Table structure for table `favorite_recipes`
--

CREATE TABLE `favorite_recipes` (
  `id` char(36) NOT NULL,
  `user_id` char(36) DEFAULT NULL,
  `recipe_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `category`) VALUES
('1d7fcb94-106c-11f0-9e95-57807cec2c15', 'ba chỉ', 'lợn'),
('228eec19-1398-11f0-a16e-5fa317865b35', 'áa', 'sâ'),
('34801b5f-1398-11f0-a16e-5fa317865b35', 'Thăn', 'lợn'),
('96933448-106a-11f0-9e95-57807cec2c15', 'fasd', 'ds'),
('96936565-106a-11f0-9e95-57807cec2c15', 'd', 'd');

-- --------------------------------------------------------

--
-- Table structure for table `meal_categories`
--

CREATE TABLE `meal_categories` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meal_categories`
--

INSERT INTO `meal_categories` (`id`, `name`) VALUES
('961dbf55-0535-11f0-a1d9-60a82de70049', 'sáng'),
('961dc304-0535-11f0-a1d9-60a82de70049', 'trưa'),
('961dc36a-0535-11f0-a1d9-60a82de70049', 'tối');

-- --------------------------------------------------------

--
-- Table structure for table `meal_type`
--

CREATE TABLE `meal_type` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meal_type`
--

INSERT INTO `meal_type` (`id`, `name`) VALUES
('030ea8c9-0536-11f0-a1d9-60a82de70049', 'ăn vặt'),
('030eab9f-0536-11f0-a1d9-60a82de70049', 'các món ăn kèm, món phụ'),
('030eac05-0536-11f0-a1d9-60a82de70049', 'ăn chay'),
('030eac1b-0536-11f0-a1d9-60a82de70049', 'món nhậu'),
('030eac2e-0536-11f0-a1d9-60a82de70049', 'món mặn');

-- --------------------------------------------------------

--
-- Table structure for table `nutrition_needs`
--

CREATE TABLE `nutrition_needs` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nutrition_needs`
--

INSERT INTO `nutrition_needs` (`id`, `name`) VALUES
('87114d89-0536-11f0-a1d9-60a82de70049', 'cân bằng dinh dưỡng'),
('87115057-0536-11f0-a1d9-60a82de70049', 'hỗ trợ cho thận khỏe mạnh'),
('871150b8-0536-11f0-a1d9-60a82de70049', 'hỗ trợ cho gan khỏe mạnh'),
('871150cc-0536-11f0-a1d9-60a82de70049', 'giúp làm việc trí não hiệu quả'),
('871150e1-0536-11f0-a1d9-60a82de70049', 'giảm khối mỡ thừa của cơ thể'),
('871150f5-0536-11f0-a1d9-60a82de70049', 'bổ máu'),
('87115113-0536-11f0-a1d9-60a82de70049', 'hỗ trợ xây dựng khối cơ xương');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` tinyint(1) NOT NULL,
  `name` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` char(36) NOT NULL,
  `name` varchar(50) NOT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `serving_size` varchar(20) DEFAULT NULL,
  `cooking_time` varchar(20) DEFAULT NULL,
  `difficulty` int(11) DEFAULT NULL,
  `calories` varchar(20) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `preparation` text DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `usagefood` text NOT NULL,
  `tips` text DEFAULT NULL,
  `expert_advice` text DEFAULT NULL,
  `img_nutrition` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `name`, `img_url`, `serving_size`, `cooking_time`, `difficulty`, `calories`, `description`, `preparation`, `instructions`, `usagefood`, `tips`, `expert_advice`, `img_nutrition`, `created_at`) VALUES
('1d7f7144-106c-11f0-9e95-57807cec2c15', 'suzyy', 'resources/img-recipes/1744019938167.png', '3', '20 phút', 2, '333', 'dfsfsad', 'dsfafsdasdfa', 'ádffdas', 'fadfsafas', '', 'fdasfadsasdf', 'resources/img-recipes/1744020444148.jpg', '2025-04-03 16:14:47'),
('96930e87-106a-11f0-9e95-57807cec2c15', 'bé yêu', 'resources/img-recipes/1743671032087.jpg', '2', '30 phút', 1, '222', 'fadsf', 'dfsaf', 'fasdfa', 'sdafasd', 'fdasf', 'adfsfas', 'resources/img-recipes/1743671032093.jpg', '2025-04-03 16:03:52');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_cooking_methods`
--

CREATE TABLE `recipe_cooking_methods` (
  `id` char(36) NOT NULL,
  `recipe_id` char(36) DEFAULT NULL,
  `cooking_method_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipe_cooking_methods`
--

INSERT INTO `recipe_cooking_methods` (`id`, `recipe_id`, `cooking_method_id`) VALUES
('967d03e7-15e4-11f0-a0c3-38fc9861f2be', '1d7f7144-106c-11f0-9e95-57807cec2c15', '765b2d04-0534-11f0-a1d9-60a82de70049'),
('9693a4b3-106a-11f0-9e95-57807cec2c15', '96930e87-106a-11f0-9e95-57807cec2c15', '765b2d04-0534-11f0-a1d9-60a82de70049');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_ingredients`
--

CREATE TABLE `recipe_ingredients` (
  `id` char(36) NOT NULL,
  `recipe_id` char(36) DEFAULT NULL,
  `ingredient_id` char(36) DEFAULT NULL,
  `quantity` varchar(20) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipe_ingredients`
--

INSERT INTO `recipe_ingredients` (`id`, `recipe_id`, `ingredient_id`, `quantity`, `unit`) VALUES
('228f3757-1398-11f0-a16e-5fa317865b35', '1d7f7144-106c-11f0-9e95-57807cec2c15', '228eec19-1398-11f0-a16e-5fa317865b35', '3', 'ed'),
('348039eb-1398-11f0-a16e-5fa317865b35', '1d7f7144-106c-11f0-9e95-57807cec2c15', '34801b5f-1398-11f0-a16e-5fa317865b35', '3', 'ok'),
('96934ab1-106a-11f0-9e95-57807cec2c15', '96930e87-106a-11f0-9e95-57807cec2c15', '96933448-106a-11f0-9e95-57807cec2c15', '3', 'dd'),
('96937a60-106a-11f0-9e95-57807cec2c15', '96930e87-106a-11f0-9e95-57807cec2c15', '96936565-106a-11f0-9e95-57807cec2c15', '3424', 'dfsaf');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_meal_categories`
--

CREATE TABLE `recipe_meal_categories` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `recipe_id` char(36) NOT NULL,
  `meal_category_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipe_meal_categories`
--

INSERT INTO `recipe_meal_categories` (`id`, `recipe_id`, `meal_category_id`) VALUES
('967cfaff-15e4-11f0-a0c3-38fc9861f2be', '1d7f7144-106c-11f0-9e95-57807cec2c15', '961dbf55-0535-11f0-a1d9-60a82de70049'),
('96939b95-106a-11f0-9e95-57807cec2c15', '96930e87-106a-11f0-9e95-57807cec2c15', '961dbf55-0535-11f0-a1d9-60a82de70049');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_meal_types`
--

CREATE TABLE `recipe_meal_types` (
  `id` char(36) NOT NULL,
  `recipe_id` char(36) NOT NULL,
  `mealtype_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipe_meal_types`
--

INSERT INTO `recipe_meal_types` (`id`, `recipe_id`, `mealtype_id`) VALUES
('967cf11c-15e4-11f0-a0c3-38fc9861f2be', '1d7f7144-106c-11f0-9e95-57807cec2c15', '030ea8c9-0536-11f0-a1d9-60a82de70049'),
('969382f4-106a-11f0-9e95-57807cec2c15', '96930e87-106a-11f0-9e95-57807cec2c15', '030ea8c9-0536-11f0-a1d9-60a82de70049');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_nutrition_needs`
--

CREATE TABLE `recipe_nutrition_needs` (
  `id` char(36) NOT NULL,
  `recipe_id` char(36) DEFAULT NULL,
  `nutrition_needs_id` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipe_nutrition_needs`
--

INSERT INTO `recipe_nutrition_needs` (`id`, `recipe_id`, `nutrition_needs_id`) VALUES
('967d186c-15e4-11f0-a0c3-38fc9861f2be', '1d7f7144-106c-11f0-9e95-57807cec2c15', '87114d89-0536-11f0-a1d9-60a82de70049'),
('967d2146-15e4-11f0-a0c3-38fc9861f2be', '1d7f7144-106c-11f0-9e95-57807cec2c15', '871150e1-0536-11f0-a1d9-60a82de70049'),
('967d2a0a-15e4-11f0-a0c3-38fc9861f2be', '1d7f7144-106c-11f0-9e95-57807cec2c15', '871150f5-0536-11f0-a1d9-60a82de70049'),
('9693ae87-106a-11f0-9e95-57807cec2c15', '96930e87-106a-11f0-9e95-57807cec2c15', '87114d89-0536-11f0-a1d9-60a82de70049');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` char(36) NOT NULL,
  `permission_id` tinyint(1) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `gender` int(11) NOT NULL DEFAULT 0,
  `birthday` datetime DEFAULT NULL,
  `banned_until` datetime DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `permission_id`, `name`, `email`, `password`, `created_at`, `gender`, `birthday`, `banned_until`, `avatar`) VALUES
('6cea5cdc-0880-11f0-9ee4-57838c346148', 2, 'nghiệp', 'nghiep@gmail.com', '$2b$10$Fjv/9akFhgj0J1ApWpsk5.fbgFfCzaPyj3mOuXmY/4OWRH.Ccy8hG', '2025-03-24 14:19:56', 1, '2001-09-22 00:00:00', NULL, 'resources/default-avatar.png'),
('c5ac6d06-fafd-11ef-a991-38fc9861f2be', 2, 'nghiep1', 'anhnghiep12@gmail.com', '$2b$10$xJrJ3nn8V8uzI93RIi0RYe5FxT52KCVPcfu33CQODcSfNd6KpsxWO', '2025-03-07 09:41:47', 2, '2001-09-22 00:00:00', NULL, 'resources/user-img/1b91cd5a830809cb30b8194571ad600e.png'),
('f42366a7-f96b-11ef-a991-38fc9861f2be', 2, 'hoàngnghiệp', 'anh123@gmail.com', '1', '2025-03-05 09:45:35', 1, '2001-09-22 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_meal_plans`
--

CREATE TABLE `user_meal_plans` (
  `id` char(36) NOT NULL,
  `user_id` char(36) DEFAULT NULL,
  `recipe_id` char(36) DEFAULT NULL,
  `date` datetime NOT NULL,
  `meal_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cooking_methods`
--
ALTER TABLE `cooking_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorite_recipes`
--
ALTER TABLE `favorite_recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meal_categories`
--
ALTER TABLE `meal_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meal_type`
--
ALTER TABLE `meal_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nutrition_needs`
--
ALTER TABLE `nutrition_needs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipe_cooking_methods`
--
ALTER TABLE `recipe_cooking_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`),
  ADD KEY `cooking_method_id` (`cooking_method_id`);

--
-- Indexes for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Indexes for table `recipe_meal_categories`
--
ALTER TABLE `recipe_meal_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meal_category_id` (`meal_category_id`);

--
-- Indexes for table `recipe_meal_types`
--
ALTER TABLE `recipe_meal_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`),
  ADD KEY `mealtype_id` (`mealtype_id`);

--
-- Indexes for table `recipe_nutrition_needs`
--
ALTER TABLE `recipe_nutrition_needs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`),
  ADD KEY `nutrition_needs_id` (`nutrition_needs_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Indexes for table `user_meal_plans`
--
ALTER TABLE `user_meal_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorite_recipes`
--
ALTER TABLE `favorite_recipes`
  ADD CONSTRAINT `favorite_recipes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `favorite_recipes_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`);

--
-- Constraints for table `recipe_cooking_methods`
--
ALTER TABLE `recipe_cooking_methods`
  ADD CONSTRAINT `recipe_cooking_methods_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`),
  ADD CONSTRAINT `recipe_cooking_methods_ibfk_2` FOREIGN KEY (`cooking_method_id`) REFERENCES `cooking_methods` (`id`);

--
-- Constraints for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD CONSTRAINT `recipe_ingredients_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`),
  ADD CONSTRAINT `recipe_ingredients_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`);

--
-- Constraints for table `recipe_meal_categories`
--
ALTER TABLE `recipe_meal_categories`
  ADD CONSTRAINT `recipe_meal_categories_ibfk_1` FOREIGN KEY (`meal_category_id`) REFERENCES `meal_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recipe_meal_types`
--
ALTER TABLE `recipe_meal_types`
  ADD CONSTRAINT `recipe_meal_types_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recipe_meal_types_ibfk_2` FOREIGN KEY (`mealtype_id`) REFERENCES `meal_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recipe_nutrition_needs`
--
ALTER TABLE `recipe_nutrition_needs`
  ADD CONSTRAINT `recipe_nutrition_needs_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`),
  ADD CONSTRAINT `recipe_nutrition_needs_ibfk_2` FOREIGN KEY (`nutrition_needs_id`) REFERENCES `nutrition_needs` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`);

--
-- Constraints for table `user_meal_plans`
--
ALTER TABLE `user_meal_plans`
  ADD CONSTRAINT `user_meal_plans_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `user_meal_plans_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
