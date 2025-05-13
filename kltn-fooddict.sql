-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2025 at 12:00 PM
-- Server version: 10.4.32-MariaDB
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
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `recipe_id` char(36) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `recipe_id`, `content`, `created_at`) VALUES
('02a20f58-2cb1-11f0-bee5-fc34974bb26c', '6cea5cdc-0880-11f0-9ee4-57838c346148', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', 'ngon', '2025-05-09 15:38:41'),
('27edc30f-2c7f-11f0-a16d-fc34974bb26c', '6cea5cdc-0880-11f0-9ee4-57838c346148', '3c5adf20-27fa-11f0-b0f6-fc34974bb26c', 'ủyytyrt', '2025-05-09 09:41:49'),
('332bb124-2cb1-11f0-bee5-fc34974bb26c', '28851978-2cb1-11f0-bee5-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', 'ngon', '2025-05-09 15:40:02'),
('698ce0f2-2fdf-11f0-957d-fc34974bb26c', '28851978-2cb1-11f0-bee5-fc34974bb26c', 'f45dfde0-27fe-11f0-b0f6-fc34974bb26c', 'ngon quá đi', '2025-05-13 16:48:24');

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

--
-- Dumping data for table `favorite_recipes`
--

INSERT INTO `favorite_recipes` (`id`, `user_id`, `recipe_id`) VALUES
('27195bed-2fdf-11f0-957d-fc34974bb26c', '28851978-2cb1-11f0-bee5-fc34974bb26c', '3c5adf20-27fa-11f0-b0f6-fc34974bb26c'),
('3cdb863e-2d86-11f0-921a-fc34974bb26c', '28851978-2cb1-11f0-bee5-fc34974bb26c', 'f45dfde0-27fe-11f0-b0f6-fc34974bb26c'),
('65f16526-2bea-11f0-a6f8-fc34974bb26c', '6cea5cdc-0880-11f0-9ee4-57838c346148', '3c5adf20-27fa-11f0-b0f6-fc34974bb26c'),
('90fe2731-2b1b-11f0-a774-fc34974bb26c', '6cea5cdc-0880-11f0-9ee4-57838c346148', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `category`, `type`) VALUES
('0a8dc8aa-2995-11f0-aded-fc34974bb26c', 'Sả 4 cây', '', ''),
('0a8e0216-2995-11f0-aded-fc34974bb26c', 'Hành tây', '', ''),
('0a8e2bb6-2995-11f0-aded-fc34974bb26c', 'Gừng nhỏ 1 củ', '', ''),
('0a8eb306-2995-11f0-aded-fc34974bb26c', 'Hành tím 5 củ', '', ''),
('0a8f150e-2995-11f0-aded-fc34974bb26c', 'Tỏi 2 tép', '', ''),
('0a8f2d5c-2995-11f0-aded-fc34974bb26c', 'Nước dừa tươi ', '', ''),
('1d7fcb94-106c-11f0-9e95-57807cec2c15', 'ba chỉ', 'lợn', NULL),
('21225630-2996-11f0-aded-fc34974bb26c', 'Bóng bì lợn', 'lợn', 'thịt'),
('2122738d-2996-11f0-aded-fc34974bb26c', 'Giò sống', 'giò', 'khác'),
('21228601-2996-11f0-aded-fc34974bb26c', 'Cà rốt', '', ''),
('2122e2f1-2996-11f0-aded-fc34974bb26c', 'Bông cải trắng 80g', '', ''),
('2122fe17-2996-11f0-aded-fc34974bb26c', 'Bông cải xanh 80g', '', ''),
('21231243-2996-11f0-aded-fc34974bb26c', 'Nấm hương rừng Sapa (loại có xiên) 10g', '', ''),
('212324c5-2996-11f0-aded-fc34974bb26c', 'Gia vị: Muối, đường, nước mắm', '', ''),
('3479b876-27fe-11f0-b0f6-fc34974bb26c', 'Tim heo', 'heo', 'thịt'),
('34801b5f-1398-11f0-a16e-5fa317865b35', 'Thăn', 'lợn', NULL),
('384389fd-2997-11f0-aded-fc34974bb26c', 'Nấm đùi gà', 'Nấm', 'rau củ quả'),
('3843c0db-2997-11f0-aded-fc34974bb26c', 'Lá tàu hủ ky khô 60g', '', 'rau củ quả khác'),
('3843eaa4-2997-11f0-aded-fc34974bb26c', 'Hạt sen 30g', '', 'rau củ quả khác'),
('38440ea6-2997-11f0-aded-fc34974bb26c', 'Táo đỏ (không hạt) 30g (10 trái )', '', 'rau củ quả khác'),
('38447e26-2997-11f0-aded-fc34974bb26c', 'Nấm đông cô', 'nấm', 'rau củ quả '),
('38449278-2997-11f0-aded-fc34974bb26c', 'Cà rốt', 'cà rốt', 'rau củ quả'),
('3844a5b6-2997-11f0-aded-fc34974bb26c', 'Tiêu xanh 1 nhánh', '', ''),
('3844c182-2997-11f0-aded-fc34974bb26c', 'Hành tây 30g', '', ''),
('3844d380-2997-11f0-aded-fc34974bb26c', 'Hành boa rô 20g', '', ''),
('38453502-2997-11f0-aded-fc34974bb26c', 'Bột năng 10g', '', ''),
('38454d0e-2997-11f0-aded-fc34974bb26c', 'Dầu mè 4g (1m)', '', ''),
('3c5b1919-27fa-11f0-b0f6-fc34974bb26c', 'Cá hú', 'cá', 'hải sản'),
('3d3b8b34-2995-11f0-aded-fc34974bb26c', 'Bacon xông khói ', '', ''),
('3d3c3475-2995-11f0-aded-fc34974bb26c', 'Xà lách romain', '', ''),
('3d3cb4e3-2995-11f0-aded-fc34974bb26c', 'Xà lách thủy tinh', '', ''),
('3d3ce1e9-2995-11f0-aded-fc34974bb26c', 'Dưa leo', '', ''),
('3d3d03f3-2995-11f0-aded-fc34974bb26c', 'Táo đỏ ', '', ''),
('3d3d27b5-2995-11f0-aded-fc34974bb26c', 'Radish', '', ''),
('3d7ddf80-2996-11f0-aded-fc34974bb26c', 'Hành tây tím 50g', '', ''),
('3d7e8ae5-2996-11f0-aded-fc34974bb26c', 'Ớt sừng 1 trái', '', ''),
('3d7eac3e-2996-11f0-aded-fc34974bb26c', 'Lá quế 2 nhánh', '', ''),
('3d7ec08c-2996-11f0-aded-fc34974bb26c', 'Ngò gai 2 nhánh', '', ''),
('3d7ed82a-2996-11f0-aded-fc34974bb26c', 'Cần Tây 1 cây', '', ''),
('3d7f2f21-2996-11f0-aded-fc34974bb26c', 'Cà rốt 100g (1/3 củ)', '', ''),
('4fc25054-2996-11f0-aded-fc34974bb26c', 'Thơm 1/4 trái', '', ''),
('4fc27eed-2996-11f0-aded-fc34974bb26c', 'Xà lách mỡ 100g', '', ''),
('4fc29d51-2996-11f0-aded-fc34974bb26c', 'Cà chua bi 50g', '', ''),
('4fc2afb1-2996-11f0-aded-fc34974bb26c', 'Bắp Mỹ hạt 20g', '', ''),
('4fc3099b-2996-11f0-aded-fc34974bb26c', 'Dưa leo 50g', '', ''),
('4fc322c4-2996-11f0-aded-fc34974bb26c', 'Gia vị: Nướng tương, dầu ăn, mật ong, tiêu', '', ''),
('56133cfa-27fc-11f0-b0f6-fc34974bb26c', 'Miến dong Thái ', 'miến', 'tinh bột'),
('5613619a-27fc-11f0-b0f6-fc34974bb26c', 'Tôm sú', 'tôm', 'hải sản'),
('6317ba92-27f9-11f0-b0f6-fc34974bb26c', 'mực ống', 'mực', 'Hải sản'),
('64db15d8-2995-11f0-aded-fc34974bb26c', 'Thơm chín', '', ''),
('64dba951-2995-11f0-aded-fc34974bb26c', 'Cà chua', '', ''),
('64dbbb80-2995-11f0-aded-fc34974bb26c', 'Bồn bồn tươi', '', ''),
('64dbcdb1-2995-11f0-aded-fc34974bb26c', 'Hành tím', '', ''),
('64dbdf7c-2995-11f0-aded-fc34974bb26c', 'Gia vị: nước mắm, dầu ăn, ớt sừng, ớt hiểm', '', ''),
('7281bbb3-2997-11f0-aded-fc34974bb26c', 'Xà lách romain', 'xà lách', 'rau củ quả'),
('7281f940-2997-11f0-aded-fc34974bb26c', 'Rong nho tách nước', '', 'rau củ quả khác'),
('728219c6-2997-11f0-aded-fc34974bb26c', 'Cà chua bi ', 'cà chua', 'rau củ quả'),
('728236b4-2997-11f0-aded-fc34974bb26c', 'Dưa leo 50g', '', 'rau củ quả khác'),
('728254ce-2997-11f0-aded-fc34974bb26c', 'Bắp cải tím 30g', '', 'rau củ quả khác'),
('737c2395-2996-11f0-aded-fc34974bb26c', 'Lá quế cắt sợi: 30g', '', ''),
('737c60fc-2996-11f0-aded-fc34974bb26c', 'Hành tím lột vỏ: 10 củ', '', ''),
('737c8f07-2996-11f0-aded-fc34974bb26c', 'Tỏi lột vỏ: 10 tép', '', ''),
('737d14f9-2996-11f0-aded-fc34974bb26c', 'Ớt hiểm: 3 trái', '', ''),
('737d2adb-2996-11f0-aded-fc34974bb26c', 'Đậu phộng rang: 1M', '', ''),
('737d422f-2996-11f0-aded-fc34974bb26c', 'Bột ngọt 8g (1.5m)', '', ''),
('737d565f-2996-11f0-aded-fc34974bb26c', 'Nước mắm 16g (2M)', '', ''),
('737d68fa-2996-11f0-aded-fc34974bb26c', 'Tiêu 6g (1/2M)', '', ''),
('737dc877-2996-11f0-aded-fc34974bb26c', 'Dầu điều 10g (2M)', '', ''),
('98f79e04-27fe-11f0-b0f6-fc34974bb26c', 'Thịt nghêu đông lạnh', 'Ngêu', 'hải sản'),
('99d4be19-2995-11f0-aded-fc34974bb26c', 'Bầu quả 400g', '', ''),
('99d55197-2995-11f0-aded-fc34974bb26c', 'Rau mồng tơi 200g', '', ''),
('99d56f91-2995-11f0-aded-fc34974bb26c', 'Hành lá 20g', '', ''),
('99d593eb-2995-11f0-aded-fc34974bb26c', 'Rau răm 10g', '', ''),
('99d5b8c8-2995-11f0-aded-fc34974bb26c', 'Gừng tươi 10g', '', ''),
('99d61b16-2995-11f0-aded-fc34974bb26c', 'Hành tím 20g', '', ''),
('99d635d2-2995-11f0-aded-fc34974bb26c', 'Ớt hiểm', '', ''),
('a0fb5f14-2997-11f0-aded-fc34974bb26c', 'Nấm rơm búp ', 'Nấm', 'rau củ quả'),
('a0fbf7d0-2997-11f0-aded-fc34974bb26c', 'Hành Boa-rô 1 cọng', '', ''),
('a0fc1972-2997-11f0-aded-fc34974bb26c', 'Nước dừa xiêm 1/2 chén', '', ''),
('a0fc3cb2-2997-11f0-aded-fc34974bb26c', 'Bột năng 2.5g 1/2m', '', ''),
('a0fc5117-2997-11f0-aded-fc34974bb26c', 'Gia vị: Đường; Tiêu; Tương ớt', '', ''),
('a8c8d1e1-28c9-11f0-ac1b-fc34974bb26c', 'Đậu bắp 8 quả', '', ''),
('b2dfb3c2-2fde-11f0-957d-fc34974bb26c', 'fdas', 'àds3', 'fdas'),
('bc7f05c1-2996-11f0-aded-fc34974bb26c', 'Gừng băm 1/2m', '', ''),
('bc7f44cd-2996-11f0-aded-fc34974bb26c', 'Hành tím băm 1M', '', ''),
('bc7f725a-2996-11f0-aded-fc34974bb26c', 'Tỏi băm 1m', '', ''),
('bc7f9e05-2996-11f0-aded-fc34974bb26c', 'Hành tây 1/4 củ', '', ''),
('bc7fc2e7-2996-11f0-aded-fc34974bb26c', 'Ớt hiểm khô 2 trái (Ngâm mềm)', '', ''),
('bc802f22-2996-11f0-aded-fc34974bb26c', 'Hành lá 1 nhánh', '', ''),
('bc804273-2996-11f0-aded-fc34974bb26c', 'Cải ngọt 4 cây', '', ''),
('bc805536-2996-11f0-aded-fc34974bb26c', 'Nước tương 44g (4M)', '', ''),
('bc806788-2996-11f0-aded-fc34974bb26c', 'Đường 12g (1M)', '', ''),
('bc8079f2-2996-11f0-aded-fc34974bb26c', 'Ajinomoto 4g (1m)', '', ''),
('bc80d82d-2996-11f0-aded-fc34974bb26c', 'Tiêu 4g (1m)', '', ''),
('bc80f651-2996-11f0-aded-fc34974bb26c', 'Bữa trưa: Ăn kèm Cơm, Tôm Mực Xào Rau Nhút, Canh Khoai Rau Đắng', '', ''),
('bc811605-2996-11f0-aded-fc34974bb26c', 'Gia vị: Dầu ăn, rượu trắng, nước tương Phú Sĩ, tiêu, đường', '', ''),
('c462389c-2995-11f0-aded-fc34974bb26c', 'Xà lách Mỹ 50g', '', ''),
('c4625d3b-2995-11f0-aded-fc34974bb26c', 'Xà lách lolo 50g', '', ''),
('c46275e8-2995-11f0-aded-fc34974bb26c', 'Cà chua bi 100g', '', ''),
('c4629170-2995-11f0-aded-fc34974bb26c', 'Dưa leo 100g', '', ''),
('c462f9a5-2995-11f0-aded-fc34974bb26c', 'Rong biển wakame 3g', '', ''),
('c4630c9b-2995-11f0-aded-fc34974bb26c', 'Thanh cua 4 cây', '', ''),
('c463741f-2995-11f0-aded-fc34974bb26c', 'Hạnh nhân lát 10g', '', ''),
('c5410c47-27fc-11f0-b0f6-fc34974bb26c', 'Trứng vịt lộn', 'trứng', 'khác'),
('c925f014-240d-11f0-98b3-fc34974bb26c', 'Thăn', 'lợn', NULL),
('d708beb3-27fd-11f0-b0f6-fc34974bb26c', 'Tôm sú (bỏ đầu, vỏ,đuôi)', 'tôm', 'hải sản'),
('da0c35d6-2997-11f0-aded-fc34974bb26c', 'Rong nho tách nước', 'rau củ quả khác', ''),
('da0c5ff6-2997-11f0-aded-fc34974bb26c', 'Dưa leo 50g', 'rau củ quả khác', ''),
('da0c7326-2997-11f0-aded-fc34974bb26c', 'Bắp cải tím 30g', 'rau củ quả khác', ''),
('ddfcf55b-28c7-11f0-ac1b-fc34974bb26c', 'Hành tím xay 1M', '', ''),
('e7c9b2ae-27fb-11f0-b0f6-fc34974bb26c', 'Đậu hũ', 'đậu', 'khác'),
('f45ea94a-27fe-11f0-b0f6-fc34974bb26c', 'Trứng gà', 'trứng', 'khác'),
('f722ea80-28c7-11f0-ac1b-fc34974bb26c', 'Tỏi xay 1m', '', ''),
('f7815565-2995-11f0-aded-fc34974bb26c', 'Củ năng ', '', ''),
('f7819493-2995-11f0-aded-fc34974bb26c', 'Củ cải trắng', '', ''),
('f781c4b9-2995-11f0-aded-fc34974bb26c', 'Mộc nhĩ 3 tai', '', ''),
('f7824804-2995-11f0-aded-fc34974bb26c', 'Nấm hương 5 tai', '', ''),
('f7826a56-2995-11f0-aded-fc34974bb26c', 'Cà rốt 1/2 củ', '', ''),
('f7828ebe-2995-11f0-aded-fc34974bb26c', 'Sả cây 4 cây', '', ''),
('f782e811-2995-11f0-aded-fc34974bb26c', 'Nước cốt dừa 1 chén', '', ''),
('f782fff3-2995-11f0-aded-fc34974bb26c', 'Đậu phộng luộc nguyên vỏ 60g', '', ''),
('f78315af-2995-11f0-aded-fc34974bb26c', 'Nước dão dừa 1 tô', '', ''),
('f7832874-2995-11f0-aded-fc34974bb26c', 'Bột cà ri 1M', '', ''),
('f7833d11-2995-11f0-aded-fc34974bb26c', 'Dầu màu điều 10g (2M)', '', ''),
('fcb57c41-27fa-11f0-b0f6-fc34974bb26c', 'Má đùi gà rút xương', 'gà', 'thịt');

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
('030eac2e-0536-11f0-a1d9-60a82de70049', 'món mặn'),
('9dabffaf-21b5-11f0-8cfe-6d7e2f6fa0d7', 'món chính'),
('a1251ee9-21b5-11f0-8cfe-6d7e2f6fa0d7', 'khác');

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
('3b775c81-21ba-11f0-8cfe-6d7e2f6fa0d7', 'khác'),
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
  `usagefood` text DEFAULT NULL,
  `tips` text DEFAULT NULL,
  `expert_advice` text DEFAULT NULL,
  `img_nutrition` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `name`, `img_url`, `serving_size`, `cooking_time`, `difficulty`, `calories`, `description`, `preparation`, `instructions`, `usagefood`, `tips`, `expert_advice`, `img_nutrition`, `created_at`) VALUES
('34796f6e-27fe-11f0-b0f6-fc34974bb26c', 'Tim heo nướng ngũ vị', 'resources/img-recipes/1746263320401.jpg', '3', '20 phút', 1, '149', 'Món tim heo nướng ngũ vị thơm nức vị thịt nướng hòa quyện với ngũ vị hương thơm ngon hấp dẫn. Cách chế biến không những làm nổi bật hương vị tự nhiên mà còn mang trải nghiệm ẩm thực phong phú khi kết hợp các nguyên liệu tim heo, hành tím, tỏi xay, đậu bắp, bắp mỹ, sữa đặc và ngũ vị hương tạo nên món ăn đầy màu sắc.\r\n\r\nTim heo: Giàu dinh dưỡng và có kết cấu mềm mại, khi nướng lên sẽ có vị ngọt tự nhiên và hương thơm hấp dẫn.\r\nHành tím và tỏi xay: Mang lại mùi thơm đặc trưng, làm tăng hương vị của món ăn.\r\nĐậu bắp và bắp mỹ: Thêm vào sự đa dạng về kết cấu, độ giòn và vị ngọt tự nhiên.\r\nNgũ vị hương: Gia vị đặc biệt với sự kết hợp của năm hương liệu chính (hồi, quế, đinh hương, hạt tiêu, và bột thì là) sẽ làm nổi bật hương vị đậm đà và độc đáo cho món ăn.\r\nCùng Món Ngon Mỗi Ngày vào bếp thực hiện ngay nào!\r\n\r\n', 'Tim heo cắt đôi làm sạch, cắt lát.\r\nHành tím xay vắt lấy nước.\r\nTỏi xay vắt lấy nước.\r\nĐậu bắp cắt bỏ đầu.\r\nBắp Mỹ bỏ vỏ, làm sạch.\r\nƯớp tim heo với nước hành tím, tỏi, 1m dầu hào, 1m Aji heo, 1M sữa đặc, 1m ngũ vị hương, 1/3m tiêu, 1/2m bột năng, 1M dầu điều.\r\nĐậu bắp cắt xéo 1/2. Bắp Mỹ cắt khoanh dày 3cm. Ướp cả 2 với ít muối, phết ít dầu lên trên.', 'Cho tất cả vào chảo điện nướng đến khi chín.', 'Cho tất cả ra đĩa, dùng nóng. Chấm chung với muối tiêu chanh hoặc nước tương tùy vị.', 'Ướp tim heo với ít bột năng để tim heo không bị khô sau khi nướng.\r\nDùng sữa đặc có đường để tạo vị ngọt và béo cho món ăn.\r\nDùng màu điều để món ăn có màu đẹp mắt.\r\n', 'Món ăn này là một món ăn làm từ phủ tạng động vật, thường được nghĩ là hoàn toàn không được dùng cho người có tỉ lệ mỡ trong cơ thể cao. Thực tế là có một số loại phủ tạng như tim heo, tim bò, mề gà… có thành phần chất béo thấp và thành phần chất đạm cao, có thể sử dụng một cách khéo léo để làm thay đổi khẩu vị cho người thừa cân, béo phì hoặc thừa mỡ. Chú ý là phải lọc bỏ hết phần mỡ tạng bám chung quanh tim trước khi chế biến.\r\nMón ăn này cần áp dụng cùng với thực đơn đã tính toán kèm theo, và đảm bảo ăn vừa đúng lượng thực phẩm trong thực đơn mới phát huy được tác dụng giảm mỡ thừa.\r\nTập luyện kèm theo ít nhất 45 phút mỗi ngày và phải tập hàng ngày.', NULL, '2025-05-03 16:08:40'),
('3c5adf20-27fa-11f0-b0f6-fc34974bb26c', 'Canh chua bồn bồn vị thái', 'resources/img-recipes/1746261615631.png', '3', '25 phút', 2, '1500', '...hehe', 'Ướp cá: Cho 1m gia vị nêm sẵn Aji-Quick® Lẩu Thái và 1m nước mắm và 3 trái ớt hiểm đập giập vào ướp trong 5 phút. Sau đó, sơ chế các nguyên liệu: cắt cà chua thành múi cau, cắt thơm thành dẻ quạt, cắt ớt sừng thành lát, rau nêm cắt rối, bồn bồn cắt khúc, cọng to cắt đôi.', 'Cho 2M dầu ăn vào nồi, sau đó cho hành tím vào phi thơm. Tiếp theo, cho thơm vào xào một lúc rồi cho tiếp bồn bồn. Sau đó, thêm 1,5 lít nước nóng, lượng gia vị nêm sẵn Aji-Quick® Lẩu Thái còn lại rồi đun sôi. Cho cá hú vào, đun sôi lại và vớt bọt. Nấu thêm 5 phút cho cá chín, thêm cà chua, sau cùng cho ớt sừng và rau nêm vào.', 'Múc canh ra tô. Chấm cùng nước mắm ớt. Ăn kèm cơm trắng hoặc bún tươi.', 'Cá ướp cùng với ớt hiểm, nước mắm và gia vị nêm sẵn Aji-Quick® Lẩu Thái giúp cá thấm vị và khử mùi cho cá.\r\n\r\nNấu canh với gia vị nêm sẵn Aji-Quick® Lẩu Thái để có vị chua cay đặc trưng\r\n\r\nXào bồn bồn cùng với hành tím giúp tăng mùi thơm đặc trưng cho món ăn.', 'Lời Khuyên của chuyên gia dinh dưỡng\r\n– Khẩu phần ăn giảm mỡ thừa là một phần của chương trình can thiệp giúp giảm khối mỡ thừa. Chương trình này bao gồm 4 phần chính là dinh dưỡng, tập luyện vận động, lối sống, và dùng thuốc khi đủ chỉ định. Vì vậy, cần áp dụng đồng loạt cả chương trình mới đạt được hiệu quả giảm mỡ thừa, chứ không chỉ nhờ vào một thực đơn dinh dưỡng.\r\n– Món ăn cần được áp dụng đồng thời với thực đơn đi kèm theo mới đạt được hiệu quả giảm mỡ thừa.\r\n– Cần phải cân thực phẩm của mỗi bữa ăn để đảm bảo lượng calo thu nhập đúng với khẩu phần giảm mỡ thừa. Cùng một món ăn đó, nếu ăn lượng gấp đôi tức là đã nhập vào cơ thể một năng lượng gấp đôi. Tất cả năng lượng thừa đều sẽ chuyển thành mỡ dự trữ trong cơ thể, dù là năng lượng thừa được cung cấp dưới dạng chất đạm, chất bột hay chất béo.\r\n– Khẩu phần giảm mỡ thừa chỉ giảm năng lượng, chứ không giảm nước. Vì vậy, vẫn phải đảm bảo lượng nước tối thiểu 40ml/kg/ngày.', 'resources/img-recipes/1746261615634.png', '2025-05-03 15:40:15'),
('56125b0c-27fc-11f0-b0f6-fc34974bb26c', 'Miến trộn hải sản', 'resources/img-recipes/1746262517760.png', '4', '15 phút', 2, '300', 'Miến trộn hải sản kết hợp giữa hương vị tươi ngon của hải sản và sự mềm dai của miến. Món ăn này không chỉ ngon mà còn mang lại cảm giác tươi mới nhờ sự kết hợp hài hòa giữa các nguyên liệu.\r\n\r\nSợi miến mềm hòa quyện cùng tôm mực giòn ngọt, thấm đẫm vị chua ngọt thanh nhẹ, điểm thêm chút cay cay của ớt sừng, bùi bùi của đậu phộng và hương thơm từ hành phi, tất cả tạo nên hương vị ngon khó cưỡng đến sợi cuối cùng. Món trộn đơn giản mà cực kỳ hấp dẫn với công thức từ đầu bếp chuyên nghiệp. Đợi gì nữa? Vào bếp cùng Món Ngon Mỗi Ngày để làm ngay món ăn này nhé!', 'Hành tây tím cắt mỏng, ngâm nước đá để giảm hăng. Ớt sừng cắt sợi. Ngò gai 3, lá quế 5 cắt nhỏ. Cà rốt, Cần Tàu cắt sợi nhuyễn.\r\nTôm bóc vỏ, bỏ đầu, chừa đuôi, bỏ chỉ lưng. Mực làm sạch, khứa vảy rồng. Tôm, mực ướp 1m Bột ngọt AJI-NO-MOTO®, 1m Hạt nêm Aji-ngon® Heo, 1/2M giấm, 1/2M tương ớt, để thấm', 'Áp chảo tôm, mực với ít dầu, trút ra để riêng. Tiếp tục xào cần tây, cà rốt, ớt sừng\r\nPha nước trộn: Cho vào máy xay nhuyễn hỗn hợp gồm: 1M nước cốt chanh, 3M nước mắm, 2.5M Giấm gạo lên men Ajinomoto, 2M đường, thêm 1M tỏi, 3 cọng ngò gai, 6 lá quế, 1M tương ớt vào xay nhuyễn mịn.\r\nĐun sôi nước sau đó cho miến vào trụng mềm thì vớt ra ngâm vào chậu nước đá lạnh. Vớt ra để cho ráo nước, trộn đều với 1M dầu tỏi phi', 'Trộn đều xốt cùng miến, các loại rau củ, tôm, mực, rắc 1M đậu phộng rang giã, hành phi, ngò rí và thưởng thức.', '🧑‍🍳 Lá quế và ngò gai thêm vào xốt trộn giúp cho xốt có mùi thơm đặc trưng hơn\r\n\r\n🧑‍🍳 Miến sau khi chần xong nên ngâm vào nước đá để sợi miến tơi, không bết dính\r\n\r\n🧑‍🍳 Dùng giấm gạo lên men Ajinomoto giúp khử tanh và tăng hương vị cho hải sản', 'Món ăn này dành cho những người đang áp dụng chế độ ăn và tập luyện để giảm khối mỡ thừa, bao gồm cả những người có tình trạng gan nhiễm mỡ mức độ nhẹ đến trung bình.\r\nMón ăn cần được áp dụng cùng với thực đơn đi kèm mới đạt mức năng lượng thấp đủ để giảm mỡ thừa của cơ thể\r\nKhẩu phần chất bột trong món ăn là chất bột tinh, ít chất xơ, nên tốt cho việc cung cấp năng lượng sạch để bảo vệ tế bào gan và thần kinh, nhưng sẽ không phù hợp với những người có bệnh lý rối loạn đường huyết đói hoặc người bệnh đái tháo đường.\r\nMón ăn đi kèm nên giàu chất xơ để cân đối khẩu phần năng lượng và các chất không sinh năng lượng.', NULL, '2025-05-03 15:55:17'),
('5a52f386-27ff-11f0-b0f6-fc34974bb26c', 'Gà hấp tứ quý chay', 'resources/img-recipes/1746263813398.jpg', '4', '20 phút', 1, '360', 'Gà hấp tứ quý chay vị đậm đà, vừa ăn, thơm nấm và nước tương. Món ăn lại rất hấp dẫn với màu vàng của da gà chay bóng bẩy kết hợp với màu của các loại nấm, cà rốt, tàu hũ ky,…. Cùng vào bếp với Món Ngon Mỗi Ngày để thực hiện ngay món chay mới hấp dẫn này thôi nào!', 'Tẩm nấm đùi gà qua bột năng, xếp vào lá tàu hủ ky thành hình chữ nhật.\r\nGói nấm lại, gói kín và dán mép bằng bột năng, làm đến khi hết nấm và lá tàu hủ ky (2-3 gói).\r\nÁp chảo những gói nấm đến khi vàng giòn 2 mặt, để nguội.\r\nCắt ngang gói nấm thành từng miếng dày 1-1.5cm (nhìn như miếng thịt gà).\r\n🥣Pha xốt: 1/3m tiêu đen, 1/2m bột ngọt, 2m Hạt nêm Aji-ngon® Nấm, 2m đường, 1m dầu mè, 1M Nước tương “Phú Sĩ”, 1M nước lọc, khuấy tan gia vị', 'Phi thơm hành boa rô, cho các loại rau củ (trừ hành tây) vào xào chung với xốt.\r\nXếp hành tây dưới đĩa oval, xếp miếng gà lên trên, cho các loại rau củ vừa xào xung quanh.\r\nCho đĩa gà vào nồi hấp và hấp 20 phút', 'Lấy đĩa gà ra và trang trí ngò rí, dùng kèm cơm nóng.', '✅ Tẩm bột năng vào nấm để nấm dính chặt hơn.\r\n\r\n✅ Áp chảo tàu hủ ky để có miếng da gà đẹp mắt.\r\n\r\n✅ Xào xốt với nguyên liệu phụ trước để hương vị hài hòa', 'Thực đơn này áp dụng cho người thừa cân – béo phì hoặc có bệnh lý rối loạn chuyển hóa lipid như tăng cholesterol, tăng triglycerid hoặc gan nhiễm mỡ, bệnh lý mạch vành…\r\nMón ăn được áp dụng trong thực đơn đính kèm mới đạt được hiệu quả giảm mỡ mong muốn và duy trì sức khỏe. Lưu ý là ăn đủ các bữa trong ngày với số lượng thực phẩm được tính toán kèm trong thực đơn thì sẽ đạt hiệu quả giảm mỡ thừa tốt hơn việc ăn một bữa nhiều rồi nhịn các bữa còn lại.\r\nNgoài việc tập luyện một môn thể thao hàng ngày, cần phải gia tăng hoạt động bằng cách tăng năng động: làm vườn, tưới cây, làm việc nhà, tập khiêu vũ…', NULL, '2025-05-03 16:16:53'),
('629888f3-27fb-11f0-b0f6-fc34974bb26c', 'Canh bóng nấu thả', 'resources/img-recipes/1746262109289.jpg', '4', '25 phút', 2, '120', 'Công thức nấu món Canh bóng nấu thả món ăn truyền thống của ẩm thực Việt nam vào những ngày lễ tết. Món canh không chỉ thanh mát, tinh tế mà còn thể hiện sự cầu kỳ trong cách chế biến, kết hợp nhiều nguyên liệu tạo nên hương vị hài hòa và hấp dẫn.\r\n\r\nBóng bì mềm dai, thấm vị: Bóng bì được sơ chế cẩn thận để có độ mềm dai vừa phải, khi thả vào canh sẽ hút nước dùng, tạo cảm giác béo nhẹ nhưng không ngán.\r\nRau củ tươi giòn, đẹp mắt: Cà rốt, bông cải trắng, xanh được tỉa hoa hoặc cắt lát tinh tế, giúp món canh thêm phần bắt mắt và tăng độ giòn ngọt tự nhiên.\r\nGiò sống dai mềm: làm cho món canh thêm phần phong phú.\r\nNấm hương dậy mùi thơm: Nấm hương không chỉ giúp tăng thêm độ ngọt mà còn tạo mùi thơm đặc trưng cho món ăn.\r\nCùng Món Ngon Mỗi Ngày vào bếp thực hiện ngay món ăn truyền thống này thôi nào!', 'Bóng bì ngâm mềm, rửa sạch với rượu và gừng.\r\nCà rốt tỉa hoa, cắt lát. Băm nhỏ 1m cà rốt. Bông cải trắng, xanh cắt miếng vừa ăn. Nấm hương cắt đôi (nếu to). Hành lá chần khoảng 6 cọng, cọng ngò rí băm nhỏ, phần còn lại cắt khúc.\r\nGiò sống trộn đều với 1M tiêu xanh đập dập, 1m ngò rí băm và 1m cà rốt băm.', 'Trải miếng bóng bì ra, phết hỗn hợp giò sống lên trên, cuộn chặt tay, sau đó dùng hành lá buộc lại. Nấu trong nước dùng khoảng 5 phút, vớt ra để nguội, cắt lát vừa ăn.\r\nNấu sôi nước dùng gà, cho các loại rau củ và nấu chín, nêm 1m hạt nêm, 1m muối, 1m bột ngọt AJI-NO-MOTO®, 1m đường, cho phàn bóng bì vào nấu sôi lại, nêm 1/2M nước mắm, hành ngò, tiêu, tắt lửa.', 'Múc canh ra tô, dùng nóng.', '🧑‍🍳 Cuộn bóng bì chặt tay, buộc bằng các khoanh hành để dễ định hình.\r\n🧑‍🍳 Sử dụng nấm hương rừng để tạo mùi thơm đặc trưng cho món ăn.\r\n🧑‍🍳 Sơ chế bóng bì với rượu và gừng để khử mùi tanh của bóng bì.\r\n\r\n', 'Món ăn cần được áp dụng đồng thời với thực đơn đi kèm theo mới đạt được hiệu quả giảm mỡ thừa.\r\nMón canh bóng có nguyên liệu đa dạng, cung cấp năng lượng vừa phải nhưng lại có đầy đủ thành phần dinh dưỡng từ các chất vi lượng. Món ăn này có thể dùng cho cả những người thừa cân béo phì có bệnh lý mạn tính. Nên ăn món canh này vào đầu bữa ăn, sẽ tạo cảm giác no tốt hơn.\r\nCác món ăn trong thực đơn giảm mỡ thừa làm từ hải sản cần loại bỏ tất cả phần gạch béo, chỉ ăn phần nạc tinh mới đạt mục tiêu giảm mỡ thừa.\r\nCần ăn chậm, nhai thật kỹ thức ăn rồi mới nuốt nếu đang trong chương trình can thiệp giảm cân và giảm mỡ thừa.\r\nThực đơn giảm mỡ thừa sẽ có mức năng lượng thấp để cơ thể sử dụng mỡ thừa sinh năng lượng. Quá trình này vần cần cung cấp đầy đủ nước và các vitamin tan trong nước. Vì vậy, cần uống đủ lượng nước 40ml/kg/ngày và mỗi tuần nên có 4-5 bữa ăn các loại hạt thô nguyên vỏ, gạo lức, khoai củ thô…', NULL, '2025-05-03 15:48:29'),
('63178aec-27f9-11f0-b0f6-fc34974bb26c', 'Mực nhúng giấm', 'resources/img-recipes/1746261251125.jpg', '4', '15 phút', 1, '200', '...', 'Mực làm sạch, để ráo, khứa ca rô mặt trong, cắt miếng vừa ăn khoảng 4cm.\r\nSả đập dập, cắt khúc. Hành tây cắt sợi. Hành tím cắt lát. Gừng cắt sợi. Tỏi giã nhuyễn. Ngò cắt nhỏ.\r\nXà lách, rau thơm lặt rửa sạch. Dưa leo cắt khúc. Chuối, khế bào mỏng, ngâm nước có pha chanh.', 'Pha nước giấm: nấu sôi hỗn hợp gồm 2 chén nước dừa (2 trái), 1/2 chén giấm gạo lên men “Ajinomoto”, 2m muối, 2.5M đường, 1m bột ngọt AJI-NO-MOTO®, hành tây, gừng sợi, hành tím và sả đập dập, nấu sôi.\r\nPha nước mắm ngò: khuấy tan 3M nước với 2M nước mắm, 1/2M giấm gạo lên men “Ajinomoto”, 1M đường, sau đó cho hỗn hợp giã nhuyễn gồm ớt hiểm xanh 3 trái, cọng ngò rí, ít tỏi vào.', 'Khi ăn ta nấu sôi nước giấm, nhúng mực vào vừa chín, cuốn bánh tráng và rau dưa, chấm nước mắm ngò.\r\n\r\n', 'Chọn mực có da sáng, không lem, bám chặt vào thịt, thịt mực trong, đầu dính chặt vào thân.\r\nNấu nước giấm sôi già mới nhúng mực để mực nhanh chín, giòn, giữ vị ngọt.\r\n\r\n', '– Món ăn cần được ăn cùng với thực đơn đi kèm mới có thể phát huy được tác dụng làm giảm khối mỡ thừa của cơ thể\r\n– Để giảm khối mỡ, luôn cần có ít nhất một giờ tập luyện thể dục thể thao mỗi ngày. Môn tập và cường độ tập luyện sẽ tùy thuộc vào độ tuổi và sức khỏe nền, nhưng nhìn chung, tập luyện để giảm mỡ thừa thường có cường độ tập luyện nặng hơn so với các trường hợp tập luyện thường quy khác\r\n– Cần lưu ý chỉ ăn vừa đủ các loại trái cây ngọt, không uống nước ép trái cây mà chỉ ăn trái cây cả xác hoặc xay sinh tố uống cả xác. Đường fructose trong trái cây là một dạng đường cần được tái chuyển hóa qua gan, nên nếu nạp vào cơ thể quá nhiều có thể làm tăng tải cho gan và làm ta8gn nguy cơ tích mỡ, trong đó có tích mỡ ở gan.', 'resources/img-recipes/1746261251127.png', '2025-05-03 15:34:11'),
('7092869d-27fd-11f0-b0f6-fc34974bb26c', 'Củ năng om nấm chay', 'resources/img-recipes/1746262991731.jpg', '4', '35 phút', 2, '240', 'Món củ năng om nấm chay được làm từ nguyên liệu chính là củ năng, nấm và các nguyên liệu chay khác như đậu hũ, cà rốt, củ cải trắng. Món ăn bắt mắt với nước om hơi sanh sách màu vàng nhạt đặc trưng, các nguyên liệu chín vừa, giòn nhẹ. Khi thưởng thức món ăn thơm mùi sả cà ri, rau củ chín mềm thấm vị, béo thơm đậm đà.\r\n\r\nCùng Món Ngon Mỗi Ngày vào bếp thực hiện ngay món ăn chay mới cho cả nhà thưởng thức nhé!', 'Củ năng gọt vỏ cắt đôi & củ cải trắng rửa sạch cắt móng ngựa 3cm. Sả cây đập dập cắt khúc 4 cm. Hành tây cắt múi cau to. Rau om, ngò gai cắt nhỏ.\r\nCho 2M dầu điều vào chảo cho sả đập dập và boa rô vào phi thơm, cho củ năng, cà rốt, củ cải trắng và đậu phộng vào xào. Thêm 1M bột cà ri hòa nước, 1M hạt nêm Ajingon Nấm, 1/2M đường, 1m bột ngọt Ajiomoto, cho thấm.\r\n', 'Cho tiếp nấm hương vào, thêm nước dão dừa, nấu khoảng 10 phút, cho tiếp đậu hủ, tiêu xanh vào.\r\nNêm gia vị hạt nêm Ajingon Nấm, đường. Nước hơi sanh sánh, cho mộc nhĩ, nấm hương, hành tây, ớt sừng vào, nêm thêm 1/2M nước tương. Nấu lửa nhỏ. Đợi sôi trở lại, cho thêm nước cốt dừa vào. Tắt lửa', 'Múc ra dĩa sâu, rắc rau om ngò gai, ớt, đậu phộng rang, tàu hủ ky chiên lên mặt. Dọn kèm bánh mì, muối ớt chanh', '💡 Xào cho củ năng, củ cải trắng và cà rốt chín 75% mới cho tiếp các nguyên liệu khác để chín đều.\r\n\r\n💡 Cho nước cốt dừa vào sau và không nấu lâu để không bị vón cục.\r\n\r\n💡 Kiểm tra củ năng không bị chua, bên ngoài khong bị nhớt.', 'Khuyến nghị của chuyên gia (dành cho thực đơn hỗ trợ tim mạch cho người có thể trạng thừa cân béo phì)\r\n\r\nNgười có bệnh tim mạch đi kèm với tình trạng thừa cân béo phì thì nguy cơ cao nhất là tình trạng tắc hẹp mạch vành do mảng xơ vữa, vì vậy giảm cân và giảm rối loạn mỡ là can thiệp dinh dưỡng quan trọng nhất để cải thiện nguy cơ của bệnh lý tim mạch.\r\nMón ăn cần đi kèm với thực đơn đã được tính toán thì mới đạt được hiệu quả hỗ trợ tim mạch, giảm cân và giảm rối loạn mỡ đồng thời.\r\nTập luyện thể dục thể thao là phần không thể thiếu, nhưng cần tập nhẹ, không làm tăng nhịp tim và nhịp thở quá nhiều. Thời gian tập luyện trung bình 45-60 phút mỗi ngày và tập 5-6 ngày mỗi tuần. Cần kết hợp với tập thở để cung cấp đủ oxy cho cơ tim.', 'resources/img-recipes/1746262991731.png', '2025-05-03 16:03:11'),
('98f76e50-27fe-11f0-b0f6-fc34974bb26c', 'Nghêu kho nước tương', 'resources/img-recipes/1746263488999.jpg', '4', '10 phút', 1, '30', 'Cùng vào bếp với Món Ngon Mỗi Ngày để thực hiện món nghêu kho nước tương kiểu Singapore hương vị đậm đà và hấp dẫn. Cảm giác khi ăn món này là sự pha trộn của nước tương, hòa quyện cùng mùi vị đặc trưng của nghêu.\r\n\r\nMón ăn được cân bằng hoàn hảo với hương vị nước tương đậm đà, mặn ngọt, kết hợp với vị ngọt tự nhiên của nghêu và một chút cay cay từ các gia vị làm cho món ăn trở nên phong phú hương vị. Thịt nghêu mềm dẻo, thấm vị, nước kho sánh sệt mang lại một trải nghiệm ẩm thực tuyệt vời. Nước kho màu nâu, rau nêm giữ được màu sắc biến đổi tự nhiên, món ăn kèm với cơm trắng chắc chắn sẽ hao cơm lắm đây😋.', 'Ướp thịt nghêu với 4M nước tương, 1M đường, 1m Ajinomoto, 1m tiêu.\r\nHành tây cắt muối cau, hành lá cắt khúc 3cm, ớt khô cắt đôi.\r\nCải ngọt cắt nhỏ 2cm\r\n', 'Phi thơm gừng, hành tím băm, tỏi băm, ớt hiểm khô, đầu hành lá. Cho thịt nghêu vào đảo đều đến khi săn lại, thêm 1 chén nước lọc kho đến khi sệt lại. Thêm hành tây cắt múi cau, hành lá cắt khúc, ớt sừng, trộn đều.\r\nLuộc cải ngọt vừa chín, để ráo.', 'Bày thố kho ra bàn dùng chung với cháo trắng và rau cải ngọt luộc.', 'Kho bằng nước tương Phú Sĩ để có mùi vị đặc trưng của Á đông.\r\nSử dụng ớt khô để mùi vị được thơm hơn.\r\nCó thể dùng nghêu tươi luộc gỡ lấy thịt để làm món này.', 'Khuyến nghị của chuyên gia (cho thực đơn giảm mỡ)\r\n\r\nMón ăn này cung cấp nhiều vi khoáng như kẽm, đồng… mà không làm tăng thêm năng lượng khẩu phần, nên không chỉ áp dụng tốt cho người cần giảm mỡ, mà còn có thể sử dụng làm món ăn chính cho những người biếng ăn, thiếu vi khoáng, rụng tóc...\r\nĐể không làm tăng năng lượng trong bữa chính và giảm nguy cơ tổng hợp mỡ dự trữ, nên sử dụng cơm đi kèm là cơm gạo lứt, hoặc cơm gạo trắng có trộn thêm đậu đỗ nguyên vỏ.\r\nCần chú ý ăn đúng lượng thực phẩm đã được tính toán trong thực đơn đính kèm, không ăn nhiều hơn ngay cả với các thực phẩm ít năng lượng như bắp hay trái cây không ngọt.', NULL, '2025-05-03 16:11:29'),
('a0a25ede-27fa-11f0-b0f6-fc34974bb26c', 'Salad rong biển thanh cua', 'resources/img-recipes/1746261783873.png', '4', '25 phút', 1, '120', '🥗 Món Salad rong biển thanh cua thơm ngon, giòn sần sật với sự kết hợp của các loại rau xà lách, dưa leo, và rong biển tạo cảm giác thanh mát dễ chịu khi ăn. Vị ngọt nhẹ dai mềm của thanh cua đi kèm nước xốt mè rang mayonnaise thơm bùi tuyệt hảo.\r\n\r\nMón salad rất thích hợp cho những ngày nắng nóng, giải nhiệt cơ thể. Hoặc bạn có thể dùng món khai vị cho những bữa tiệc cũng rất thích hợp. Cùng Món Ngon Mỗi Ngày vào bếp thực hiện ngay nhé! 😋', 'Xà lách mỹ, lolo rửa sạch, cắt miếng vừa ăn\r\nCà chua bi cắt đôi\r\nRong biển wakame ngâm nở, để ráo, dưa leo cắt khoanh\r\nThanh cua xé sợi. Hạnh nhân lát rang vàng', 'Trộn đều thanh cua với 3M Bột chiên giòn, búng vài giọt nước, chiên giòn, vớt ra để nguội', 'Xếp xà lách ra dĩa, cho tiếp cà chua và rong biển wakame lên trên\r\nCho tiếp thanh cua và hạnh nhân lát ở trên cùng. Thêm Xốt Mè Rang “Aji-Xốt” lên trên. Dùng làm món khai vị', 'Xé nhỏ thanh cua, sau đó chiên giòn giúp món ăn giòn giòn và thú vị hơn\r\nRong biển ngâm 5p vớt ra để ráo, không nên ngâm lâu sẽ bị bở\r\nDùng Xốt Mè Rang “Aji-Xốt” giúp món salad đậm thơm vị mè và hấp dẫn hơn', 'Món ăn cần được áp dụng đồng thời với thực đơn đi kèm theo mới đạt được hiệu quả giảm mỡ thừa.\r\nCác món salad thường có mức năng lượng thấp và nhiều chất xơ, phù hợp với mục tiêu của các khẩu phần ăn giảm mỡ thừa. Tuy nhiên, cần thận trọng với các loại nước sốt ăn kèm salad. Nếu nước sốt được làm từ dầu, mỡ, bơ, kem nấu ăn, các loại hạt có dầu như đậu phộng, hạt thông… thì năng lượng được cung cấp từ nước sốt có khi còn lớn hơn năng lượng từ món salad. Vì vậy, chỉ nên sử dụng các loại sốt không có năng lượng như nước tương trộn dấm và muối tiêu.\r\nCác món salad làm từ hải sản cần loại bỏ tất cả phần gạch béo, chỉ ăn phần nạc tinh mới đạt mục tiêu giảm mỡ thừa.', 'resources/img-recipes/1746261783876.png', '2025-05-03 15:43:03'),
('c540df55-27fc-11f0-b0f6-fc34974bb26c', 'Canh bầu mồng tơi', 'resources/img-recipes/1746262704303.png', '4', '20 phút', 2, '120', 'Canh bầu mồng tơi là một món ăn dân dã nhưng lại rất được yêu thích trong bữa cơm gia đình Việt Nam. Sự kết hợp giữa hai loại rau bầu và mồng tơi mang đến hương vị thanh mát, ngọt lành, thích hợp trong những ngày hè oi bức hoặc khi bạn muốn một bữa ăn nhẹ nhàng và bổ dưỡng.\r\n\r\nTrứng bùi béo thấm vị, bầu chín tới ngọt lừ, nước dùng thì đậm đà, thơm mùi mắm ruốc, dậy chút the cay từ ớt và gừng, trứng vịt lộn vừa bổ dưỡng lại hài hòa khó cưỡng. Một món canh quen thuộc nhưng giờ lại cực kì hấp dẫn với công thức từ đầu bếp chuyên nghiệp.\r\n\r\nChờ chi nữa? Thử ngay thôi!', 'Trứng lộn luộc chín rồi đập ra chén. Bầu gọt vỏ, bỏ ruột thái lát mỏng dày 0,5cm. Rau mồng tơi thái rối. Hành lá cắt khúc dài 2cm. Ớt hiểm thái vát. Gừng tươi thái sợi. Hành tím cắt lát mỏng. Rau răm thái rối', 'Nấu canh: Phi thơm hành tím với 1M dầu ăn sau đó cho 2m mắm ruốc vào xào thơm rồi cho 1.2 lít nước vào đun sôi rồi cho bầu và rau mồng tơi đảo đều, hạ nhỏ lửa rồi nêm với 2m Hạt nêm Aji-ngon® Heo, 1m Bột ngọt AJI-NO-MOTO®, 1/2m đường. Tiếp đó cho trứng vịt lộn, gừng, ớt hiểm, hành lá, rau răm vào đun thêm khoảng 1 phút rồi tắt bếp', 'Múc canh ra bát, trang trí thêm rau răm, gừng và ớt lên trên', '🧑‍🍳 Luộc trứng lộn trong nước có ít muối, bột ngọt để trứng thấm vị\r\n\r\n🧑‍🍳 Phi thơm mắm ruốc với hành tím giúp khử mùi và tạo hương thơm đặc trưng cho món ăn', 'Món ăn này cần được áp dụng cùng với trong thực đơn ngày được cung cấp kèm theo mới đảm bảo được tổng khẩu phần phù hợp với mục tiêu giảm mỡ thừa của cơ thể.\r\nTrong chế độ ăn giảm mỡ thừa, cần lưu ý cắt giảm các thực phẩm có vị ngọt ngay cả với các thực phẩm ngọt từ tự nhiên như trái cây ngọt, mật ong… Đừng quên, các chất ngọt luôn chứa đường đơn giản, và tất cả mọi dạng đường đơn giản đều có thể làm tăng chuyển hóa theo hướng chuyển đường thành mỡ.\r\nVận động và tập luyện có thể giúp sử dụng các loại đường đơn giản, nên nếu muốn giảm nguy cơ tổng hợp mỡ thừa từ đường đơn giản, thì chỉ nên ăn các thực phẩm ngọt trước và trong khi tập luyện thể dục thể thao.', NULL, '2025-05-03 15:58:24'),
('d7081b0d-27fd-11f0-b0f6-fc34974bb26c', 'Tôm sú kho lá quế', 'resources/img-recipes/1746263163629.jpg', '4', '20 phút', 1, '118', 'Mùa mưa mà được ngồi bên mâm cơm thưởng thức món cơm trắng nóng hổi với tôm kho thì còn gì tuyệt với bằng. Tôm sú thấm vị nước kho, thịt tôm chắc mặn ngọt đậm đà, rất thơm mùi lá quế, nước kho sánh sệt chan vào cơm ăn ngon hết biết.\r\n\r\nLá quế không chỉ mang lại mùi thơm dễ chịu mà còn giúp tăng thêm hương vị cho món ăn, làm cho tôm sú trở nên ngon miệng hơn. Món này không chỉ ngon mà còn rất bổ dưỡng, cung cấp nhiều protein và các dưỡng chất cần thiết.\r\n\r\nCùng Món Ngon Mỗi Ngày vào bếp thực hiện ngay món Tôm sú kho lá quế nhé!', 'Tôm sú xẻ dọc sống lưng lấy chỉ đen. Cắt bỏ phần đuôi nhọn.\r\nLá quế cắt sợi một nửa. Hành tím, tỏi và ớt hiểm đập dập.\r\nƯớp tôm với 1.5m bột ngọt AJI-NO-MOTO®, 2M nước mắm, 1/2M tiêu, trộn đều. Thêm hành tỏi, ớt hiểm đập dập, phần lá quế cắt sợi vào trộn đều.', 'Cho 2M dầu điều, 1M đường vào chảo, thắng caramel. Cho tôm vào xào săn, thêm 2M nước và kho đến khi thịt tôm săn lại, thấm đều gia vị, nước kho sệt lại. Rắc lá quế tươi lên mặt. Tắt lửa.\r\n\r\n', 'Rắc đậu phộng rang lên mặt. Dùng nóng với cơm trắng, rau sống.', '💡 Xẻ dọc, sâu vào lưng tôm để tôm thấm gia vị và khi kho tôm nở bung trông đẹp mắt hơn.\r\n\r\n💡 Ướp trước lá quế thái sợi sẽ giúp thịt tôm ngấm mùi lá quế hơn, tạo nên hương vị đặc trưng cho món ăn.', 'Tập luyện thể dục thể thao là phần không thể thiếu khi muốn giảm mỡ. Thời gian tập tối thiểu cần là 60 phút mỗi ngày và 6-7 ngày mỗi tuần.\r\nĐể tránh tăng tổng hợp mỡ, nên ăn nhiều bữa trong ngày, mỗi bữa một ít sẽ tốt hơn ăn dồn vào một bữa và nhịn các bữa còn lại.\r\nSố lượng thực phẩm trong mỗi bữa ăn quyết định việc giảm mỡ nhiều hơn là loại thực phẩm dùng trong bữa ăn. Về nguyên tắc, nên ăn đa dạng thực phẩm, chế biến thật đơn giản, và chỉ ăn đúng lượng thực phẩm đã được tính toán trong thực đơn.\r\nThận trọng với các loại nước uống có đường và những loại hạt có dầu. Năng lượng từ các thức ăn uống vặt này thường lớn hơn nhiều so với ước lượng của bạn.', NULL, '2025-05-03 16:06:03'),
('de508421-27f9-11f0-b0f6-fc34974bb26c', 'Salad táo phô mai', 'resources/img-recipes/1746261457860.png', '4', '20 phút', 1, '130', '...', '– Pha nước trộn salad: Trộn đều 2M giấm táo lên men “Ajinomoto”, 1M nước, 1.5M đường, 1/3m tiêu và 1/3m muối, thêm 1m dầu mè trắng.\r\n– Táo đỏ cắt miếng vừa ăn, rưới 1M nước trộn salad rồi trộn đều.\r\n– Xà lách các loại rửa sạch, cắt miếng vừa ăn. Dưa leo bỏ ruột cắt lát mỏng. Radish cắt mỏng, ngâm nước, để ráo.', '– Bacon áp chảo với 1m dầu ăn, để nguội cắt miếng vừa ăn.\r\n– Chừa ra 2M nước trộn salad và rưới phần còn lại lên rau củ đã để lạnh, trộn đều\r\n', '– Xếp các loại rau củ ra dĩa, topping bacon lên, rưới 2M nước trộn salad lên trên và trộn đều.\r\n\r\n', 'Phô mai Parmesan có vị chua, béo, đậm nên phù hợp khi làm salad.\r\n\r\nCắt táo rồi trộn với nước trộn salad giúp táo giữ được vitamin và không bị thâm.\r\n\r\nDùng giấm táo lên men “Ajinomoto” để món ăn thơm mùi táo đặc trưng và có vị chua thanh.', '– Thực đơn giảm mỡ thừa thường có khẩu phần năng lượng thấp, phù hợp với người thừa cân béo phì không có bệnh lý mạn tính. Các trường hợp tình trạng dinh dưỡng bình thường và suy dinh dưỡng không được áp dụng thực đơn này.\r\n– Món ăn cần được áp dụng đồng thời với thực đơn đi kèm theo mới đạt được hiệu quả giảm mỡ thừa.\r\n– Cần phải chuẩn bị các thực phẩm ăn độn để ăn thêm trong trường hợp cảm thấy đói khi chưa đến bữa ăn chính. Các thực phẩm độn thông dụng nhất là: cuốn rau (không dùng bánh tráng), canh rau hay súp rau (nấu với nước dùng trong đã vớt bỏ mỡ), 1 cái lòng trắng trứng gà luộc, 200ml sữa tươi không béo không đường pha với 100ml hạt chia hay hạt é đã ngâm nở.\r\n– Lưu ý: các dạng thức ăn có năng lượng như ngũ cốc nhiều xơ, khoai củ, bánh giảm năng lượng… đều không phải là thức ăn độn, mà là thức ăn thay thế, tức là dùng để thay thế cho các thức ăn thông thường.', 'resources/img-recipes/1746261457861.png', '2025-05-03 15:37:37'),
('e7c9817a-27fb-11f0-b0f6-fc34974bb26c', 'Đậu hủ kho nấm rơm', 'resources/img-recipes/1746262332747.jpg', '4', '20 phút', 2, '50', 'Đậu hủ kho nấm rơm là một món ăn thơm ngon, đậm đà và rất đưa cơm. Hương vị của món này có sự kết hợp hài hòa giữa vị béo mềm của đậu hủ, vị ngọt tự nhiên của nấm rơm và nước kho đậm đà thấm vào từng miếng đậu. Khi ăn, bạn sẽ cảm nhận được độ dai giòn nhẹ của nấm rơm, vị mặn ngọt vừa phải từ nước tương và một chút cay nhẹ nếu thêm ớt.\r\n\r\nMón này không chỉ ngon mà còn tốt cho sức khỏe, giàu protein thực vật và ít dầu mỡ rất thích hợp cho người muốn giảm cân, giảm lượng mỡ trong cơ thể. Khi dùng kèm với cơm nóng, dưa leo hoặc rau luộc, hương vị sẽ càng thêm trọn vẹn. Nếu thích, bạn có thể thêm một ít tiêu hoặc rau ngò để tăng thêm hương thơm.\r\n\r\n', 'Nấm rơm cắt bỏ gốc, ngâm trong nước vo gạo hoặc nước pha 1/2m bột năng. Vớt ra, để ráo, cắt đầu nấm rơm hình chữ thập.\r\nCắt đậu hủ thành khối vuông vừa ăn. Hành Poa-rô cắt lát xéo. Ớt cắt sợi.', 'Phi thơm hành Poa-rô, tiếp đến cho nấm rơm vào xào chung. Nêm 1m đường, 1/3m tiêu, 1m Bột ngọt AJI-NO-MOTO®, 1/2m hạt nêm Nấm, 3M Nước tương Phú Sĩ, 1M tương ớt. Giảm lửa, cho thêm 1/2 chén nước dừa và cho toàn bộ đậu hủ vô. Kho đến khi nước rút xuống, thêm hành boaro lá và ớt cắt sợi', 'Trình bày đậu hũ kho nấm rơm ra dĩa, dùng với cơm trắng.', '🧑‍🍳 Ngâm nấm vào nước gạo hoặc nước pha chút bột năng sẽ giúp cho nấm sạch và trắng.\r\n\r\n🧑‍🍳 Kho lửa liu riu để nguyên liệu thấm đều vị.\r\n\r\n🧑‍🍳 Lựa nấm rơm búp có màu trắng hay đen tự nhiên để phù hợp với món kho.', 'Món ăn này áp dụng cho người thừa cân, béo phì, có tỉ lệ mỡ cơ thể cao.\r\nMón ăn phải được áp dụng cùng với thực đơn đã được tính toán kèm theo mới có thể đạt được hiệu quả giảm khối mỡ thừa trong cơ thể.\r\nKhối mỡ trong cơ thể được gọi là “thừa” khi tổng khối mỡ vượt quá trọng lượng mỡ cần thiết cân đối với các khối khác của cơ thể. Có nghĩa là một số người có tổng trọng lượng cơ thể không cao, dáng cũng có vẻ gầy gầy, nhưng tỉ lệ khối mỡ trong cơ thể lớn hơn khối nạc, khối xương và khối nước, vẫn được tính là người có mỡ thừa, chứ không phải chỉ người thừa cân béo phì mới có nguy cơ thừa mỡ.\r\nĐể xác định trọng lượng khối mỡ và tỉ lệ mỡ trong cơ thể, cần được đo phân tích thành phần cơ thể bằng máy kháng trở sinh học, chứ không thể khám thông thường. Vì vậy, trong kiểm tra sức khỏe tổng quát hàng năm, nên có hạng mục đo thành phần cơ thể.', NULL, '2025-05-03 15:52:12'),
('f45dfde0-27fe-11f0-b0f6-fc34974bb26c', 'Salad rong nho xốt mè rang', 'resources/img-recipes/1746263642343.jpg', '4', '10 phút', 1, '500', 'Khi thưởng thức món Salad rong nho xốt mè rang, bạn sẽ cảm nhận được sự hòa quyện của các hương vị rong nho mọng nước, béo béo từ sốt mè rang, và giòn giòn từ rau salad. Màu sắc đẹp mắt hấp dẫn hài hòa từ các loại rau củ, vàng nhạt của xốt và trứng.\r\n\r\nMau vào bếp làm ngay món ăn salad để giảm cân và chế đệ ăn kiêng phù hợp cùng Món Ngon Mỗi Ngày nhé!', 'Xà lách rửa sạch, cắt miếng vừa ăn. Rong nho ngâm nước lạnh 2-3 phút (không quá lâu), vớt ra để ráo.\r\nTrứng luộc chín, bóc vỏ, cắt lát.\r\nBắp cải tím bào sợi mỏng. Cà chua bi cắt đôi. Dưa leo rửa sạch, bào sơ vỏ, cắt đôi, sau đó cắt lát mỏng. Lá quế cắt khúc vừa ăn.\r\n', 'Trộn đều các loại xà lách, cà chua, dưa leo, bắp cải tím, lá quế, xếp trứng và rong nho lên trên.', 'Khi ăn rưới Xốt mè rang “Aji-Xốt” lên trên, trộn đều và thưởng thức', '💡Bảo quản rau củ trong tủ mát trước khi trộn giúp món salad tươi ngon và giòn hơn.\r\n\r\n💡Sử dụng Xốt mè rang “Aji-Xốt” giúp món salad thơm ngon, tròn vị.', 'Món ăn này có thể sử dụng trong bữa chính như một món rau ăn kèm, dùng trong bữa phụ cách bữa ăn chính buổi tối khoảng 1 tiếng cho những người hoặc có bệnh lý rối loạn chuyển hóa lipid như: tăng cholesterol, tăng triglycerid hoặc gan nhiễm mỡ, bệnh lý mạch vành…\r\nMón ăn rất giàu vi khoáng như kẽm, i ốt… nên cũng có thể dùng như một món rau trong bữa chính khoảng 2 lần mỗi tuần cho những đối tượng khác trong gia đình, hoặc 3-4 lần mỗi tuần cho nhóm nhân viên văn phòng không có thời gian chuẩn bị bữa ăn cân đối và đa dạng.\r\nMón ăn được áp dụng trong thực đơn đính kèm mới đạt được hiệu quả giảm mỡ mong muốn và duy trì sức khỏe.\r\nMón ăn không phù hợp với những bệnh nhân có tình trạng cường giáp hay có u bướu ở tuyến giáp.', NULL, '2025-05-03 16:14:02'),
('fcb54590-27fa-11f0-b0f6-fc34974bb26c', 'Salad gà nướng thơm', 'resources/img-recipes/1746261938348.png', '4', '20 phút', 1, '150', 'Món Salad gà nướng thơm vừa lành mạnh, vừa hấp dẫn, đặc biệt với những ai yêu thích sự tươi mới và hương vị cân bằng. Món ăn thơm ngon với cách ướp gia vị gà kỹ lưỡng giúp miếng gà nướng thơm lừng, mềm. Quả thơm giúp cho món gà nướng có hương vị tươi mới, lạ vị cùng kết hợp với rau xà lách, bắp mĩ, cà chua, và chấm nước xốt Aji Mayonnaise hài hòa tạo sự cân bằng hương vị nhẹ nhàng khi ăn.\r\n\r\nGà nướng chứa nhiều protein giúp cơ bắp săn chắc.\r\nRau xanh giàu chất xơ, vitamin, giúp đẹp da và tốt cho tiêu hóa.\r\nMón ăn này rất phù hợp cho những ai muốn ăn lành mạnh hoặc giảm cân.', 'Má đùi gà lạng mỏng, đập sơ, ướp má đùi gà với 1m hành tỏi băm nhuyễn, 1/2m Hạt nêm Aji-ngon® Heo, 1/2m Bột ngọt AJI-NO-MOTO®, 1/3m tiêu, 1m nước tương “Phú Sĩ”, 1/2M mật ong, để thấm 10 phút.\r\nXà lách cắt miếng vừa ăn. Cà chua cắt đôi. Bắp Mỹ hạt luộc chín. Dưa leo cắt khoanh tròn. Húng lủi cắt nhỏ Cho salad vào tủ mát.\r\nThơm bỏ cùi, cắt lát dày 1cm ướp với xíu muối.', 'Áp chảo thơm không dầu, trút ra. Tiếp tục áp chảo gà với 1m dầu cho chín vàng, để nguội cắt miếng ngang 1cm.', 'Xếp gà lên dĩa salad, bắt Xốt Mayonnaise Aji-mayo® Phiên bản ít béo lên trên, khi ăn trộn đều.\r\n\r\n', '🧑‍🍳 Với món nướng, ướp 1 ít mật ong giúp màu sắc món ăn đẹp và bóng hơn.\r\n🧑‍🍳 Áp chảo không dầu để thơm đẹp mắt và ngon hơn.', 'Món ăn cần được áp dụng đồng thời với thực đơn đi kèm theo mới đạt được hiệu quả giảm mỡ thừa.\r\nThời gian tập luyện để giảm được khối mỡ dự trữ là tập tối thiểu 45 phút liên tục. Tập luyện trong 30 phút đầu chỉ mới làm cạn lượng đường dự trữ trong cơ. Từ 30 phút trở đi cơ thể mới bắt đầu sử dụng mỡ để sinh năng lượng. Có thể tập bất kỳ môn thể thao nào để giảm mỡ thừa, nhưng cần phải đạt đủ thời gian tập luyện liên tục mỗi lần tập.\r\nNgoài ăn uống và tập luyện, cần phải ngủ đủ giấc 6-7 giờ trong đêm và phải ngủ sâu trong giai đoạn từ 0-4g. Thức khuya là một yếu tố nguy cơ của tăng khối mỡ thừa.\r\nBữa ăn cuối cùng trong ngày nên cách giờ đi ngủ khoảng 2 tiếng đồng hồ.', NULL, '2025-05-03 15:45:38');

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
('0a8fac44-2995-11f0-aded-fc34974bb26c', '63178aec-27f9-11f0-b0f6-fc34974bb26c', '765b2c4b-0534-11f0-a1d9-60a82de70049'),
('0a8fb1be-2995-11f0-aded-fc34974bb26c', '63178aec-27f9-11f0-b0f6-fc34974bb26c', '765b2d2e-0534-11f0-a1d9-60a82de70049'),
('17eb7ed5-2b1b-11f0-a774-fc34974bb26c', '34796f6e-27fe-11f0-b0f6-fc34974bb26c', '765b0b44-0534-11f0-a1d9-60a82de70049'),
('21235cd9-2996-11f0-aded-fc34974bb26c', '629888f3-27fb-11f0-b0f6-fc34974bb26c', '765b2ce4-0534-11f0-a1d9-60a82de70049'),
('38457ec2-2997-11f0-aded-fc34974bb26c', '5a52f386-27ff-11f0-b0f6-fc34974bb26c', '765b2c22-0534-11f0-a1d9-60a82de70049'),
('3d3d5910-2995-11f0-aded-fc34974bb26c', 'de508421-27f9-11f0-b0f6-fc34974bb26c', '765b2c4b-0534-11f0-a1d9-60a82de70049'),
('3d7fd500-2996-11f0-aded-fc34974bb26c', '56125b0c-27fc-11f0-b0f6-fc34974bb26c', '765b2c4b-0534-11f0-a1d9-60a82de70049'),
('439ca01b-2d83-11f0-921a-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', '765b2d19-0534-11f0-a1d9-60a82de70049'),
('4fc3e8a0-2996-11f0-aded-fc34974bb26c', 'fcb54590-27fa-11f0-b0f6-fc34974bb26c', '765b2c4b-0534-11f0-a1d9-60a82de70049'),
('99d660dd-2995-11f0-aded-fc34974bb26c', 'c540df55-27fc-11f0-b0f6-fc34974bb26c', '765b2ce4-0534-11f0-a1d9-60a82de70049'),
('a0cdb5f6-2fde-11f0-957d-fc34974bb26c', '3c5adf20-27fa-11f0-b0f6-fc34974bb26c', '765b2ce4-0534-11f0-a1d9-60a82de70049'),
('bc81953d-2996-11f0-aded-fc34974bb26c', '98f76e50-27fe-11f0-b0f6-fc34974bb26c', '765b2d19-0534-11f0-a1d9-60a82de70049'),
('c463e08b-2995-11f0-aded-fc34974bb26c', 'a0a25ede-27fa-11f0-b0f6-fc34974bb26c', '765b2c4b-0534-11f0-a1d9-60a82de70049'),
('cd477da7-2997-11f0-aded-fc34974bb26c', 'd7081b0d-27fd-11f0-b0f6-fc34974bb26c', '765b2d19-0534-11f0-a1d9-60a82de70049'),
('da0d3700-2997-11f0-aded-fc34974bb26c', 'f45dfde0-27fe-11f0-b0f6-fc34974bb26c', '765b2c4b-0534-11f0-a1d9-60a82de70049'),
('f783a325-2995-11f0-aded-fc34974bb26c', '7092869d-27fd-11f0-b0f6-fc34974bb26c', '765b2d04-0534-11f0-a1d9-60a82de70049');

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
('0a8df0a6-2995-11f0-aded-fc34974bb26c', '63178aec-27f9-11f0-b0f6-fc34974bb26c', '0a8dc8aa-2995-11f0-aded-fc34974bb26c', '', ''),
('0a8e16e4-2995-11f0-aded-fc34974bb26c', '63178aec-27f9-11f0-b0f6-fc34974bb26c', '0a8e0216-2995-11f0-aded-fc34974bb26c', '100', 'g'),
('0a8e45ff-2995-11f0-aded-fc34974bb26c', '63178aec-27f9-11f0-b0f6-fc34974bb26c', '0a8e2bb6-2995-11f0-aded-fc34974bb26c', '', ''),
('0a8f0c8f-2995-11f0-aded-fc34974bb26c', '63178aec-27f9-11f0-b0f6-fc34974bb26c', '0a8eb306-2995-11f0-aded-fc34974bb26c', '', ''),
('0a8f24f2-2995-11f0-aded-fc34974bb26c', '63178aec-27f9-11f0-b0f6-fc34974bb26c', '0a8f150e-2995-11f0-aded-fc34974bb26c', '', ''),
('0a8f3d35-2995-11f0-aded-fc34974bb26c', '63178aec-27f9-11f0-b0f6-fc34974bb26c', '0a8f2d5c-2995-11f0-aded-fc34974bb26c', '200', 'ml'),
('21226b91-2996-11f0-aded-fc34974bb26c', '629888f3-27fb-11f0-b0f6-fc34974bb26c', '21225630-2996-11f0-aded-fc34974bb26c', '40', 'g'),
('21227ecb-2996-11f0-aded-fc34974bb26c', '629888f3-27fb-11f0-b0f6-fc34974bb26c', '2122738d-2996-11f0-aded-fc34974bb26c', '200', 'g'),
('2122da93-2996-11f0-aded-fc34974bb26c', '629888f3-27fb-11f0-b0f6-fc34974bb26c', '21228601-2996-11f0-aded-fc34974bb26c', '100', 'g'),
('2122f016-2996-11f0-aded-fc34974bb26c', '629888f3-27fb-11f0-b0f6-fc34974bb26c', '2122e2f1-2996-11f0-aded-fc34974bb26c', '', ''),
('21230a7d-2996-11f0-aded-fc34974bb26c', '629888f3-27fb-11f0-b0f6-fc34974bb26c', '2122fe17-2996-11f0-aded-fc34974bb26c', '', ''),
('21231d7a-2996-11f0-aded-fc34974bb26c', '629888f3-27fb-11f0-b0f6-fc34974bb26c', '21231243-2996-11f0-aded-fc34974bb26c', '', ''),
('21232f74-2996-11f0-aded-fc34974bb26c', '629888f3-27fb-11f0-b0f6-fc34974bb26c', '212324c5-2996-11f0-aded-fc34974bb26c', '', ''),
('3479cba0-27fe-11f0-b0f6-fc34974bb26c', '34796f6e-27fe-11f0-b0f6-fc34974bb26c', '3479b876-27fe-11f0-b0f6-fc34974bb26c', '300', 'g'),
('3843b24f-2997-11f0-aded-fc34974bb26c', '5a52f386-27ff-11f0-b0f6-fc34974bb26c', '384389fd-2997-11f0-aded-fc34974bb26c', '150', 'g'),
('3843dae0-2997-11f0-aded-fc34974bb26c', '5a52f386-27ff-11f0-b0f6-fc34974bb26c', '3843c0db-2997-11f0-aded-fc34974bb26c', '', ''),
('38440031-2997-11f0-aded-fc34974bb26c', '5a52f386-27ff-11f0-b0f6-fc34974bb26c', '3843eaa4-2997-11f0-aded-fc34974bb26c', '', ''),
('3844731d-2997-11f0-aded-fc34974bb26c', '5a52f386-27ff-11f0-b0f6-fc34974bb26c', '38440ea6-2997-11f0-aded-fc34974bb26c', '', ''),
('38448a72-2997-11f0-aded-fc34974bb26c', '5a52f386-27ff-11f0-b0f6-fc34974bb26c', '38447e26-2997-11f0-aded-fc34974bb26c', '', ''),
('38449dea-2997-11f0-aded-fc34974bb26c', '5a52f386-27ff-11f0-b0f6-fc34974bb26c', '38449278-2997-11f0-aded-fc34974bb26c', '30', 'g'),
('3844b9f4-2997-11f0-aded-fc34974bb26c', '5a52f386-27ff-11f0-b0f6-fc34974bb26c', '3844a5b6-2997-11f0-aded-fc34974bb26c', '', ''),
('3844cc4d-2997-11f0-aded-fc34974bb26c', '5a52f386-27ff-11f0-b0f6-fc34974bb26c', '3844c182-2997-11f0-aded-fc34974bb26c', '', ''),
('3844e46f-2997-11f0-aded-fc34974bb26c', '5a52f386-27ff-11f0-b0f6-fc34974bb26c', '3844d380-2997-11f0-aded-fc34974bb26c', '', ''),
('3845451b-2997-11f0-aded-fc34974bb26c', '5a52f386-27ff-11f0-b0f6-fc34974bb26c', '38453502-2997-11f0-aded-fc34974bb26c', '', ''),
('38455858-2997-11f0-aded-fc34974bb26c', '5a52f386-27ff-11f0-b0f6-fc34974bb26c', '38454d0e-2997-11f0-aded-fc34974bb26c', '', ''),
('3c5b2b00-27fa-11f0-b0f6-fc34974bb26c', '3c5adf20-27fa-11f0-b0f6-fc34974bb26c', '3c5b1919-27fa-11f0-b0f6-fc34974bb26c', '300', 'g'),
('3d3bb957-2995-11f0-aded-fc34974bb26c', 'de508421-27f9-11f0-b0f6-fc34974bb26c', '3d3b8b34-2995-11f0-aded-fc34974bb26c', '80', 'g'),
('3d3ca1c3-2995-11f0-aded-fc34974bb26c', 'de508421-27f9-11f0-b0f6-fc34974bb26c', '3d3c3475-2995-11f0-aded-fc34974bb26c', '70', 'g'),
('3d3cd114-2995-11f0-aded-fc34974bb26c', 'de508421-27f9-11f0-b0f6-fc34974bb26c', '3d3cb4e3-2995-11f0-aded-fc34974bb26c', '70', 'g'),
('3d3cf5d9-2995-11f0-aded-fc34974bb26c', 'de508421-27f9-11f0-b0f6-fc34974bb26c', '3d3ce1e9-2995-11f0-aded-fc34974bb26c', '30', 'g'),
('3d3d1a07-2995-11f0-aded-fc34974bb26c', 'de508421-27f9-11f0-b0f6-fc34974bb26c', '3d3d03f3-2995-11f0-aded-fc34974bb26c', '150', 'g'),
('3d3d3bb8-2995-11f0-aded-fc34974bb26c', 'de508421-27f9-11f0-b0f6-fc34974bb26c', '3d3d27b5-2995-11f0-aded-fc34974bb26c', '30', 'g'),
('3d7e0b23-2996-11f0-aded-fc34974bb26c', '56125b0c-27fc-11f0-b0f6-fc34974bb26c', '3d7ddf80-2996-11f0-aded-fc34974bb26c', '', ''),
('3d7e9f70-2996-11f0-aded-fc34974bb26c', '56125b0c-27fc-11f0-b0f6-fc34974bb26c', '3d7e8ae5-2996-11f0-aded-fc34974bb26c', '', ''),
('3d7eb915-2996-11f0-aded-fc34974bb26c', '56125b0c-27fc-11f0-b0f6-fc34974bb26c', '3d7eac3e-2996-11f0-aded-fc34974bb26c', '', ''),
('3d7ecfd2-2996-11f0-aded-fc34974bb26c', '56125b0c-27fc-11f0-b0f6-fc34974bb26c', '3d7ec08c-2996-11f0-aded-fc34974bb26c', '', ''),
('3d7f239c-2996-11f0-aded-fc34974bb26c', '56125b0c-27fc-11f0-b0f6-fc34974bb26c', '3d7ed82a-2996-11f0-aded-fc34974bb26c', '', ''),
('3d7f3baf-2996-11f0-aded-fc34974bb26c', '56125b0c-27fc-11f0-b0f6-fc34974bb26c', '3d7f2f21-2996-11f0-aded-fc34974bb26c', '', ''),
('4fc27180-2996-11f0-aded-fc34974bb26c', 'fcb54590-27fa-11f0-b0f6-fc34974bb26c', '4fc25054-2996-11f0-aded-fc34974bb26c', '', ''),
('4fc294c5-2996-11f0-aded-fc34974bb26c', 'fcb54590-27fa-11f0-b0f6-fc34974bb26c', '4fc27eed-2996-11f0-aded-fc34974bb26c', '', ''),
('4fc2a873-2996-11f0-aded-fc34974bb26c', 'fcb54590-27fa-11f0-b0f6-fc34974bb26c', '4fc29d51-2996-11f0-aded-fc34974bb26c', '', ''),
('4fc2bb23-2996-11f0-aded-fc34974bb26c', 'fcb54590-27fa-11f0-b0f6-fc34974bb26c', '4fc2afb1-2996-11f0-aded-fc34974bb26c', '', ''),
('4fc31a78-2996-11f0-aded-fc34974bb26c', 'fcb54590-27fa-11f0-b0f6-fc34974bb26c', '4fc3099b-2996-11f0-aded-fc34974bb26c', '', ''),
('4fc32e41-2996-11f0-aded-fc34974bb26c', 'fcb54590-27fa-11f0-b0f6-fc34974bb26c', '4fc322c4-2996-11f0-aded-fc34974bb26c', '', ''),
('5613503a-27fc-11f0-b0f6-fc34974bb26c', '56125b0c-27fc-11f0-b0f6-fc34974bb26c', '56133cfa-27fc-11f0-b0f6-fc34974bb26c', '300', 'g'),
('5613d7ef-27fc-11f0-b0f6-fc34974bb26c', '56125b0c-27fc-11f0-b0f6-fc34974bb26c', '5613619a-27fc-11f0-b0f6-fc34974bb26c', '300', 'g'),
('56143cd0-27fc-11f0-b0f6-fc34974bb26c', '56125b0c-27fc-11f0-b0f6-fc34974bb26c', '6317ba92-27f9-11f0-b0f6-fc34974bb26c', '200', 'g'),
('6317cb63-27f9-11f0-b0f6-fc34974bb26c', '63178aec-27f9-11f0-b0f6-fc34974bb26c', '6317ba92-27f9-11f0-b0f6-fc34974bb26c', '400', 'g'),
('64dba148-2995-11f0-aded-fc34974bb26c', '3c5adf20-27fa-11f0-b0f6-fc34974bb26c', '64db15d8-2995-11f0-aded-fc34974bb26c', '130', 'g'),
('64dbb435-2995-11f0-aded-fc34974bb26c', '3c5adf20-27fa-11f0-b0f6-fc34974bb26c', '64dba951-2995-11f0-aded-fc34974bb26c', '50', 'g'),
('64dbc692-2995-11f0-aded-fc34974bb26c', '3c5adf20-27fa-11f0-b0f6-fc34974bb26c', '64dbbb80-2995-11f0-aded-fc34974bb26c', '300', 'g'),
('64dbd846-2995-11f0-aded-fc34974bb26c', '3c5adf20-27fa-11f0-b0f6-fc34974bb26c', '64dbcdb1-2995-11f0-aded-fc34974bb26c', '30', 'g'),
('64dbea3a-2995-11f0-aded-fc34974bb26c', '3c5adf20-27fa-11f0-b0f6-fc34974bb26c', '64dbdf7c-2995-11f0-aded-fc34974bb26c', '', ''),
('7092bb00-27fd-11f0-b0f6-fc34974bb26c', '7092869d-27fd-11f0-b0f6-fc34974bb26c', 'e7c9b2ae-27fb-11f0-b0f6-fc34974bb26c', '2', 'miếng'),
('7281e70d-2997-11f0-aded-fc34974bb26c', 'f45dfde0-27fe-11f0-b0f6-fc34974bb26c', '7281bbb3-2997-11f0-aded-fc34974bb26c', ' 70', 'g'),
('72820c90-2997-11f0-aded-fc34974bb26c', 'f45dfde0-27fe-11f0-b0f6-fc34974bb26c', '7281f940-2997-11f0-aded-fc34974bb26c', ' 50', 'g'),
('72822b67-2997-11f0-aded-fc34974bb26c', 'f45dfde0-27fe-11f0-b0f6-fc34974bb26c', '728219c6-2997-11f0-aded-fc34974bb26c', '50', 'g'),
('72824cbd-2997-11f0-aded-fc34974bb26c', 'f45dfde0-27fe-11f0-b0f6-fc34974bb26c', '728236b4-2997-11f0-aded-fc34974bb26c', '', ''),
('72826006-2997-11f0-aded-fc34974bb26c', 'f45dfde0-27fe-11f0-b0f6-fc34974bb26c', '728254ce-2997-11f0-aded-fc34974bb26c', '', ''),
('737c4e7d-2996-11f0-aded-fc34974bb26c', '34796f6e-27fe-11f0-b0f6-fc34974bb26c', '737c2395-2996-11f0-aded-fc34974bb26c', '', ''),
('737c7d3f-2996-11f0-aded-fc34974bb26c', '34796f6e-27fe-11f0-b0f6-fc34974bb26c', '737c60fc-2996-11f0-aded-fc34974bb26c', '', ''),
('737d0898-2996-11f0-aded-fc34974bb26c', '34796f6e-27fe-11f0-b0f6-fc34974bb26c', '737c8f07-2996-11f0-aded-fc34974bb26c', '', ''),
('737d217f-2996-11f0-aded-fc34974bb26c', '34796f6e-27fe-11f0-b0f6-fc34974bb26c', '737d14f9-2996-11f0-aded-fc34974bb26c', '', ''),
('737d385d-2996-11f0-aded-fc34974bb26c', '34796f6e-27fe-11f0-b0f6-fc34974bb26c', '737d2adb-2996-11f0-aded-fc34974bb26c', '', ''),
('737d4e76-2996-11f0-aded-fc34974bb26c', '34796f6e-27fe-11f0-b0f6-fc34974bb26c', '737d422f-2996-11f0-aded-fc34974bb26c', '', ''),
('737d61bb-2996-11f0-aded-fc34974bb26c', '34796f6e-27fe-11f0-b0f6-fc34974bb26c', '737d565f-2996-11f0-aded-fc34974bb26c', '', ''),
('737d73fd-2996-11f0-aded-fc34974bb26c', '34796f6e-27fe-11f0-b0f6-fc34974bb26c', '737d68fa-2996-11f0-aded-fc34974bb26c', '', ''),
('737dd5e2-2996-11f0-aded-fc34974bb26c', '34796f6e-27fe-11f0-b0f6-fc34974bb26c', '737dc877-2996-11f0-aded-fc34974bb26c', '', ''),
('98f811e0-27fe-11f0-b0f6-fc34974bb26c', '98f76e50-27fe-11f0-b0f6-fc34974bb26c', '98f79e04-27fe-11f0-b0f6-fc34974bb26c', '500', 'g'),
('99d545e7-2995-11f0-aded-fc34974bb26c', 'c540df55-27fc-11f0-b0f6-fc34974bb26c', '99d4be19-2995-11f0-aded-fc34974bb26c', '', ''),
('99d5618d-2995-11f0-aded-fc34974bb26c', 'c540df55-27fc-11f0-b0f6-fc34974bb26c', '99d55197-2995-11f0-aded-fc34974bb26c', '', ''),
('99d58592-2995-11f0-aded-fc34974bb26c', 'c540df55-27fc-11f0-b0f6-fc34974bb26c', '99d56f91-2995-11f0-aded-fc34974bb26c', '', ''),
('99d5a918-2995-11f0-aded-fc34974bb26c', 'c540df55-27fc-11f0-b0f6-fc34974bb26c', '99d593eb-2995-11f0-aded-fc34974bb26c', '', ''),
('99d5cdf7-2995-11f0-aded-fc34974bb26c', 'c540df55-27fc-11f0-b0f6-fc34974bb26c', '99d5b8c8-2995-11f0-aded-fc34974bb26c', '', ''),
('99d62712-2995-11f0-aded-fc34974bb26c', 'c540df55-27fc-11f0-b0f6-fc34974bb26c', '99d61b16-2995-11f0-aded-fc34974bb26c', '', ''),
('99d64631-2995-11f0-aded-fc34974bb26c', 'c540df55-27fc-11f0-b0f6-fc34974bb26c', '99d635d2-2995-11f0-aded-fc34974bb26c', '', ''),
('a0fbea6d-2997-11f0-aded-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', 'a0fb5f14-2997-11f0-aded-fc34974bb26c', '150', 'g'),
('a0fc0baa-2997-11f0-aded-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', 'a0fbf7d0-2997-11f0-aded-fc34974bb26c', '', ''),
('a0fc30d7-2997-11f0-aded-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', 'a0fc1972-2997-11f0-aded-fc34974bb26c', '', ''),
('a0fc490c-2997-11f0-aded-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', 'a0fc3cb2-2997-11f0-aded-fc34974bb26c', '', ''),
('a0fc5c38-2997-11f0-aded-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', 'a0fc5117-2997-11f0-aded-fc34974bb26c', '', ''),
('bc7f3298-2996-11f0-aded-fc34974bb26c', '98f76e50-27fe-11f0-b0f6-fc34974bb26c', 'bc7f05c1-2996-11f0-aded-fc34974bb26c', '', ''),
('bc7f60ab-2996-11f0-aded-fc34974bb26c', '98f76e50-27fe-11f0-b0f6-fc34974bb26c', 'bc7f44cd-2996-11f0-aded-fc34974bb26c', '', ''),
('bc7f8cef-2996-11f0-aded-fc34974bb26c', '98f76e50-27fe-11f0-b0f6-fc34974bb26c', 'bc7f725a-2996-11f0-aded-fc34974bb26c', '', ''),
('bc7fb926-2996-11f0-aded-fc34974bb26c', '98f76e50-27fe-11f0-b0f6-fc34974bb26c', 'bc7f9e05-2996-11f0-aded-fc34974bb26c', '', ''),
('bc80267c-2996-11f0-aded-fc34974bb26c', '98f76e50-27fe-11f0-b0f6-fc34974bb26c', 'bc7fc2e7-2996-11f0-aded-fc34974bb26c', '', ''),
('bc803ac5-2996-11f0-aded-fc34974bb26c', '98f76e50-27fe-11f0-b0f6-fc34974bb26c', 'bc802f22-2996-11f0-aded-fc34974bb26c', '', ''),
('bc804dcd-2996-11f0-aded-fc34974bb26c', '98f76e50-27fe-11f0-b0f6-fc34974bb26c', 'bc804273-2996-11f0-aded-fc34974bb26c', '', ''),
('bc80603c-2996-11f0-aded-fc34974bb26c', '98f76e50-27fe-11f0-b0f6-fc34974bb26c', 'bc805536-2996-11f0-aded-fc34974bb26c', '', ''),
('bc807291-2996-11f0-aded-fc34974bb26c', '98f76e50-27fe-11f0-b0f6-fc34974bb26c', 'bc806788-2996-11f0-aded-fc34974bb26c', '', ''),
('bc8084cb-2996-11f0-aded-fc34974bb26c', '98f76e50-27fe-11f0-b0f6-fc34974bb26c', 'bc8079f2-2996-11f0-aded-fc34974bb26c', '', ''),
('bc80e6f3-2996-11f0-aded-fc34974bb26c', '98f76e50-27fe-11f0-b0f6-fc34974bb26c', 'bc80d82d-2996-11f0-aded-fc34974bb26c', '', ''),
('bc810550-2996-11f0-aded-fc34974bb26c', '98f76e50-27fe-11f0-b0f6-fc34974bb26c', 'bc80f651-2996-11f0-aded-fc34974bb26c', '', ''),
('bc81239c-2996-11f0-aded-fc34974bb26c', '98f76e50-27fe-11f0-b0f6-fc34974bb26c', 'bc811605-2996-11f0-aded-fc34974bb26c', '', ''),
('c4625180-2995-11f0-aded-fc34974bb26c', 'a0a25ede-27fa-11f0-b0f6-fc34974bb26c', 'c462389c-2995-11f0-aded-fc34974bb26c', '', ''),
('c4626e0c-2995-11f0-aded-fc34974bb26c', 'a0a25ede-27fa-11f0-b0f6-fc34974bb26c', 'c4625d3b-2995-11f0-aded-fc34974bb26c', '', ''),
('c4628a4e-2995-11f0-aded-fc34974bb26c', 'a0a25ede-27fa-11f0-b0f6-fc34974bb26c', 'c46275e8-2995-11f0-aded-fc34974bb26c', '', ''),
('c4629c36-2995-11f0-aded-fc34974bb26c', 'a0a25ede-27fa-11f0-b0f6-fc34974bb26c', 'c4629170-2995-11f0-aded-fc34974bb26c', '', ''),
('c4630575-2995-11f0-aded-fc34974bb26c', 'a0a25ede-27fa-11f0-b0f6-fc34974bb26c', 'c462f9a5-2995-11f0-aded-fc34974bb26c', '', ''),
('c463674c-2995-11f0-aded-fc34974bb26c', 'a0a25ede-27fa-11f0-b0f6-fc34974bb26c', 'c4630c9b-2995-11f0-aded-fc34974bb26c', '', ''),
('c46380ff-2995-11f0-aded-fc34974bb26c', 'a0a25ede-27fa-11f0-b0f6-fc34974bb26c', 'c463741f-2995-11f0-aded-fc34974bb26c', '', ''),
('c5411cce-27fc-11f0-b0f6-fc34974bb26c', 'c540df55-27fc-11f0-b0f6-fc34974bb26c', 'c5410c47-27fc-11f0-b0f6-fc34974bb26c', '4', 'quả'),
('cd463920-2997-11f0-aded-fc34974bb26c', 'd7081b0d-27fd-11f0-b0f6-fc34974bb26c', '737c2395-2996-11f0-aded-fc34974bb26c', '', ''),
('cd465c72-2997-11f0-aded-fc34974bb26c', 'd7081b0d-27fd-11f0-b0f6-fc34974bb26c', '737c60fc-2996-11f0-aded-fc34974bb26c', '', ''),
('cd46cec6-2997-11f0-aded-fc34974bb26c', 'd7081b0d-27fd-11f0-b0f6-fc34974bb26c', '737c8f07-2996-11f0-aded-fc34974bb26c', '', ''),
('cd46e185-2997-11f0-aded-fc34974bb26c', 'd7081b0d-27fd-11f0-b0f6-fc34974bb26c', '737d14f9-2996-11f0-aded-fc34974bb26c', '', ''),
('d708c7db-27fd-11f0-b0f6-fc34974bb26c', 'd7081b0d-27fd-11f0-b0f6-fc34974bb26c', 'd708beb3-27fd-11f0-b0f6-fc34974bb26c', '250', 'g'),
('da0c4a93-2997-11f0-aded-fc34974bb26c', 'f45dfde0-27fe-11f0-b0f6-fc34974bb26c', 'da0c35d6-2997-11f0-aded-fc34974bb26c', ' 50', 'g'),
('da0c6b87-2997-11f0-aded-fc34974bb26c', 'f45dfde0-27fe-11f0-b0f6-fc34974bb26c', 'da0c5ff6-2997-11f0-aded-fc34974bb26c', '', ''),
('da0c7e12-2997-11f0-aded-fc34974bb26c', 'f45dfde0-27fe-11f0-b0f6-fc34974bb26c', 'da0c7326-2997-11f0-aded-fc34974bb26c', '', ''),
('ddfd7c7a-28c7-11f0-ac1b-fc34974bb26c', '34796f6e-27fe-11f0-b0f6-fc34974bb26c', 'ddfcf55b-28c7-11f0-ac1b-fc34974bb26c', '', ''),
('e7c9c4a2-27fb-11f0-b0f6-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', 'e7c9b2ae-27fb-11f0-b0f6-fc34974bb26c', '160', 'g'),
('f45ebd8e-27fe-11f0-b0f6-fc34974bb26c', 'f45dfde0-27fe-11f0-b0f6-fc34974bb26c', 'f45ea94a-27fe-11f0-b0f6-fc34974bb26c', '3', 'quả'),
('f7230bb8-28c7-11f0-ac1b-fc34974bb26c', '34796f6e-27fe-11f0-b0f6-fc34974bb26c', 'f722ea80-28c7-11f0-ac1b-fc34974bb26c', '', ''),
('f7818280-2995-11f0-aded-fc34974bb26c', '7092869d-27fd-11f0-b0f6-fc34974bb26c', 'f7815565-2995-11f0-aded-fc34974bb26c', '200', 'g'),
('f781b2d8-2995-11f0-aded-fc34974bb26c', '7092869d-27fd-11f0-b0f6-fc34974bb26c', 'f7819493-2995-11f0-aded-fc34974bb26c', '200', 'g'),
('f781e4ce-2995-11f0-aded-fc34974bb26c', '7092869d-27fd-11f0-b0f6-fc34974bb26c', 'f781c4b9-2995-11f0-aded-fc34974bb26c', '', ''),
('f7825b8a-2995-11f0-aded-fc34974bb26c', '7092869d-27fd-11f0-b0f6-fc34974bb26c', 'f7824804-2995-11f0-aded-fc34974bb26c', '', ''),
('f7828027-2995-11f0-aded-fc34974bb26c', '7092869d-27fd-11f0-b0f6-fc34974bb26c', 'f7826a56-2995-11f0-aded-fc34974bb26c', '', ''),
('f782df95-2995-11f0-aded-fc34974bb26c', '7092869d-27fd-11f0-b0f6-fc34974bb26c', 'f7828ebe-2995-11f0-aded-fc34974bb26c', '', ''),
('f782f818-2995-11f0-aded-fc34974bb26c', '7092869d-27fd-11f0-b0f6-fc34974bb26c', 'f782e811-2995-11f0-aded-fc34974bb26c', '', ''),
('f7830b8e-2995-11f0-aded-fc34974bb26c', '7092869d-27fd-11f0-b0f6-fc34974bb26c', 'f782fff3-2995-11f0-aded-fc34974bb26c', '', ''),
('f7832147-2995-11f0-aded-fc34974bb26c', '7092869d-27fd-11f0-b0f6-fc34974bb26c', 'f78315af-2995-11f0-aded-fc34974bb26c', '', ''),
('f7833389-2995-11f0-aded-fc34974bb26c', '7092869d-27fd-11f0-b0f6-fc34974bb26c', 'f7832874-2995-11f0-aded-fc34974bb26c', '', ''),
('f783484a-2995-11f0-aded-fc34974bb26c', '7092869d-27fd-11f0-b0f6-fc34974bb26c', 'f7833d11-2995-11f0-aded-fc34974bb26c', '', ''),
('fcb58f4a-27fa-11f0-b0f6-fc34974bb26c', 'fcb54590-27fa-11f0-b0f6-fc34974bb26c', 'fcb57c41-27fa-11f0-b0f6-fc34974bb26c', '200', 'g');

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
('0a8fa3bf-2995-11f0-aded-fc34974bb26c', '63178aec-27f9-11f0-b0f6-fc34974bb26c', '961dc36a-0535-11f0-a1d9-60a82de70049'),
('17eb5fb6-2b1b-11f0-a774-fc34974bb26c', '34796f6e-27fe-11f0-b0f6-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('21234c41-2996-11f0-aded-fc34974bb26c', '629888f3-27fb-11f0-b0f6-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('38457026-2997-11f0-aded-fc34974bb26c', '5a52f386-27ff-11f0-b0f6-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('3d3d523c-2995-11f0-aded-fc34974bb26c', 'de508421-27f9-11f0-b0f6-fc34974bb26c', '961dc36a-0535-11f0-a1d9-60a82de70049'),
('3d7f8ed3-2996-11f0-aded-fc34974bb26c', '56125b0c-27fc-11f0-b0f6-fc34974bb26c', '961dc36a-0535-11f0-a1d9-60a82de70049'),
('439c8afe-2d83-11f0-921a-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('439c8f66-2d83-11f0-921a-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', '961dbf55-0535-11f0-a1d9-60a82de70049'),
('4fc39af3-2996-11f0-aded-fc34974bb26c', 'fcb54590-27fa-11f0-b0f6-fc34974bb26c', '961dc36a-0535-11f0-a1d9-60a82de70049'),
('99d65680-2995-11f0-aded-fc34974bb26c', 'c540df55-27fc-11f0-b0f6-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('a0cd9144-2fde-11f0-957d-fc34974bb26c', '3c5adf20-27fa-11f0-b0f6-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('a0cd9a33-2fde-11f0-957d-fc34974bb26c', '3c5adf20-27fa-11f0-b0f6-fc34974bb26c', '961dbf55-0535-11f0-a1d9-60a82de70049'),
('bc813237-2996-11f0-aded-fc34974bb26c', '98f76e50-27fe-11f0-b0f6-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('c463d950-2995-11f0-aded-fc34974bb26c', 'a0a25ede-27fa-11f0-b0f6-fc34974bb26c', '961dc36a-0535-11f0-a1d9-60a82de70049'),
('cd473b5c-2997-11f0-aded-fc34974bb26c', 'd7081b0d-27fd-11f0-b0f6-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('da0ceff1-2997-11f0-aded-fc34974bb26c', 'f45dfde0-27fe-11f0-b0f6-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('f78356c1-2995-11f0-aded-fc34974bb26c', '7092869d-27fd-11f0-b0f6-fc34974bb26c', '961dbf55-0535-11f0-a1d9-60a82de70049');

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
('0a8f51d6-2995-11f0-aded-fc34974bb26c', '63178aec-27f9-11f0-b0f6-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('0a8f571b-2995-11f0-aded-fc34974bb26c', '63178aec-27f9-11f0-b0f6-fc34974bb26c', '030eac1b-0536-11f0-a1d9-60a82de70049'),
('17ead9c3-2b1b-11f0-a774-fc34974bb26c', '34796f6e-27fe-11f0-b0f6-fc34974bb26c', '030eac1b-0536-11f0-a1d9-60a82de70049'),
('17eae4b2-2b1b-11f0-a774-fc34974bb26c', '34796f6e-27fe-11f0-b0f6-fc34974bb26c', '030eac2e-0536-11f0-a1d9-60a82de70049'),
('212336ca-2996-11f0-aded-fc34974bb26c', '629888f3-27fb-11f0-b0f6-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('3845696d-2997-11f0-aded-fc34974bb26c', '5a52f386-27ff-11f0-b0f6-fc34974bb26c', '030eac1b-0536-11f0-a1d9-60a82de70049'),
('3d3d483f-2995-11f0-aded-fc34974bb26c', 'de508421-27f9-11f0-b0f6-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('3d7f45b3-2996-11f0-aded-fc34974bb26c', '56125b0c-27fc-11f0-b0f6-fc34974bb26c', '9dabffaf-21b5-11f0-8cfe-6d7e2f6fa0d7'),
('439bba71-2d83-11f0-921a-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('439bc575-2d83-11f0-921a-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', '030eac1b-0536-11f0-a1d9-60a82de70049'),
('4fc3431c-2996-11f0-aded-fc34974bb26c', 'fcb54590-27fa-11f0-b0f6-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('99d64f3b-2995-11f0-aded-fc34974bb26c', 'c540df55-27fc-11f0-b0f6-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('a0cd6768-2fde-11f0-957d-fc34974bb26c', '3c5adf20-27fa-11f0-b0f6-fc34974bb26c', '9dabffaf-21b5-11f0-8cfe-6d7e2f6fa0d7'),
('a0cd70f8-2fde-11f0-957d-fc34974bb26c', '3c5adf20-27fa-11f0-b0f6-fc34974bb26c', '030eac2e-0536-11f0-a1d9-60a82de70049'),
('bc812b70-2996-11f0-aded-fc34974bb26c', '98f76e50-27fe-11f0-b0f6-fc34974bb26c', '030eac1b-0536-11f0-a1d9-60a82de70049'),
('c4638912-2995-11f0-aded-fc34974bb26c', 'a0a25ede-27fa-11f0-b0f6-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('cd46ebfe-2997-11f0-aded-fc34974bb26c', 'd7081b0d-27fd-11f0-b0f6-fc34974bb26c', '9dabffaf-21b5-11f0-8cfe-6d7e2f6fa0d7'),
('da0c9fe9-2997-11f0-aded-fc34974bb26c', 'f45dfde0-27fe-11f0-b0f6-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('f7834fd3-2995-11f0-aded-fc34974bb26c', '7092869d-27fd-11f0-b0f6-fc34974bb26c', '9dabffaf-21b5-11f0-8cfe-6d7e2f6fa0d7');

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
('0a8ffa21-2995-11f0-aded-fc34974bb26c', '63178aec-27f9-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('17eba2c7-2b1b-11f0-a774-fc34974bb26c', '34796f6e-27fe-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('21236491-2996-11f0-aded-fc34974bb26c', '629888f3-27fb-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('3845856f-2997-11f0-aded-fc34974bb26c', '5a52f386-27ff-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('3d3d6070-2995-11f0-aded-fc34974bb26c', 'de508421-27f9-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('3d801d59-2996-11f0-aded-fc34974bb26c', '56125b0c-27fc-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('439cf22b-2d83-11f0-921a-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('4fc4400d-2996-11f0-aded-fc34974bb26c', 'fcb54590-27fa-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('99d6afc4-2995-11f0-aded-fc34974bb26c', 'c540df55-27fc-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('a0ce3cd9-2fde-11f0-957d-fc34974bb26c', '3c5adf20-27fa-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('bc81de8c-2996-11f0-aded-fc34974bb26c', '98f76e50-27fe-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('c463e73c-2995-11f0-aded-fc34974bb26c', 'a0a25ede-27fa-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('cd478499-2997-11f0-aded-fc34974bb26c', 'd7081b0d-27fd-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('da0d7d96-2997-11f0-aded-fc34974bb26c', 'f45dfde0-27fe-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('f783b014-2995-11f0-aded-fc34974bb26c', '7092869d-27fd-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049');

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
('28851978-2cb1-11f0-bee5-fc34974bb26c', 2, 'thế hải', 'thehai@gmail.com', '$2b$10$I3EITGuqpK1V3YHKYNc.be6nTtxXer0q8bM40h3Wonx6fl2uMW6ei', '2025-05-09 15:39:44', 1, '2002-05-03 06:00:00', NULL, 'resources/user-img/efb00c2a70d70d79d83dee2d044599b8.jpg'),
('4a7666ab-27f6-11f0-b0f6-fc34974bb26c', 2, 'Bất quy tắc', 'tac@gmail.com', '$2b$10$pbTsJF8kq8OLohZGSUaYBOuybfh7REoWk.0bHViemc4U6uJnAs47.', '2025-05-03 15:12:01', 1, '2001-09-22 00:00:00', NULL, 'resources/default-avatar.png'),
('6cea5cdc-0880-11f0-9ee4-57838c346148', 2, 'Hoàng Nghiệp', 'nghiep@gmail.com', '$2b$10$agTkK0PbYHI.PBB.c7VsHOVy1LDMjCebFkBl4g9ITkqkSjv7BxswG', '2025-03-24 14:19:56', 0, '2003-09-25 10:00:00', NULL, 'resources/user-img/7399e74f777a3b38373561ed09a614c7.jpg'),
('c5ac6d06-fafd-11ef-a991-38fc9861f2be', 2, 'nghiep1', 'anhnghiep12@gmail.com', '$2b$10$xJrJ3nn8V8uzI93RIi0RYe5FxT52KCVPcfu33CQODcSfNd6KpsxWO', '2025-03-07 09:41:47', 2, '2001-09-22 00:00:00', NULL, 'resources/user-img/1b91cd5a830809cb30b8194571ad600e.png'),
('f42366a7-f96b-11ef-a991-38fc9861f2be', 2, 'hoàngnghiệp', 'anh123@gmail.com', '1', '2025-03-05 09:45:35', 1, '2001-09-22 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_meal_plans`
--

CREATE TABLE `user_meal_plans` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `recipe_id` char(36) NOT NULL,
  `menu_number` tinyint(4) DEFAULT NULL,
  `meal_time` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_meal_plans`
--

INSERT INTO `user_meal_plans` (`id`, `user_id`, `recipe_id`, `menu_number`, `meal_time`) VALUES
('159c5f5d-2cbb-11f0-bee5-fc34974bb26c', '28851978-2cb1-11f0-bee5-fc34974bb26c', '34796f6e-27fe-11f0-b0f6-fc34974bb26c', 3, 1),
('159cbca2-2cbb-11f0-bee5-fc34974bb26c', '28851978-2cb1-11f0-bee5-fc34974bb26c', '56125b0c-27fc-11f0-b0f6-fc34974bb26c', 3, 3),
('325bfa8e-2fde-11f0-957d-fc34974bb26c', '28851978-2cb1-11f0-bee5-fc34974bb26c', 'd7081b0d-27fd-11f0-b0f6-fc34974bb26c', 1, 2),
('3637be57-2fde-11f0-957d-fc34974bb26c', '28851978-2cb1-11f0-bee5-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', 1, 1),
('399b69ac-2fde-11f0-957d-fc34974bb26c', '28851978-2cb1-11f0-bee5-fc34974bb26c', '98f76e50-27fe-11f0-b0f6-fc34974bb26c', 1, 3),
('78fed8ba-2fdf-11f0-957d-fc34974bb26c', '28851978-2cb1-11f0-bee5-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', 2, 1),
('820b6bfb-2fdf-11f0-957d-fc34974bb26c', '28851978-2cb1-11f0-bee5-fc34974bb26c', 'c540df55-27fc-11f0-b0f6-fc34974bb26c', 7, 3),
('84c149e8-2fdf-11f0-957d-fc34974bb26c', '28851978-2cb1-11f0-bee5-fc34974bb26c', 'a0a25ede-27fa-11f0-b0f6-fc34974bb26c', 7, 2),
('9382feeb-2fdf-11f0-957d-fc34974bb26c', '28851978-2cb1-11f0-bee5-fc34974bb26c', '5a52f386-27ff-11f0-b0f6-fc34974bb26c', 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `recipe_id` (`recipe_id`);

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
  ADD UNIQUE KEY `unique_plan` (`user_id`,`menu_number`,`meal_time`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`);

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
