-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2025 at 02:51 PM
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
('14059a43-32f5-11f0-9152-fc34974bb26c', 'Cá chép ta 1kg/con (1 con nhỏ)', 'cá ', 'hải sản'),
('1405ba80-32f5-11f0-9152-fc34974bb26c', 'Cốt tắc và quả tắc 1M / 2 quả', '', ''),
('1405df92-32f5-11f0-9152-fc34974bb26c', 'Ớt sừng băm 1M', '', ''),
('1405fff5-32f5-11f0-9152-fc34974bb26c', 'Ớt hiểm 2 quả', '', ''),
('1406146d-32f5-11f0-9152-fc34974bb26c', 'Hành lá cắt nhỏ 2 nhánh', '', ''),
('1406269b-32f5-11f0-9152-fc34974bb26c', 'Nước lọc 500ml', '', ''),
('1406629e-32f5-11f0-9152-fc34974bb26c', 'Đậu phông rang bỏ vỏ tách đôi 2M', '', ''),
('14068ebb-32f5-11f0-9152-fc34974bb26c', 'Xoài keo 160g', '', ''),
('1406a3e3-32f5-11f0-9152-fc34974bb26c', 'Gia vị nêm sẵn Aji-Quick Bột Tẩm Khô Chiên Giòn 84g (2 gói)', '', ''),
('1406b66e-32f5-11f0-9152-fc34974bb26c', 'Bữa chiều: Ăn kèm Bún tươi, rau sống, Tráng miệng: táo', '', ''),
('1d7fcb94-106c-11f0-9e95-57807cec2c15', 'ba chỉ', 'lợn', NULL),
('1d9ae78b-32eb-11f0-9152-fc34974bb26c', 'Fillet cá bông lau (còn da) ', 'cá', 'hải sản'),
('1d9b08c5-32eb-11f0-9152-fc34974bb26c', 'Ớt chuông xanh 50g', '', ''),
('1d9b2408-32eb-11f0-9152-fc34974bb26c', 'Ớt chuông đỏ 50g', '', ''),
('1d9b4b1c-32eb-11f0-9152-fc34974bb26c', 'Ớt chuông vàng 50g', '', ''),
('1d9b63f8-32eb-11f0-9152-fc34974bb26c', 'Hành tây 25g ', '', ''),
('1d9b8465-32eb-11f0-9152-fc34974bb26c', 'Hành tím băm, Tỏi băm', '', ''),
('1d9ba2ee-32eb-11f0-9152-fc34974bb26c', 'Gia vị: Đường, Dầu ăn, Tương ớt, Tương cà, Sản phẩm nhấn', '', ''),
('21225630-2996-11f0-aded-fc34974bb26c', 'Bóng bì lợn', 'lợn', 'thịt'),
('2122738d-2996-11f0-aded-fc34974bb26c', 'Giò sống', 'giò', 'khác'),
('21228601-2996-11f0-aded-fc34974bb26c', 'Cà rốt', '', ''),
('2122e2f1-2996-11f0-aded-fc34974bb26c', 'Bông cải trắng 80g', '', ''),
('2122fe17-2996-11f0-aded-fc34974bb26c', 'Bông cải xanh 80g', '', ''),
('21231243-2996-11f0-aded-fc34974bb26c', 'Nấm hương rừng Sapa (loại có xiên) 10g', '', ''),
('212324c5-2996-11f0-aded-fc34974bb26c', 'Gia vị: Muối, đường, nước mắm', '', ''),
('248b9061-32ef-11f0-9152-fc34974bb26c', 'Sườn non heo ', 'Sườn heo', 'thịt'),
('248bc2c3-32ef-11f0-9152-fc34974bb26c', 'Sả 2 cây', '', ''),
('248be879-32ef-11f0-9152-fc34974bb26c', 'Tỏi băm 1/2M', '', ''),
('248c0f62-32ef-11f0-9152-fc34974bb26c', 'Hành tím băm 1/2M', '', ''),
('248c31a8-32ef-11f0-9152-fc34974bb26c', 'Gừng 1m', '', ''),
('248cd73f-32ef-11f0-9152-fc34974bb26c', 'Khoai môn cao 200g', '', ''),
('248cfdec-32ef-11f0-9152-fc34974bb26c', 'Chao đỏ 3 viên', '', ''),
('248d23c9-32ef-11f0-9152-fc34974bb26c', 'Nước dừa tươi 500ml', '', ''),
('248d4339-32ef-11f0-9152-fc34974bb26c', 'Sa tế 1M', '', ''),
('248d66cf-32ef-11f0-9152-fc34974bb26c', 'Hạt nêm Aji-ngon® HEO 12g (1M)', '', ''),
('248d9711-32ef-11f0-9152-fc34974bb26c', 'Nước mắm 8g (1M)', '', ''),
('248ded8b-32ef-11f0-9152-fc34974bb26c', 'Ăn tối kèm: Bún tươi, Tráng miệng: Mận', '', ''),
('2c27df7a-32ed-11f0-9152-fc34974bb26c', 'Sườn bò ', 'sườn', 'thịt'),
('2c27f8fa-32ed-11f0-9152-fc34974bb26c', 'Đậu phộng ', '', ''),
('2c280f3c-32ed-11f0-9152-fc34974bb26c', 'Đậu Hà Lan hạt 100g', '', ''),
('2c28344b-32ed-11f0-9152-fc34974bb26c', 'Cà rốt 100g', '', ''),
('2c285417-32ed-11f0-9152-fc34974bb26c', 'Hành tây bi 50g', '', ''),
('2c286a78-32ed-11f0-9152-fc34974bb26c', 'Nước dừa tươi: 1 trái', '', ''),
('2c28834d-32ed-11f0-9152-fc34974bb26c', 'Rau gia vị: 50g', '', ''),
('2c28a03d-32ed-11f0-9152-fc34974bb26c', 'Cà Paste hộp: 30g (3M)', '', ''),
('2c28c507-32ed-11f0-9152-fc34974bb26c', 'Dầu ăn: 10g', '', ''),
('2c28f671-32ed-11f0-9152-fc34974bb26c', 'Đường: 2.5g (1M)', '', ''),
('2c291cf1-32ed-11f0-9152-fc34974bb26c', 'Dầu ăn: 10g (2M)', '', ''),
('2c293d05-32ed-11f0-9152-fc34974bb26c', 'Bột năng: 24g (2M)', '', ''),
('31b38e48-3486-11f0-8af6-fc34974bb26c', 'Cà tím: 2 trái', '', ''),
('31b3c406-3486-11f0-8af6-fc34974bb26c', 'Tỏi: 2 tép', '', ''),
('31b3f01d-3486-11f0-8af6-fc34974bb26c', 'Gừng: 2 lát', '', ''),
('31b416e0-3486-11f0-8af6-fc34974bb26c', 'Hành lá: 2 cây', '', ''),
('31b43824-3486-11f0-8af6-fc34974bb26c', 'Mè trắng rang: 1M', '', ''),
('31b4566c-3486-11f0-8af6-fc34974bb26c', 'Đường, dầu mè, ớt', '', ''),
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
('4292d89e-3485-11f0-8af6-fc34974bb26c', 'Mề gà (trưởng thành) ', 'gà', 'thịt'),
('4293664f-3485-11f0-8af6-fc34974bb26c', 'Tỏi băm 25g', '', ''),
('4293be3a-3485-11f0-8af6-fc34974bb26c', 'Ớt sừng 10g', '', ''),
('429417d8-3485-11f0-8af6-fc34974bb26c', 'Dầu điều 8g (1m)', '', ''),
('42944502-3485-11f0-8af6-fc34974bb26c', 'Nước tương 22g (2M)', '', ''),
('42947917-3485-11f0-8af6-fc34974bb26c', 'Giấm gạo lên men Ajinomoto 7.5g (1,5M)', '', ''),
('4294a176-3485-11f0-8af6-fc34974bb26c', 'Ớt bột 1m', '', ''),
('4294e19a-3485-11f0-8af6-fc34974bb26c', 'Dầu hào 8g (2M)', '', ''),
('42950bc4-3485-11f0-8af6-fc34974bb26c', 'Tương ớt 14g (1M)', '', ''),
('448aab71-32ee-11f0-9152-fc34974bb26c', 'Da heo ', 'lợn', 'thịt'),
('448ad913-32ee-11f0-9152-fc34974bb26c', 'Hành lá 2 cọng', '', ''),
('448b029e-32ee-11f0-9152-fc34974bb26c', 'Hành tây 40g (1/2 củ)', '', ''),
('448b4814-32ee-11f0-9152-fc34974bb26c', 'Bột năng 1M', '', ''),
('448b64e4-32ee-11f0-9152-fc34974bb26c', 'Muối 4g (1m)', '', ''),
('448b88eb-32ee-11f0-9152-fc34974bb26c', 'Nước mắm 4g (1M)', '', ''),
('448b9a4d-32ee-11f0-9152-fc34974bb26c', 'Hạt nêm Aji heo 4g (1m)', '', ''),
('448bb5d1-32ee-11f0-9152-fc34974bb26c', 'RAU NÊM: Ngò rí ĂN KÈM: Cơm trắng Gia vị: Dầu ăn, muối, đường, nước mắm', '', ''),
('4fc25054-2996-11f0-aded-fc34974bb26c', 'Thơm 1/4 trái', '', ''),
('4fc27eed-2996-11f0-aded-fc34974bb26c', 'Xà lách mỡ 100g', '', ''),
('4fc29d51-2996-11f0-aded-fc34974bb26c', 'Cà chua bi 50g', '', ''),
('4fc2afb1-2996-11f0-aded-fc34974bb26c', 'Bắp Mỹ hạt 20g', '', ''),
('4fc3099b-2996-11f0-aded-fc34974bb26c', 'Dưa leo 50g', '', ''),
('4fc322c4-2996-11f0-aded-fc34974bb26c', 'Gia vị: Nướng tương, dầu ăn, mật ong, tiêu', '', ''),
('56133cfa-27fc-11f0-b0f6-fc34974bb26c', 'Miến dong Thái ', 'miến', 'tinh bột'),
('5613619a-27fc-11f0-b0f6-fc34974bb26c', 'tôm sú', 'tôm', 'hải sản'),
('5b319a26-32ea-11f0-9152-fc34974bb26c', 'Mì udon tươi ', '', ''),
('5b31d4c4-32ea-11f0-9152-fc34974bb26c', 'Xá lách 150g', '', ''),
('5b31f69d-32ea-11f0-9152-fc34974bb26c', 'Cà chua 100g (1 quả)', '', ''),
('5b321d81-32ea-11f0-9152-fc34974bb26c', 'Cá hồi phile ', 'cá', 'hải sản'),
('5b3245af-32ea-11f0-9152-fc34974bb26c', 'Bắp mỹ 300g (1 trái)', '', ''),
('5b326caa-32ea-11f0-9152-fc34974bb26c', 'Hành tây tím 25g (1/4 củ)', '', ''),
('5b3298af-32ea-11f0-9152-fc34974bb26c', 'Gia vị khác: Muối, bơ tươi (Anchor), tiêu', '', ''),
('5b9990e1-3487-11f0-8af6-fc34974bb26c', 'thịt ốc miếng', 'ốc', 'hải sản'),
('5b99b198-3487-11f0-8af6-fc34974bb26c', '1/2kg bún tươi', '', ''),
('5b99d551-3487-11f0-8af6-fc34974bb26c', 'Nước dùng: 1,5 lít', '', ''),
('5b99efe7-3487-11f0-8af6-fc34974bb26c', 'Cà chua: 2 trá', '', ''),
('5b9a06b8-3487-11f0-8af6-fc34974bb26c', 'Đậu hũ chiên: 1', '', ''),
('5b9a22fb-3487-11f0-8af6-fc34974bb26c', 'Rau thơm: tía tô, kinh giới', '', ''),
('5b9a3e3d-3487-11f0-8af6-fc34974bb26c', 'Ngò gai, xà lách', '', ''),
('5b9a60ed-3487-11f0-8af6-fc34974bb26c', 'Ớt khô, ớt hiểm, hành tím băm', '', ''),
('5b9a7b24-3487-11f0-8af6-fc34974bb26c', 'Hành lá, chanh, ớt sa tế, tiêu', '', ''),
('5b9a93de-3487-11f0-8af6-fc34974bb26c', 'Bột nghệ, mắm tôm', '', ''),
('5eb974bf-32f5-11f0-9152-fc34974bb26c', 'Cá nục con nhỏ ', 'cá ', 'hải sản'),
('5eb9a61b-32f5-11f0-9152-fc34974bb26c', 'Mía cây 3 đốt', '', ''),
('5eba4538-32f5-11f0-9152-fc34974bb26c', 'Hành tím 50g', '', ''),
('5eba73ac-32f5-11f0-9152-fc34974bb26c', 'Tỏi băm 30g', '', ''),
('5eba9102-32f5-11f0-9152-fc34974bb26c', 'Ớt trái 3 trái', '', ''),
('5ebab1e2-32f5-11f0-9152-fc34974bb26c', 'Nước mắm 40g (5M)', '', ''),
('5ebae764-32f5-11f0-9152-fc34974bb26c', 'Tương ớt 1M', '', ''),
('5ebb0ee8-32f5-11f0-9152-fc34974bb26c', 'Nước màu 1M', '', ''),
('5ebb3188-32f5-11f0-9152-fc34974bb26c', 'Ăn trưa kèm: Cơm, Cánh gà xào ớt xiêm, Canh rau dền khoai sọ', '', ''),
('6317ba92-27f9-11f0-b0f6-fc34974bb26c', 'mực ống', 'mực', 'hải sản'),
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
('794ddf83-32ed-11f0-9152-fc34974bb26c', 'Tôm thẻ ', 'tôm', 'hải sản'),
('794dffa6-32ed-11f0-9152-fc34974bb26c', 'Cơm trắng 400g', '', ''),
('794e1b32-32ed-11f0-9152-fc34974bb26c', 'Đậu bắp 100g', '', ''),
('794e46fb-32ed-11f0-9152-fc34974bb26c', 'Bầu 100g', '', ''),
('794e613e-32ed-11f0-9152-fc34974bb26c', 'Bông cải trắng 100g', '', ''),
('794e7417-32ed-11f0-9152-fc34974bb26c', 'Kho quẹt 60g', '', ''),
('794e85f5-32ed-11f0-9152-fc34974bb26c', 'Dầu ăn 7.5g', '', ''),
('7a4aa791-32ef-11f0-9152-fc34974bb26c', 'Thịt ba chỉ bò cắt lát sẵn ', 'lợn', 'thịt'),
('7a4ad610-32ef-11f0-9152-fc34974bb26c', 'Phô mai mozzarella 50g', '', ''),
('7a4af37b-32ef-11f0-9152-fc34974bb26c', 'Cải thảo 200g', '', ''),
('7a4b1e15-32ef-11f0-9152-fc34974bb26c', 'Nấm kim châm 150g', '', ''),
('7a4b41f4-32ef-11f0-9152-fc34974bb26c', 'Hành boaro 1 cây', '', ''),
('7a4b6c54-32ef-11f0-9152-fc34974bb26c', 'Dầu ăn 1.5g (1m)', '', ''),
('7a4b9618-32ef-11f0-9152-fc34974bb26c', 'Viên thả lẩu (bánh bao hải sản nhiều màu) 100g', '', ''),
('7a4bba52-32ef-11f0-9152-fc34974bb26c', 'Bữa tối: Ăn kèm Ăn kèm mì vắt Koreno, Tráng miệng: Trái cây', '', ''),
('7a7237df-322a-11f0-ad72-fc34974bb26c', 'Khoai tây', 'khoai tây', 'rau củ quả'),
('7a725d52-322a-11f0-ad72-fc34974bb26c', 'Thịt bò xay', 'bò', 'thịt'),
('7a7286ae-322a-11f0-ad72-fc34974bb26c', 'Phô mai Mozzarella 60g', '', ''),
('7a73047e-322a-11f0-ad72-fc34974bb26c', 'Tương cà Heinz 50g', '', ''),
('7a733339-322a-11f0-ad72-fc34974bb26c', 'Dầu ăn 5g (1M)', '', ''),
('7a7351d9-322a-11f0-ad72-fc34974bb26c', 'Dầu ô liu 5g (1M)', '', ''),
('7a7369b3-322a-11f0-ad72-fc34974bb26c', 'Bột ngọt 4g', '', ''),
('83626aa7-3229-11f0-ad72-fc34974bb26c', 'Hành tây 100g ', '', ''),
('8362d07a-3229-11f0-ad72-fc34974bb26c', 'Dầu ăn 2M (10g)', '', ''),
('8362e917-3229-11f0-ad72-fc34974bb26c', 'Tiêu 1/3m', '', ''),
('8362fd40-3229-11f0-ad72-fc34974bb26c', 'Lá chanh Thái băm nhỏ 1m', '', ''),
('836311b3-3229-11f0-ad72-fc34974bb26c', 'Lá chanh Thái cắt sợi 2M', '', ''),
('836322eb-3229-11f0-ad72-fc34974bb26c', 'Nước cốt chanh 1M', '', ''),
('836332fb-3229-11f0-ad72-fc34974bb26c', 'Nước hành tỏi 1M', '', ''),
('93bc680a-3485-11f0-8af6-fc34974bb26c', 'Bông cải trắng', '', ''),
('93bcd019-3485-11f0-8af6-fc34974bb26c', 'Măng tây', '', ''),
('93bd00de-3485-11f0-8af6-fc34974bb26c', 'Thơm', '', ''),
('93bd275f-3485-11f0-8af6-fc34974bb26c', 'Nấm đùi gà', '', ''),
('93bd4e09-3485-11f0-8af6-fc34974bb26c', 'RAU NÊM: Lá boa rô cắt sợi', '', ''),
('93bd9392-3485-11f0-8af6-fc34974bb26c', 'Gia vị: Boa rô cắt lát, tiêu, đường, dầu ăn', '', ''),
('98f79e04-27fe-11f0-b0f6-fc34974bb26c', 'Thịt nghêu đông lạnh', 'Ngêu', 'hải sản'),
('99d4be19-2995-11f0-aded-fc34974bb26c', 'Bầu quả 400g', '', ''),
('99d55197-2995-11f0-aded-fc34974bb26c', 'Rau mồng tơi 200g', '', ''),
('99d56f91-2995-11f0-aded-fc34974bb26c', 'Hành lá 20g', '', ''),
('99d593eb-2995-11f0-aded-fc34974bb26c', 'Rau răm 10g', '', ''),
('99d5b8c8-2995-11f0-aded-fc34974bb26c', 'Gừng tươi 10g', '', ''),
('99d61b16-2995-11f0-aded-fc34974bb26c', 'Hành tím 20g', '', ''),
('99d635d2-2995-11f0-aded-fc34974bb26c', 'Ớt hiểm', '', ''),
('9e31a0ff-32eb-11f0-9152-fc34974bb26c', 'Giò nạc ', 'giò', 'khác'),
('9e31e73a-32eb-11f0-9152-fc34974bb26c', 'Thơm 70g', '', ''),
('9e3202e1-32eb-11f0-9152-fc34974bb26c', 'Tôm khô ', 'tôm', 'hải sản'),
('9e32196c-32eb-11f0-9152-fc34974bb26c', 'Sợi bún to (bún bò ) ', '', ''),
('9e322ef4-32eb-11f0-9152-fc34974bb26c', 'Sả cây', '', ''),
('9e3241d3-32eb-11f0-9152-fc34974bb26c', 'Đầu hành lá', '', ''),
('9e326843-32eb-11f0-9152-fc34974bb26c', 'Dầu ăn, Nước mắm, Đường', '', ''),
('9e32894a-32eb-11f0-9152-fc34974bb26c', 'Ăn kèm: Xà lách sợi, giá, hoa chuối, rau thơm, chanh, ớt nước mắm.', '', ''),
('a0fb5f14-2997-11f0-aded-fc34974bb26c', 'Nấm rơm búp ', 'Nấm', 'rau củ quả'),
('a0fbf7d0-2997-11f0-aded-fc34974bb26c', 'Hành Boa-rô 1 cọng', '', ''),
('a0fc1972-2997-11f0-aded-fc34974bb26c', 'Nước dừa xiêm 1/2 chén', '', ''),
('a0fc3cb2-2997-11f0-aded-fc34974bb26c', 'Bột năng 2.5g 1/2m', '', ''),
('a0fc5117-2997-11f0-aded-fc34974bb26c', 'Gia vị: Đường; Tiêu; Tương ớt', '', ''),
('a1ffaed2-3227-11f0-ad72-fc34974bb26c', 'Bacon xông khói', 'lợn', 'thịt'),
('a1ffd6e1-3227-11f0-ad72-fc34974bb26c', 'Đậu petit pois đông lạnh ', 'đậu', 'khác'),
('a200140a-3227-11f0-ad72-fc34974bb26c', 'Hành tây tím 30g', '', ''),
('a200474e-3227-11f0-ad72-fc34974bb26c', 'Húng lủi 20g', '', ''),
('a200e923-3227-11f0-ad72-fc34974bb26c', 'Nước cốt chanh 5g', '', ''),
('a201129b-3227-11f0-ad72-fc34974bb26c', 'Sữa đặc', '', ''),
('a2013c67-3227-11f0-ad72-fc34974bb26c', 'Sữa tươi', '', ''),
('a201c2ae-3227-11f0-ad72-fc34974bb26c', 'Mù tạt xanh', '', ''),
('a72aec9c-322b-11f0-ad72-fc34974bb26c', 'Bông cải xanh 350g', '', ''),
('a72b0a7f-322b-11f0-ad72-fc34974bb26c', 'Bông cải trắng 250g', '', ''),
('a72b26ef-322b-11f0-ad72-fc34974bb26c', 'Đậu bi đông lạnh 30g', '', ''),
('a72b63a5-322b-11f0-ad72-fc34974bb26c', 'Bắp hạt đông lạnh 1 trái', '', ''),
('a72b9720-322b-11f0-ad72-fc34974bb26c', 'Bơ 6g (1m)', '', ''),
('a8c8d1e1-28c9-11f0-ac1b-fc34974bb26c', 'Đậu bắp 8 quả', '', ''),
('acd06a87-32ea-11f0-9152-fc34974bb26c', 'Hành tây 50g', '', ''),
('acd0f6fa-32ea-11f0-9152-fc34974bb26c', 'Bắp cải tím 50g', '', ''),
('acd1228d-32ea-11f0-9152-fc34974bb26c', 'Cà rốt 30g', '', ''),
('acd1467c-32ea-11f0-9152-fc34974bb26c', 'Lá quế 20g', '', ''),
('acd16ebb-32ea-11f0-9152-fc34974bb26c', 'Bánh phồng tôm', '', ''),
('acd1e439-32ea-11f0-9152-fc34974bb26c', 'Gia vị: đường, dầu ăn', '', ''),
('afd0ec21-3486-11f0-8af6-fc34974bb26c', 'Bánh phở', '', ''),
('afd10486-3486-11f0-8af6-fc34974bb26c', 'Xương gà', '', ''),
('afd12a32-3486-11f0-8af6-fc34974bb26c', 'Thịt gà', 'gà', 'thịt'),
('afd155a4-3486-11f0-8af6-fc34974bb26c', 'Gừng, hành tím: 50g', '', ''),
('afd16cde-3486-11f0-8af6-fc34974bb26c', 'Sá sùng: 25g', '', ''),
('afd18c0c-3486-11f0-8af6-fc34974bb26c', 'Đường phèn: 20g', '', ''),
('afd1a82c-3486-11f0-8af6-fc34974bb26c', 'Hành tây: 1/2 củ', '', ''),
('afd1be83-3486-11f0-8af6-fc34974bb26c', 'Hành boaro: 1 cây', '', ''),
('afd1e13c-3486-11f0-8af6-fc34974bb26c', 'Cần tây: 1/2 cọng', '', ''),
('afd20a5a-3486-11f0-8af6-fc34974bb26c', 'Lá chanh Bắc: 6 lá', '', ''),
('afd27382-3486-11f0-8af6-fc34974bb26c', 'Muối hột rang, nước mắm', '', ''),
('afd2d3b7-3486-11f0-8af6-fc34974bb26c', 'Tiêu sọ xay, tương ớt Bắc', '', ''),
('afd2e961-3486-11f0-8af6-fc34974bb26c', 'Hành lá, ngò gai, chanh, ớt sừng, rễ ngò', '', ''),
('b87c47d9-3228-11f0-ad72-fc34974bb26c', 'Cá điêu hồng', 'cá', 'hải sản'),
('b87c8d7b-3228-11f0-ad72-fc34974bb26c', 'Ớt xiêm xanh 2M', '', ''),
('b87cb421-3228-11f0-ad72-fc34974bb26c', 'Ớt chuông xanh 150g (1M)', '', ''),
('b87ce9ef-3228-11f0-ad72-fc34974bb26c', 'Cà rốt ngâm chua 50g', '', ''),
('b87d10a8-3228-11f0-ad72-fc34974bb26c', 'Tỏi tép 5 tép', '', ''),
('b87d3b66-3228-11f0-ad72-fc34974bb26c', 'Hành tây 50g (1/2 củ)', '', ''),
('b87d5fd9-3228-11f0-ad72-fc34974bb26c', 'Cải bẹ xanh 600g', '', ''),
('b87d86ef-3228-11f0-ad72-fc34974bb26c', 'Hạt nêm 4g (1m)', '', ''),
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
('c3dfe2b8-32ee-11f0-9152-fc34974bb26c', 'Cá basa fillet đông lạnh ', 'cá', 'hải sản'),
('c3e00b2f-32ee-11f0-9152-fc34974bb26c', 'Ngò rí 2 cọng', '', ''),
('c3e01df7-32ee-11f0-9152-fc34974bb26c', 'Trứng gà 55g ( 2 quả )', '', ''),
('c3e050df-32ee-11f0-9152-fc34974bb26c', 'Xốt Mayonnaise Aji-mayo® Vị Nguyên Bản 1M', '', ''),
('c3e07141-32ee-11f0-9152-fc34974bb26c', 'Cà chua 84g (1 quả )', '', ''),
('c3e08e7c-32ee-11f0-9152-fc34974bb26c', 'Bột mì đa dụng (11) 2M', '', ''),
('c3e0ad5f-32ee-11f0-9152-fc34974bb26c', 'Tiêu 1/2m', '', ''),
('c3e0cf32-32ee-11f0-9152-fc34974bb26c', 'Hạt nêm Aji-ngon® HEO 2m', '', ''),
('c3e0e9ca-32ee-11f0-9152-fc34974bb26c', 'Ăn trưa kèm: Cơm, Canh sườn khoai sọ, Mít non kho nấm', '', ''),
('c462389c-2995-11f0-aded-fc34974bb26c', 'Xà lách Mỹ 50g', '', ''),
('c4625d3b-2995-11f0-aded-fc34974bb26c', 'Xà lách lolo 50g', '', ''),
('c46275e8-2995-11f0-aded-fc34974bb26c', 'Cà chua bi 100g', '', ''),
('c4629170-2995-11f0-aded-fc34974bb26c', 'Dưa leo 100g', '', ''),
('c462f9a5-2995-11f0-aded-fc34974bb26c', 'Rong biển wakame 3g', '', ''),
('c4630c9b-2995-11f0-aded-fc34974bb26c', 'Thanh cua 4 cây', '', ''),
('c463741f-2995-11f0-aded-fc34974bb26c', 'Hạnh nhân lát 10g', '', ''),
('c5410c47-27fc-11f0-b0f6-fc34974bb26c', 'Trứng vịt lộn', 'trứng', 'khác'),
('c925f014-240d-11f0-98b3-fc34974bb26c', 'Thăn', 'lợn', NULL),
('d708beb3-27fd-11f0-b0f6-fc34974bb26c', 'tôm sú', 'tôm', 'hải sản'),
('da0c35d6-2997-11f0-aded-fc34974bb26c', 'Rong nho tách nước', 'rau củ quả khác', ''),
('da0c5ff6-2997-11f0-aded-fc34974bb26c', 'Dưa leo 50g', 'rau củ quả khác', ''),
('da0c7326-2997-11f0-aded-fc34974bb26c', 'Bắp cải tím 30g', 'rau củ quả khác', ''),
('dda68c44-32ed-11f0-9152-fc34974bb26c', 'Thịt thăn bò ', 'bò', 'thịt'),
('dda6babd-32ed-11f0-9152-fc34974bb26c', 'Cần tây 50g (1 bẹ )', '', ''),
('dda6e06e-32ed-11f0-9152-fc34974bb26c', 'Ớt chuông đỏ, vàng 100g (50g mỗi loại )', '', ''),
('dda7050e-32ed-11f0-9152-fc34974bb26c', 'Cà bi 84g (5 trái )', '', ''),
('dda727b8-32ed-11f0-9152-fc34974bb26c', 'Hành tây tím 47g (1/2 củ )', '', ''),
('dda74db5-32ed-11f0-9152-fc34974bb26c', 'Cải mầm 3 màu 80g', '', ''),
('dda7d02d-32ed-11f0-9152-fc34974bb26c', 'Chanh vàng 1 quả', '', ''),
('dda85069-32ed-11f0-9152-fc34974bb26c', 'Nước tương Phú Sĩ giảm muối 27g (1,5M )', '', ''),
('dda87340-32ed-11f0-9152-fc34974bb26c', 'Dầu ăn 5g (1M )', '', ''),
('dda897a4-32ed-11f0-9152-fc34974bb26c', 'Bơ lạt 10g (1,5m)', '', ''),
('dda8c73b-32ed-11f0-9152-fc34974bb26c', 'Hạt nêm AjiNgon Heo 2g (1/2m)', '', ''),
('dda8eb2e-32ed-11f0-9152-fc34974bb26c', 'Đường 6g (1/2 M)', '', ''),
('dda91605-32ed-11f0-9152-fc34974bb26c', 'Giấm 10g (2M)', '', ''),
('dda9365e-32ed-11f0-9152-fc34974bb26c', 'AjiQuick bột tẩm khô chiên giòn 21g (Nửa gói)', '', ''),
('dda9479c-32ed-11f0-9152-fc34974bb26c', 'Mè rang 2m', '', ''),
('ddfcf55b-28c7-11f0-ac1b-fc34974bb26c', 'Hành tím xay 1M', '', ''),
('de0885cb-322a-11f0-ad72-fc34974bb26c', 'Cà tím 100g (1 trái to)', '', ''),
('de08b3de-322a-11f0-ad72-fc34974bb26c', 'Nạc dăm xay', 'lợn', 'thịt'),
('de08d333-322a-11f0-ad72-fc34974bb26c', 'Giò sống ', 'giò', 'thịt'),
('de08f3eb-322a-11f0-ad72-fc34974bb26c', 'Củ năng 4 củ', '', ''),
('de0916f7-322a-11f0-ad72-fc34974bb26c', 'Dưa chuột muối chua 1 quả', '', ''),
('de09a7f7-322a-11f0-ad72-fc34974bb26c', 'Trứng gà luộc 1/2 quả', '', ''),
('de09cdb0-322a-11f0-ad72-fc34974bb26c', 'Bột năng 5g (1m)', '', ''),
('de09efa9-322a-11f0-ad72-fc34974bb26c', 'Gia vị: Dầu ăn, nước mắm, muối, tiêu, đường, tương ớt', '', ''),
('e18149de-32e9-11f0-9152-fc34974bb26c', 'Thịt nạc dăm xay', 'lợn', 'thịt'),
('e181c964-32e9-11f0-9152-fc34974bb26c', 'Củ sắn 150g', '', ''),
('e181dbe8-32e9-11f0-9152-fc34974bb26c', 'Trứng gà 1 quả', '', ''),
('e181ed7e-32e9-11f0-9152-fc34974bb26c', 'Cà chua chín đỏ 2 trái', '', ''),
('e1823f40-32e9-11f0-9152-fc34974bb26c', 'Hành lá 2 nhánh', '', ''),
('e1825a36-32e9-11f0-9152-fc34974bb26c', 'Hành tây băm 3M', '', ''),
('e1826b31-32e9-11f0-9152-fc34974bb26c', 'Hành tím phi 1M', '', ''),
('e1827c83-32e9-11f0-9152-fc34974bb26c', 'Bánh mì 4 ổ trung bình', '', ''),
('e1828faa-32e9-11f0-9152-fc34974bb26c', 'Bột năng 1M + 1m', '', ''),
('e32fee46-3229-11f0-ad72-fc34974bb26c', 'Đùi gà', 'gà', 'thịt'),
('e33071fd-3229-11f0-ad72-fc34974bb26c', 'Tiêu xanh 2 nhánh', '', ''),
('e3309142-3229-11f0-ad72-fc34974bb26c', 'Lá chanh bắc/lá chúc 5 lá', '', ''),
('e330b3d9-3229-11f0-ad72-fc34974bb26c', 'Hành tím 10 củ', '', ''),
('e330db4a-3229-11f0-ad72-fc34974bb26c', 'Ớt hiểm 3 trái', '', ''),
('e3315c40-3229-11f0-ad72-fc34974bb26c', 'Đường 4g (1m)', '', ''),
('e331806c-3229-11f0-ad72-fc34974bb26c', 'Nước tương 11g (1M)', '', ''),
('e331ac27-3229-11f0-ad72-fc34974bb26c', 'Gia vị: Dầu ăn, đường, ngũ vị hương, hạt nêm Aji-ngon® Heo', '', ''),
('e3b80e09-3226-11f0-ad72-fc34974bb26c', 'Xương heo', 'lợn', 'thịt'),
('e3b840bb-3226-11f0-ad72-fc34974bb26c', 'Khổ qua rừng', 'Khổ qua', 'rau củ quả'),
('e3b8708b-3226-11f0-ad72-fc34974bb26c', 'Cá thác lác', 'cá', 'hải sản'),
('e3b8ab4d-3226-11f0-ad72-fc34974bb26c', 'Cọng thì là băm nhỏ 1M', '', ''),
('e3b8d287-3226-11f0-ad72-fc34974bb26c', 'Hành lá 50g', '', ''),
('e3b8fba8-3226-11f0-ad72-fc34974bb26c', 'Ngò rí 2 cây', '', ''),
('e3b922d0-3226-11f0-ad72-fc34974bb26c', 'Nấm kim châm', 'nấm', 'rau củ quả'),
('e3b94851-3226-11f0-ad72-fc34974bb26c', 'Nấm bào ngư ', 'nấm', 'rau củ quả'),
('e7c9b2ae-27fb-11f0-b0f6-fc34974bb26c', 'Đậu hũ', 'đậu', 'khác'),
('ea0198d7-32eb-11f0-9152-fc34974bb26c', 'Cánh gà khúc giữa:', 'gà', 'thịt'),
('ea01c404-32eb-11f0-9152-fc34974bb26c', 'Hạt đác tươi: 50g', '', ''),
('ea01e5c4-32eb-11f0-9152-fc34974bb26c', 'Chanh dây: 1 trái', '', ''),
('ea0206f7-32eb-11f0-9152-fc34974bb26c', 'Hành tím băm: 2m', '', ''),
('ea02225d-32eb-11f0-9152-fc34974bb26c', 'Tỏi băm: 2m', '', ''),
('ea0238d0-32eb-11f0-9152-fc34974bb26c', 'Nước mắm: 1M', '', ''),
('ea02c9cf-32eb-11f0-9152-fc34974bb26c', 'Aji thịt kho: 1 gói', '', ''),
('ea02ed99-32eb-11f0-9152-fc34974bb26c', 'Đường: 1M', '', ''),
('eba0e499-3486-11f0-8af6-fc34974bb26c', 'Sườn non: 200g', '', ''),
('eba1049b-3486-11f0-8af6-fc34974bb26c', 'Bí đao: 1 trái', '', ''),
('eba1274c-3486-11f0-8af6-fc34974bb26c', 'Hành tím: 3 củ', '', ''),
('eba144d6-3486-11f0-8af6-fc34974bb26c', 'Hành lá, ngò rí, tiêu', '', ''),
('f2560587-3485-11f0-8af6-fc34974bb26c', 'Táo: 1/2quả', '', ''),
('f256595c-3485-11f0-8af6-fc34974bb26c', 'Kiwi: 1 quả', '', ''),
('f2568858-3485-11f0-8af6-fc34974bb26c', 'Dâu: 1 quả', '', ''),
('f256b491-3485-11f0-8af6-fc34974bb26c', 'Rượu Rum: 1m', '', ''),
('f256e074-3485-11f0-8af6-fc34974bb26c', 'Bơ lạt: 10g', '', ''),
('f25701e1-3485-11f0-8af6-fc34974bb26c', 'Whipping cream: 15ml', '', ''),
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
('1428736b-3227-11f0-ad72-fc34974bb26c', 'Hỗ trợ hệ tiêu hóa'),
('3b775c81-21ba-11f0-8cfe-6d7e2f6fa0d7', 'khác'),
('87114d89-0536-11f0-a1d9-60a82de70049', 'cân bằng dinh dưỡng'),
('87115057-0536-11f0-a1d9-60a82de70049', 'hỗ trợ cho thận khỏe mạnh'),
('871150b8-0536-11f0-a1d9-60a82de70049', 'hỗ trợ cho gan khỏe mạnh'),
('871150cc-0536-11f0-a1d9-60a82de70049', 'giúp làm việc trí não hiệu quả'),
('871150e1-0536-11f0-a1d9-60a82de70049', 'giảm khối mỡ thừa của cơ thể'),
('871150f5-0536-11f0-a1d9-60a82de70049', 'bổ máu'),
('87115113-0536-11f0-a1d9-60a82de70049', 'hỗ trợ xây dựng khối cơ xương'),
('f231139b-3226-11f0-ad72-fc34974bb26c', 'Hỗ trợ tim và mạch máu');

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
('14056a95-32f5-11f0-9152-fc34974bb26c', 'Cá chép chiên giòn cuốn bánh tráng', 'resources/img-recipes/1747468863269.jpg', '4', '35 phút', 1, '247', 'Món cá chép chiên giòn cuốn bánh tráng không chỉ ngon miệng mà còn mang cảm giác thú vị khi tự tay cuốn và thưởng thức. Cá chép chín vàng đều, giòn rụm bên ngoài, khi ăn ngọt thịt kết hợp với nước nấm chấm sánh sệt chua ngọt hài hòa.\r\n\r\n', 'Cá chép làm sạch để vảy\r\nHành lá cắt nhỏ\r\nXoài keo bào sợi\r\nNgâm ngập cá trong nước lạnh pha 1m muối, 2 quả ớt hiểm đập dập và vắt 2 quả tắc trong 30 phút. Vớt ra để ráo.\r\nPha nước mắm: hòa tan 1M tỏi xay, 1M ớt xay, 1M cốt tắc, 1M đường, 1M nước mắm, 2M nước lọc.', 'Chuẩn bị chảo dầu nóng 160oC. Tẩm cá với 2 gói bột Aji quick khô chiên giòn. Thả từ từ đuôi cá từ thành chảo vào, chiên đến khi cá chín vàng giòn 2 mặt. Vớt ra để ráo.\r\nChan ít dầu nóng vào hành lá để làm mở hành.', 'Cho cá ra đĩa rưới mỡ hành và rắc đậu phộng lên trên, dùng nóng. Cuộn với bánh tráng rau sống, chấm nước mắm khi thưởng thức.', 'Ngâm cá với nước tắc, muối ớt để cá thấm vị và hết mùi tanh.\r\nDùng bột Aji Quick khô để cá có vị đậm đà và không bị văng dầu.\r\nThả từ từ đuôi cá vào thành chảo để bột Aji quick không bị trôi và không bị bắn dầu.', 'thực đơn này áp dụng cho những người có vận động thể lực mạnh, trẻ nam trong giai đoạn dậy thì, người có tập luyện thể dục thể thao có tập luyện căng cơ nhiều như tập gyM, tập tạ.\r\nMón ăn cần được áp dụng đồng bộ với thực đơn kèm theo mới có thể phát huy tác dụng tăng xây dựng khối cơ xương.\r\nKhẩu phần đạm trong thực đơn đã được tính toán tối ưu cho sinh lý xây dựng khối cơ xương bình thường. Vì vậy, những trường hợp muốn sử dụng thêm các loại bột đạm hay khẩu phần ăn cao đạm hơn so với thực đơn này, đều cần phải có sự theo dõi chức năng gan thận và điều chỉnh thực đơn của các chuyên gia dinh dưỡng.', 'resources/img-recipes/1747468863272.png', '2025-05-17 15:01:03'),
('1d9a4bd8-32eb-11f0-9152-fc34974bb26c', 'Cá bông lau chua ngọt', 'resources/img-recipes/1747464584377.jpg', '4', '25 phút', 1, '260', 'Cá bông lau chua ngọt là món ăn thơm ngon, hấp dẫn, kết hợp giữa vị chua dịu, ngọt thanh và vị béo mềm tự nhiên của cá bông lau. Đây là món ăn phổ biến trong bữa cơm gia đình, đặc biệt là ở các vùng sông nước miền Tây, nơi cá bông lau được yêu thích nhờ độ béo thơm và thịt mềm đặc trưng.\r\n\r\nNhững miếng cá giòn thơm có màu vàng đẹp mắt, thịt cá mềm thấm đều xốt xào chua ngọt, thêm hành tây và ớt chuông nhiều màu sắc, ngon khỏi bàn, cực bén cơm! Ai mà ngờ Cá Bông Lau lại có thể ngon được đến như thế này! Không thử là tiếc lắm nha! Xắn tay áo vào bếp liền thôi nào.', 'Fillet cá bông lau rửa sạch qua muối pha loãng, để ráo, cắt miếng vuông\r\nHành tây, ớt chuông xanh, ớt chuông đỏ, ớt chuông vàng rửa sạch cắt vuông cạnh 2cm\r\nÁo cá với 1/2 gói Gia vị nêm sẵn Aji-Quick® Bột tẩm khô chiên giòn', 'Chiên ngập dầu cá với lửa lớn, đến khi da vàng giòn. Vớt ra dĩa để ráo dầu.\r\n🥣Làm xốt: Phi thơm 1m hành tím băm, 1m tỏi băm , cho ớt chuông đỏ, ớt chuông xanh, ớt chuông vàng, hành tây xào đến khi vừa chín tới. Cho hỗn hợp rau ra dĩa. Tiếp tục cho 1M tương ớt, 3M tương cà, 4M nước, 1/2M đường, 1m giấm, 1m Aji heo vào chảo đảo đều đến khi xốt vừa sệt laị. Thêm cá, rau xốc đều cho thấm gia vị. Tắt bếp\r\n', '...', '🧑‍🍳 Dùng Aji khô thì tạo độ kêt dính hơn và không cần nêm thêm gia vị khi ướp cá.\r\n🧑‍🍳 Rửa cá qua nước muối pha loãng để giảm bớt mùi tanh.\r\n🧑‍🍳 Chiên cá ngập dầu ở lửa lớn để da cá vàng giòn, thịt không khô.', 'Thực đơn cho người cần tăng khối cơ xương thường có lượng đạm cao. Nên để cân bằng các dạng protein khác nhau trong khẩu phần hàng ngày, tốt nhất không nên tập trung ăn 1-2 loại thực phẩm giàu đạm ví dụ chỉ ăn thịt gà hay thịt bò, mà cần thay đổi đa dạng các thực phẩm giàu đạm khác nhau trong các bữa ăn hàng ngày. Các loại đạm từ “thịt trắng” như cá, lươn, ếch,… rất tốt vì vẫn cung cấp nguyên liệu cho quá trình xây dựng khối cơ xương nhưng lại dễ tiêu hóa hơn, dễ chuyển hóa hơn nên làm nhẹ công lao động của gan và thận hơn.\r\nLượng chất béo trong khẩu phần của người cần xây dựng khối cơ xương cũng thường chiếm tỉ lệ cao, vì là nguyên liệu cần thiết để xây dựng màng tế bào và các nội tiết tố. Vì vậy, không cần ăn đạm nạc tuyệt đối, vẫn có thể ăn các thực phẩm giàu đạm có béo kèm theo.', 'resources/img-recipes/1747464584378.png', '2025-05-17 13:49:44'),
('248b6b65-32ef-11f0-9152-fc34974bb26c', 'Lẩu sườn khoai môn', 'resources/img-recipes/1747466314010.jpg', '4', '35 phút', 1, '151', 'Món lẩu sườn khoai môn hấp dẫn với sự kết hợp vị ngọt của sườn non và vị dẻo bùi của khoai môn, thoảng mùi thơm đặc trưng khi ăn với chao, cay nhẹ của sa tế, sả. Cách nấu sao cho nước lẩu sanh sánh, sườn mềm, khoai môn chín mềm không bị quá nát.\r\n\r\nMón ăn có nhiều ích lợi cho sức khỏe với khoai môn cải thiện hệ tiêu hóa, giảm lượng đường trong máu, ngăn ngừa ung thư, bảo vệ da, đặc biệt là sườn non rất tốt để xây dựng khối cơ xương khi kết hợp với thực đơn dinh dưỡng.', 'Sườn non heo rửa qua nước muối, để ráo nước, chặt khúc 2cm\r\nSả đập giập\r\nKhoai môn cao chẻ dọc, cắt khúc 3cm.\r\n🥣Ướp sườn với 1/2m tiêu, 1m đường, 1M Hạt nêm Aji-ngon® HEO, 1M nước mắm, 1M sa tế, 3 viên chao đỏ. Ướp 15 phút.', 'Chiên rám mặt khoai môn.\r\nPhi thơm hành, tỏi, gừng, sả cho sườn vào xào săn, thêm 500ml nước dừa tươi, 500ml nước lọc, nấu 20 phút ở lửa vừa. Thêm khoai môn vào nấu đến khi khoai mềm.', 'Ăn kèm với cơm/ bún, rau muống/ cải bẹ xanh', '💡 Dùng hạt nêm Aji-ngon Heo để món ăn đậm đà hơn.\r\n\r\n💡 Chiên rám mặt khoai môn để nước lẩu sánh hơn.\r\n\r\n💡 Dùng chao đỏ để màu sắc và mùi vị đặc trưng hơn.', 'Món ăn có thành phần dinh dưỡng gần như cân đối và đạt các yêu cầu về đa dạng thực phẩm trong bữa ăn chính.\r\nMón ăn phải được áp dụng trong thực đơn đính kèm mới đạt được hiệu quả xây dựng khối cơ xương như mong muốn.\r\nThực đơn được áp dụng cho người trưởng thành có luyện tập thể dục thể thao mức độ từ trung bình đến nặng; trẻ đang giai đoạn tăng trưởng nhanh của quá trình dậy thì. Những người có tình trạng dinh dưỡng như thừa cân béo phì, có bệnh lý cần giảm khẩu phần đạm như bệnh gout (thống phong), suy thận… không nên áp dụng thực đơn này.\r\nTập luyện để khối cơ căng giãn gắng sức và ngủ sớm trước 10g hàng đêm là phần rất quan trọng đi kèm với chế độ ăn này để kích thích gia tăng xây dựng khối cơ xương ở nhóm trẻ nam trong độ tuổi dậy thì, khi trẻ còn tăng trưởng chiều cao. Với nhóm trẻ này, khẩu phần sữa thường cần đạt > 600ml mỗi ngày, nên các bữa phụ thường thay bằng các bữa sữa.', 'resources/img-recipes/1747466314011.png', '2025-05-17 14:18:34'),
('2c27b604-32ed-11f0-9152-fc34974bb26c', 'Sườn bò hầm đậu phộng', 'resources/img-recipes/1747465467787.jpg', '4', '20 phút', 1, '2100', 'Thịt sườn bò chín mềm, đậm đà, hòa chung vị bùi thơm các loại đậu, chua nhẹ của nước om, chấm miếng bánh mì là nếm trọn được vị ngọt ngon hấp dẫn. Một sự kết hợp miễn chê, dễ dàng đổi vị cho mâm cơm nhà. Vào bếp thử ngay món Sườn Bò Hầm Đậu Phộng cùng Món Ngon Mỗi Ngày thôi nào!', 'Ướp sườn bò với, 1.5 m hạt nêm, 1M hành tỏi băm, 1M Nước tương “Phú Sĩ”. Để thấm 30 phút.', 'Bắc chảo cho 2M dầu cho sườn bò vào xào săn, thêm 3M cà paste, 1/2 hành tây bi vào. Tiếp theo cho đậu phộng, đậu Hà Lan vào. Nêm gia vị: 3m Hạt nêm Aji-ngon® HEO, 1m đường, thêm nước dừa tươi và nước sôi vào đậy vung om chín. Cho thêm cà rốt, và 1/2 hành tây bi vào nấu chín, thêm 2M nước bột năng, nước hơi sánh nhẹ là được.', 'Múc sườn bò om ra đĩa sâu lòng. Rắc rau nêm, ớt sừng cắt lát. Dọn kèm chén Nước tương “Phú Sĩ” và ớt cắt lát. Ăn kèm bánh mì.\r\n\r\nĂn sáng – Ăn kèm: Bánh mỳ, Tráng miệng – Trái cây, Sữa – Cà phê', 'Nên xào săn thịt sườn bò trước khi nấu thịt sẽ thấm vị và thơm ngon hơn.\r\nNấu với lửa nhỏ và dậy vug để mó không bị mất nhiều nước.\r\nCó thể nấu bằng nồi áp suất giúp tiết kiệm thời gian.', 'Để xây dựng khối cơ sẽ cần khẩu phần chất đạm cao hơn, ưu tiên các loại đạm có nguồn gốc động vật, bao gồm cả sữa và các chế phẩm từ sữa. \r\nĐiều cần lưu ý là vẫn phải duy trì đủ lượng chất bột đường cần thiết cho nhu cầu bình thường của các tế bào trong cơ thể, nếu không chất đạm đưa vào sẽ không thể dùng hoàn toàn cho việc xây dựng khối cơ xương. Mặc dù cần cung cấp đủ chất bột đường, nhưng vẫn nên ưu tiên lựa chọn những chất bột đường hấp thu chậm như gạo chà dối, cơm gạo có trộn đậu, bánh mì đen, bánh mì ngũ cốc…  ', NULL, '2025-05-17 14:04:27'),
('31b36070-3486-11f0-8af6-fc34974bb26c', 'Cà tím hấp nước tương tỏi', 'resources/img-recipes/1747641141252.jpg', '4', '20 phút', 1, '72', 'Đây là món ăn có hương vị không chỉ mới lạ mà còn rất lý tưởng cho những ai muốn ăn kiêng nữa.', 'Cà tím rửa sạch, để ráo. Tỏi, gừng, ớt bằm nhuyễn. Hành lá rửa sạch, cắt nhỏ.', 'Cho cà tím vào nồi hấp chín, lấy ra bóc vỏ, cắt miếng vừa ăn.\r\nPhi thơm tỏi, gừng, ớt cho vào 1M Giấm gạo lên men LISA®, 1m đường, 2M nước tương Phú Sĩ và 1M dầu mè, đun sôi, tắt bếp.', 'Xếp cà tím ra dĩa, rưới hỗn hợp nước tương lên, rắc mè rang và hành lá lên trên, dùng nóng.\r\n', 'Chọn trái cà dài đều, vừa trái, không sâu héo, da láng mướt. Cà tím dài thơm, mềm và ngon hơn cà tím tròn.', 'Đối tượng sử dụng thực đơn là những người có cơ địa sỏi thận, tiền căn mắc bệnh thận, người có chức năng thận kém dù chưa đến độ suy thận.\r\nKhẩu phần ăn giảm đạm, tăng chất bột đường nên cần ăn làm nhiều bữa trong ngày để tránh nguy cơ tăng đường huyết.\r\nMón ăn cần được áp dụng cùng lúc với thực đơn ngày kèm theo.\r\nNên uống vừa đủ lượng nước lọc khoảng 1-1,5 lít mỗi ngày. Không uống quá nhiều nước, không uống các loại nước rau quả ép, nước luộc rau quả, nước khoáng, hạn chế ăn các loại trái cây khô.', 'resources/img-recipes/1747641141254.png', '2025-05-19 14:52:21'),
('34796f6e-27fe-11f0-b0f6-fc34974bb26c', 'Tim heo nướng ngũ vị', 'resources/img-recipes/1746263320401.jpg', '3', '20 phút', 1, '149', 'Món tim heo nướng ngũ vị thơm nức vị thịt nướng hòa quyện với ngũ vị hương thơm ngon hấp dẫn. Cách chế biến không những làm nổi bật hương vị tự nhiên mà còn mang trải nghiệm ẩm thực phong phú khi kết hợp các nguyên liệu tim heo, hành tím, tỏi xay, đậu bắp, bắp mỹ, sữa đặc và ngũ vị hương tạo nên món ăn đầy màu sắc.\r\n\r\nTim heo: Giàu dinh dưỡng và có kết cấu mềm mại, khi nướng lên sẽ có vị ngọt tự nhiên và hương thơm hấp dẫn.\r\nHành tím và tỏi xay: Mang lại mùi thơm đặc trưng, làm tăng hương vị của món ăn.\r\nĐậu bắp và bắp mỹ: Thêm vào sự đa dạng về kết cấu, độ giòn và vị ngọt tự nhiên.\r\nNgũ vị hương: Gia vị đặc biệt với sự kết hợp của năm hương liệu chính (hồi, quế, đinh hương, hạt tiêu, và bột thì là) sẽ làm nổi bật hương vị đậm đà và độc đáo cho món ăn.\r\nCùng Món Ngon Mỗi Ngày vào bếp thực hiện ngay nào!\r\n\r\n', 'Tim heo cắt đôi làm sạch, cắt lát.\r\nHành tím xay vắt lấy nước.\r\nTỏi xay vắt lấy nước.\r\nĐậu bắp cắt bỏ đầu.\r\nBắp Mỹ bỏ vỏ, làm sạch.\r\nƯớp tim heo với nước hành tím, tỏi, 1m dầu hào, 1m Aji heo, 1M sữa đặc, 1m ngũ vị hương, 1/3m tiêu, 1/2m bột năng, 1M dầu điều.\r\nĐậu bắp cắt xéo 1/2. Bắp Mỹ cắt khoanh dày 3cm. Ướp cả 2 với ít muối, phết ít dầu lên trên.', 'Cho tất cả vào chảo điện nướng đến khi chín.', 'Cho tất cả ra đĩa, dùng nóng. Chấm chung với muối tiêu chanh hoặc nước tương tùy vị.', 'Ướp tim heo với ít bột năng để tim heo không bị khô sau khi nướng.\r\nDùng sữa đặc có đường để tạo vị ngọt và béo cho món ăn.\r\nDùng màu điều để món ăn có màu đẹp mắt.\r\n', 'Món ăn này là một món ăn làm từ phủ tạng động vật, thường được nghĩ là hoàn toàn không được dùng cho người có tỉ lệ mỡ trong cơ thể cao. Thực tế là có một số loại phủ tạng như tim heo, tim bò, mề gà… có thành phần chất béo thấp và thành phần chất đạm cao, có thể sử dụng một cách khéo léo để làm thay đổi khẩu vị cho người thừa cân, béo phì hoặc thừa mỡ. Chú ý là phải lọc bỏ hết phần mỡ tạng bám chung quanh tim trước khi chế biến.\r\nMón ăn này cần áp dụng cùng với thực đơn đã tính toán kèm theo, và đảm bảo ăn vừa đúng lượng thực phẩm trong thực đơn mới phát huy được tác dụng giảm mỡ thừa.\r\nTập luyện kèm theo ít nhất 45 phút mỗi ngày và phải tập hàng ngày.', 'resources/img-recipes/1747382640148.png', '2025-05-03 16:08:40'),
('385e0ec5-32ec-11f0-9152-fc34974bb26c', 'Cá nục kho tóp mỡ', 'resources/img-recipes/1747465058777.png', '4', '30 phút', 1, '196', 'Cá nục chắc thịt- thơm mùi gừng, thấm đều nước kho đậm đà, cay cay nhẹ, ăn cùng tóp mỡ giòn giòn, beo béo, rất đưa cơm. Vị thân quen nhưng ắt hẳn không phải ai cũng làm đúng được. Có ngay công thức cá nục kho tóp mỡ chuẩn chỉ từ đầu bếp chuyên nghiệp mời bạn thử. Chờ gì nữa? Vào bếp ngay cùng Món Ngon Mỗi Ngày nào!', 'Cá nục Làm sạch phần mang và bụng sau đó rửa sạch với nước muối loãng. Mỡ heo cắt hạt lựu vừa. Gừng & hành tím cắt lát.', 'Cho cá nục vào với 1/2m Bột ngọt AJI-NO-MOTO® + 1.5M nước mắm + 1M đường cát + 1M tương ớt + 1/4m tiêu xay\r\n\r\nB1: Chuẩn bị nồi rồi cho dầu ăn vào, sau đó cho 50g mỡ heo vào rang cho vừa vàng rồi vớt ra. Tiếp tục dùng dầu đó cho hành tím và gừng phi cho vàng\r\nB2: Cho với cá đã ướp cùng mỡ heo đã ráng và 2 quả ớt hiểm + 1/2M dầu màu điều và 1 chén nước nóng vào đậy nắp kho nhỏ lửa 15 phút', 'Cho cá ra đĩa cho 1 ít tiêu xay và hành lá cắt nhuyễn lên', '🧑‍🍳Chọn cá to vừa, da ánh kim, mắt trong, mang đỏ, thịt có độ đàn hồi là cá tươi.\r\n\r\n🧑‍🍳Khi kho cá, bạn nên đảo nhẹ tay và không trở cá nhiều lần để cá không bị nát.\r\n\r\n🧑‍🍳Kho cá với gừng để khử mùi tanh và tạo hương vị đặc biệt cho món ăn.', 'Món ăn cần áp dụng cùng với thực đơn đã được tính toán và chế độ tập luyện phù hợp mới có thể giúp xây dựng được khối cơ xương.\r\nKhẩu phần đạm trong thực đơn khá cao, tốt nhất là nên chọn ăn đa dạng chất đạm trong các bữa ăn của một ngày, ví dụ sáng ăn cá, chiều ăn thịt gà… Các thức ăn thực vật như cơm, mì… đều đã cung cấp một phần đạm thực vật cân chiếm khoảng 40% lượng đạm khẩu phần, nên các thức ăn giàu đạm khác trong bữa ăn nên ưu tiên chọn các thức ăn giàu đạm nguồn gốc động vật. .\r\nKhẩu phần ăn giàu đạm có thể giúp xây dựng khối cơ xuong tốt hơn, nhưng nếu không đi kèm theo vận động tích cực, có thể là tăng nguy cơ thải canxi qua đường thận vì lượng Ni tơ trong máu cao. Vì vậy, luôn luôn cần tập luyện các môn vận động cơ bắp tích cực 45-60 phút mỗi ngày và gia tăng vận động trong cuộc sống hàng ngày.', 'resources/img-recipes/1747465058779.png', '2025-05-17 13:57:38'),
('3c5adf20-27fa-11f0-b0f6-fc34974bb26c', 'Canh chua bồn bồn vị thái', 'resources/img-recipes/1746261615631.png', '3', '25 phút', 2, '1500', '...hehe', 'Ướp cá: Cho 1m gia vị nêm sẵn Aji-Quick® Lẩu Thái và 1m nước mắm và 3 trái ớt hiểm đập giập vào ướp trong 5 phút. Sau đó, sơ chế các nguyên liệu: cắt cà chua thành múi cau, cắt thơm thành dẻ quạt, cắt ớt sừng thành lát, rau nêm cắt rối, bồn bồn cắt khúc, cọng to cắt đôi.', 'Cho 2M dầu ăn vào nồi, sau đó cho hành tím vào phi thơm. Tiếp theo, cho thơm vào xào một lúc rồi cho tiếp bồn bồn. Sau đó, thêm 1,5 lít nước nóng, lượng gia vị nêm sẵn Aji-Quick® Lẩu Thái còn lại rồi đun sôi. Cho cá hú vào, đun sôi lại và vớt bọt. Nấu thêm 5 phút cho cá chín, thêm cà chua, sau cùng cho ớt sừng và rau nêm vào.', 'Múc canh ra tô. Chấm cùng nước mắm ớt. Ăn kèm cơm trắng hoặc bún tươi.', 'Cá ướp cùng với ớt hiểm, nước mắm và gia vị nêm sẵn Aji-Quick® Lẩu Thái giúp cá thấm vị và khử mùi cho cá.\r\n\r\nNấu canh với gia vị nêm sẵn Aji-Quick® Lẩu Thái để có vị chua cay đặc trưng\r\n\r\nXào bồn bồn cùng với hành tím giúp tăng mùi thơm đặc trưng cho món ăn.', 'Lời Khuyên của chuyên gia dinh dưỡng\r\n– Khẩu phần ăn giảm mỡ thừa là một phần của chương trình can thiệp giúp giảm khối mỡ thừa. Chương trình này bao gồm 4 phần chính là dinh dưỡng, tập luyện vận động, lối sống, và dùng thuốc khi đủ chỉ định. Vì vậy, cần áp dụng đồng loạt cả chương trình mới đạt được hiệu quả giảm mỡ thừa, chứ không chỉ nhờ vào một thực đơn dinh dưỡng.\r\n– Món ăn cần được áp dụng đồng thời với thực đơn đi kèm theo mới đạt được hiệu quả giảm mỡ thừa.\r\n– Cần phải cân thực phẩm của mỗi bữa ăn để đảm bảo lượng calo thu nhập đúng với khẩu phần giảm mỡ thừa. Cùng một món ăn đó, nếu ăn lượng gấp đôi tức là đã nhập vào cơ thể một năng lượng gấp đôi. Tất cả năng lượng thừa đều sẽ chuyển thành mỡ dự trữ trong cơ thể, dù là năng lượng thừa được cung cấp dưới dạng chất đạm, chất bột hay chất béo.\r\n– Khẩu phần giảm mỡ thừa chỉ giảm năng lượng, chứ không giảm nước. Vì vậy, vẫn phải đảm bảo lượng nước tối thiểu 40ml/kg/ngày.', 'resources/img-recipes/1746261615634.png', '2025-05-03 15:40:15'),
('429293a8-3485-11f0-8af6-fc34974bb26c', 'Mề gà xào cay', 'resources/img-recipes/1747640740060.jpg', '4', '10 phút', 1, '200', 'Mề gà xào cay giòn giòn đậm đà hấp dẫn. Món ăn còn có vị hơi cay và chua nhẹ lạ vị. Màu nâu vàng bắt mắt kết hợp với màu hành lá, ớt giữ được độ tươi cho món ăn. Món mề gà rất bổ dưỡng giúp gan thận khỏe mạnh cho cả gia đình. Cùng vào bếp thực hiện ngay món ăn mới lạ này thôi nào!', 'Trụng sơ mề gà với nước có rượu và gừng, sau đó khứa hình hoa khế.\r\nXốt xào: Pha hỗn hợp sốt gồm 1/3m tiêu, 1m ớt bột, 2m đường, 1M tương ớt, 2M dầu hào, 2M nước tương, và 1,5M Giấm gạo lên men Ajinomoto.', 'Phi 1/2M tỏi với đầu điều cho thơm, sau đó cho mề gà vào đảo đều cho săn mặt, cho hết lượng xốt cùng 1 chén nước nấu với lửa nhỏ trong vòng 5 phút.\r\nSau 5 phút thì mề gà đã chín thì cho hành cắt khúc và ớt sừng cắt lát mỏng vào đảo đều rồi tắt lửa.', 'Dùng nóng với cơm trắng', '💡 Trụng sơ mề gà với nước có rượu và gừng để khử mùi tanh.\r\n\r\n💡 Mề gà khứa hoa khế giúp thấm vị hơn.\r\n\r\n💡 Có thể sử dụng nguyên bộ nội tạng gà nếu người tiêu dùng ko mua được mề.', 'Món ăn này phải được ăn cùng trong toàn bộ thực đơn ngày đã được tính toán thì mới đạt được hiệu quả hỗ trợ cho hoạt động thận khỏe mạnh.\r\nVới người đã có tiền căn bệnh lý trên thận, nên khám theo dõi định kỳ mỗi 6 – 12 tháng để theo dõi chức năng thận và xem xét có tình trạng thiếu máu hay không từ đó mới có thể điều chỉnh khẩu phần ăn.\r\nThở sâu – hít sâu để cung cấp đủ oxy hàng ngày ít nhất 15 phút.\r\nKhông uống các loại nước lá, nước sắc… vì có nguy cơ làm tăng tải thận. Nước lọc là tốt nhất. ', 'resources/img-recipes/1747640740062.png', '2025-05-19 14:45:40'),
('448a5cf6-32ee-11f0-9152-fc34974bb26c', 'Da heo chiên nước mắm', 'resources/img-recipes/1747465938193.jpg', '10', '10 phút', 1, '2300', 'Cách làm món da heo chiên nước mắm phồng to mặn ngọt giòn tan mà không bị chai khi chiên. Màu vàng của miếng da heo kết hợp với màu sắc tự nhiên của các loại rau bắt mắt hấp dẫn ngay cái nhìn đầu tiên. Cùng vào bếp cùng Món Ngon Mỗi Ngày nấu và thưởng thức ngay món ăn mới lạ này ngay nhé!', 'Cho da heo vào nồi, thêm nước ngập mặt, thêm 1m muối, luộc vừa chín tới 5 phút tính từ lúc nước sôi. Vớt ra xả qua nước lạnh, để nguội. Cắt miếng vuông cạnh 3cm.\r\nHành tây cắt múi cau bảng 2cm, hành lá cắt khúc xéo 3cm, ớt sừng cắt hình thoi cạnh 3cm.', 'Cho 200ml dầu vào chảo đun vừa nóng, cho da heo, bột năng vào chiên lửa vừa, thi thoảng đảo đều. Khi da heo chuẩn bị nở phồng, tăng lửa đảo đều nhanh tay, vớt ra để ráo.\r\n\r\nPha nước xốt: phi thơm tỏi băm, cho thêm 4M nước lọc, 1M nước mắm , 1M đường, 1m Aji heo, nấu sệt.\r\n\r\nXào thơm hành tây, ớt, cho da heo đã chiên, nước xốt vào xốc nhanh cho thấm vị, thêm hành lá vào sau cùng', 'Cho da heo vào dĩa, trang trí thêm ngò rí. Dùng chung với cơm/ thức uống có cồn.\r\n\r\n🥛 Bữa phụ tối: Uống kèm sữa ít béo', '✅ Luộc da heo từ nước nguội,thêm muối đậm đà khi luộc để da heo thấm vị bên trong và phồng giòn.\r\n\r\n✅ Chiên da heo lửa nhỏ ban đầu, thêm ít bột năng để hạn chế bắn dầu.\r\n\r\n✅ Luôn giữ da heo ngập dầu trong quá trình chiên để da heo không bị chai.\r\n\r\n', 'Món ăn này cần được áp dụng với thực đơn đính kèm, bao gồm uống đủ lượng sữa theo thực đơn mới giúp đạt được đầy đủ hiệu quả tăng đồng thời chiều cao và cân nặng cho trẻ đang trong độ tuổi dậy thì nhưng có tình trạng suy dinh dưỡng.\r\nCần lưu ý ăn đúng số lượng thực phẩm được sử dụng trong một phần ăn. Ăn tăng thêm hay giảm đi so với khẩu phần đã được tính toán đều có thể gây thiếu hoặc thừa dẫn đến mất cân bằng về dinh dưỡng.\r\nNgoài thực đơn dinh dưỡng, đừng quên việc tập luyện thể dục thể thao hàng ngày 45-60 phút để xây dựng khối cơ xương cho cơ thể.', 'resources/img-recipes/1747465938194.png', '2025-05-17 14:12:18'),
('56125b0c-27fc-11f0-b0f6-fc34974bb26c', 'Miến trộn hải sản', 'resources/img-recipes/1746262517760.png', '4', '15 phút', 2, '300', 'Miến trộn hải sản kết hợp giữa hương vị tươi ngon của hải sản và sự mềm dai của miến. Món ăn này không chỉ ngon mà còn mang lại cảm giác tươi mới nhờ sự kết hợp hài hòa giữa các nguyên liệu.\r\n\r\nSợi miến mềm hòa quyện cùng tôm mực giòn ngọt, thấm đẫm vị chua ngọt thanh nhẹ, điểm thêm chút cay cay của ớt sừng, bùi bùi của đậu phộng và hương thơm từ hành phi, tất cả tạo nên hương vị ngon khó cưỡng đến sợi cuối cùng. Món trộn đơn giản mà cực kỳ hấp dẫn với công thức từ đầu bếp chuyên nghiệp. Đợi gì nữa? Vào bếp cùng Món Ngon Mỗi Ngày để làm ngay món ăn này nhé!', 'Hành tây tím cắt mỏng, ngâm nước đá để giảm hăng. Ớt sừng cắt sợi. Ngò gai 3, lá quế 5 cắt nhỏ. Cà rốt, Cần Tàu cắt sợi nhuyễn.\r\nTôm bóc vỏ, bỏ đầu, chừa đuôi, bỏ chỉ lưng. Mực làm sạch, khứa vảy rồng. Tôm, mực ướp 1m Bột ngọt AJI-NO-MOTO®, 1m Hạt nêm Aji-ngon® Heo, 1/2M giấm, 1/2M tương ớt, để thấm', 'Áp chảo tôm, mực với ít dầu, trút ra để riêng. Tiếp tục xào cần tây, cà rốt, ớt sừng\r\nPha nước trộn: Cho vào máy xay nhuyễn hỗn hợp gồm: 1M nước cốt chanh, 3M nước mắm, 2.5M Giấm gạo lên men Ajinomoto, 2M đường, thêm 1M tỏi, 3 cọng ngò gai, 6 lá quế, 1M tương ớt vào xay nhuyễn mịn.\r\nĐun sôi nước sau đó cho miến vào trụng mềm thì vớt ra ngâm vào chậu nước đá lạnh. Vớt ra để cho ráo nước, trộn đều với 1M dầu tỏi phi', 'Trộn đều xốt cùng miến, các loại rau củ, tôm, mực, rắc 1M đậu phộng rang giã, hành phi, ngò rí và thưởng thức.', '🧑‍🍳 Lá quế và ngò gai thêm vào xốt trộn giúp cho xốt có mùi thơm đặc trưng hơn\r\n\r\n🧑‍🍳 Miến sau khi chần xong nên ngâm vào nước đá để sợi miến tơi, không bết dính\r\n\r\n🧑‍🍳 Dùng giấm gạo lên men Ajinomoto giúp khử tanh và tăng hương vị cho hải sản', 'Món ăn này dành cho những người đang áp dụng chế độ ăn và tập luyện để giảm khối mỡ thừa, bao gồm cả những người có tình trạng gan nhiễm mỡ mức độ nhẹ đến trung bình.\r\nMón ăn cần được áp dụng cùng với thực đơn đi kèm mới đạt mức năng lượng thấp đủ để giảm mỡ thừa của cơ thể\r\nKhẩu phần chất bột trong món ăn là chất bột tinh, ít chất xơ, nên tốt cho việc cung cấp năng lượng sạch để bảo vệ tế bào gan và thần kinh, nhưng sẽ không phù hợp với những người có bệnh lý rối loạn đường huyết đói hoặc người bệnh đái tháo đường.\r\nMón ăn đi kèm nên giàu chất xơ để cân đối khẩu phần năng lượng và các chất không sinh năng lượng.', 'resources/img-recipes/1747382728530.png', '2025-05-03 15:55:17'),
('5a52f386-27ff-11f0-b0f6-fc34974bb26c', 'Gà hấp tứ quý chay', 'resources/img-recipes/1746263813398.jpg', '4', '20 phút', 1, '360', 'Gà hấp tứ quý chay vị đậm đà, vừa ăn, thơm nấm và nước tương. Món ăn lại rất hấp dẫn với màu vàng của da gà chay bóng bẩy kết hợp với màu của các loại nấm, cà rốt, tàu hũ ky,…. Cùng vào bếp với Món Ngon Mỗi Ngày để thực hiện ngay món chay mới hấp dẫn này thôi nào!', 'Tẩm nấm đùi gà qua bột năng, xếp vào lá tàu hủ ky thành hình chữ nhật.\r\nGói nấm lại, gói kín và dán mép bằng bột năng, làm đến khi hết nấm và lá tàu hủ ky (2-3 gói).\r\nÁp chảo những gói nấm đến khi vàng giòn 2 mặt, để nguội.\r\nCắt ngang gói nấm thành từng miếng dày 1-1.5cm (nhìn như miếng thịt gà).\r\n🥣Pha xốt: 1/3m tiêu đen, 1/2m bột ngọt, 2m Hạt nêm Aji-ngon® Nấm, 2m đường, 1m dầu mè, 1M Nước tương “Phú Sĩ”, 1M nước lọc, khuấy tan gia vị', 'Phi thơm hành boa rô, cho các loại rau củ (trừ hành tây) vào xào chung với xốt.\r\nXếp hành tây dưới đĩa oval, xếp miếng gà lên trên, cho các loại rau củ vừa xào xung quanh.\r\nCho đĩa gà vào nồi hấp và hấp 20 phút', 'Lấy đĩa gà ra và trang trí ngò rí, dùng kèm cơm nóng.', '✅ Tẩm bột năng vào nấm để nấm dính chặt hơn.\r\n\r\n✅ Áp chảo tàu hủ ky để có miếng da gà đẹp mắt.\r\n\r\n✅ Xào xốt với nguyên liệu phụ trước để hương vị hài hòa', 'Thực đơn này áp dụng cho người thừa cân – béo phì hoặc có bệnh lý rối loạn chuyển hóa lipid như tăng cholesterol, tăng triglycerid hoặc gan nhiễm mỡ, bệnh lý mạch vành…\r\nMón ăn được áp dụng trong thực đơn đính kèm mới đạt được hiệu quả giảm mỡ mong muốn và duy trì sức khỏe. Lưu ý là ăn đủ các bữa trong ngày với số lượng thực phẩm được tính toán kèm trong thực đơn thì sẽ đạt hiệu quả giảm mỡ thừa tốt hơn việc ăn một bữa nhiều rồi nhịn các bữa còn lại.\r\nNgoài việc tập luyện một môn thể thao hàng ngày, cần phải gia tăng hoạt động bằng cách tăng năng động: làm vườn, tưới cây, làm việc nhà, tập khiêu vũ…', 'resources/img-recipes/1747382761782.png', '2025-05-03 16:16:53'),
('5b315bfd-32ea-11f0-9152-fc34974bb26c', 'Salad mì udon cá hồi xốt mè rang', 'resources/img-recipes/1747464258199.png', '4', '10 phút', 1, '400', 'Salad mì Udon cá hồi xốt mè rang là một món ăn mang hương vị tươi mát, thanh nhẹ nhưng không kém phần đậm đà và bổ dưỡng. Sự kết hợp giữa cá hồi béo ngậy, mì Udon dai mềm và nước xốt mè rang thơm lừng tạo nên một trải nghiệm ẩm thực độc đáo.\r\n\r\nCá hồi màu đỏ cam hấp dẫn, mềm mọng cùng rau củ tươi giòn và mì udon mềm, thấm vị phủ đều lớp xốt mè rang chua nhẹ, béo thơm, lạ miệng, ngon khó cưỡng. Đón xuân mới chắc chắn phải có món mới chiêu đãi cả nhà. Công thức salad thú vị từ đầu bếp chuyên nghiệp vừa dễ làm mà còn ngon hết ý. Vào bếp thử ngay Tết này!', 'Mì udon chần qua nước sôi đến khi sợi mì tách nhau. Vớt ra để ráo, trộn đều với 1M Xốt Mè Rang “Aji-Xốt”\r\nXà lách cắt miếng nhỏ. Cà chua bỏ hạt, cắt hạt lựu.\r\nBắp mỹ: luộc chín, tách lấy hạt. Hành tây cắt lát mỏng chiều ngang, ngâm nước đá cho giòn, để ráo.\r\nCá hồi phi lê cắt lát dày vừa ăn.', 'Áp chảo cá hồi với bơ lạt cho vừa chín, rắc lên ít muối, tiêu.', 'Xếp các loại rau củ lên dĩa, thêm mì udon & cá hồi lên trên, khi ăn rưới 3M xốt mè còn lại lên trên, trộn đều và thưởng thức.', '🧑‍🍳 Rắc gia vị vào cá khi áp chảo để cá hồi không bị ra nước và giữ được vị ngọt.\r\n\r\n🧑‍🍳 Dùng Xốt Mè Rang “Aji-Xốt” để tạo vị chua béo, thơm mùi mè rang.', '– Món ăn này có khẩu phần đạm cao và tổng năng lượng lớn, áp dụng tốt cho người đang tập luyện thể dục thể thao với cường độ trên trung bình.\r\n– Món ăn phải được áp dụng cùng với thực đơn đã được tính toán kèm theo mới có thể đạt được hiệu quả mong muốn.\r\n– Các món ăn trong thực đơn đã được tính toán lượng gia vị để đảm bảo cung cấp đủ các loại chất điện giải theo nhu cầu hàng ngày. Vì vậy, tốt nhất không nên chấm thêm các loại nước chấm, muối ớt, muối tiêu, sốt… trên bàn ăn ngoài khẩu phần đã có trong thực đơn. Khi ăn một lượng muối quá lớn, có thể tăng thải Canxi qua thận và tăng giữ nước trong cơ thể, sẽ ảnh hưởng đến quá trình xây dựng khối cơ xương.\r\n– Cần uống đủ nước cho quá trình tập luyện tích cực. Lượng nước tối thiểu cần cung cấp là 40ml/kg/ngày. Người tập luyện nhiều hơn sẽ cần thêm nước, có thể uống theo phản xạ khát sau khi tập luyện.', 'resources/img-recipes/1747464258209.png', '2025-05-17 13:44:18'),
('5b994271-3487-11f0-8af6-fc34974bb26c', 'Bún ốc', 'resources/img-recipes/1747641641045.jpg', '4', '10 phút', 1, '500', 'Bún ốc là một món ngon cân bằng dưỡng chất, hấp dẫn, thích hợp nhất là vừa ăn Tết xong, mọi người cứ no ngang, hậu quả của việc ăn quá nhiều thịt.\r\n\r\n🐚 Mẹo chọn ốc bươu tươi ngon và sơ chế ốc bươu đúng cách\r\n\r\n🐚 Cách phân biệt ốc bươu đen và ốc bươu vàng rất đơn giản', 'Ốc bươu ngâm nước vo gạo với ớt hiểm đập dập 1 đêm cho nhả hết chất dơ và nhớt, rửa sạch, đập lấy thịt, ướp ốc với 2 trái ớt hiểm băm, 1/2m tiêu, 1m hành tím băm, 1/2m hạt nêm Aji-ngon®, 1/2m bột nghệ và 1/2m mắm tôm.\r\nCà chua bổ hình múi cau. Rau xà lách, tía tô, kinh giới cắt sợi. Đậu hũ chiên cắt miếng vuông. Ngâm 1M ớt khô với nước cho mềm. Hành, ngò gai cắt nhuyễn. Chanh cắt miếng nhỏ. Ớt sừng đập dập.', 'Phi thơm hành tím băm với 1M dầu ăn, cho ốc vào xào sơ với lửa lớn, xào ốc vừa chín tới rồi trút ra dĩa.\r\nCho 1M dầu ăn vào chảo, thêm hành tím vào phi thơm, tắt bếp.\r\n\r\n\r\nChuẩn bị 1 nồi nước dùng đặt trên bếp. Cho cà chua vào xào sơ rồi trút qua nồi nước dùng, thêm đậu hũ, nêm 2M Hạt nêm Aji-ngon®, 1/3M sa tế, 2M Giấm gạo lên men Ajinomoto và ớt khô đã ngâm.\r\n', 'Cho bún, ốc vào tô, chan nước dùng rồi gạn ra lại, cho hành lá và ngò gai vào, chan nước dùng ngập bún. Ăn kèm rau, chanh, ớt sa tế và mắm tôm tùy khẩu vị.\r\n\r\n\r\n', 'Nên rửa ốc với ít muối và giấm để ốc hết nhớt.\r\nƯớp ốc với bột nghệ để khử mùi tanh và tạo màu đẹp.\r\nXào ốc với lửa lớn và nhanh tay để ốc chín giòn và không bị dai.\r\n', 'Đối tượng sử dụng thực đơn là những người có cơ địa sỏi thận, tiền căn mắc bệnh thận, người có chức năng thận kém dù chưa đến độ suy thận.\r\nKhẩu phần ăn giảm đạm, tăng chất bột đường nên cần ăn làm nhiều bữa trong ngày để tránh nguy cơ tăng đường huyết.\r\nMón ăn cần được áp dụng cùng lúc với thực đơn ngày kèm theo.\r\nNên uống vừa đủ lượng nước lọc khoảng 1-1,5 lít mỗi ngày. Không uống quá nhiều nước, không uống các loại nước rau quả ép, nước luộc rau quả, nước khoáng, hạn chế ăn các loại trái cây khô.', 'resources/img-recipes/1747641641046.png', '2025-05-19 15:00:41'),
('5eb93375-32f5-11f0-9152-fc34974bb26c', 'Cá nục kho mía', 'resources/img-recipes/1747468988602.jpg', '4', '30 phút', 1, '1040', 'Cá nục kho mía mang đến một hương vị đậm đà, hài hòa giữa vị ngọt thanh của nước mía, vị mặn của nước mắm, vị cay của ớt, vị thơm của hành, tỏi. Thịt cá nục thấm vị săn, quyện cùng nước kho sánh lại tạo nên sự hấp dẫn khó cưỡng. Cùng Món Ngon Mỗi Ngày vào bếp nấu ngay món cá kho thơm ngon này đảm bảo bắt cơm lắm nhé!\r\n\r\n🐟 Lựa chọn cá nục:\r\n\r\nChọn cá nục tươi, có vảy bám chặt với thân, không có mùi hôi.\r\nHậu môn cá tươi có màu trắng nhạt thụt sâu vào bên trong và bụng cá lép.', '🔪🐟Sơ chế cá nục: Cá làm sạch ruột, cắt bỏ phần mang cá, rửa dưới vòi nước chảy để loại bỏ hết chất nhầy, ngâm cá vào nước muối pha loãng hoặc nước vo gạo khoảng 15 phút để khử mùi tanh. Sau đó rửa lại sạch và để ráo\r\nMía cây bỏ mắt, cắt làm 4 theo chiều dọc.\r\nHành tím lột vỏ, cắt đôi.\r\nHành lá cắt khúc 3cm.\r\nỚt trái khứa xéo.', 'Ướp cá với tất cả gia vị cùng 1m Hạt nêm Aji-ngon® HEO, 1m Bột ngọt AJI-NO-MOTO®, 1m đường, 5M nước mắm, 1M nước màu, đầu hành lá và tỏi băm, để thấm.\r\nXếp 1 lớp mía vào nồi đất, xếp cá lên trên, thêm ớt trái, 1M tương ớt và 2 chén nước vào, kho lửa lớn đến khi nước sôi vớt bọt, sau đó đậy nắp, hạ lửa liu riu.\r\nKho cá 30 phút đến khi cá thấm và mềm, nước sánh cạn, rút mía ra. Cho hành lá, tiêu vào, tắt lửa.', 'Dùng kèm cơm nóng.', '💡Đập dập mía để chất ngọt của mía dễ thấm vào thịt cá khi kho.\r\n\r\n💡Lót mía dưới đáy nồi giúp cá không bị sém đồng thời giúp món cá kho ngon ngọt hơn.', 'Ngoài những người trưởng thành có luyện tập thể dục thể thao mức độ từ trung bình đến nặng; trẻ đang giai đoạn tăng trưởng nhanh của quá trình dậy thì thì thực đơn này cũng có thể áp dụng ngắt quãng, tức là ăn tuần 2-3 ngày cho đối tượng phụ nữ trung niên hoặc phụ nữ sau sinh không cho con bú.\r\nMón ăn được áp dụng trong thực đơn đính kèm mới đạt được hiệu quả xây dựng khối cơ xương mà không làm tăng các nguy cơ dinh dưỡng khác.\r\nKết hợp tập luyện thể dục thể thao để tăng nhịp tim và tăng co giãn cơ theo tỉ lệ thời gian là 1:3, tức là ưu tiên tập luyện căng cơ hơn là tập cardio.', 'resources/img-recipes/1747468988602.png', '2025-05-17 15:03:08'),
('629888f3-27fb-11f0-b0f6-fc34974bb26c', 'Canh bóng nấu thả', 'resources/img-recipes/1746262109289.jpg', '4', '25 phút', 2, '120', 'Công thức nấu món Canh bóng nấu thả món ăn truyền thống của ẩm thực Việt nam vào những ngày lễ tết. Món canh không chỉ thanh mát, tinh tế mà còn thể hiện sự cầu kỳ trong cách chế biến, kết hợp nhiều nguyên liệu tạo nên hương vị hài hòa và hấp dẫn.\r\n\r\nBóng bì mềm dai, thấm vị: Bóng bì được sơ chế cẩn thận để có độ mềm dai vừa phải, khi thả vào canh sẽ hút nước dùng, tạo cảm giác béo nhẹ nhưng không ngán.\r\nRau củ tươi giòn, đẹp mắt: Cà rốt, bông cải trắng, xanh được tỉa hoa hoặc cắt lát tinh tế, giúp món canh thêm phần bắt mắt và tăng độ giòn ngọt tự nhiên.\r\nGiò sống dai mềm: làm cho món canh thêm phần phong phú.\r\nNấm hương dậy mùi thơm: Nấm hương không chỉ giúp tăng thêm độ ngọt mà còn tạo mùi thơm đặc trưng cho món ăn.\r\nCùng Món Ngon Mỗi Ngày vào bếp thực hiện ngay món ăn truyền thống này thôi nào!', 'Bóng bì ngâm mềm, rửa sạch với rượu và gừng.\r\nCà rốt tỉa hoa, cắt lát. Băm nhỏ 1m cà rốt. Bông cải trắng, xanh cắt miếng vừa ăn. Nấm hương cắt đôi (nếu to). Hành lá chần khoảng 6 cọng, cọng ngò rí băm nhỏ, phần còn lại cắt khúc.\r\nGiò sống trộn đều với 1M tiêu xanh đập dập, 1m ngò rí băm và 1m cà rốt băm.', 'Trải miếng bóng bì ra, phết hỗn hợp giò sống lên trên, cuộn chặt tay, sau đó dùng hành lá buộc lại. Nấu trong nước dùng khoảng 5 phút, vớt ra để nguội, cắt lát vừa ăn.\r\nNấu sôi nước dùng gà, cho các loại rau củ và nấu chín, nêm 1m hạt nêm, 1m muối, 1m bột ngọt AJI-NO-MOTO®, 1m đường, cho phàn bóng bì vào nấu sôi lại, nêm 1/2M nước mắm, hành ngò, tiêu, tắt lửa.', 'Múc canh ra tô, dùng nóng.', '🧑‍🍳 Cuộn bóng bì chặt tay, buộc bằng các khoanh hành để dễ định hình.\r\n🧑‍🍳 Sử dụng nấm hương rừng để tạo mùi thơm đặc trưng cho món ăn.\r\n🧑‍🍳 Sơ chế bóng bì với rượu và gừng để khử mùi tanh của bóng bì.\r\n\r\n', 'Món ăn cần được áp dụng đồng thời với thực đơn đi kèm theo mới đạt được hiệu quả giảm mỡ thừa.\r\nMón canh bóng có nguyên liệu đa dạng, cung cấp năng lượng vừa phải nhưng lại có đầy đủ thành phần dinh dưỡng từ các chất vi lượng. Món ăn này có thể dùng cho cả những người thừa cân béo phì có bệnh lý mạn tính. Nên ăn món canh này vào đầu bữa ăn, sẽ tạo cảm giác no tốt hơn.\r\nCác món ăn trong thực đơn giảm mỡ thừa làm từ hải sản cần loại bỏ tất cả phần gạch béo, chỉ ăn phần nạc tinh mới đạt mục tiêu giảm mỡ thừa.\r\nCần ăn chậm, nhai thật kỹ thức ăn rồi mới nuốt nếu đang trong chương trình can thiệp giảm cân và giảm mỡ thừa.\r\nThực đơn giảm mỡ thừa sẽ có mức năng lượng thấp để cơ thể sử dụng mỡ thừa sinh năng lượng. Quá trình này vần cần cung cấp đầy đủ nước và các vitamin tan trong nước. Vì vậy, cần uống đủ lượng nước 40ml/kg/ngày và mỗi tuần nên có 4-5 bữa ăn các loại hạt thô nguyên vỏ, gạo lức, khoai củ thô…', 'resources/img-recipes/1747382792014.png', '2025-05-03 15:48:29'),
('63178aec-27f9-11f0-b0f6-fc34974bb26c', 'Mực nhúng giấm', 'resources/img-recipes/1746261251125.jpg', '4', '15 phút', 1, '200', '...', 'Mực làm sạch, để ráo, khứa ca rô mặt trong, cắt miếng vừa ăn khoảng 4cm.\r\nSả đập dập, cắt khúc. Hành tây cắt sợi. Hành tím cắt lát. Gừng cắt sợi. Tỏi giã nhuyễn. Ngò cắt nhỏ.\r\nXà lách, rau thơm lặt rửa sạch. Dưa leo cắt khúc. Chuối, khế bào mỏng, ngâm nước có pha chanh.', 'Pha nước giấm: nấu sôi hỗn hợp gồm 2 chén nước dừa (2 trái), 1/2 chén giấm gạo lên men “Ajinomoto”, 2m muối, 2.5M đường, 1m bột ngọt AJI-NO-MOTO®, hành tây, gừng sợi, hành tím và sả đập dập, nấu sôi.\r\nPha nước mắm ngò: khuấy tan 3M nước với 2M nước mắm, 1/2M giấm gạo lên men “Ajinomoto”, 1M đường, sau đó cho hỗn hợp giã nhuyễn gồm ớt hiểm xanh 3 trái, cọng ngò rí, ít tỏi vào.', 'Khi ăn ta nấu sôi nước giấm, nhúng mực vào vừa chín, cuốn bánh tráng và rau dưa, chấm nước mắm ngò.\r\n\r\n', 'Chọn mực có da sáng, không lem, bám chặt vào thịt, thịt mực trong, đầu dính chặt vào thân.\r\nNấu nước giấm sôi già mới nhúng mực để mực nhanh chín, giòn, giữ vị ngọt.\r\n\r\n', '– Món ăn cần được ăn cùng với thực đơn đi kèm mới có thể phát huy được tác dụng làm giảm khối mỡ thừa của cơ thể\r\n– Để giảm khối mỡ, luôn cần có ít nhất một giờ tập luyện thể dục thể thao mỗi ngày. Môn tập và cường độ tập luyện sẽ tùy thuộc vào độ tuổi và sức khỏe nền, nhưng nhìn chung, tập luyện để giảm mỡ thừa thường có cường độ tập luyện nặng hơn so với các trường hợp tập luyện thường quy khác\r\n– Cần lưu ý chỉ ăn vừa đủ các loại trái cây ngọt, không uống nước ép trái cây mà chỉ ăn trái cây cả xác hoặc xay sinh tố uống cả xác. Đường fructose trong trái cây là một dạng đường cần được tái chuyển hóa qua gan, nên nếu nạp vào cơ thể quá nhiều có thể làm tăng tải cho gan và làm ta8gn nguy cơ tích mỡ, trong đó có tích mỡ ở gan.', 'resources/img-recipes/1746261251127.png', '2025-05-03 15:34:11'),
('7092869d-27fd-11f0-b0f6-fc34974bb26c', 'Củ năng om nấm chay', 'resources/img-recipes/1746262991731.jpg', '4', '35 phút', 2, '240', 'Món củ năng om nấm chay được làm từ nguyên liệu chính là củ năng, nấm và các nguyên liệu chay khác như đậu hũ, cà rốt, củ cải trắng. Món ăn bắt mắt với nước om hơi sanh sách màu vàng nhạt đặc trưng, các nguyên liệu chín vừa, giòn nhẹ. Khi thưởng thức món ăn thơm mùi sả cà ri, rau củ chín mềm thấm vị, béo thơm đậm đà.\r\n\r\nCùng Món Ngon Mỗi Ngày vào bếp thực hiện ngay món ăn chay mới cho cả nhà thưởng thức nhé!', 'Củ năng gọt vỏ cắt đôi & củ cải trắng rửa sạch cắt móng ngựa 3cm. Sả cây đập dập cắt khúc 4 cm. Hành tây cắt múi cau to. Rau om, ngò gai cắt nhỏ.\r\nCho 2M dầu điều vào chảo cho sả đập dập và boa rô vào phi thơm, cho củ năng, cà rốt, củ cải trắng và đậu phộng vào xào. Thêm 1M bột cà ri hòa nước, 1M hạt nêm Ajingon Nấm, 1/2M đường, 1m bột ngọt Ajiomoto, cho thấm.\r\n', 'Cho tiếp nấm hương vào, thêm nước dão dừa, nấu khoảng 10 phút, cho tiếp đậu hủ, tiêu xanh vào.\r\nNêm gia vị hạt nêm Ajingon Nấm, đường. Nước hơi sanh sánh, cho mộc nhĩ, nấm hương, hành tây, ớt sừng vào, nêm thêm 1/2M nước tương. Nấu lửa nhỏ. Đợi sôi trở lại, cho thêm nước cốt dừa vào. Tắt lửa', 'Múc ra dĩa sâu, rắc rau om ngò gai, ớt, đậu phộng rang, tàu hủ ky chiên lên mặt. Dọn kèm bánh mì, muối ớt chanh', '💡 Xào cho củ năng, củ cải trắng và cà rốt chín 75% mới cho tiếp các nguyên liệu khác để chín đều.\r\n\r\n💡 Cho nước cốt dừa vào sau và không nấu lâu để không bị vón cục.\r\n\r\n💡 Kiểm tra củ năng không bị chua, bên ngoài khong bị nhớt.', 'Khuyến nghị của chuyên gia (dành cho thực đơn hỗ trợ tim mạch cho người có thể trạng thừa cân béo phì)\r\n\r\nNgười có bệnh tim mạch đi kèm với tình trạng thừa cân béo phì thì nguy cơ cao nhất là tình trạng tắc hẹp mạch vành do mảng xơ vữa, vì vậy giảm cân và giảm rối loạn mỡ là can thiệp dinh dưỡng quan trọng nhất để cải thiện nguy cơ của bệnh lý tim mạch.\r\nMón ăn cần đi kèm với thực đơn đã được tính toán thì mới đạt được hiệu quả hỗ trợ tim mạch, giảm cân và giảm rối loạn mỡ đồng thời.\r\nTập luyện thể dục thể thao là phần không thể thiếu, nhưng cần tập nhẹ, không làm tăng nhịp tim và nhịp thở quá nhiều. Thời gian tập luyện trung bình 45-60 phút mỗi ngày và tập 5-6 ngày mỗi tuần. Cần kết hợp với tập thở để cung cấp đủ oxy cho cơ tim.', 'resources/img-recipes/1746262991731.png', '2025-05-03 16:03:11'),
('794d570c-32ed-11f0-9152-fc34974bb26c', 'Cơm giòn tôm kho quẹt', 'resources/img-recipes/1747465597217.webp', '4', '10 phút', 1, '1800', 'Miếng cơm tôm giòn rụm vàng ươm, rau củ vừa chín tới đủ màu sắc, chấm cùng xốt kho quẹt mặn ngọt đậm đà, thơm mùi thịt và tôm khô làm nên một món ăn dân dã mà ngon vét nồi. Biến tấu đơn giản mà cực kỳ vừa miệng, hấp dẫn. Chỉ tích tắc là có món lạ miệng CƠM GIÒN TÔM KHO QUẸT ăn cực ghiền.\r\n\r\n👩‍🍳Vào bếp thử ngay!', 'Tôm bỏ đầu, bóc vỏ, dùng dap đập hơi dập, sau đó cắt hạt lựu.\r\nCơm trộn đều với 100g bột chiên giòn và tôm cắt hạt lựu, sau đó cho vào túi zipper, cán mỏng còn khoảng 2mm, dùng dao cắt cơm thành từng miếng vuông cạnh 4cm rồi cắt xéo thành hình tam giác.\r\nCác loại rau củ cắt miếng vừa ăn, luộc chín trong nước có ít dầu ăn và hạt nêm.\r\n', 'Đun nóng dầu ăn, lần lượt cho cơm vào chiên chín vàng giòn, vớt ra để ráo dầu.', 'Cho kho quẹt ra chén, khi ăn chấm cùng cơm tôm giòn và rau củ.\r\n\r\n🍎 Ăn kèm Tráng miệng: Táo\r\n\r\n🍴Đối tượng: 35 – 45+. Thực đơn hỗ trợ xây dựng khối cơ xương.', 'Chiên cơm lửa vừa để cơm giòn đều và ngon hơn.\r\nCho một ít dầu ăn vào nước luộc rau giúp rau củ có độ bóng & hấp dẫn hơn.\r\nĂn cùng sốt dùng ngay Kho Quẹt chấm cùng rau củ và cơm giòn giúp món ăn hơn, chuẩn vị và tiết kiệm thời gian.\r\nCán trước vài miếng tôm rồi bỏ tủ mát cho dễ cắt.', 'Thực đơn giúp hoạt động trí não hiệu quả\r\nÁp dụng món ăn cùng với thực đơn cả ngày mới đạt được cân bằng dinh dưỡng và hiệu quả gia tăng hoạt động trí não.\r\nNếu là người lao động trí óc nhưng có bệnh lý chuyển hóa đường (rối loạn đường huyết đói, kháng insulin, đái tháo đường…) cần phải được thiết kế thực đơn khác chứ không hoàn toàn sử dụng được khẩu phần này.\r\nGiấc ngủ đêm thật sâu là phần quan trọng nhất để phục hồi hoạt động não ngày hôm sau. Vì vậy nên đi ngủ trước 23 giờ và ngủ liên tục ít nhất 6 giờ trong đêm. Giấc ngủ trưa có thể cần hay không tùy thói quen của từng người.', NULL, '2025-05-17 14:06:37'),
('7a4a2b22-32ef-11f0-9152-fc34974bb26c', 'Lẩu kim chi phô mai', 'resources/img-recipes/1747466457867.jpg', '4', '5', 1, '400', 'Món lẩu kim chi phô mai độc đáo mang hương vị Hàn Quốc. Món lẩu là sự kết hợp hoàn hảo giữa hương vị cay thơm của kim chi và béo béo của phô mai. Màu nước lẩu hấp dẫn với màu cam đỏ, điểm thêm phô mai dai kéo sợi. Vị cay vừa dễ ăn thích hợp trong những ngày trời hơi se lạnh.', 'Cải thảo cắt gốc, rửa sạch lá, để ráo. Nấm kim châm cắt bỏ gốc, rửa sạch, để ráo.\r\nHành boaro: phần cọng trắng cắt mỏng, phần lá cắt nhỏ, để riêng', 'Phi thơm hành boaro với 1m dầu ăn, thêm 1.5L nước vào đun sôi, nêm gói Gia Vị Nêm Sẵn Aji-Quick® Lẩu kim chi vào khuấy đều.\r\nChuẩn bị 1 nồi đất, cho mì, xếp các loại rau, nấm lên trên, thêm thịt các loại, viên thả lẩu (bánh bao hải sản) vào, chan nước lẩu.', 'Đun sôi nồi lẩu, trước khi ăn cho phô mai lên trên, thêm lá boaro cắt sợi, ớt sừng cắt lát, đậy nắp, nấu đến khi phô mai tan chảy là dùng được. Có thể ăn kèm với kim chi.', '💡Cho phô mai vào sau cùng để phô mai tan chảy trên mặt lẩu giúp món ăn hấp dẫn hơn.\r\n\r\n💡Dùng Gia Vị Nêm Sẵn Aji-Quick® Lẩu kim chi để món lẩu có mùi vị kim chi đặc trưng.', 'Món ăn cần ăn kèm với thực đơn được tính toán mới đạt đạt đủ mức độ cân đối khẩu phần cho người cần gia tăng khối cơ xương.\r\nTập luyện thể dục thể thao để tăng khối cơ xương bao gồm tập mạnh để gia tăng nhịp tim trong vòng 15 phút, tập tác động trực tiếp làm tăng co giãn cơ trong 30 phút, và tập thở để tăng cung cấp oxy cho hoạt động chuyển hóa trong 15 phút mỗi lần tập.\r\nKhẩu phần của người tập luyện để tăng cơ xuơng thường có lượng chất đạm cao, nên cần thường xuyên kiểm tra chức năng gan thận trong khi đang áp dụng thực đơn.\r\nKhông giảm thêm khẩu phần chất bột đường trong thực đơn để đảm bảo an toàn cho thận và hạn chế việc sử dụng chất đạm để sinh năng lượng trong cơ thể.', 'resources/img-recipes/1747466457867.png', '2025-05-17 14:20:57'),
('7a71e1bc-322a-11f0-ad72-fc34974bb26c', 'Khoai tây xào thịt bò phô mai', 'resources/img-recipes/1747381847271.png', '4', '25 phút', 1, '300', 'Món Khoai tây xào thịt bò phô mai là sự kết hợp hoàn hảo giữa vị bùi béo của khoai tây, độ mềm ngọt của thịt bò và lớp phô mai kéo sợi thơm lừng.\r\n\r\n🥔 Khoai tây được xào chín tới, vàng nhẹ bên ngoài nhưng vẫn mềm bên trong, thấm gia vị.\r\n🥩 Thịt bò mềm, không bị dai, được ướp đậm đà, xào vừa chín tới để giữ độ ngọt tự nhiên.\r\n🧀 Phô mai tan chảy, béo ngậy, bám đều lên khoai tây và thịt bò, tạo thành một lớp sánh mịn hấp dẫn.\r\n\r\nKhi ăn, bạn sẽ cảm nhận được sự hòa quyện giữa vị béo, mặn, ngọt. Bạn có thể ăn kèm bánh mì hoặc cơm nóng đều rất hợp, đảm bảo đưa cơm và cực kỳ gây nghiện! 😋', 'Khoai tây sau khi cắt vuông cờ rửa sạch để ráo, rắc ít muối và trộn đều với 1M dầu ô liu, cho vào nồi chiên không dầu nướng nhiệt độ 160 trong 15p cho khoai chín vàng', 'Cho 1M dầu ăn vào chảo, đun nóng rồi phi 1M tỏi vàng thơm. Tiếp theo, cho thịt bò xay vào xào săn cho thịt tơi ra. Cho 50g tương cà và 1/2 chén nước vào xào cho thịt chín mềm.\r\n\r\nNêm nếm gia vị gồm: 1m bột ngọt AJI-NO-MOTO®, 1m hạt nêm Aji-ngon® Heo và 1/4m tiêu. Nước sệt lại, cho hết khoai tây vào xóc chung, cho tiếp 1/2 phô mai và cọng ngò băm vào xóc đều. Cho bơ vào xóc đều rồi tắt lửa.', 'Cho khoai ra đĩa rắc thêm phô mai lên cùng với lượng ngò tây còn lại lên trên. Dùng nóng.', '🧑‍🍳 Cho bơ tươi vào sau cùng rồi tắt lửa, xóc đều giúp giữ được mùi thơm của bơ.\r\n🧑‍🍳 Kếp hợp phô mai với thịt bò và khoai tây giúp món ăn có hương vị đặc trưng hơn.', 'Món ăn này có khẩu phần đạm cao và tổng năng lượng lớn, áp dụng tốt cho người đang tập luyện thể dục thể thao với cường độ trung bình đến nặng.\r\nMón ăn phải được áp dụng cùng với thực đơn đã được tính toán kèm theo mới có thể đạt được hiệu quả mong muốn.\r\nKhẩu phần chất đạm cao có thể liên quan đến việc tăng các chất chuyển hóa chứa Ni tơ trong máu. Vì vậy, nếu sử dụng khẩu phần đạm cao liên tục thì nên làm các xét nghiệm chức năng gan thận định kỳ hàng năm, nhất là với những người trên 50 tuổi.\r\nCần uống đủ nước và tập thở đủ để tăng thải các chất chuyển hóa liên quan đến quá trình tổng hợp khối cơ xương. Có thể uống theo phản xạ khát ở người trẻ, nhưng với người lớn tuổi, phản xạ khát đã giảm, nên uống theo chỉ tiêu, tức là uống khoảng 200ml mỗi 2g chứ không nên chờ đến khi có dấu hiệu khát mới uống dồn. Loại nước tốt nhất là nước lọc, cần chiếm đến 60% khẩu phần nước trong ngày. 20% còn lại là sữa và 20% là các loại nước khác.', 'resources/img-recipes/1747382902810.png', '2025-05-16 14:50:47'),
('836230a2-3229-11f0-ad72-fc34974bb26c', 'Cá diêu hồng xiên que chiên lá chanh', 'resources/img-recipes/1747381432773.png', '4', '15 phút', 1, '220', '..', 'Ướp cá với 1M nước chanh, 1M nước hành tỏi, 1m lá chanh băm, 1/3m tiêu trong 5′. Tẩm cá qua 1M gia vị nêm sẵn Aji-Quick® Bột Chiên Giòn, xiên vào que xen kẽ với hành tây.', 'Pha bột còn lại với 130ml nước, nhúng xiên cá vào bột ướt. Đun dầu nóng cho 2M lá chanh cắt sợi vào chiên, tiếp tục xiên cá vào chiên chín vàng đều, đem ra ghim cà bi đứng vào đầu que.\r\nNước sốt: pha 2M xốt Mayonnaise Aji-mayo®- 1M tương ớt', '‘Bày xiên cá chiên ra đĩa, rắc thêm lá chanh chiên. Rưới 1M xốt Mayonnaise Aji-mayo® lên. Ăn kèm xà lách, dưa leo, và nước sốt.\r\n\r\n', 'Ướp nước chanh vào cá giúp thơm và khử mùi\r\nChọn lá chanh Thái không non quá, cũng không già quá (bánh tẻ) thơm, không xơ, ăn được – rất phù hợp cho món này.\r\nCách lấy nước hành tỏi là dùng 1 nắm hành tỏi xay, vắt lấy phần nước. Phần xác giữ lại để dùng món khác.', '– Thực đơn và món ăn trong thực đơn này sử dụng tốt cho những người trưởng thành có tập luyện thể dục thể thao cường độ từ trung bình đến nặng, thanh thiếu niên đang trong giai đoạn tăng trưởng nhanh của dậy thì, và những người có tình trạng suy mòn khối cơ bắp do nguyên nhân bệnh lý hay nguyên nhân dinh dưỡng.\r\n– Các trường hợp không nên áp dụng khẩu phần ăn này: người có tăng acid uric máu, người có bệnh lý sỏi thận, sỏi mật, người có độ lọc cầu thận <90ml/phút.\r\n– Khẩu phần dinh dưỡng giàu chất đạm cần thiết đê cung cấp đủ nguyên liệu cho việc xây dựng khối cơ xương, nhưng đồng thời cũng tăng tải trên gan thận để đáp ứng quá trình chuyển hóa chất đạm. Vì vậy, trước khi áp dụng các chế độ ăn này cần phải kiểm tra chức năng gan, thận… theo dõi định kỳ hàng năm nhất là với người trên 50 tuổi.\r\n– Ngoài việc tập luyện thể dục thể thao thường xuyên, còn cần chú trọng tập thở để cung cấp đủ oxy cho cơ thể.', 'resources/img-recipes/1747382934472.png', '2025-05-16 14:43:52'),
('93bc1fb6-3485-11f0-8af6-fc34974bb26c', 'Bông cải xào nước tương', 'resources/img-recipes/1747640876231.jpg', '4', '10 phút', 1, '200', 'Cách nấu món bông cải xào nước tương với rau củ vừa ăn, giòn giòn lại có vị mặn ngọt, hơi chua nhẹ. Món ăn lại còn hấp dẫn với màu sắc của các loại rau củ, đậm đà khi ăn cùng nước tương.', 'Bông cải trắng cắt miếng vừa ăn.\r\nMăng tây tước vỏ, cắt khúc 5 cm.\r\nThơm cắt lát dày 3 ly.\r\nCà rốt tỉa cắt khoanh dày 2 ly.\r\nNấm đùi gà rửa sạch, cắt lát 3 ly.\r\nSơ chế rau: Chần bông cải, cà rốt và măng tây qua nước sôi.', 'Đun nóng 2M dầu ăn, phi 1M boa rô cắt lát, cho nấm vào đảo đều, cho tiếp các loại rau còn lại vào, nêm 2m đường, 1m hạt nêm AjiNgon nấm, 1M nước tương “Phú Sĩ”. Xào thêm 2 phút cho rau củ chín, thêm lá boa rô cắt sợi, rắc tiêu Tắt lửa.', 'Múc bông cải xào cùng rau củ, nấm ra đĩa. Dọn kèm với nước tương Phú Sĩ và ớt cắt lát.\r\nĂn với cơm.', 'Chần qua bông cải, cà rốt và măng tâu để sau khi xào không bị teo và dai.\r\nBào bỏ lớp vỏ dai bên ngoài của phần gốc của măng tây (phần già) tận dụng được tối đa.\r\nXào lửa to cho rau củ giữ được độ giòn.', 'Lời Khuyên của chuyên gia dinh dưỡng\r\nĐối tượng sử dụng thực đơn là những người có cơ địa sỏi thận, tiền căn mắc bệnh thận, người có chức năng thận kém dù chưa đến độ suy thận.\r\nKhẩu phần ăn giảm đạm, tăng chất bột đường nên cần ăn làm nhiều bữa trong ngày để tránh nguy cơ tăng đường huyết.\r\nMón ăn cần được áp dụng cùng lúc với thực đơn ngày kèm theo.\r\nNên uống vừa đủ lượng nước lọc khoảng 1-1,5 lít mỗi ngày. Không uống quá nhiều nước, không uống các loại nước rau quả ép, nước luộc rau quả, nước khoáng, hạn chế ăn các loại trái cây khô.', 'resources/img-recipes/1747640876232.png', '2025-05-19 14:47:56');
INSERT INTO `recipes` (`id`, `name`, `img_url`, `serving_size`, `cooking_time`, `difficulty`, `calories`, `description`, `preparation`, `instructions`, `usagefood`, `tips`, `expert_advice`, `img_nutrition`, `created_at`) VALUES
('98f76e50-27fe-11f0-b0f6-fc34974bb26c', 'Nghêu kho nước tương', 'resources/img-recipes/1746263488999.jpg', '4', '10 phút', 1, '30', 'Cùng vào bếp với Món Ngon Mỗi Ngày để thực hiện món nghêu kho nước tương kiểu Singapore hương vị đậm đà và hấp dẫn. Cảm giác khi ăn món này là sự pha trộn của nước tương, hòa quyện cùng mùi vị đặc trưng của nghêu.\r\n\r\nMón ăn được cân bằng hoàn hảo với hương vị nước tương đậm đà, mặn ngọt, kết hợp với vị ngọt tự nhiên của nghêu và một chút cay cay từ các gia vị làm cho món ăn trở nên phong phú hương vị. Thịt nghêu mềm dẻo, thấm vị, nước kho sánh sệt mang lại một trải nghiệm ẩm thực tuyệt vời. Nước kho màu nâu, rau nêm giữ được màu sắc biến đổi tự nhiên, món ăn kèm với cơm trắng chắc chắn sẽ hao cơm lắm đây😋.', 'Ướp thịt nghêu với 4M nước tương, 1M đường, 1m Ajinomoto, 1m tiêu.\r\nHành tây cắt muối cau, hành lá cắt khúc 3cm, ớt khô cắt đôi.\r\nCải ngọt cắt nhỏ 2cm\r\n', 'Phi thơm gừng, hành tím băm, tỏi băm, ớt hiểm khô, đầu hành lá. Cho thịt nghêu vào đảo đều đến khi săn lại, thêm 1 chén nước lọc kho đến khi sệt lại. Thêm hành tây cắt múi cau, hành lá cắt khúc, ớt sừng, trộn đều.\r\nLuộc cải ngọt vừa chín, để ráo.', 'Bày thố kho ra bàn dùng chung với cháo trắng và rau cải ngọt luộc.', 'Kho bằng nước tương Phú Sĩ để có mùi vị đặc trưng của Á đông.\r\nSử dụng ớt khô để mùi vị được thơm hơn.\r\nCó thể dùng nghêu tươi luộc gỡ lấy thịt để làm món này.', 'Khuyến nghị của chuyên gia (cho thực đơn giảm mỡ)\r\n\r\nMón ăn này cung cấp nhiều vi khoáng như kẽm, đồng… mà không làm tăng thêm năng lượng khẩu phần, nên không chỉ áp dụng tốt cho người cần giảm mỡ, mà còn có thể sử dụng làm món ăn chính cho những người biếng ăn, thiếu vi khoáng, rụng tóc...\r\nĐể không làm tăng năng lượng trong bữa chính và giảm nguy cơ tổng hợp mỡ dự trữ, nên sử dụng cơm đi kèm là cơm gạo lứt, hoặc cơm gạo trắng có trộn thêm đậu đỗ nguyên vỏ.\r\nCần chú ý ăn đúng lượng thực phẩm đã được tính toán trong thực đơn đính kèm, không ăn nhiều hơn ngay cả với các thực phẩm ít năng lượng như bắp hay trái cây không ngọt.', 'resources/img-recipes/1747382960050.png', '2025-05-03 16:11:29'),
('9e31662c-32eb-11f0-9152-fc34974bb26c', 'Bún giò heo cay', 'resources/img-recipes/1747464800103.png', '4', '25 phút', 1, '400', 'Bún giò heo cay là một món ăn đậm đà, hấp dẫn nhờ sự kết hợp giữa nước dùng cay nồng, giò heo béo mềm và sợi bún trắng dai. Đây là món ăn phù hợp cho những người yêu thích hương vị cay nóng và đậm đà, đặc biệt vào những ngày se lạnh hoặc khi muốn đổi vị.\r\n\r\nMón ăn ngon bởi sự kết hợp từ giò nạc béo mềm thấm đều gia vị, cùng với vị ngọt tôm khô và sợi bún tươi trắng tinh, mềm mại, khi chan nước dùng thấm đều gia vị, tạo nên hương vị tròn trịa trong từng sợi. Cuối cùng là sự thanh mát từ các loại rau ăn kèm tươi ngon.\r\n\r\nCùng vào bếp với Món Ngon Mỗi Ngày để thực hiện ngay món ăn ngon này nhé!', 'Ngâm phai tiết giò heo với nước pha ít muối.\r\nTôm khô ngâm mềm.\r\nSả cây đập giập thắt gút', 'Cho ít dầu vào nồi, cháy vàng thơm đầu hành lá, gắp ra để riêng. Thêm 1.8 lít nước, giò heo, thơm, sả, tôm khô, 1 gói Aji lẩu Thái, nêm 1/2M Hạt nêm Aji-ngon® Heo, 1m bột ngọt Bột ngọt AJI-NO-MOTO®, 1m đường, 3-5 trái ớt hiểm tùy vị, nấu nhỏ lửa đến khi giò chín mềm. Vớt bỏ sả, thơm thêm đầu hành cháy + 1/2M nước mắm vào. Kiểm tra vị vừa ăn.\r\n\r\n', 'Trụng bún nóng cho vào tô, thêm khoanh giò, rau nêm chan nước dùng, dùng nóng chung với rau ăn kèm, mắm ớt.', 'Ngâm phai tiết để giò heo được sạch, thơm.\r\nThêm thơm để giò nhanh mềm và tạo vị ngọt tự nhiên.\r\nDùng Gia vị nêm sẵn Aji-Quick® Lẩu Thái,có mùi vị đặc trưng và màu sắc đẹp mắt.', 'Món ăn có mức năng lượng khá cao nên sẽ phù hợp hơn với những người trẻ, năng động, tập luyện thể dục thể thao hàng ngày, và có trọng lượng cơ thể trên 60kg. Với những người có trọng lượng cơ thể thấp hơn 50kg, khi sử dụng món ăn này với mục đích làm tăng xây dựng khối cơ xương tốt nhất nên ăn khoảng 3/4 khẩu phần được hướng dẫn.\r\nCần áp dụng món ăn kèm theo với thực đơn đã tính toán thì mới đạt được mức cân bằng dinh dưỡng và phát huy tính chất xây dựng khối cơ xương.\r\nKhi tập luyện để tăng khối cơ xương, đừng quên uống đủ lượng nước theo nhu cầu của cơ thể. Tổng lượng nước uống trong ngày thường tương đương với khoảng 2000ml/ngày, nên chia uống làm nhiều lần, mỗi lần 200ml. Chủ yếu uống nước lọc, các loại nước khác không nên vượt quá 200ml mỗi ngày.', 'resources/img-recipes/1747464800114.png', '2025-05-17 13:53:20'),
('a0a25ede-27fa-11f0-b0f6-fc34974bb26c', 'Salad rong biển thanh cua', 'resources/img-recipes/1746261783873.png', '4', '25 phút', 1, '120', '🥗 Món Salad rong biển thanh cua thơm ngon, giòn sần sật với sự kết hợp của các loại rau xà lách, dưa leo, và rong biển tạo cảm giác thanh mát dễ chịu khi ăn. Vị ngọt nhẹ dai mềm của thanh cua đi kèm nước xốt mè rang mayonnaise thơm bùi tuyệt hảo.\r\n\r\nMón salad rất thích hợp cho những ngày nắng nóng, giải nhiệt cơ thể. Hoặc bạn có thể dùng món khai vị cho những bữa tiệc cũng rất thích hợp. Cùng Món Ngon Mỗi Ngày vào bếp thực hiện ngay nhé! 😋', 'Xà lách mỹ, lolo rửa sạch, cắt miếng vừa ăn\r\nCà chua bi cắt đôi\r\nRong biển wakame ngâm nở, để ráo, dưa leo cắt khoanh\r\nThanh cua xé sợi. Hạnh nhân lát rang vàng', 'Trộn đều thanh cua với 3M Bột chiên giòn, búng vài giọt nước, chiên giòn, vớt ra để nguội', 'Xếp xà lách ra dĩa, cho tiếp cà chua và rong biển wakame lên trên\r\nCho tiếp thanh cua và hạnh nhân lát ở trên cùng. Thêm Xốt Mè Rang “Aji-Xốt” lên trên. Dùng làm món khai vị', 'Xé nhỏ thanh cua, sau đó chiên giòn giúp món ăn giòn giòn và thú vị hơn\r\nRong biển ngâm 5p vớt ra để ráo, không nên ngâm lâu sẽ bị bở\r\nDùng Xốt Mè Rang “Aji-Xốt” giúp món salad đậm thơm vị mè và hấp dẫn hơn', 'Món ăn cần được áp dụng đồng thời với thực đơn đi kèm theo mới đạt được hiệu quả giảm mỡ thừa.\r\nCác món salad thường có mức năng lượng thấp và nhiều chất xơ, phù hợp với mục tiêu của các khẩu phần ăn giảm mỡ thừa. Tuy nhiên, cần thận trọng với các loại nước sốt ăn kèm salad. Nếu nước sốt được làm từ dầu, mỡ, bơ, kem nấu ăn, các loại hạt có dầu như đậu phộng, hạt thông… thì năng lượng được cung cấp từ nước sốt có khi còn lớn hơn năng lượng từ món salad. Vì vậy, chỉ nên sử dụng các loại sốt không có năng lượng như nước tương trộn dấm và muối tiêu.\r\nCác món salad làm từ hải sản cần loại bỏ tất cả phần gạch béo, chỉ ăn phần nạc tinh mới đạt mục tiêu giảm mỡ thừa.', 'resources/img-recipes/1746261783876.png', '2025-05-03 15:43:03'),
('a1ff7a6b-3227-11f0-ad72-fc34974bb26c', 'Salad bacon\r\n', 'resources/img-recipes/1747380910621.png', '4', '15 phút', 1, '147', 'Bacon giòn, đậm đà, ăn cùng rau củ thanh mát, xốt mayonnaise chua nhẹ, beo béo, thêm chút cay tê đầu lưỡi từ mù tạt, tiện lợi mà dinh dưỡng. Công thức salad siêu cấp từ đầu bếp chuyên nghiệp. Ăn rau chưa bao giờ ngon đến thế! Thử ngay món Salad bacon cùng Món Ngon Mỗi Ngày ngay nhé!', 'Áp chảo bacon với ít dầu, cắt miếng vừa ăn.\r\nCà chua bi cắt đôi. Hành tây tím cắt sợi, ngâm nước đá. Dưa leo cắt hạt lựu. Đậu peptit pois chần sơ. Húng lủi cắt nhỏ. Xà lách cắt miếng vừa ăn', 'Pha xốt trộn salad: trộn đều 3M xốt Aji-mayo, 1M nước cốt chanh, 1M sữa đặc, 2M sữa tươi, 1M lá húng lủi băm, 1m mù tạt xanh\r\nXếp lá salad bên dưới, lần lượt cho các loại rau củ, húng lủi và bacon, topping xốt lên trên', 'Trộn đều salad và thưởng thức', 'Áp chảo bacon để bacon tươm mỡ, có độ giòn và mùi thơm.\r\nNgâm hành tây tím vào nước đá giúp giảm bớt mùi hăng và có độ giòn.', 'Món ăn cần áp dụng trong thực đơn kèm theo mới cung cấp cân bằng và đầy đủ các chất có vai trò tạo máu.\r\nCác chất dinh dưỡng liên quan đến tạo hồng cầu như sắt, vitamin B12, đạm thiết yếu, béo thiết yếu… thường khó bị phá hủy bởi nhiệt độ và thời gian chế biến, nên có thể được giữ nguyên cả trong thực phẩm khô, thực phẩm chế biến. Dù vậy, một số vitamin tan trong nước như vitamin B9 có thể bị ảnh hưởng khi sử dụng lò vi sóng để hâm hoặc nấu thức ăn, cần tránh sử dụng lò vi sóng với các món ăn trong thực đơn “bổ máu”\r\nThực phẩm trong thực đơn có thể có một số thực phẩm có lượng chất béo tự nhiên hay chất béo trong quá trình chế biến cao. Nên chú ý loại bỏ bớt chất béo (ví dụ bỏ các phần mỡ của bacon, giảm lượng chất béo như dầu hay bơ khi chế biến nước sốt…) với những người có tình trạng dinh dưỡng thừa cân hay béo phì.', 'resources/img-recipes/1747380910622.png', '2025-05-16 14:30:25'),
('a72a97c8-322b-11f0-ad72-fc34974bb26c', 'Salad mực chiên', 'resources/img-recipes/1747382351796.png', '4', '25 phút', 1, '250', 'Món Salad mực chiên giòn rụm, tươi mát hấp dẫn với sự kết hợp hoàn hảo của các nguyên liệu: mực ống, bông cải, đậu bi, bắp hạt, lá quế, bơ trong một công thức biến tấu mới, mang lại trải nghiệm hương vị độc đáo cho bạn ngay khi ăn miếng đầu tiên. Món salad này có đầy đủ vị giòn, béo, thơm và thanh mát, cực kỳ thích hợp để thưởng thức trong những bữa ăn nhẹ hoặc làm món khai vị hấp dẫn.\r\n\r\n🦑 Mực chiên giòn rụm, thơm lừng: Mực ống tươi, được tẩm bột chiên giòn, bên ngoài vàng rụm, bên trong lại dai ngọt, tạo cảm giác thích thú khi thưởng thức.\r\n\r\n🥦 Rau củ tươi mát, giòn ngon: Bông cải xanh, bông cải trắng và đậu bi (đậu Hà Lan) và bắp hạt giúp món salad vừa có độ giòn tự nhiên, vừa cung cấp nhiều vitamin, tạo sự cân bằng hoàn hảo với mực chiên.\r\n\r\n🌿 Hương thơm đặc trưng từ lá quế: Một chút lá quế giúp tăng hương vị, tạo cảm giác the mát nhẹ nhàng, giúp món ăn không bị đơn điệu.\r\n\r\n🥑 Vị béo mịn của bơ giúp làm dịu độ giòn của mực, tạo nên sự hòa quyện tinh tế. Kết hợp với nước xốt được pha rất thơm ngon dịu ngọt hài hòa.\r\n\r\nCùng Món Ngon Mỗi Ngày vào bếp thực hiện ngay món ăn thơm ngon này nhé! 😋', 'Mực ống làm sạch, cắt sợi cạnh 1.2cm, ướp 1 ít tiêu, để thấm.\r\nĐậu bi và bắp đông lạnh, chần sơ.\r\nTrộn đều các loại rau củ.', 'Múc ra 1M gia vị nêm sẵn Aji-Quick® Bột chiên giòn tẩm với mực, phần còn lại pha với 120ml nước đá lạnh.\r\nĐun nóng dầu ăn, chiên lá quế trước. Sau đó, lần lượt cho mực vào chiên, dùng tay búng hỗn hợp bột đã pha nước lên mực để tạo gai giòn, đảo mực và tiếp tục búng bột để tạo gai. chiên đến khi mực chín vàng giòn vớt ra để ráo dầu.\r\nBông cải xanh/ trắng rửa sạch, tách miếng vừa ăn, chần sơ, sau đó áp chảo với bơ và 1 ít muối, tiêu.\r\n🥣Pha xốt: trộn đều 1M giấm gạo lên men “Ajinomoto”, 1M xốt Mayonnaise Aji-mayo® Vị Ngọt Dịu, 1M sữa chua, 2m mù tạt vàng, 1m sữa đặc và 1 ít tiêu, trộn đều', 'Xếp mực chiên lên salad. Khi ăn trộn đều với xốt.', '🧑‍🍳 Pha bột với nước đá giúp bột giòn hơn khi chiên.\r\n🧑‍🍳 Áp chảo bông cải với bơ, giúp bông cải thơm, thấm gia vị.\r\n🧑‍🍳 Nên búng bột dứt khoác để tạo gai giòn, đẹp mắt.', 'Món ăn cần được áp dụng đồng thời với thực đơn đi kèm và phối hợp với tập luyện thể dục thể thao tối thiểu ở mức độ trung bình thì mới đạt được hiệu quả tăng cường xây dựng khối cơ xương.\r\nKhẩu phần ăn để tăng xây dựng khối cơ xương thường có khẩu phần đạm cao hơn và khẩu phần bột đường ít hơn so với khẩu phần ăn của người bình thường. Vì vậy, khẩu phần này không phù hợp với những người có bệnh lý bẩm sinh ở thận, những người thận yếu, những trường hợp tiều đường hay cao huyết áp đã có ảnh hưởng trên thận.\r\nCần hạn chế tất cả các loại đường đơn giản như bánh kẹo, nước giải khát có vị ngọt, mật ong thậm chí các loại trái cây ngọt cũng cần hạn chế số lượng. Cũng có thể dùng một số chất tạo ngọt nhân tạo để thay thế đường, nhưng phải lưu ý số lượng an toàn được sử dụng hàng ngày. Với những người trên 50 tuổi, tốt nhất không nên dùng chất tạo ngọt nhân tạo.', 'resources/img-recipes/1747382351800.png', '2025-05-16 14:59:11'),
('accffb24-32ea-11f0-9152-fc34974bb26c', 'Gỏi gà giòn', 'resources/img-recipes/1747464395144.png', '4', '20 phút', 1, '280', 'Rau củ tươi giòn nhiều màu sắc bắt mắt, kết hợp với những miếng gà chiên vỏ giòn thịt ngọt, tất cả thấm đều xốt gỏi chua cay hài hòa, hấp dẫn không thể bỏ qua. Món ăn kèm bánh phồng tôm hoặc cơm cháy càng làm tăng độ ngon hơn nữa.\r\n\r\nCuối năm làm món này đảm bảo tiệc nào mà không xôm, ai mà không thích. Thử ngay món gỏi gà giòn nào!', 'Hành tây cắt mỏng, ướp đá, vớt ra để ráo.\r\nDưa leo bỏ hạt, cắt lát vừa ăn. Cà rốt bào sợi. Bắp cải tím cắt sợi, rửa sạch, để ráo. Trộn đều các loại rau với nhau', 'Đun nóng dầu ăn, chiên lá quế nguyên. Tẩm gà qua Aji Quick Bột Tẩm Khô Chiên Giòn, đem chiên chín vàng, vớt ra để ráo dầu, để nguội, cắt lát vừa ăn.\r\nPha nước trộn gỏi: nấu tan hỗn hợp 1/2 chén nước, 2M Aji Quick Lẩu Thái, 1M đường để nguội, thêm 1m tỏi băm nhuyễn.', 'Xếp gà chiên lên salad, topping xốt trộn lên trên. Khi ăn trộn đều, ăn kèm bánh phồng tôm', '🧑‍🍳 Chiên gà với AjiQuick Bột tẩm khô chiên giòn để món ăn giòn ngon và vị đậm đà hơn\r\n\r\n🧑‍🍳 Dùng Gia Vị Nêm Sẵn Aji-Quick Lẩu Thái để pha xốt trộn cho vị chua cay đặc trưng, làm món trộn hấp dẫn hơn', 'Món ăn cần được áp dụng đồng thời với thực đơn đi kèm và phối hợp với tập luyện thể dục thể thao tương xứng thì mới đạt được hiệu quả tăng cường xây dựng khối cơ xương.\r\n\r\nKhẩu phần ăn trung bình để tăng cường xây dựng khối cơ xương thường có lượng chất bột đường ít hơn người bình thường. Các thực phẩm giàu bột nên dùng là các dạng bột lỏng, ít năng lượng như: bún, phở… hoặc các thực phẩm dạng thô như gạo lứt, bánh mì đen, bánh mì ngũ cốc…\r\n\r\nNếu muốn tăng cường chất xơ, nên ăn thêm các loại rau, trái… vào các bữa phụ. Khẩu phần rau trong các bữa chính không nên quá 160g/bữa để tránh tình trạng giảm hấp thu các chất dinh dưỡng không sinh năng lượng như các vitamin và chất khoáng.\r\n\r\nCần có chế độ tập luyện luân phiên để tăng cường đồng bộ giữa xương, cơ bắp ngoại vi, cơ tim, các cơ chức năng của các cơ quan bên trong như tim phổi thận, và tăng cường cả hồng huyết cầu. Nếu chỉ tập luyện để tăng duy nhất khối cơ, sẽ tăng tải lên xương và các cơ quan nội tạng khác.', 'resources/img-recipes/1747464395147.png', '2025-05-17 13:46:35'),
('afd085d1-3486-11f0-8af6-fc34974bb26c', 'Phở gà', 'resources/img-recipes/1747641352838.jpg', '4', '180 phút', 1, '500', 'Là một món ăn đặc sắc phổ biến với tất cả người Việt Nam, nổi tiếng trên toàn thế giới, rất ngon và bổ dưỡng.', 'Xương gà, xương heo rửa sạch, chần qua nước sôi rồi rửa lại bằng nước lạnh. Ướp thịt gà với 1 ít muối, tiêu, bột ngọt AJI-NO-MOTO® và nước mắm.\r\nNướng sơ qua gừng, hành tím và rễ ngò. Bọc gừng, hành tím, rễ ngò trong 1 miếng vải mùng, buộc lại.\r\nCho xương vào nồi với 5 lít nước lạnh, đun sôi rồi giảm lửa, hớt bọt kỹ. Thêm cần tây, boaro, gừng, hành tím, rễ ngò đã nướng. Nấu nhỏ lửa khoảng 2 – 3h sau đó lọc lấy 3 lít nước dùng.\r\nHành lá cắt lấy đầu trắng, trụng qua nước sôi, phần lá cắt nhỏ. Hành tây cắt lát mỏng. Lá chanh rửa sạch, cắt sợi nhỏ. Ngò gai rửa sạch, để ráo.', 'Nấu sôi nước dùng, nêm 2M muối hột, 1M nước mắm, 1m hạt nêm Aji-ngon®, 20g đường phèn và 2m bột ngọt AJI-NO-MOTO®.\r\nThịt gà rửa sạch, cho vào nồi nước dùng luộc chín, vớt ra ngâm vào thau nước đá rồi lọc lấy thịt xé sợi.', 'Khi ăn nhúng bánh phở vào nước nóng, vẩy ráo rồi cho vào tô. Xếp thịt gà, hành lá, hành tây, ngò gai và lá chanh lên trên. Chan nước dùng đang sôi vào tô phở, dọn kèm nước mắm nguyên chất, ớt cắt lát và chanh, ăn nóng.\r\n', 'Nêm muối hột và đường phèn để nước dùng ngọt thanh.', 'Đối tượng sử dụng thực đơn là những người có cơ địa sỏi thận, tiền căn mắc bệnh thận, người có chức năng thận kém dù chưa đến độ suy thận.\r\nKhẩu phần ăn giảm đạm, tăng chất bột đường nên cần ăn làm nhiều bữa trong ngày để tránh nguy cơ tăng đường huyết.\r\nMón ăn cần được áp dụng cùng lúc với thực đơn ngày kèm theo.\r\nNên uống vừa đủ lượng nước lọc khoảng 1-1,5 lít mỗi ngày. Không uống quá nhiều nước, không uống các loại nước rau quả ép, nước luộc rau quả, nước khoáng, hạn chế ăn các loại trái cây khô.', 'resources/img-recipes/1747641352839.png', '2025-05-19 14:55:52'),
('b87b67af-3228-11f0-ad72-fc34974bb26c', 'Cá nướng chấm muối ớt xanh', 'resources/img-recipes/1747381092361.png', '4', '40 ', 2, '200', '...', 'Cá khứa vài đường xéo song song trên cá. Cải xanh rửa sạch, cắt bỏ cọng lấy phần lá.\r\nHành tây cắt mỏng, ngâm nước đá, vớt ra để ráo. Ớt chuông xanh lạng bỏ ruột, ớt sừng đỏ bỏ hột cắt khúc ngắn 3cm.\r\nGiã 3 trái ớt xiêm xanh với ớt sừng cắt khúc, 5 tép tỏi cho nhuyễn, cho vào cá, ướp thêm 1m hạt nêm Aji-ngon®, 1m bột ngọt AJI-NO-MOTO®, 1m dầu điều, 1M tương ớt vào thịt cá để thấm 10 phút.\r\nPha xốt muối ớt xanh: 1/2M đường, 1/2m muối, 2 trái ớt xiêm xanh còn lại, 1M ớt chuông xanh, 1/2m bột ngọt AJI-NO-MOTO®, 1M nước cốt chanh, 2M sữa đặc xay mịn bằng máy xay.', 'Bọc cá trong 1 lớp giấy nến để cố định rồi bọc thêm giấy bạc, cho cá vào lò nướng 220 độ, nướng 20 – 25 phút cho cá chín.', 'Cho cá ra đĩa, trải lá cải xanh ra, cho thịt cá, hành tây, cà rốt ngâm chua vào, cuộn lại, chấm với xốt muối ớt xanh.', 'Sử dụng ớt chuông xanh để tăng màu sắc cho muối ớt và giảm độ cay của ớt xiêm.\r\n\r\nNên nướng bằng lò than, cá sẽ thơm hơn.', '– Thực đơn này có thể áp dụng cho người trưởng thành không có bệnh lý đường tiêu hóa nhưng muốn duy trì một hệ tiêu hóa khỏe mạnh.\r\n– Những trường hợp có bệnh lý trên đường tiêu hóa, vẫn có thể dùng món ăn này, nhưng không chấm muối ớt xanh. Những người bị táo bón mạn tính có thể tăng cường thêm 1 bữa phụ với các loại thực phẩm nhiều xơ hòa tan như sữa tươi giảm béo pha với hạt chia, hạt é, sương sâm, sương sáo…\r\n– Các bữa ăn chính cần ăn đúng giờ, cách xa giờ đi ngủ chừng 60-90 phút.\r\n– Cần chú trọng đến việc cân bàng cuộc sống, giảm các yếu tố gây stress, ngủ đủ giấc trong đêm.', NULL, '2025-05-16 14:38:12'),
('c3dfb511-32ee-11f0-9152-fc34974bb26c', 'Cá basa fillet chiên trứng', 'resources/img-recipes/1747466151824.jpg', '4', '15 phút', 1, '1200', 'Cá basa fillet chiên trứng bên trong mềm, ngọt, bên ngoài giòn nhẹ, không ngấm dầu.\r\nMàu vàng của lớp bột bên ngoài cá, màu xanh của hành ngò, màu đỏ của cà chua hấp dẫn.\r\nMón cá chiên còn thơm mùi ngò rí, hành lá ăn kèm, vị vừa ăn.\r\n\r\n✅ Món cá basa rất dinh dưỡng giúp hỗ trợ xây dựng khối xương vững chắc.', 'Cá basa fillet rã đông, rửa sạch với nước muối loãng, thấm ráo nước, cắt miếng khoảng 60g.\r\nHành lá băm nhuyễn, phần gốc, lá để riêng\r\nƯớp cá 15 phút với đầu hành lá băm nhỏ, 1m Hạt nêm Aji-ngon® HEO, 1m nước cốt chanh. Xốc đều.\r\nXốt trứng: Cho 2 quả trứng, 1/2m tiêu, 1m Hạt nêm Aji-ngon® HEO, 2M bột mì đa dụng, ngò rí, hành lá cắt nhỏ, khuấy đều hỗn hợp, để 10 phút cho bột nở.', 'Làm nóng dầu, nhúng đều cá qua hỗn hợp xốt trứng, chiên ở lửa vừa đến khi vàng đều.', 'Cho cá ra dĩa có giấy thấm dầu, trang trí thêm cà chua cắt lát, ngò rí. Ăn kèm Xốt Mayonnaise Aji-mayo® Vị Nguyên Bản.', '💡 Áp chảo cá ở lửa vừa để cá không bị ngấm dầu.\r\n\r\n💡 Ướp cá với nước cốt chanh để cá không bị tanh và giòn hơn.', 'Món ăn có lượng đạm cao, phù hợp với những người cần xây dựng khối cơ xương như trẻ trong độ tuổi dậy thì, người bị teo cơ sau một đợt bệnh cấp tính hay mạn tính.\r\nMón ăn cần được áp dụng cùng lúc với thực đơn ngày kèm theo và nên ăn vào bữa trưa.\r\nCần ăn đủ lượng chất bột trong bữa ăn cùng với món ăn nhiều đạm, vì các tế bào sẽ ưu tiên tạo năng lượng từ chất bột đường, chất đạm sẽ được dùng làm nguyên liệu tạo khối cơ xương khi tập luyện thể dục thể thao tích cực.\r\nNgoài khẩu phần ăn đúng và tập luyện đủ, những người muốn xây dựng khối cơ xương cần phải ngủ đủ giấc trong đêm, đặc biệt là giai đoạn 0 giờ đến 4 giờ', 'resources/img-recipes/1747466151825.png', '2025-05-17 14:15:51'),
('c540df55-27fc-11f0-b0f6-fc34974bb26c', 'Canh bầu mồng tơi', 'resources/img-recipes/1746262704303.png', '4', '20 phút', 2, '120', 'Canh bầu mồng tơi là một món ăn dân dã nhưng lại rất được yêu thích trong bữa cơm gia đình Việt Nam. Sự kết hợp giữa hai loại rau bầu và mồng tơi mang đến hương vị thanh mát, ngọt lành, thích hợp trong những ngày hè oi bức hoặc khi bạn muốn một bữa ăn nhẹ nhàng và bổ dưỡng.\r\n\r\nTrứng bùi béo thấm vị, bầu chín tới ngọt lừ, nước dùng thì đậm đà, thơm mùi mắm ruốc, dậy chút the cay từ ớt và gừng, trứng vịt lộn vừa bổ dưỡng lại hài hòa khó cưỡng. Một món canh quen thuộc nhưng giờ lại cực kì hấp dẫn với công thức từ đầu bếp chuyên nghiệp.\r\n\r\nChờ chi nữa? Thử ngay thôi!', 'Trứng lộn luộc chín rồi đập ra chén. Bầu gọt vỏ, bỏ ruột thái lát mỏng dày 0,5cm. Rau mồng tơi thái rối. Hành lá cắt khúc dài 2cm. Ớt hiểm thái vát. Gừng tươi thái sợi. Hành tím cắt lát mỏng. Rau răm thái rối', 'Nấu canh: Phi thơm hành tím với 1M dầu ăn sau đó cho 2m mắm ruốc vào xào thơm rồi cho 1.2 lít nước vào đun sôi rồi cho bầu và rau mồng tơi đảo đều, hạ nhỏ lửa rồi nêm với 2m Hạt nêm Aji-ngon® Heo, 1m Bột ngọt AJI-NO-MOTO®, 1/2m đường. Tiếp đó cho trứng vịt lộn, gừng, ớt hiểm, hành lá, rau răm vào đun thêm khoảng 1 phút rồi tắt bếp', 'Múc canh ra bát, trang trí thêm rau răm, gừng và ớt lên trên', '🧑‍🍳 Luộc trứng lộn trong nước có ít muối, bột ngọt để trứng thấm vị\r\n\r\n🧑‍🍳 Phi thơm mắm ruốc với hành tím giúp khử mùi và tạo hương thơm đặc trưng cho món ăn', 'Món ăn này cần được áp dụng cùng với trong thực đơn ngày được cung cấp kèm theo mới đảm bảo được tổng khẩu phần phù hợp với mục tiêu giảm mỡ thừa của cơ thể.\r\nTrong chế độ ăn giảm mỡ thừa, cần lưu ý cắt giảm các thực phẩm có vị ngọt ngay cả với các thực phẩm ngọt từ tự nhiên như trái cây ngọt, mật ong… Đừng quên, các chất ngọt luôn chứa đường đơn giản, và tất cả mọi dạng đường đơn giản đều có thể làm tăng chuyển hóa theo hướng chuyển đường thành mỡ.\r\nVận động và tập luyện có thể giúp sử dụng các loại đường đơn giản, nên nếu muốn giảm nguy cơ tổng hợp mỡ thừa từ đường đơn giản, thì chỉ nên ăn các thực phẩm ngọt trước và trong khi tập luyện thể dục thể thao.', NULL, '2025-05-03 15:58:24'),
('d49c1153-3485-11f0-8af6-fc34974bb26c', 'Pancake chocolate trái cây nhiệt đới', 'resources/img-recipes/1747640985075.jpg', '4', '20 phút', 1, '250', 'Lát bánh xốp mềm, quyện sốt caramel thơm lừng; kết hợp cùng trái cây tươi chua chua ngọt ngọt. Đảm bảo chỉ muốn ăn mãi thôi.', 'Táo bỏ vỏ,cắt vuông 1cm.\r\nKiwi bỏ vỏ,cắt vuông 1cm.\r\nDâu cắt đôi.\r\nCho 35ml nước vào 75g bột pancake, khuấy đều đến khi hỗn hợp mịn.', 'Nướng bánh theo hướng dẫn trong bao bì.\r\nLàm caramel: cho 10g đường, 1m nước lọc thắng tan chảy, đến khi hỗn hợp có màu nâu nhạt, tắt bếp cho từ từ 15ml whipping cream khuấy đều. Sau đó cho thêm 15g bơ lạnh & 1m rượu Rum tiếp tực khuấy tan đều.', 'Phết caramel lên mặt bánh pancake, xếp lần lượt bánh chồng lên nhau. Cho trái cây lên mặt bánh cuối cùng, rưới xốt caramel đều trên mặt trái cây.', 'Thắng caramel ở lửa nhỏ.\r\nChọn loại trái cây ít đường, vị chua nhẹ mix sẽ hài hòa hơn.', 'Đối tượng sử dụng thực đơn là những người làm công việc lao động trí óc, học sinh trong mùa thi, người có các biểu hiện của tình trạng giảm hoạt động trí não như nhức đầu, mệt mỏi, buồn ngủ…\r\nKhẩu phần ăn giảm năng lượng chung và giảm béo, tăng chất bột đường và các vitamin tan trong nước.\r\nMón ăn cần được áp dụng cùng lúc với thực đơn ngày kèm theo, không ăn nhiều hơn lượng đã được tính toán tránh nguy cơ tăng cân và tăng khối mỡ.\r\nMỗi ngày cần tập luyện các môn thể dục tốc độ nhanh như chạy bộ, bơi lội trong 45-60 phút và cần thêm 10-15 phút hít thở sâu.\r\nGiấc ngủ sâu trong đêm rất quan trọng, cần ngủ sớm trước 22g và ngủ đủ trên 6 giờ mỗi đêm.', 'resources/img-recipes/1747640985075.png', '2025-05-19 14:49:45'),
('d7081b0d-27fd-11f0-b0f6-fc34974bb26c', 'Tôm sú kho lá quế', 'resources/img-recipes/1746263163629.jpg', '4', '20 phút', 1, '118', 'Mùa mưa mà được ngồi bên mâm cơm thưởng thức món cơm trắng nóng hổi với tôm kho thì còn gì tuyệt với bằng. Tôm sú thấm vị nước kho, thịt tôm chắc mặn ngọt đậm đà, rất thơm mùi lá quế, nước kho sánh sệt chan vào cơm ăn ngon hết biết.\r\n\r\nLá quế không chỉ mang lại mùi thơm dễ chịu mà còn giúp tăng thêm hương vị cho món ăn, làm cho tôm sú trở nên ngon miệng hơn. Món này không chỉ ngon mà còn rất bổ dưỡng, cung cấp nhiều protein và các dưỡng chất cần thiết.\r\n\r\nCùng Món Ngon Mỗi Ngày vào bếp thực hiện ngay món Tôm sú kho lá quế nhé!', 'Tôm sú xẻ dọc sống lưng lấy chỉ đen. Cắt bỏ phần đuôi nhọn.\r\nLá quế cắt sợi một nửa. Hành tím, tỏi và ớt hiểm đập dập.\r\nƯớp tôm với 1.5m bột ngọt AJI-NO-MOTO®, 2M nước mắm, 1/2M tiêu, trộn đều. Thêm hành tỏi, ớt hiểm đập dập, phần lá quế cắt sợi vào trộn đều.', 'Cho 2M dầu điều, 1M đường vào chảo, thắng caramel. Cho tôm vào xào săn, thêm 2M nước và kho đến khi thịt tôm săn lại, thấm đều gia vị, nước kho sệt lại. Rắc lá quế tươi lên mặt. Tắt lửa.\r\n\r\n', 'Rắc đậu phộng rang lên mặt. Dùng nóng với cơm trắng, rau sống.', '💡 Xẻ dọc, sâu vào lưng tôm để tôm thấm gia vị và khi kho tôm nở bung trông đẹp mắt hơn.\r\n\r\n💡 Ướp trước lá quế thái sợi sẽ giúp thịt tôm ngấm mùi lá quế hơn, tạo nên hương vị đặc trưng cho món ăn.', 'Tập luyện thể dục thể thao là phần không thể thiếu khi muốn giảm mỡ. Thời gian tập tối thiểu cần là 60 phút mỗi ngày và 6-7 ngày mỗi tuần.\r\nĐể tránh tăng tổng hợp mỡ, nên ăn nhiều bữa trong ngày, mỗi bữa một ít sẽ tốt hơn ăn dồn vào một bữa và nhịn các bữa còn lại.\r\nSố lượng thực phẩm trong mỗi bữa ăn quyết định việc giảm mỡ nhiều hơn là loại thực phẩm dùng trong bữa ăn. Về nguyên tắc, nên ăn đa dạng thực phẩm, chế biến thật đơn giản, và chỉ ăn đúng lượng thực phẩm đã được tính toán trong thực đơn.\r\nThận trọng với các loại nước uống có đường và những loại hạt có dầu. Năng lượng từ các thức ăn uống vặt này thường lớn hơn nhiều so với ước lượng của bạn.', 'resources/img-recipes/1747382575432.png', '2025-05-03 16:06:03'),
('dda64acf-32ed-11f0-9152-fc34974bb26c', 'Thịt bò chiên trộn cải mầm', 'resources/img-recipes/1747465765571.jpg', '4', '5 phút', 1, '1078', 'Thịt bò chiên trộn cải mầm mềm, chín tới, rau củ giòn nhiều màu sắc hấp dẫn. Món ăn có vị thơm ngọt từ thịt bò, vị vừa ăn, kết hợp với rau củ tươi mát thích hợp cho các món khai vị hay ăn giải nhiệt vào mùa nắng nóng.\r\n\r\nCùng vào bếp với Món Ngon Mỗi Ngày để làm ngay món trộn cải mầm mới cho cả nhà thưởng thức thôi nào!', 'Mài vỏ chanh lấy 1m. Các loại rau củ cắt quả trám. Thịt bò ướp với 1/2M tỏi băm, 1m Nước tương “Phú Sĩ” GIẢM MUỐI.', 'Tẩm Gia vị nêm sẵn Aji-Quick® BỘT TẨM KHÔ CHIÊN GIÒN vào thịt bò cho đều. Bắc chảo cho dầu đun nóng cho thịt bò vào chiên nhanh. Vớt ra cho lên giấy thấm dầu.\r\n👩‍🍳 Xào rau củ: cho 1M dầu + 1,5m bơ đun nóng cho lần lượt các loại rau củ xào lửa to nhanh tay. Nêm gia vị: 1/3m tiêu, 1/2m Hạt nêm Aji-ngon® HEO, 1/2m đường, 1m + 1M Nước tương “Phú Sĩ” GIẢM MUỐI, 2M giấm. Tắt lửa, trộn vỏ chanh mài vào.\r\n', 'Bày rau mầm ra đĩa, để rau xào và thịt bò chiên lên trên, bày ngò rí, tiệu, rắc mè rang. Khi ăn chấm Nước tương “Phú Sĩ” GIẢM MUỐI+ ớt cắt lát.', '✅ Chiên thịt bò với lửa to vừa chín tới để thịt giữ được nước ngọt và không bị dai.\r\n\r\n✅ Thêm vỏ chanh mài tạo hương vị đặc biệt cho món ăn.\r\n\r\n✅ Xào rau củ với lửa lớn và nhanh để rau củ giữ được độ giòn', 'Thực đơn được tính toán đi kèm món ăn này có mức năng lượng khá cao nên phù hợp cho người có tình trạng dinh dưỡng bình thường đến thiếu dinh dưỡng nhẹ. Những người có tình trạng thừa cân béo phì đặc biệt là nữ giới sau 40 tuổi cần tính toán lại lượng thức ăn trong mỗi bữa.\r\nMón ăn có lượng đạm cao nên phù hợp với những người đang cần xây dựng khối cơ xương đồng thời cung cấp nguyên liệu tạo hồng cầu như trẻ trong độ tuổi dậy thì, người tập luyện thể dục nhiều >1 giờ mỗi ngày.\r\nCải mầm trong món ăn giàu kali, cũng là một thành phần chất dinh dưỡng cần thiết cho người tập luyện nhiều.\r\nMón ăn này không được dùng cho người có tiềm năng hoặc đang mắc bệnh gout (thống phong).', 'resources/img-recipes/1747465765572.png', '2025-05-17 14:09:25'),
('de07e551-322a-11f0-ad72-fc34974bb26c', 'Cà tím cuộn thịt chiên', 'resources/img-recipes/1747382014351.jpg', '4', '35 phút', 1, '260', 'Món Cà tím cuộn thịt chiên là một sự kết hợp hài hòa giữa vị béo ngậy của thịt, vị ngọt mềm của cà tím và lớp vỏ giòn rụm hấp dẫn. Khi cắn vào, bạn sẽ cảm nhận được sự giòn tan bên ngoài, sau đó là phần cà tím chín mềm, thấm gia vị, ôm lấy lớp nhân thịt, giò đậm đà bên trong.\r\n\r\nMón ăn thơm ngon hơn khi chấm với nước sốt pha mayonnaise kích thích vị giác, đảm bảo đưa cơm và cực kỳ bắt miệng! 😋', 'Hành lá: đầu hành đập giập băm nhuyễn, phần lá cắt nhỏ, cho vào tô thịt, thêm giò sống, 1/2m gừng băm, củ năng băm, 1/2m bột ngọt AJI-NO-MOTO®, 1/2m hạt nêm Aji-ngon® Heo, 1/2m đường, 1/4m tiêu, 1/4m muối, 1/2m nước mắm, 1m bột năng, quết đến khi dẻo.\r\nPhết nhân thịt lên từng miếng cà tím, cuộn tròn lại, ghim cố định, cho vào tủ đông làm lạnh.\r\nGia vị nêm sẵn Aji-Quick® Bột chiên giòn: pha bột theo hướng dẫn trên bao bì.', 'Nhúng cà tím cuộn thịt vào hỗn hợp gia vị nêm sẵn Aji-Quick® Bột chiên giòn đã pha.\r\nChiên ngập dầu cà tím với lửa vừa, đến khi vàng giòn. Vớt ra để ráo.\r\n🥣Xốt chấm: Trộn đều 1M xốt Mayonnaise Aji-mayo® Phiên bản ít béo, trứng, dưa chuột muối, 1M tương ớt.', 'Cho cà tím ra dĩa, ăn kèm nước chấm xốt Mayonnaise Aji-mayo®.', '🧑‍🍳 Cho bột năng vào nhân, để nhân được dẻ chặt.\r\n🧑‍🍳 Giữ lạnh cuộn cà tím, để dễ nhúng vào bột hơn.\r\n\r\n', 'Thực đơn này áp dụng cho nam giới, trong độ tuổi trưởng thành (25-50 tuổi), có tình trạng dinh dưỡng ở mức trung bình, có tập luyện thể dục thể thao hàng ngày 45-60 phút, hoặc thiếu niên nam trong độ tuổi dậy thì.\r\nMón ăn cần được áp dụng đồng thời với thực đơn đi kèm và phối hợp với tập luyện thể dục thể thao tương xứng thì mới đạt được hiệu quả tăng cường xây dựng khối cơ xương.\r\nDo khẩu phần dinh dưỡng cần phải giảm các loại đường đơn giản, nên cần phải loại trừ các thực phẩm hoặc nước uống có vị ngọt. Không uống nước ép trái cây, mà nên ăn cả xác, ngay cả với trái cây không ngọt. Cũng có thể xay sinh tố trái cây với sữa không béo không đường để uống vào các bữa phụ.\r\nBất kỳ chất đạm nào cũng tốt cho việc xây dựng khối cơ xương, vì vậy, nên ăn đa dạng chất đạm, chứ không chỉ tập trung vào các chất đạm nhiều nạc.', 'resources/img-recipes/1747382606875.png', '2025-05-16 14:53:34'),
('de508421-27f9-11f0-b0f6-fc34974bb26c', 'Salad táo phô mai', 'resources/img-recipes/1746261457860.png', '4', '20 phút', 1, '130', '...', '– Pha nước trộn salad: Trộn đều 2M giấm táo lên men “Ajinomoto”, 1M nước, 1.5M đường, 1/3m tiêu và 1/3m muối, thêm 1m dầu mè trắng.\r\n– Táo đỏ cắt miếng vừa ăn, rưới 1M nước trộn salad rồi trộn đều.\r\n– Xà lách các loại rửa sạch, cắt miếng vừa ăn. Dưa leo bỏ ruột cắt lát mỏng. Radish cắt mỏng, ngâm nước, để ráo.', '– Bacon áp chảo với 1m dầu ăn, để nguội cắt miếng vừa ăn.\r\n– Chừa ra 2M nước trộn salad và rưới phần còn lại lên rau củ đã để lạnh, trộn đều\r\n', '– Xếp các loại rau củ ra dĩa, topping bacon lên, rưới 2M nước trộn salad lên trên và trộn đều.\r\n\r\n', 'Phô mai Parmesan có vị chua, béo, đậm nên phù hợp khi làm salad.\r\n\r\nCắt táo rồi trộn với nước trộn salad giúp táo giữ được vitamin và không bị thâm.\r\n\r\nDùng giấm táo lên men “Ajinomoto” để món ăn thơm mùi táo đặc trưng và có vị chua thanh.', '– Thực đơn giảm mỡ thừa thường có khẩu phần năng lượng thấp, phù hợp với người thừa cân béo phì không có bệnh lý mạn tính. Các trường hợp tình trạng dinh dưỡng bình thường và suy dinh dưỡng không được áp dụng thực đơn này.\r\n– Món ăn cần được áp dụng đồng thời với thực đơn đi kèm theo mới đạt được hiệu quả giảm mỡ thừa.\r\n– Cần phải chuẩn bị các thực phẩm ăn độn để ăn thêm trong trường hợp cảm thấy đói khi chưa đến bữa ăn chính. Các thực phẩm độn thông dụng nhất là: cuốn rau (không dùng bánh tráng), canh rau hay súp rau (nấu với nước dùng trong đã vớt bỏ mỡ), 1 cái lòng trắng trứng gà luộc, 200ml sữa tươi không béo không đường pha với 100ml hạt chia hay hạt é đã ngâm nở.\r\n– Lưu ý: các dạng thức ăn có năng lượng như ngũ cốc nhiều xơ, khoai củ, bánh giảm năng lượng… đều không phải là thức ăn độn, mà là thức ăn thay thế, tức là dùng để thay thế cho các thức ăn thông thường.', 'resources/img-recipes/1746261457861.png', '2025-05-03 15:37:37'),
('e18091a7-32e9-11f0-9152-fc34974bb26c', 'Bánh mì xíu mại', 'resources/img-recipes/1747464054043.jpg', '4', '25 phút', 2, '298', 'Bánh mì xíu mại hấp dẫn với sự kết hợp hoàn hảo giữa bánh mì giòn và viên xíu mại mềm ngọt, ngập trong sốt đậm đà. Đây là món ăn sáng phổ biến, dễ ăn và cực kỳ ngon miệng.\r\n\r\nMón ăn có hương vị đặc biệt từ viên xíu mại được làm từ thịt băm nhuyễn kết hợp với giò sống, trứng và các loại rau củ tạo nên độ ngọt tự nhiên, mềm mịn khi ăn. Nước sốt cà chua đậm đà, chua nhẹ thơm ngọt nước dùng, tất cả kết hợp với bánh mì nóng giòn thơm ngon ăn kèm các loại rau để tăng thêm phần tươi mát, cân bằng hương vị.\r\n\r\nCùng Món Ngon Mỗi Ngày vào bếp thực hiện ngay món ăn này thôi nào!', 'Củ sắn gọt vỏ, cắt sợi, luộc chín rồi vớt ra để nguội, sau đó vắt ráo nước, cắt ngắn.\r\nHành lá cắt nhỏ, đầu hành lá đập dập, băm nhỏ.\r\nCà chua bỏ hạt, băm nhuyễn.\r\n', 'Trộn thịt nạc dăm xay và giò sống với củ sắn, 2m cọng ngò rí băm, 2M hành tây băm, hành phi, đầu hành, hành lá, trứng gà và 1M bột năng. Nêm 1/2m muối, 1m đường, 1m hạt nêm Aji-ngon® Heo, 1m nước tương “Phú Sĩ” và 1/2m tiêu, trộn đều, quết dẻo, rồi cho vào tủ lạnh 15p. Sau đó lấy ra vo viên tròn vừa ăn (cỡ trái tắc) rồi cho vào xửng hấp 10p từ lúc nước sôi.\r\nLàm xốt: Phi thơm đầu hành lá, 1M hành tây băm bằng dầu điều, cho cà chua băm vào xào chín, thêm 2M ketchup, 1 chén nước, nêm 1/2m hạt nêm Aji-ngon® Heo, 1/2m đường, 1/2m muối, 1m nước tương “Phú Sĩ”, nấu nhỏ lửa cho cà chua chín nhừ, cho xíu mại đã hấp vào hỗn hợp xốt nấu trong vòng 5 phút, thêm 1m bột năng hòa nước và 1/2m dầu mè.', 'Cho xíu mại ra từng phần nhỏ, trang trí với ít ngò. Dùng chung với bánh mì, dưa leo, ngò rí, ớt sừng, khi ăn chấm với nước tương “Phú Sĩ”.', '🧑‍🍳 Ướp hành tím phi vào nhân xíu mại giúp xíu mại thơm ngon và hấp dẫn hơn.\r\n🧑‍🍳 Lấy phần nước hấp xíu mại làm xốt giúp xốt ngọt, thơm hơn.\r\n🧑‍🍳 Thêm nước tương và dầu mè để tạo hương vị đặc trưng cho viên xíu mại.\r\n\r\n', 'Món ăn này có thành phần dinh dưỡng cân đối, nên có thể áp dụng cho cả khẩu phần ăn cho người bình thường không cần tập luyện tích cực.\r\nMón ăn này cần được áp dụng cùng với thực đơn đính kèm mới phát huy được tác dụng xây dựng khối cơ xương.\r\nĐể xây dựng khối cơ, cần có sự tập luyện kéo giãn các khối cơ gắng sức, vì vậy, ngoài việc tập luyện để nâng cao thể lực, nâng cao hoạt động của tim phổi, cần các động tác tập luyện bằng tạ nhỏ thật chậm và tác động lên từng khối cơ một.\r\nĐể xây dựng khối xương, tập luyện sẽ chú trọng vào các động tác kéo giãn và nén ép đầu xương xen kẽ nhau. Các môn thể thao có tác dụng kéo giãn trục cơ thể sẽ có hiệu quả tốt hơn các môn cử tạ đè lên trục cơ thể hoặc các môn có sự phát triển khối cơ quá nhiều.', 'resources/img-recipes/1747464054045.png', '2025-05-17 13:40:54'),
('e32fb110-3229-11f0-ad72-fc34974bb26c', 'Gà nướng nồi đất', 'resources/img-recipes/1747381593499.jpg', '4', '35 phút', 1, '200', '..', 'Đập dập tiêu xanh, sả, hành tím và ớt hiểm.\r\nĐùi gà rửa sạch, khứa hai bên mặt đùi gà, ướp 1m Hạt nêm Aji-ngon® Heo, 1m đường, 1/4m ngũ vị hương , 1M Nước tương “Phú Sĩ” giảm muối, để thấm.', 'Chiên vàng 2 mặt đùi gà để riêng, tiếp tục xào xén mặt hành tím, thêm tiêu xanh và ớt vào xào thơm.\r\nLót sả dưới đáy nồi đất, xếp đùi gà lên trên, cho các thành phần còn lại và lá chanh/lá chúc lên trên cùng, đem nướng ở nhiệt độ 180°C trong 20 phút. Nướng lửa nhỏ trong 10 phút.', 'Bày gà nướng nồi đất ra bàn dùng kèm cơm. Chấm thêm xốt phô mai cay “Aji xốt”.', 'Khứa đùi gà khi ướp để thịt gà thấm gia vị và mau chín.\r\nNướng gà trong nồi đất, gà sẽ chín mềm ngọt thịt và không bị khô.', '– Món ăn này cần áp dụng đồng thời với thực đơn đã được hướng dẫn thì mới có tác dụng xây dựng khối cơ xương\r\n– Để lượng chất đạm trong khẩu phần có thể đạt được mục tiêu là dùng để xây dựng khối cơ xương chứ không dùng để sinh năng lượng, cần thiết phải ăn đủ lượng chất bột đường để sử dụng làm năng lượng cho các tế bào trong cơ thể, dành toàn bộ chất đạm cho việc xây dựng cấu trúc cơ thể. Khi ăn không đủ lượng chất bột đường, một phần chất đạm ăn vào sẽ được sử dụng để sinh năng lượng hoạt động, lúc đó sẽ làm tăng các chất chuyển hóa có ni tơ (amoniac, ure, creatinin…) trong máu, làm tăng tải cho gan, thận và hệ thống chuyển hóa trong các tế bào, chưa kể quá trình tăng thải các chất chuyển hóa này quá nước tiểu có thể kéo theo sự mất mát nhiều dạng chất khoáng trong đó có Canxi, tức là làm tăng nguy cơ mất xương, ngày cả khi khối cơ có vẻ tăng lên.\r\n\r\n ', 'resources/img-recipes/1747381593501.png', '2025-05-16 14:46:33'),
('e3b7d128-3226-11f0-ad72-fc34974bb26c', 'Lẩu cá thác lác khổ qua', 'resources/img-recipes/1747380305900.jpg', '4', '20 phút', 1, '120', '...', 'Cho xương heo và 2 củ hành tím đập dập vào nồi nấu lấy 1.2 lít nước dùng.\r\nKhổ qua bỏ ruột, rửa sạch, bào mỏng. Cà rốt tỉa hoa, cắt lát. Hành lá, ngò rí cắt khúc, đầu hành lá băm nhỏ. Các loại nấm rửa sạch.\r\nƯớp cá với 1M đầu hành lá, 1.5m hạt nêm Aji-ngon® giảm muối, 1M cọng thì là băm, một ít tiêu và một ít dầu ăn, quết cá thật dẻo sau đó vo thành viên vừa ăn.\r\n', 'Đun sôi 1.2 lít nước dùng, cho viên cá vào nấu chín, cho cà rốt vào nêm 1/2m muối, 1.5m bột ngọt AJI-NO-MOTO®, 1M Hạt nêm Aji-ngon® giảm muối, 1m đường, 1M nước mắm tắt lửa, rắc 1 ít tiêu.\r\n\r\n', 'Xếp khổ qua, hành lá, ngò rí và các loại nấm ra dĩa. Đặt nồi nước dùng lên bếp, khi ăn cho các loại rau nấm vào. Ăn kèm với bún, chấm nước mắm và ớt cắt lát.\r\n\r\n', 'Cho viên cá vào nước dùng đang sôi để viên cá nhanh chín và dai hơn.\r\nSử dụng hạt nêm Aji-ngon® giảm muối để món ăn vẫn giữ được độ ngon nhưng lành mạnh hơn.', '– Món ăn này cần ăn trong thực đơn đã được tính toán mới có thể phát huy tác dung hỗ trợ tim mạch.\r\n– Với người có bệnh lý tim mạch mạn tính, có thể áp dụng thực đơn này nhưng lưu ý hạn chế tối đa lượng muối sử dụng trong nêm nếm hoặc không chấm thêm các loại nước chấm trên bàn ăn\r\n– Món ăn này cũng có thể sử dụng tốt cho người có bệnh lý tiểu đường, rối loạn lipid máu, thừa cân béo phì\r\n– Đừng quên tập luyện thể dục thể thao hàng ngày để làm tăng sức khỏe tim mạch. Nguyên tắc tập luyện là tập nhẹ, kéo dài thời gian tập, tập tăng co cơ nhưng không làm tăng nhịp tim quá 140 lần/phút, và luôn có 10 phút tập thở sâu sau khi đã tập các môn khác.', 'resources/img-recipes/1747380305901.png', '2025-05-16 14:25:05'),
('e7c9817a-27fb-11f0-b0f6-fc34974bb26c', 'Đậu hủ kho nấm rơm', 'resources/img-recipes/1746262332747.jpg', '4', '20 phút', 2, '50', 'Đậu hủ kho nấm rơm là một món ăn thơm ngon, đậm đà và rất đưa cơm. Hương vị của món này có sự kết hợp hài hòa giữa vị béo mềm của đậu hủ, vị ngọt tự nhiên của nấm rơm và nước kho đậm đà thấm vào từng miếng đậu. Khi ăn, bạn sẽ cảm nhận được độ dai giòn nhẹ của nấm rơm, vị mặn ngọt vừa phải từ nước tương và một chút cay nhẹ nếu thêm ớt.\r\n\r\nMón này không chỉ ngon mà còn tốt cho sức khỏe, giàu protein thực vật và ít dầu mỡ rất thích hợp cho người muốn giảm cân, giảm lượng mỡ trong cơ thể. Khi dùng kèm với cơm nóng, dưa leo hoặc rau luộc, hương vị sẽ càng thêm trọn vẹn. Nếu thích, bạn có thể thêm một ít tiêu hoặc rau ngò để tăng thêm hương thơm.\r\n\r\n', 'Nấm rơm cắt bỏ gốc, ngâm trong nước vo gạo hoặc nước pha 1/2m bột năng. Vớt ra, để ráo, cắt đầu nấm rơm hình chữ thập.\r\nCắt đậu hủ thành khối vuông vừa ăn. Hành Poa-rô cắt lát xéo. Ớt cắt sợi.', 'Phi thơm hành Poa-rô, tiếp đến cho nấm rơm vào xào chung. Nêm 1m đường, 1/3m tiêu, 1m Bột ngọt AJI-NO-MOTO®, 1/2m hạt nêm Nấm, 3M Nước tương Phú Sĩ, 1M tương ớt. Giảm lửa, cho thêm 1/2 chén nước dừa và cho toàn bộ đậu hủ vô. Kho đến khi nước rút xuống, thêm hành boaro lá và ớt cắt sợi', 'Trình bày đậu hũ kho nấm rơm ra dĩa, dùng với cơm trắng.', '🧑‍🍳 Ngâm nấm vào nước gạo hoặc nước pha chút bột năng sẽ giúp cho nấm sạch và trắng.\r\n\r\n🧑‍🍳 Kho lửa liu riu để nguyên liệu thấm đều vị.\r\n\r\n🧑‍🍳 Lựa nấm rơm búp có màu trắng hay đen tự nhiên để phù hợp với món kho.', 'Món ăn này áp dụng cho người thừa cân, béo phì, có tỉ lệ mỡ cơ thể cao.\r\nMón ăn phải được áp dụng cùng với thực đơn đã được tính toán kèm theo mới có thể đạt được hiệu quả giảm khối mỡ thừa trong cơ thể.\r\nKhối mỡ trong cơ thể được gọi là “thừa” khi tổng khối mỡ vượt quá trọng lượng mỡ cần thiết cân đối với các khối khác của cơ thể. Có nghĩa là một số người có tổng trọng lượng cơ thể không cao, dáng cũng có vẻ gầy gầy, nhưng tỉ lệ khối mỡ trong cơ thể lớn hơn khối nạc, khối xương và khối nước, vẫn được tính là người có mỡ thừa, chứ không phải chỉ người thừa cân béo phì mới có nguy cơ thừa mỡ.\r\nĐể xác định trọng lượng khối mỡ và tỉ lệ mỡ trong cơ thể, cần được đo phân tích thành phần cơ thể bằng máy kháng trở sinh học, chứ không thể khám thông thường. Vì vậy, trong kiểm tra sức khỏe tổng quát hàng năm, nên có hạng mục đo thành phần cơ thể.', 'resources/img-recipes/1747382503356.png', '2025-05-03 15:52:12'),
('ea016ec0-32eb-11f0-9152-fc34974bb26c', 'Cánh gà rim hạt đác', 'resources/img-recipes/1747464927309.png', '4', '20 phút', 1, '120', 'Thịt gà mềm thơm thấm vị, lẫn chút chua nhẹ của chanh dây, ăn cùng hạt đác mềm dẻo, chan chút nước xốt đậm đà, xứng danh chiến thần bắt cơm! Nguyên liệu quen thuộc nhưng biến tấu ngon cực đã với công thức độc quyền từ đầu bếp chuyên nghiệp! Cùng vào bếp làm ngay món cánh gà rim hạt đác để cả nhà cùng thưởng thức nhé!', 'Chần hạt đác qua nước sôi, 5 phút, vớt ra để ráo.\r\nƯớp gà 20 phút với 1m hành tím băm, 1m tỏi băm, 1M nước mắm, 1M Aji- Thịt Kho, 1M đường, 1/2m tiêu xay.', 'Phi thơm hành tỏi băm còn lại, cho cánh gà vào đảo đều đến khi săn, thêm hạt đác, nước và hạt chanh dây, 100ml nước lọc và phần Aji Thịt Kho còn lại. Rim đến khi sệt lại. Thêm hành lá cắt khúc, đảo đều.', 'Cho cánh gà lên dĩa, rưới xốt, hạt đác, hành lá lên mặt', 'Không ngâm, rửa đác bằng nước muối, chanh, giấm vì đác sẽ bị mặn, hoặc chua', 'Món ăn cần được áp dụng chung với thực đơn đi kèm mới phát huy được tính năng hỗ trợ hệ tiêu hóa. Người phù hợp với thực đơn này là người có mức vận động thể lực cao, tuổi trẻ <45 tuổi và không có các bệnh lý liên quan đến gan, thận, tủy xương, nội tiết.\r\nThực đơn có thành phần bữa ăn cung cấp đầy đủ các vi khoáng và chất dinh dưỡng tạo hồng cầu bên cạnh việc xây dựng khối cơ xương, nên rất thích hợp cho đối tượng thiếu niên nam giới trong độ tuổi dậy thì. Ngoài thực đơn ăn uống thích hợp, đừng quên uống đủ sữa trong giai đoạn dậy thì.\r\nVận động thể lục kèm theo thực đơn có tác dụng giúp cơ thể xây dựng khối cơ xương một cách tích cực. Vì vậy, những ngày không tập luyện, cần phải giảm bớt thực đơn, tránh tình trạng dư thừa năng lượng có thể làm tăng khối mỡ nhiều hơn khối cơ xương.', 'resources/img-recipes/1747464927311.png', '2025-05-17 13:55:27'),
('eba06a26-3486-11f0-8af6-fc34974bb26c', 'Canh bí đao nấu sườn non', 'resources/img-recipes/1747641453187.png', '4', '40 phút', 1, '65', 'Một món ăn thân quen hàng ngày và dễ làm, canh bí đao phù hợp với thời tiết nóng vì bí có tính hàn giúp làm mát cơ thể.', ' Bí đao gọt vỏ, chẻ làm tư, cắt bớt ruột rồi cắt thành miếng dày khoảng 1cm.\r\n Sườn non chặt khúc dài 2cm, ướp với 1m hạt nêm Aji-ngon® và 1/2m tiêu và 1 ít hành tím đập dập, băm nhỏ, để thấm 15 phút.\r\n Hành lá, ngò rí rửa sạch, rễ ngò rửa sạch và nước vo gạo hoặc nước có bột và đầu hành đạp dập, để riêng, lá hành và ngò cắt nhỏ.', ' Đun sôi 1 lít nước, cho sườn non, rễ ngò vào, đợi sôi lại, giảm nhỏ lửa hầm xương khoảng 15 phút cho ra chất ngọt. Cho bí đao vào nấu đến khi bí vừa chín tới, nêm 1,5M hạt nêm Aji-ngon®, nếm vị vừa ăn rồi tắt bếp.', ' Múc canh bí ra tô, rắc hành lá, ngò rí và tiêu lên, dùng nóng với cơm..', ' Bí đao chọn bí già sẽ ngọt hơn, nên cắt bỏ bớt ruột bí để khi nấu xong canh không bị chua.\r\n Đầu hành và rễ ngò cho vào nước hầm xương sẽ thơm hơn.', 'Đối tượng sử dụng thực đơn là những người có cơ địa sỏi thận, tiền căn mắc bệnh thận, người có chức năng thận kém dù chưa đến độ suy thận.\r\nKhẩu phần ăn giảm đạm, tăng chất bột đường nên cần ăn làm nhiều bữa trong ngày để tránh nguy cơ tăng đường huyết.\r\nMón ăn cần được áp dụng cùng lúc với thực đơn ngày kèm theo.\r\nNên uống vừa đủ lượng nước lọc khoảng 1-1,5 lít mỗi ngày. Không uống quá nhiều nước, không uống các loại nước rau quả ép, nước luộc rau quả, nước khoáng, hạn chế ăn các loại trái cây khô.\r\n', 'resources/img-recipes/1747641453187.png', '2025-05-19 14:57:33'),
('f45dfde0-27fe-11f0-b0f6-fc34974bb26c', 'Salad rong nho xốt mè rang', 'resources/img-recipes/1746263642343.jpg', '4', '10 phút', 1, '500', 'Khi thưởng thức món Salad rong nho xốt mè rang, bạn sẽ cảm nhận được sự hòa quyện của các hương vị rong nho mọng nước, béo béo từ sốt mè rang, và giòn giòn từ rau salad. Màu sắc đẹp mắt hấp dẫn hài hòa từ các loại rau củ, vàng nhạt của xốt và trứng.\r\n\r\nMau vào bếp làm ngay món ăn salad để giảm cân và chế đệ ăn kiêng phù hợp cùng Món Ngon Mỗi Ngày nhé!', 'Xà lách rửa sạch, cắt miếng vừa ăn. Rong nho ngâm nước lạnh 2-3 phút (không quá lâu), vớt ra để ráo.\r\nTrứng luộc chín, bóc vỏ, cắt lát.\r\nBắp cải tím bào sợi mỏng. Cà chua bi cắt đôi. Dưa leo rửa sạch, bào sơ vỏ, cắt đôi, sau đó cắt lát mỏng. Lá quế cắt khúc vừa ăn.\r\n', 'Trộn đều các loại xà lách, cà chua, dưa leo, bắp cải tím, lá quế, xếp trứng và rong nho lên trên.', 'Khi ăn rưới Xốt mè rang “Aji-Xốt” lên trên, trộn đều và thưởng thức', '💡Bảo quản rau củ trong tủ mát trước khi trộn giúp món salad tươi ngon và giòn hơn.\r\n\r\n💡Sử dụng Xốt mè rang “Aji-Xốt” giúp món salad thơm ngon, tròn vị.', 'Món ăn này có thể sử dụng trong bữa chính như một món rau ăn kèm, dùng trong bữa phụ cách bữa ăn chính buổi tối khoảng 1 tiếng cho những người hoặc có bệnh lý rối loạn chuyển hóa lipid như: tăng cholesterol, tăng triglycerid hoặc gan nhiễm mỡ, bệnh lý mạch vành…\r\nMón ăn rất giàu vi khoáng như kẽm, i ốt… nên cũng có thể dùng như một món rau trong bữa chính khoảng 2 lần mỗi tuần cho những đối tượng khác trong gia đình, hoặc 3-4 lần mỗi tuần cho nhóm nhân viên văn phòng không có thời gian chuẩn bị bữa ăn cân đối và đa dạng.\r\nMón ăn được áp dụng trong thực đơn đính kèm mới đạt được hiệu quả giảm mỡ mong muốn và duy trì sức khỏe.\r\nMón ăn không phù hợp với những bệnh nhân có tình trạng cường giáp hay có u bướu ở tuyến giáp.', 'resources/img-recipes/1747382547326.png', '2025-05-03 16:14:02'),
('fcb54590-27fa-11f0-b0f6-fc34974bb26c', 'Salad gà nướng thơm', 'resources/img-recipes/1746261938348.png', '4', '20 phút', 1, '150', 'Món Salad gà nướng thơm vừa lành mạnh, vừa hấp dẫn, đặc biệt với những ai yêu thích sự tươi mới và hương vị cân bằng. Món ăn thơm ngon với cách ướp gia vị gà kỹ lưỡng giúp miếng gà nướng thơm lừng, mềm. Quả thơm giúp cho món gà nướng có hương vị tươi mới, lạ vị cùng kết hợp với rau xà lách, bắp mĩ, cà chua, và chấm nước xốt Aji Mayonnaise hài hòa tạo sự cân bằng hương vị nhẹ nhàng khi ăn.\r\n\r\nGà nướng chứa nhiều protein giúp cơ bắp săn chắc.\r\nRau xanh giàu chất xơ, vitamin, giúp đẹp da và tốt cho tiêu hóa.\r\nMón ăn này rất phù hợp cho những ai muốn ăn lành mạnh hoặc giảm cân.', 'Má đùi gà lạng mỏng, đập sơ, ướp má đùi gà với 1m hành tỏi băm nhuyễn, 1/2m Hạt nêm Aji-ngon® Heo, 1/2m Bột ngọt AJI-NO-MOTO®, 1/3m tiêu, 1m nước tương “Phú Sĩ”, 1/2M mật ong, để thấm 10 phút.\r\nXà lách cắt miếng vừa ăn. Cà chua cắt đôi. Bắp Mỹ hạt luộc chín. Dưa leo cắt khoanh tròn. Húng lủi cắt nhỏ Cho salad vào tủ mát.\r\nThơm bỏ cùi, cắt lát dày 1cm ướp với xíu muối.', 'Áp chảo thơm không dầu, trút ra. Tiếp tục áp chảo gà với 1m dầu cho chín vàng, để nguội cắt miếng ngang 1cm.', 'Xếp gà lên dĩa salad, bắt Xốt Mayonnaise Aji-mayo® Phiên bản ít béo lên trên, khi ăn trộn đều.\r\n\r\n', '🧑‍🍳 Với món nướng, ướp 1 ít mật ong giúp màu sắc món ăn đẹp và bóng hơn.\r\n🧑‍🍳 Áp chảo không dầu để thơm đẹp mắt và ngon hơn.', 'Món ăn cần được áp dụng đồng thời với thực đơn đi kèm theo mới đạt được hiệu quả giảm mỡ thừa.\r\nThời gian tập luyện để giảm được khối mỡ dự trữ là tập tối thiểu 45 phút liên tục. Tập luyện trong 30 phút đầu chỉ mới làm cạn lượng đường dự trữ trong cơ. Từ 30 phút trở đi cơ thể mới bắt đầu sử dụng mỡ để sinh năng lượng. Có thể tập bất kỳ môn thể thao nào để giảm mỡ thừa, nhưng cần phải đạt đủ thời gian tập luyện liên tục mỗi lần tập.\r\nNgoài ăn uống và tập luyện, cần phải ngủ đủ giấc 6-7 giờ trong đêm và phải ngủ sâu trong giai đoạn từ 0-4g. Thức khuya là một yếu tố nguy cơ của tăng khối mỡ thừa.\r\nBữa ăn cuối cùng trong ngày nên cách giờ đi ngủ khoảng 2 tiếng đồng hồ.', 'resources/img-recipes/1747382837303.png', '2025-05-03 15:45:38');

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
('01818608-322c-11f0-ad72-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', '765b2d19-0534-11f0-a1d9-60a82de70049'),
('0278629c-322d-11f0-ad72-fc34974bb26c', '836230a2-3229-11f0-ad72-fc34974bb26c', '765b2b6f-0534-11f0-a1d9-60a82de70049'),
('02d41a36-3227-11f0-ad72-fc34974bb26c', 'e3b7d128-3226-11f0-ad72-fc34974bb26c', '765b2c92-0534-11f0-a1d9-60a82de70049'),
('0a8fac44-2995-11f0-aded-fc34974bb26c', '63178aec-27f9-11f0-b0f6-fc34974bb26c', '765b2c4b-0534-11f0-a1d9-60a82de70049'),
('0a8fb1be-2995-11f0-aded-fc34974bb26c', '63178aec-27f9-11f0-b0f6-fc34974bb26c', '765b2d2e-0534-11f0-a1d9-60a82de70049'),
('11b6f028-322d-11f0-ad72-fc34974bb26c', '98f76e50-27fe-11f0-b0f6-fc34974bb26c', '765b2d19-0534-11f0-a1d9-60a82de70049'),
('1406d111-32f5-11f0-9152-fc34974bb26c', '14056a95-32f5-11f0-9152-fc34974bb26c', '765b2b6f-0534-11f0-a1d9-60a82de70049'),
('1bb6dcf1-322c-11f0-ad72-fc34974bb26c', 'f45dfde0-27fe-11f0-b0f6-fc34974bb26c', '765b2c4b-0534-11f0-a1d9-60a82de70049'),
('1d9bcebe-32eb-11f0-9152-fc34974bb26c', '1d9a4bd8-32eb-11f0-9152-fc34974bb26c', '765b2d04-0534-11f0-a1d9-60a82de70049'),
('248e24ff-32ef-11f0-9152-fc34974bb26c', '248b6b65-32ef-11f0-9152-fc34974bb26c', '765b2c92-0534-11f0-a1d9-60a82de70049'),
('2c296148-32ed-11f0-9152-fc34974bb26c', '2c27b604-32ed-11f0-9152-fc34974bb26c', '765b2d04-0534-11f0-a1d9-60a82de70049'),
('2c76dcb7-322c-11f0-ad72-fc34974bb26c', 'd7081b0d-27fd-11f0-b0f6-fc34974bb26c', '765b2d19-0534-11f0-a1d9-60a82de70049'),
('31b47ae3-3486-11f0-8af6-fc34974bb26c', '31b36070-3486-11f0-8af6-fc34974bb26c', '765b2c22-0534-11f0-a1d9-60a82de70049'),
('385e3069-32ec-11f0-9152-fc34974bb26c', '385e0ec5-32ec-11f0-9152-fc34974bb26c', '765b2d19-0534-11f0-a1d9-60a82de70049'),
('3d3d5910-2995-11f0-aded-fc34974bb26c', 'de508421-27f9-11f0-b0f6-fc34974bb26c', '765b2c4b-0534-11f0-a1d9-60a82de70049'),
('3f34b39d-322c-11f0-ad72-fc34974bb26c', 'de07e551-322a-11f0-ad72-fc34974bb26c', '765b2c4b-0534-11f0-a1d9-60a82de70049'),
('4295b43b-3485-11f0-8af6-fc34974bb26c', '429293a8-3485-11f0-8af6-fc34974bb26c', '765b2cb5-0534-11f0-a1d9-60a82de70049'),
('448bde90-32ee-11f0-9152-fc34974bb26c', '448a5cf6-32ee-11f0-9152-fc34974bb26c', '765b2b6f-0534-11f0-a1d9-60a82de70049'),
('530b06d8-322c-11f0-ad72-fc34974bb26c', '34796f6e-27fe-11f0-b0f6-fc34974bb26c', '765b0b44-0534-11f0-a1d9-60a82de70049'),
('53e035e5-3228-11f0-ad72-fc34974bb26c', 'a1ff7a6b-3227-11f0-ad72-fc34974bb26c', '765b2c4b-0534-11f0-a1d9-60a82de70049'),
('5b32c7d7-32ea-11f0-9152-fc34974bb26c', '5b315bfd-32ea-11f0-9152-fc34974bb26c', '765b2d2e-0534-11f0-a1d9-60a82de70049'),
('5b9aaa16-3487-11f0-8af6-fc34974bb26c', '5b994271-3487-11f0-8af6-fc34974bb26c', '765b2ce4-0534-11f0-a1d9-60a82de70049'),
('5ebb4553-32f5-11f0-9152-fc34974bb26c', '5eb93375-32f5-11f0-9152-fc34974bb26c', '765b2d19-0534-11f0-a1d9-60a82de70049'),
('794e9ec8-32ed-11f0-9152-fc34974bb26c', '794d570c-32ed-11f0-9152-fc34974bb26c', '765b2d19-0534-11f0-a1d9-60a82de70049'),
('7a4be07f-32ef-11f0-9152-fc34974bb26c', '7a4a2b22-32ef-11f0-9152-fc34974bb26c', '765b2c92-0534-11f0-a1d9-60a82de70049'),
('87b7957e-322c-11f0-ad72-fc34974bb26c', '56125b0c-27fc-11f0-b0f6-fc34974bb26c', '765b2c4b-0534-11f0-a1d9-60a82de70049'),
('93bdd0c8-3485-11f0-8af6-fc34974bb26c', '93bc1fb6-3485-11f0-8af6-fc34974bb26c', '765b2cb5-0534-11f0-a1d9-60a82de70049'),
('99d660dd-2995-11f0-aded-fc34974bb26c', 'c540df55-27fc-11f0-b0f6-fc34974bb26c', '765b2ce4-0534-11f0-a1d9-60a82de70049'),
('9b8a529b-322c-11f0-ad72-fc34974bb26c', '5a52f386-27ff-11f0-b0f6-fc34974bb26c', '765b2c22-0534-11f0-a1d9-60a82de70049'),
('9e3314c1-32eb-11f0-9152-fc34974bb26c', '9e31662c-32eb-11f0-9152-fc34974bb26c', '765b2ce4-0534-11f0-a1d9-60a82de70049'),
('a0cdb5f6-2fde-11f0-957d-fc34974bb26c', '3c5adf20-27fa-11f0-b0f6-fc34974bb26c', '765b2ce4-0534-11f0-a1d9-60a82de70049'),
('a72ba81b-322b-11f0-ad72-fc34974bb26c', 'a72a97c8-322b-11f0-ad72-fc34974bb26c', '765b2b6f-0534-11f0-a1d9-60a82de70049'),
('acd204c5-32ea-11f0-9152-fc34974bb26c', 'accffb24-32ea-11f0-9152-fc34974bb26c', '765b2c4b-0534-11f0-a1d9-60a82de70049'),
('ad8e0bd6-322c-11f0-ad72-fc34974bb26c', '629888f3-27fb-11f0-b0f6-fc34974bb26c', '765b2ce4-0534-11f0-a1d9-60a82de70049'),
('afd31279-3486-11f0-8af6-fc34974bb26c', 'afd085d1-3486-11f0-8af6-fc34974bb26c', '765b2ce4-0534-11f0-a1d9-60a82de70049'),
('b87db977-3228-11f0-ad72-fc34974bb26c', 'b87b67af-3228-11f0-ad72-fc34974bb26c', '765b0b44-0534-11f0-a1d9-60a82de70049'),
('c3e100f6-32ee-11f0-9152-fc34974bb26c', 'c3dfb511-32ee-11f0-9152-fc34974bb26c', '765b2b6f-0534-11f0-a1d9-60a82de70049'),
('c463e08b-2995-11f0-aded-fc34974bb26c', 'a0a25ede-27fa-11f0-b0f6-fc34974bb26c', '765b2c4b-0534-11f0-a1d9-60a82de70049'),
('c88d934d-322c-11f0-ad72-fc34974bb26c', 'fcb54590-27fa-11f0-b0f6-fc34974bb26c', '765b2c4b-0534-11f0-a1d9-60a82de70049'),
('dda95c9e-32ed-11f0-9152-fc34974bb26c', 'dda64acf-32ed-11f0-9152-fc34974bb26c', '765b2c4b-0534-11f0-a1d9-60a82de70049'),
('e1830cd1-32e9-11f0-9152-fc34974bb26c', 'e18091a7-32e9-11f0-9152-fc34974bb26c', '765b2d2e-0534-11f0-a1d9-60a82de70049'),
('e331d24d-3229-11f0-ad72-fc34974bb26c', 'e32fb110-3229-11f0-ad72-fc34974bb26c', '765b0b44-0534-11f0-a1d9-60a82de70049'),
('ea03632b-32eb-11f0-9152-fc34974bb26c', 'ea016ec0-32eb-11f0-9152-fc34974bb26c', '765b2d04-0534-11f0-a1d9-60a82de70049'),
('eba16027-3486-11f0-8af6-fc34974bb26c', 'eba06a26-3486-11f0-8af6-fc34974bb26c', '765b2ce4-0534-11f0-a1d9-60a82de70049'),
('ef98b1a1-322c-11f0-ad72-fc34974bb26c', '7a71e1bc-322a-11f0-ad72-fc34974bb26c', '765b2cb5-0534-11f0-a1d9-60a82de70049'),
('f257a070-3485-11f0-8af6-fc34974bb26c', 'd49c1153-3485-11f0-8af6-fc34974bb26c', '765b2d2e-0534-11f0-a1d9-60a82de70049'),
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
('1405ab11-32f5-11f0-9152-fc34974bb26c', '14056a95-32f5-11f0-9152-fc34974bb26c', '14059a43-32f5-11f0-9152-fc34974bb26c', '1000', 'g'),
('1405c7f2-32f5-11f0-9152-fc34974bb26c', '14056a95-32f5-11f0-9152-fc34974bb26c', '1405ba80-32f5-11f0-9152-fc34974bb26c', '', ''),
('1405d34c-32f5-11f0-9152-fc34974bb26c', '14056a95-32f5-11f0-9152-fc34974bb26c', 'bc7f725a-2996-11f0-aded-fc34974bb26c', '', ''),
('1405f13c-32f5-11f0-9152-fc34974bb26c', '14056a95-32f5-11f0-9152-fc34974bb26c', '1405df92-32f5-11f0-9152-fc34974bb26c', '', ''),
('14060a8d-32f5-11f0-9152-fc34974bb26c', '14056a95-32f5-11f0-9152-fc34974bb26c', '1405fff5-32f5-11f0-9152-fc34974bb26c', '', ''),
('14061d7d-32f5-11f0-9152-fc34974bb26c', '14056a95-32f5-11f0-9152-fc34974bb26c', '1406146d-32f5-11f0-9152-fc34974bb26c', '', ''),
('14062f7c-32f5-11f0-9152-fc34974bb26c', '14056a95-32f5-11f0-9152-fc34974bb26c', '1406269b-32f5-11f0-9152-fc34974bb26c', '', ''),
('14066bf3-32f5-11f0-9152-fc34974bb26c', '14056a95-32f5-11f0-9152-fc34974bb26c', '1406629e-32f5-11f0-9152-fc34974bb26c', '', ''),
('1406753d-32f5-11f0-9152-fc34974bb26c', '14056a95-32f5-11f0-9152-fc34974bb26c', 'bc806788-2996-11f0-aded-fc34974bb26c', '', ''),
('14067f01-32f5-11f0-9152-fc34974bb26c', '14056a95-32f5-11f0-9152-fc34974bb26c', '248d9711-32ef-11f0-9152-fc34974bb26c', '', ''),
('1406997a-32f5-11f0-9152-fc34974bb26c', '14056a95-32f5-11f0-9152-fc34974bb26c', '14068ebb-32f5-11f0-9152-fc34974bb26c', '', ''),
('1406ad35-32f5-11f0-9152-fc34974bb26c', '14056a95-32f5-11f0-9152-fc34974bb26c', '1406a3e3-32f5-11f0-9152-fc34974bb26c', '', ''),
('1406bfb7-32f5-11f0-9152-fc34974bb26c', '14056a95-32f5-11f0-9152-fc34974bb26c', '1406b66e-32f5-11f0-9152-fc34974bb26c', '', ''),
('1d9af7db-32eb-11f0-9152-fc34974bb26c', '1d9a4bd8-32eb-11f0-9152-fc34974bb26c', '1d9ae78b-32eb-11f0-9152-fc34974bb26c', '400', 'g'),
('1d9b15d7-32eb-11f0-9152-fc34974bb26c', '1d9a4bd8-32eb-11f0-9152-fc34974bb26c', '1d9b08c5-32eb-11f0-9152-fc34974bb26c', '', ''),
('1d9b3bd8-32eb-11f0-9152-fc34974bb26c', '1d9a4bd8-32eb-11f0-9152-fc34974bb26c', '1d9b2408-32eb-11f0-9152-fc34974bb26c', '', ''),
('1d9b57ca-32eb-11f0-9152-fc34974bb26c', '1d9a4bd8-32eb-11f0-9152-fc34974bb26c', '1d9b4b1c-32eb-11f0-9152-fc34974bb26c', '', ''),
('1d9b7211-32eb-11f0-9152-fc34974bb26c', '1d9a4bd8-32eb-11f0-9152-fc34974bb26c', '1d9b63f8-32eb-11f0-9152-fc34974bb26c', '', ''),
('1d9b9447-32eb-11f0-9152-fc34974bb26c', '1d9a4bd8-32eb-11f0-9152-fc34974bb26c', '1d9b8465-32eb-11f0-9152-fc34974bb26c', '', ''),
('1d9baf44-32eb-11f0-9152-fc34974bb26c', '1d9a4bd8-32eb-11f0-9152-fc34974bb26c', '1d9ba2ee-32eb-11f0-9152-fc34974bb26c', '', ''),
('21226b91-2996-11f0-aded-fc34974bb26c', '629888f3-27fb-11f0-b0f6-fc34974bb26c', '21225630-2996-11f0-aded-fc34974bb26c', '40', 'g'),
('21227ecb-2996-11f0-aded-fc34974bb26c', '629888f3-27fb-11f0-b0f6-fc34974bb26c', '2122738d-2996-11f0-aded-fc34974bb26c', '200', 'g'),
('2122da93-2996-11f0-aded-fc34974bb26c', '629888f3-27fb-11f0-b0f6-fc34974bb26c', '21228601-2996-11f0-aded-fc34974bb26c', '100', 'g'),
('2122f016-2996-11f0-aded-fc34974bb26c', '629888f3-27fb-11f0-b0f6-fc34974bb26c', '2122e2f1-2996-11f0-aded-fc34974bb26c', '', ''),
('21230a7d-2996-11f0-aded-fc34974bb26c', '629888f3-27fb-11f0-b0f6-fc34974bb26c', '2122fe17-2996-11f0-aded-fc34974bb26c', '', ''),
('21231d7a-2996-11f0-aded-fc34974bb26c', '629888f3-27fb-11f0-b0f6-fc34974bb26c', '21231243-2996-11f0-aded-fc34974bb26c', '', ''),
('21232f74-2996-11f0-aded-fc34974bb26c', '629888f3-27fb-11f0-b0f6-fc34974bb26c', '212324c5-2996-11f0-aded-fc34974bb26c', '', ''),
('248ba56b-32ef-11f0-9152-fc34974bb26c', '248b6b65-32ef-11f0-9152-fc34974bb26c', '248b9061-32ef-11f0-9152-fc34974bb26c', '400', 'g'),
('248bd4ba-32ef-11f0-9152-fc34974bb26c', '248b6b65-32ef-11f0-9152-fc34974bb26c', '248bc2c3-32ef-11f0-9152-fc34974bb26c', '', ''),
('248bfa2b-32ef-11f0-9152-fc34974bb26c', '248b6b65-32ef-11f0-9152-fc34974bb26c', '248be879-32ef-11f0-9152-fc34974bb26c', '', ''),
('248c20e8-32ef-11f0-9152-fc34974bb26c', '248b6b65-32ef-11f0-9152-fc34974bb26c', '248c0f62-32ef-11f0-9152-fc34974bb26c', '', ''),
('248cc247-32ef-11f0-9152-fc34974bb26c', '248b6b65-32ef-11f0-9152-fc34974bb26c', '248c31a8-32ef-11f0-9152-fc34974bb26c', '', ''),
('248cea26-32ef-11f0-9152-fc34974bb26c', '248b6b65-32ef-11f0-9152-fc34974bb26c', '248cd73f-32ef-11f0-9152-fc34974bb26c', '', ''),
('248d1119-32ef-11f0-9152-fc34974bb26c', '248b6b65-32ef-11f0-9152-fc34974bb26c', '248cfdec-32ef-11f0-9152-fc34974bb26c', '', ''),
('248d3691-32ef-11f0-9152-fc34974bb26c', '248b6b65-32ef-11f0-9152-fc34974bb26c', '248d23c9-32ef-11f0-9152-fc34974bb26c', '', ''),
('248d4f9e-32ef-11f0-9152-fc34974bb26c', '248b6b65-32ef-11f0-9152-fc34974bb26c', '248d4339-32ef-11f0-9152-fc34974bb26c', '', ''),
('248d7b85-32ef-11f0-9152-fc34974bb26c', '248b6b65-32ef-11f0-9152-fc34974bb26c', '248d66cf-32ef-11f0-9152-fc34974bb26c', '', ''),
('248dac14-32ef-11f0-9152-fc34974bb26c', '248b6b65-32ef-11f0-9152-fc34974bb26c', '248d9711-32ef-11f0-9152-fc34974bb26c', '', ''),
('248dc21e-32ef-11f0-9152-fc34974bb26c', '248b6b65-32ef-11f0-9152-fc34974bb26c', 'e3315c40-3229-11f0-ad72-fc34974bb26c', '', ''),
('248dd369-32ef-11f0-9152-fc34974bb26c', '248b6b65-32ef-11f0-9152-fc34974bb26c', '7a733339-322a-11f0-ad72-fc34974bb26c', '', ''),
('248e04cb-32ef-11f0-9152-fc34974bb26c', '248b6b65-32ef-11f0-9152-fc34974bb26c', '248ded8b-32ef-11f0-9152-fc34974bb26c', '', ''),
('2c27edf4-32ed-11f0-9152-fc34974bb26c', '2c27b604-32ed-11f0-9152-fc34974bb26c', '2c27df7a-32ed-11f0-9152-fc34974bb26c', '700', 'g'),
('2c28023d-32ed-11f0-9152-fc34974bb26c', '2c27b604-32ed-11f0-9152-fc34974bb26c', '2c27f8fa-32ed-11f0-9152-fc34974bb26c', '30', 'g'),
('2c282198-32ed-11f0-9152-fc34974bb26c', '2c27b604-32ed-11f0-9152-fc34974bb26c', '2c280f3c-32ed-11f0-9152-fc34974bb26c', '', ''),
('2c2845d8-32ed-11f0-9152-fc34974bb26c', '2c27b604-32ed-11f0-9152-fc34974bb26c', '2c28344b-32ed-11f0-9152-fc34974bb26c', '', ''),
('2c286093-32ed-11f0-9152-fc34974bb26c', '2c27b604-32ed-11f0-9152-fc34974bb26c', '2c285417-32ed-11f0-9152-fc34974bb26c', '', ''),
('2c2875ce-32ed-11f0-9152-fc34974bb26c', '2c27b604-32ed-11f0-9152-fc34974bb26c', '2c286a78-32ed-11f0-9152-fc34974bb26c', '', ''),
('2c2891d6-32ed-11f0-9152-fc34974bb26c', '2c27b604-32ed-11f0-9152-fc34974bb26c', '2c28834d-32ed-11f0-9152-fc34974bb26c', '', ''),
('2c28b52f-32ed-11f0-9152-fc34974bb26c', '2c27b604-32ed-11f0-9152-fc34974bb26c', '2c28a03d-32ed-11f0-9152-fc34974bb26c', '', ''),
('2c28dc1e-32ed-11f0-9152-fc34974bb26c', '2c27b604-32ed-11f0-9152-fc34974bb26c', '2c28c507-32ed-11f0-9152-fc34974bb26c', '', ''),
('2c290a2e-32ed-11f0-9152-fc34974bb26c', '2c27b604-32ed-11f0-9152-fc34974bb26c', '2c28f671-32ed-11f0-9152-fc34974bb26c', '', ''),
('2c292ce1-32ed-11f0-9152-fc34974bb26c', '2c27b604-32ed-11f0-9152-fc34974bb26c', '2c291cf1-32ed-11f0-9152-fc34974bb26c', '', ''),
('2c294b2d-32ed-11f0-9152-fc34974bb26c', '2c27b604-32ed-11f0-9152-fc34974bb26c', '2c293d05-32ed-11f0-9152-fc34974bb26c', '', ''),
('31b3a4eb-3486-11f0-8af6-fc34974bb26c', '31b36070-3486-11f0-8af6-fc34974bb26c', '31b38e48-3486-11f0-8af6-fc34974bb26c', '', ''),
('31b3db30-3486-11f0-8af6-fc34974bb26c', '31b36070-3486-11f0-8af6-fc34974bb26c', '31b3c406-3486-11f0-8af6-fc34974bb26c', '', ''),
('31b403d2-3486-11f0-8af6-fc34974bb26c', '31b36070-3486-11f0-8af6-fc34974bb26c', '31b3f01d-3486-11f0-8af6-fc34974bb26c', '', ''),
('31b42946-3486-11f0-8af6-fc34974bb26c', '31b36070-3486-11f0-8af6-fc34974bb26c', '31b416e0-3486-11f0-8af6-fc34974bb26c', '', ''),
('31b446ee-3486-11f0-8af6-fc34974bb26c', '31b36070-3486-11f0-8af6-fc34974bb26c', '31b43824-3486-11f0-8af6-fc34974bb26c', '', ''),
('31b463db-3486-11f0-8af6-fc34974bb26c', '31b36070-3486-11f0-8af6-fc34974bb26c', '31b4566c-3486-11f0-8af6-fc34974bb26c', '', ''),
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
('4292f384-3485-11f0-8af6-fc34974bb26c', '429293a8-3485-11f0-8af6-fc34974bb26c', '4292d89e-3485-11f0-8af6-fc34974bb26c', '300', 'g'),
('42934cc5-3485-11f0-8af6-fc34974bb26c', '429293a8-3485-11f0-8af6-fc34974bb26c', '99d56f91-2995-11f0-aded-fc34974bb26c', '', ''),
('4293a7c6-3485-11f0-8af6-fc34974bb26c', '429293a8-3485-11f0-8af6-fc34974bb26c', '4293664f-3485-11f0-8af6-fc34974bb26c', '', ''),
('4293d38e-3485-11f0-8af6-fc34974bb26c', '429293a8-3485-11f0-8af6-fc34974bb26c', '4293be3a-3485-11f0-8af6-fc34974bb26c', '', ''),
('42943144-3485-11f0-8af6-fc34974bb26c', '429293a8-3485-11f0-8af6-fc34974bb26c', '429417d8-3485-11f0-8af6-fc34974bb26c', '', ''),
('42946044-3485-11f0-8af6-fc34974bb26c', '429293a8-3485-11f0-8af6-fc34974bb26c', '42944502-3485-11f0-8af6-fc34974bb26c', '', ''),
('42948c6e-3485-11f0-8af6-fc34974bb26c', '429293a8-3485-11f0-8af6-fc34974bb26c', '42947917-3485-11f0-8af6-fc34974bb26c', '', ''),
('4294b582-3485-11f0-8af6-fc34974bb26c', '429293a8-3485-11f0-8af6-fc34974bb26c', '4294a176-3485-11f0-8af6-fc34974bb26c', '', ''),
('4294cb73-3485-11f0-8af6-fc34974bb26c', '429293a8-3485-11f0-8af6-fc34974bb26c', '8362e917-3229-11f0-ad72-fc34974bb26c', '', ''),
('4294f6b5-3485-11f0-8af6-fc34974bb26c', '429293a8-3485-11f0-8af6-fc34974bb26c', '4294e19a-3485-11f0-8af6-fc34974bb26c', '', ''),
('42952495-3485-11f0-8af6-fc34974bb26c', '429293a8-3485-11f0-8af6-fc34974bb26c', '42950bc4-3485-11f0-8af6-fc34974bb26c', '', ''),
('448ac18c-32ee-11f0-9152-fc34974bb26c', '448a5cf6-32ee-11f0-9152-fc34974bb26c', '448aab71-32ee-11f0-9152-fc34974bb26c', '500', 'g'),
('448aee07-32ee-11f0-9152-fc34974bb26c', '448a5cf6-32ee-11f0-9152-fc34974bb26c', '448ad913-32ee-11f0-9152-fc34974bb26c', '', ''),
('448b1311-32ee-11f0-9152-fc34974bb26c', '448a5cf6-32ee-11f0-9152-fc34974bb26c', '448b029e-32ee-11f0-9152-fc34974bb26c', '', ''),
('448b23e6-32ee-11f0-9152-fc34974bb26c', '448a5cf6-32ee-11f0-9152-fc34974bb26c', '3d7e8ae5-2996-11f0-aded-fc34974bb26c', '', ''),
('448b3455-32ee-11f0-9152-fc34974bb26c', '448a5cf6-32ee-11f0-9152-fc34974bb26c', 'bc7f725a-2996-11f0-aded-fc34974bb26c', '', ''),
('448b55bf-32ee-11f0-9152-fc34974bb26c', '448a5cf6-32ee-11f0-9152-fc34974bb26c', '448b4814-32ee-11f0-9152-fc34974bb26c', '', ''),
('448b753d-32ee-11f0-9152-fc34974bb26c', '448a5cf6-32ee-11f0-9152-fc34974bb26c', '448b64e4-32ee-11f0-9152-fc34974bb26c', '', ''),
('448b8003-32ee-11f0-9152-fc34974bb26c', '448a5cf6-32ee-11f0-9152-fc34974bb26c', 'bc806788-2996-11f0-aded-fc34974bb26c', '', ''),
('448b9198-32ee-11f0-9152-fc34974bb26c', '448a5cf6-32ee-11f0-9152-fc34974bb26c', '448b88eb-32ee-11f0-9152-fc34974bb26c', '', ''),
('448ba52a-32ee-11f0-9152-fc34974bb26c', '448a5cf6-32ee-11f0-9152-fc34974bb26c', '448b9a4d-32ee-11f0-9152-fc34974bb26c', '', ''),
('448bc4a9-32ee-11f0-9152-fc34974bb26c', '448a5cf6-32ee-11f0-9152-fc34974bb26c', '448bb5d1-32ee-11f0-9152-fc34974bb26c', '', ''),
('4fc27180-2996-11f0-aded-fc34974bb26c', 'fcb54590-27fa-11f0-b0f6-fc34974bb26c', '4fc25054-2996-11f0-aded-fc34974bb26c', '', ''),
('4fc294c5-2996-11f0-aded-fc34974bb26c', 'fcb54590-27fa-11f0-b0f6-fc34974bb26c', '4fc27eed-2996-11f0-aded-fc34974bb26c', '', ''),
('4fc2a873-2996-11f0-aded-fc34974bb26c', 'fcb54590-27fa-11f0-b0f6-fc34974bb26c', '4fc29d51-2996-11f0-aded-fc34974bb26c', '', ''),
('4fc2bb23-2996-11f0-aded-fc34974bb26c', 'fcb54590-27fa-11f0-b0f6-fc34974bb26c', '4fc2afb1-2996-11f0-aded-fc34974bb26c', '', ''),
('4fc31a78-2996-11f0-aded-fc34974bb26c', 'fcb54590-27fa-11f0-b0f6-fc34974bb26c', '4fc3099b-2996-11f0-aded-fc34974bb26c', '', ''),
('4fc32e41-2996-11f0-aded-fc34974bb26c', 'fcb54590-27fa-11f0-b0f6-fc34974bb26c', '4fc322c4-2996-11f0-aded-fc34974bb26c', '', ''),
('5613503a-27fc-11f0-b0f6-fc34974bb26c', '56125b0c-27fc-11f0-b0f6-fc34974bb26c', '56133cfa-27fc-11f0-b0f6-fc34974bb26c', '300', 'g'),
('5613d7ef-27fc-11f0-b0f6-fc34974bb26c', '56125b0c-27fc-11f0-b0f6-fc34974bb26c', '5613619a-27fc-11f0-b0f6-fc34974bb26c', '300', 'g'),
('56143cd0-27fc-11f0-b0f6-fc34974bb26c', '56125b0c-27fc-11f0-b0f6-fc34974bb26c', '6317ba92-27f9-11f0-b0f6-fc34974bb26c', '200', 'g'),
('5b31afdc-32ea-11f0-9152-fc34974bb26c', '5b315bfd-32ea-11f0-9152-fc34974bb26c', '5b319a26-32ea-11f0-9152-fc34974bb26c', '300', 'g'),
('5b31e6d7-32ea-11f0-9152-fc34974bb26c', '5b315bfd-32ea-11f0-9152-fc34974bb26c', '5b31d4c4-32ea-11f0-9152-fc34974bb26c', '', ''),
('5b320815-32ea-11f0-9152-fc34974bb26c', '5b315bfd-32ea-11f0-9152-fc34974bb26c', '5b31f69d-32ea-11f0-9152-fc34974bb26c', '', ''),
('5b32322a-32ea-11f0-9152-fc34974bb26c', '5b315bfd-32ea-11f0-9152-fc34974bb26c', '5b321d81-32ea-11f0-9152-fc34974bb26c', '300', 'g'),
('5b3257da-32ea-11f0-9152-fc34974bb26c', '5b315bfd-32ea-11f0-9152-fc34974bb26c', '5b3245af-32ea-11f0-9152-fc34974bb26c', '', ''),
('5b328133-32ea-11f0-9152-fc34974bb26c', '5b315bfd-32ea-11f0-9152-fc34974bb26c', '5b326caa-32ea-11f0-9152-fc34974bb26c', '', ''),
('5b32ad53-32ea-11f0-9152-fc34974bb26c', '5b315bfd-32ea-11f0-9152-fc34974bb26c', '5b3298af-32ea-11f0-9152-fc34974bb26c', '', ''),
('5b999e7e-3487-11f0-8af6-fc34974bb26c', '5b994271-3487-11f0-8af6-fc34974bb26c', '5b9990e1-3487-11f0-8af6-fc34974bb26c', '2', 'g'),
('5b99c6b6-3487-11f0-8af6-fc34974bb26c', '5b994271-3487-11f0-8af6-fc34974bb26c', '5b99b198-3487-11f0-8af6-fc34974bb26c', '', ''),
('5b99e2b7-3487-11f0-8af6-fc34974bb26c', '5b994271-3487-11f0-8af6-fc34974bb26c', '5b99d551-3487-11f0-8af6-fc34974bb26c', '', ''),
('5b99fc28-3487-11f0-8af6-fc34974bb26c', '5b994271-3487-11f0-8af6-fc34974bb26c', '5b99efe7-3487-11f0-8af6-fc34974bb26c', '', ''),
('5b9a15e1-3487-11f0-8af6-fc34974bb26c', '5b994271-3487-11f0-8af6-fc34974bb26c', '5b9a06b8-3487-11f0-8af6-fc34974bb26c', '', ''),
('5b9a2e5d-3487-11f0-8af6-fc34974bb26c', '5b994271-3487-11f0-8af6-fc34974bb26c', '5b9a22fb-3487-11f0-8af6-fc34974bb26c', '', ''),
('5b9a4fe9-3487-11f0-8af6-fc34974bb26c', '5b994271-3487-11f0-8af6-fc34974bb26c', '5b9a3e3d-3487-11f0-8af6-fc34974bb26c', '', ''),
('5b9a6ed2-3487-11f0-8af6-fc34974bb26c', '5b994271-3487-11f0-8af6-fc34974bb26c', '5b9a60ed-3487-11f0-8af6-fc34974bb26c', '', ''),
('5b9a86cc-3487-11f0-8af6-fc34974bb26c', '5b994271-3487-11f0-8af6-fc34974bb26c', '5b9a7b24-3487-11f0-8af6-fc34974bb26c', '', ''),
('5b9a9f54-3487-11f0-8af6-fc34974bb26c', '5b994271-3487-11f0-8af6-fc34974bb26c', '5b9a93de-3487-11f0-8af6-fc34974bb26c', '', ''),
('5eb98b5e-32f5-11f0-9152-fc34974bb26c', '5eb93375-32f5-11f0-9152-fc34974bb26c', '5eb974bf-32f5-11f0-9152-fc34974bb26c', '400', 'g'),
('5eb9c058-32f5-11f0-9152-fc34974bb26c', '5eb93375-32f5-11f0-9152-fc34974bb26c', '5eb9a61b-32f5-11f0-9152-fc34974bb26c', '', ''),
('5eba56d4-32f5-11f0-9152-fc34974bb26c', '5eb93375-32f5-11f0-9152-fc34974bb26c', '5eba4538-32f5-11f0-9152-fc34974bb26c', '', ''),
('5eba6491-32f5-11f0-9152-fc34974bb26c', '5eb93375-32f5-11f0-9152-fc34974bb26c', 'e3315c40-3229-11f0-ad72-fc34974bb26c', '', ''),
('5eba81f5-32f5-11f0-9152-fc34974bb26c', '5eb93375-32f5-11f0-9152-fc34974bb26c', '5eba73ac-32f5-11f0-9152-fc34974bb26c', '', ''),
('5eba9dac-32f5-11f0-9152-fc34974bb26c', '5eb93375-32f5-11f0-9152-fc34974bb26c', '5eba9102-32f5-11f0-9152-fc34974bb26c', '', ''),
('5ebaa7ae-32f5-11f0-9152-fc34974bb26c', '5eb93375-32f5-11f0-9152-fc34974bb26c', '99d56f91-2995-11f0-aded-fc34974bb26c', '', ''),
('5ebabadd-32f5-11f0-9152-fc34974bb26c', '5eb93375-32f5-11f0-9152-fc34974bb26c', '5ebab1e2-32f5-11f0-9152-fc34974bb26c', '', ''),
('5ebaf912-32f5-11f0-9152-fc34974bb26c', '5eb93375-32f5-11f0-9152-fc34974bb26c', '5ebae764-32f5-11f0-9152-fc34974bb26c', '', ''),
('5ebb268d-32f5-11f0-9152-fc34974bb26c', '5eb93375-32f5-11f0-9152-fc34974bb26c', '5ebb0ee8-32f5-11f0-9152-fc34974bb26c', '', ''),
('5ebb3b17-32f5-11f0-9152-fc34974bb26c', '5eb93375-32f5-11f0-9152-fc34974bb26c', '5ebb3188-32f5-11f0-9152-fc34974bb26c', '', ''),
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
('794df10b-32ed-11f0-9152-fc34974bb26c', '794d570c-32ed-11f0-9152-fc34974bb26c', '794ddf83-32ed-11f0-9152-fc34974bb26c', '200', 'g'),
('794e0b6e-32ed-11f0-9152-fc34974bb26c', '794d570c-32ed-11f0-9152-fc34974bb26c', '794dffa6-32ed-11f0-9152-fc34974bb26c', '', ''),
('794e282a-32ed-11f0-9152-fc34974bb26c', '794d570c-32ed-11f0-9152-fc34974bb26c', '794e1b32-32ed-11f0-9152-fc34974bb26c', '', ''),
('794e37ed-32ed-11f0-9152-fc34974bb26c', '794d570c-32ed-11f0-9152-fc34974bb26c', '2c28344b-32ed-11f0-9152-fc34974bb26c', '', ''),
('794e55b1-32ed-11f0-9152-fc34974bb26c', '794d570c-32ed-11f0-9152-fc34974bb26c', '794e46fb-32ed-11f0-9152-fc34974bb26c', '', ''),
('794e6ab6-32ed-11f0-9152-fc34974bb26c', '794d570c-32ed-11f0-9152-fc34974bb26c', '794e613e-32ed-11f0-9152-fc34974bb26c', '', ''),
('794e7d08-32ed-11f0-9152-fc34974bb26c', '794d570c-32ed-11f0-9152-fc34974bb26c', '794e7417-32ed-11f0-9152-fc34974bb26c', '', ''),
('794e942a-32ed-11f0-9152-fc34974bb26c', '794d570c-32ed-11f0-9152-fc34974bb26c', '794e85f5-32ed-11f0-9152-fc34974bb26c', '', ''),
('7a4ac29f-32ef-11f0-9152-fc34974bb26c', '7a4a2b22-32ef-11f0-9152-fc34974bb26c', '7a4aa791-32ef-11f0-9152-fc34974bb26c', '300', 'g'),
('7a4ae65f-32ef-11f0-9152-fc34974bb26c', '7a4a2b22-32ef-11f0-9152-fc34974bb26c', '7a4ad610-32ef-11f0-9152-fc34974bb26c', '', ''),
('7a4b09c9-32ef-11f0-9152-fc34974bb26c', '7a4a2b22-32ef-11f0-9152-fc34974bb26c', '7a4af37b-32ef-11f0-9152-fc34974bb26c', '', ''),
('7a4b30f5-32ef-11f0-9152-fc34974bb26c', '7a4a2b22-32ef-11f0-9152-fc34974bb26c', '7a4b1e15-32ef-11f0-9152-fc34974bb26c', '', ''),
('7a4b568b-32ef-11f0-9152-fc34974bb26c', '7a4a2b22-32ef-11f0-9152-fc34974bb26c', '7a4b41f4-32ef-11f0-9152-fc34974bb26c', '', ''),
('7a4b8133-32ef-11f0-9152-fc34974bb26c', '7a4a2b22-32ef-11f0-9152-fc34974bb26c', '7a4b6c54-32ef-11f0-9152-fc34974bb26c', '', ''),
('7a4ba7f1-32ef-11f0-9152-fc34974bb26c', '7a4a2b22-32ef-11f0-9152-fc34974bb26c', '7a4b9618-32ef-11f0-9152-fc34974bb26c', '', ''),
('7a4bcd2b-32ef-11f0-9152-fc34974bb26c', '7a4a2b22-32ef-11f0-9152-fc34974bb26c', '7a4bba52-32ef-11f0-9152-fc34974bb26c', '', ''),
('7a724b68-322a-11f0-ad72-fc34974bb26c', '7a71e1bc-322a-11f0-ad72-fc34974bb26c', '7a7237df-322a-11f0-ad72-fc34974bb26c', '400', 'g'),
('7a7271be-322a-11f0-ad72-fc34974bb26c', '7a71e1bc-322a-11f0-ad72-fc34974bb26c', '7a725d52-322a-11f0-ad72-fc34974bb26c', '150', 'g'),
('7a729ab0-322a-11f0-ad72-fc34974bb26c', '7a71e1bc-322a-11f0-ad72-fc34974bb26c', '7a7286ae-322a-11f0-ad72-fc34974bb26c', '', ''),
('7a7314dd-322a-11f0-ad72-fc34974bb26c', '7a71e1bc-322a-11f0-ad72-fc34974bb26c', '7a73047e-322a-11f0-ad72-fc34974bb26c', '', ''),
('7a732304-322a-11f0-ad72-fc34974bb26c', '7a71e1bc-322a-11f0-ad72-fc34974bb26c', 'bc7f725a-2996-11f0-aded-fc34974bb26c', '', ''),
('7a73425e-322a-11f0-ad72-fc34974bb26c', '7a71e1bc-322a-11f0-ad72-fc34974bb26c', '7a733339-322a-11f0-ad72-fc34974bb26c', '', ''),
('7a7360d1-322a-11f0-ad72-fc34974bb26c', '7a71e1bc-322a-11f0-ad72-fc34974bb26c', '7a7351d9-322a-11f0-ad72-fc34974bb26c', '', ''),
('7a7371bb-322a-11f0-ad72-fc34974bb26c', '7a71e1bc-322a-11f0-ad72-fc34974bb26c', '7a7369b3-322a-11f0-ad72-fc34974bb26c', '', ''),
('83625db3-3229-11f0-ad72-fc34974bb26c', '836230a2-3229-11f0-ad72-fc34974bb26c', 'b87c47d9-3228-11f0-ad72-fc34974bb26c', '700', 'g'),
('83627382-3229-11f0-ad72-fc34974bb26c', '836230a2-3229-11f0-ad72-fc34974bb26c', '83626aa7-3229-11f0-ad72-fc34974bb26c', '', ''),
('8362df19-3229-11f0-ad72-fc34974bb26c', '836230a2-3229-11f0-ad72-fc34974bb26c', '8362d07a-3229-11f0-ad72-fc34974bb26c', '', ''),
('8362f479-3229-11f0-ad72-fc34974bb26c', '836230a2-3229-11f0-ad72-fc34974bb26c', '8362e917-3229-11f0-ad72-fc34974bb26c', '', ''),
('836306e1-3229-11f0-ad72-fc34974bb26c', '836230a2-3229-11f0-ad72-fc34974bb26c', '8362fd40-3229-11f0-ad72-fc34974bb26c', '', ''),
('83631a22-3229-11f0-ad72-fc34974bb26c', '836230a2-3229-11f0-ad72-fc34974bb26c', '836311b3-3229-11f0-ad72-fc34974bb26c', '', ''),
('83632aca-3229-11f0-ad72-fc34974bb26c', '836230a2-3229-11f0-ad72-fc34974bb26c', '836322eb-3229-11f0-ad72-fc34974bb26c', '', ''),
('836344c0-3229-11f0-ad72-fc34974bb26c', '836230a2-3229-11f0-ad72-fc34974bb26c', '836332fb-3229-11f0-ad72-fc34974bb26c', '', ''),
('93bc7ff3-3485-11f0-8af6-fc34974bb26c', '93bc1fb6-3485-11f0-8af6-fc34974bb26c', '93bc680a-3485-11f0-8af6-fc34974bb26c', '200', 'g'),
('93bce81c-3485-11f0-8af6-fc34974bb26c', '93bc1fb6-3485-11f0-8af6-fc34974bb26c', '93bcd019-3485-11f0-8af6-fc34974bb26c', '200', 'g'),
('93bd1350-3485-11f0-8af6-fc34974bb26c', '93bc1fb6-3485-11f0-8af6-fc34974bb26c', '93bd00de-3485-11f0-8af6-fc34974bb26c', '100', 'g'),
('93bd3ac8-3485-11f0-8af6-fc34974bb26c', '93bc1fb6-3485-11f0-8af6-fc34974bb26c', '93bd275f-3485-11f0-8af6-fc34974bb26c', '150', 'g'),
('93bd7514-3485-11f0-8af6-fc34974bb26c', '93bc1fb6-3485-11f0-8af6-fc34974bb26c', '93bd4e09-3485-11f0-8af6-fc34974bb26c', '', ''),
('93bdb659-3485-11f0-8af6-fc34974bb26c', '93bc1fb6-3485-11f0-8af6-fc34974bb26c', '93bd9392-3485-11f0-8af6-fc34974bb26c', '', ''),
('98f811e0-27fe-11f0-b0f6-fc34974bb26c', '98f76e50-27fe-11f0-b0f6-fc34974bb26c', '98f79e04-27fe-11f0-b0f6-fc34974bb26c', '500', 'g'),
('99d545e7-2995-11f0-aded-fc34974bb26c', 'c540df55-27fc-11f0-b0f6-fc34974bb26c', '99d4be19-2995-11f0-aded-fc34974bb26c', '', ''),
('99d5618d-2995-11f0-aded-fc34974bb26c', 'c540df55-27fc-11f0-b0f6-fc34974bb26c', '99d55197-2995-11f0-aded-fc34974bb26c', '', ''),
('99d58592-2995-11f0-aded-fc34974bb26c', 'c540df55-27fc-11f0-b0f6-fc34974bb26c', '99d56f91-2995-11f0-aded-fc34974bb26c', '', ''),
('99d5a918-2995-11f0-aded-fc34974bb26c', 'c540df55-27fc-11f0-b0f6-fc34974bb26c', '99d593eb-2995-11f0-aded-fc34974bb26c', '', ''),
('99d5cdf7-2995-11f0-aded-fc34974bb26c', 'c540df55-27fc-11f0-b0f6-fc34974bb26c', '99d5b8c8-2995-11f0-aded-fc34974bb26c', '', ''),
('99d62712-2995-11f0-aded-fc34974bb26c', 'c540df55-27fc-11f0-b0f6-fc34974bb26c', '99d61b16-2995-11f0-aded-fc34974bb26c', '', ''),
('99d64631-2995-11f0-aded-fc34974bb26c', 'c540df55-27fc-11f0-b0f6-fc34974bb26c', '99d635d2-2995-11f0-aded-fc34974bb26c', '', ''),
('9e31aaa3-32eb-11f0-9152-fc34974bb26c', '9e31662c-32eb-11f0-9152-fc34974bb26c', '9e31a0ff-32eb-11f0-9152-fc34974bb26c', '600', 'g'),
('9e31f607-32eb-11f0-9152-fc34974bb26c', '9e31662c-32eb-11f0-9152-fc34974bb26c', '9e31e73a-32eb-11f0-9152-fc34974bb26c', '', ''),
('9e320cab-32eb-11f0-9152-fc34974bb26c', '9e31662c-32eb-11f0-9152-fc34974bb26c', '9e3202e1-32eb-11f0-9152-fc34974bb26c', '10', 'g'),
('9e3224bf-32eb-11f0-9152-fc34974bb26c', '9e31662c-32eb-11f0-9152-fc34974bb26c', '9e32196c-32eb-11f0-9152-fc34974bb26c', '700', 'g'),
('9e323838-32eb-11f0-9152-fc34974bb26c', '9e31662c-32eb-11f0-9152-fc34974bb26c', '9e322ef4-32eb-11f0-9152-fc34974bb26c', '', ''),
('9e324a56-32eb-11f0-9152-fc34974bb26c', '9e31662c-32eb-11f0-9152-fc34974bb26c', '9e3241d3-32eb-11f0-9152-fc34974bb26c', '', ''),
('9e32583b-32eb-11f0-9152-fc34974bb26c', '9e31662c-32eb-11f0-9152-fc34974bb26c', '99d635d2-2995-11f0-aded-fc34974bb26c', '', ''),
('9e327944-32eb-11f0-9152-fc34974bb26c', '9e31662c-32eb-11f0-9152-fc34974bb26c', '9e326843-32eb-11f0-9152-fc34974bb26c', '', ''),
('9e3299be-32eb-11f0-9152-fc34974bb26c', '9e31662c-32eb-11f0-9152-fc34974bb26c', '9e32894a-32eb-11f0-9152-fc34974bb26c', '', ''),
('a0fbea6d-2997-11f0-aded-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', 'a0fb5f14-2997-11f0-aded-fc34974bb26c', '150', 'g'),
('a0fc0baa-2997-11f0-aded-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', 'a0fbf7d0-2997-11f0-aded-fc34974bb26c', '', ''),
('a0fc30d7-2997-11f0-aded-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', 'a0fc1972-2997-11f0-aded-fc34974bb26c', '', ''),
('a0fc490c-2997-11f0-aded-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', 'a0fc3cb2-2997-11f0-aded-fc34974bb26c', '', ''),
('a0fc5c38-2997-11f0-aded-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', 'a0fc5117-2997-11f0-aded-fc34974bb26c', '', ''),
('a1ffc1ce-3227-11f0-ad72-fc34974bb26c', 'a1ff7a6b-3227-11f0-ad72-fc34974bb26c', 'a1ffaed2-3227-11f0-ad72-fc34974bb26c', '50', 'g'),
('a1ffe935-3227-11f0-ad72-fc34974bb26c', 'a1ff7a6b-3227-11f0-ad72-fc34974bb26c', 'a1ffd6e1-3227-11f0-ad72-fc34974bb26c', '30', 'g'),
('a20000b0-3227-11f0-ad72-fc34974bb26c', 'a1ff7a6b-3227-11f0-ad72-fc34974bb26c', '4fc29d51-2996-11f0-aded-fc34974bb26c', '', ''),
('a20029bd-3227-11f0-ad72-fc34974bb26c', 'a1ff7a6b-3227-11f0-ad72-fc34974bb26c', 'a200140a-3227-11f0-ad72-fc34974bb26c', '', ''),
('a2003a31-3227-11f0-ad72-fc34974bb26c', 'a1ff7a6b-3227-11f0-ad72-fc34974bb26c', '4fc3099b-2996-11f0-aded-fc34974bb26c', '', ''),
('a20052e0-3227-11f0-ad72-fc34974bb26c', 'a1ff7a6b-3227-11f0-ad72-fc34974bb26c', 'a200474e-3227-11f0-ad72-fc34974bb26c', '', ''),
('a200625a-3227-11f0-ad72-fc34974bb26c', 'a1ff7a6b-3227-11f0-ad72-fc34974bb26c', 'c4625d3b-2995-11f0-aded-fc34974bb26c', '', ''),
('a200fcc4-3227-11f0-ad72-fc34974bb26c', 'a1ff7a6b-3227-11f0-ad72-fc34974bb26c', 'a200e923-3227-11f0-ad72-fc34974bb26c', '', ''),
('a20126bf-3227-11f0-ad72-fc34974bb26c', 'a1ff7a6b-3227-11f0-ad72-fc34974bb26c', 'a201129b-3227-11f0-ad72-fc34974bb26c', '', ''),
('a201546d-3227-11f0-ad72-fc34974bb26c', 'a1ff7a6b-3227-11f0-ad72-fc34974bb26c', 'a2013c67-3227-11f0-ad72-fc34974bb26c', '', ''),
('a201d950-3227-11f0-ad72-fc34974bb26c', 'a1ff7a6b-3227-11f0-ad72-fc34974bb26c', 'a201c2ae-3227-11f0-ad72-fc34974bb26c', '', ''),
('a72adb7e-322b-11f0-ad72-fc34974bb26c', 'a72a97c8-322b-11f0-ad72-fc34974bb26c', '6317ba92-27f9-11f0-b0f6-fc34974bb26c', '300', 'g'),
('a72afb37-322b-11f0-ad72-fc34974bb26c', 'a72a97c8-322b-11f0-ad72-fc34974bb26c', 'a72aec9c-322b-11f0-ad72-fc34974bb26c', '', ''),
('a72b189c-322b-11f0-ad72-fc34974bb26c', 'a72a97c8-322b-11f0-ad72-fc34974bb26c', 'a72b0a7f-322b-11f0-ad72-fc34974bb26c', '', ''),
('a72b3426-322b-11f0-ad72-fc34974bb26c', 'a72a97c8-322b-11f0-ad72-fc34974bb26c', 'a72b26ef-322b-11f0-ad72-fc34974bb26c', '', ''),
('a72b82b0-322b-11f0-ad72-fc34974bb26c', 'a72a97c8-322b-11f0-ad72-fc34974bb26c', 'a72b63a5-322b-11f0-ad72-fc34974bb26c', '', ''),
('a72b8e5d-322b-11f0-ad72-fc34974bb26c', 'a72a97c8-322b-11f0-ad72-fc34974bb26c', '3d7eac3e-2996-11f0-aded-fc34974bb26c', '', ''),
('a72b9e33-322b-11f0-ad72-fc34974bb26c', 'a72a97c8-322b-11f0-ad72-fc34974bb26c', 'a72b9720-322b-11f0-ad72-fc34974bb26c', '', ''),
('acd0527b-32ea-11f0-9152-fc34974bb26c', 'accffb24-32ea-11f0-9152-fc34974bb26c', 'fcb57c41-27fa-11f0-b0f6-fc34974bb26c', '300', 'g'),
('acd07c2e-32ea-11f0-9152-fc34974bb26c', 'accffb24-32ea-11f0-9152-fc34974bb26c', 'acd06a87-32ea-11f0-9152-fc34974bb26c', '', ''),
('acd08d76-32ea-11f0-9152-fc34974bb26c', 'accffb24-32ea-11f0-9152-fc34974bb26c', 'c4629170-2995-11f0-aded-fc34974bb26c', '', ''),
('acd1086a-32ea-11f0-9152-fc34974bb26c', 'accffb24-32ea-11f0-9152-fc34974bb26c', 'acd0f6fa-32ea-11f0-9152-fc34974bb26c', '', ''),
('acd1360c-32ea-11f0-9152-fc34974bb26c', 'accffb24-32ea-11f0-9152-fc34974bb26c', 'acd1228d-32ea-11f0-9152-fc34974bb26c', '', ''),
('acd154c1-32ea-11f0-9152-fc34974bb26c', 'accffb24-32ea-11f0-9152-fc34974bb26c', 'acd1467c-32ea-11f0-9152-fc34974bb26c', '', ''),
('acd16265-32ea-11f0-9152-fc34974bb26c', 'accffb24-32ea-11f0-9152-fc34974bb26c', 'bc7f725a-2996-11f0-aded-fc34974bb26c', '', ''),
('acd1827a-32ea-11f0-9152-fc34974bb26c', 'accffb24-32ea-11f0-9152-fc34974bb26c', 'acd16ebb-32ea-11f0-9152-fc34974bb26c', '', ''),
('acd1f211-32ea-11f0-9152-fc34974bb26c', 'accffb24-32ea-11f0-9152-fc34974bb26c', 'acd1e439-32ea-11f0-9152-fc34974bb26c', '', ''),
('afd0f842-3486-11f0-8af6-fc34974bb26c', 'afd085d1-3486-11f0-8af6-fc34974bb26c', 'afd0ec21-3486-11f0-8af6-fc34974bb26c', '', ''),
('afd114a4-3486-11f0-8af6-fc34974bb26c', 'afd085d1-3486-11f0-8af6-fc34974bb26c', 'afd10486-3486-11f0-8af6-fc34974bb26c', '1', 'kg'),
('afd13ab3-3486-11f0-8af6-fc34974bb26c', 'afd085d1-3486-11f0-8af6-fc34974bb26c', 'afd12a32-3486-11f0-8af6-fc34974bb26c', '600', 'g'),
('afd14586-3486-11f0-8af6-fc34974bb26c', 'afd085d1-3486-11f0-8af6-fc34974bb26c', 'e3b80e09-3226-11f0-ad72-fc34974bb26c', '300', 'g'),
('afd1619c-3486-11f0-8af6-fc34974bb26c', 'afd085d1-3486-11f0-8af6-fc34974bb26c', 'afd155a4-3486-11f0-8af6-fc34974bb26c', '', ''),
('afd17973-3486-11f0-8af6-fc34974bb26c', 'afd085d1-3486-11f0-8af6-fc34974bb26c', 'afd16cde-3486-11f0-8af6-fc34974bb26c', '', ''),
('afd19d08-3486-11f0-8af6-fc34974bb26c', 'afd085d1-3486-11f0-8af6-fc34974bb26c', 'afd18c0c-3486-11f0-8af6-fc34974bb26c', '', ''),
('afd1b214-3486-11f0-8af6-fc34974bb26c', 'afd085d1-3486-11f0-8af6-fc34974bb26c', 'afd1a82c-3486-11f0-8af6-fc34974bb26c', '', ''),
('afd1cef6-3486-11f0-8af6-fc34974bb26c', 'afd085d1-3486-11f0-8af6-fc34974bb26c', 'afd1be83-3486-11f0-8af6-fc34974bb26c', '', ''),
('afd1f485-3486-11f0-8af6-fc34974bb26c', 'afd085d1-3486-11f0-8af6-fc34974bb26c', 'afd1e13c-3486-11f0-8af6-fc34974bb26c', '', ''),
('afd2647f-3486-11f0-8af6-fc34974bb26c', 'afd085d1-3486-11f0-8af6-fc34974bb26c', 'afd20a5a-3486-11f0-8af6-fc34974bb26c', '', ''),
('afd2c812-3486-11f0-8af6-fc34974bb26c', 'afd085d1-3486-11f0-8af6-fc34974bb26c', 'afd27382-3486-11f0-8af6-fc34974bb26c', '', ''),
('afd2dea5-3486-11f0-8af6-fc34974bb26c', 'afd085d1-3486-11f0-8af6-fc34974bb26c', 'afd2d3b7-3486-11f0-8af6-fc34974bb26c', '', ''),
('afd30203-3486-11f0-8af6-fc34974bb26c', 'afd085d1-3486-11f0-8af6-fc34974bb26c', 'afd2e961-3486-11f0-8af6-fc34974bb26c', '', ''),
('b87c5ef1-3228-11f0-ad72-fc34974bb26c', 'b87b67af-3228-11f0-ad72-fc34974bb26c', 'b87c47d9-3228-11f0-ad72-fc34974bb26c', '500', 'g '),
('b87c731a-3228-11f0-ad72-fc34974bb26c', 'b87b67af-3228-11f0-ad72-fc34974bb26c', '3d7e8ae5-2996-11f0-aded-fc34974bb26c', '', ''),
('b87ca066-3228-11f0-ad72-fc34974bb26c', 'b87b67af-3228-11f0-ad72-fc34974bb26c', 'b87c8d7b-3228-11f0-ad72-fc34974bb26c', '', ''),
('b87cd4b6-3228-11f0-ad72-fc34974bb26c', 'b87b67af-3228-11f0-ad72-fc34974bb26c', 'b87cb421-3228-11f0-ad72-fc34974bb26c', '', ''),
('b87cfd3b-3228-11f0-ad72-fc34974bb26c', 'b87b67af-3228-11f0-ad72-fc34974bb26c', 'b87ce9ef-3228-11f0-ad72-fc34974bb26c', '', ''),
('b87d28a1-3228-11f0-ad72-fc34974bb26c', 'b87b67af-3228-11f0-ad72-fc34974bb26c', 'b87d10a8-3228-11f0-ad72-fc34974bb26c', '', ''),
('b87d4cc0-3228-11f0-ad72-fc34974bb26c', 'b87b67af-3228-11f0-ad72-fc34974bb26c', 'b87d3b66-3228-11f0-ad72-fc34974bb26c', '', ''),
('b87d6d22-3228-11f0-ad72-fc34974bb26c', 'b87b67af-3228-11f0-ad72-fc34974bb26c', 'b87d5fd9-3228-11f0-ad72-fc34974bb26c', '', ''),
('b87d781e-3228-11f0-ad72-fc34974bb26c', 'b87b67af-3228-11f0-ad72-fc34974bb26c', 'b87d3b66-3228-11f0-ad72-fc34974bb26c', '', ''),
('b87d99c4-3228-11f0-ad72-fc34974bb26c', 'b87b67af-3228-11f0-ad72-fc34974bb26c', 'b87d86ef-3228-11f0-ad72-fc34974bb26c', '', ''),
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
('c3dff088-32ee-11f0-9152-fc34974bb26c', 'c3dfb511-32ee-11f0-9152-fc34974bb26c', 'c3dfe2b8-32ee-11f0-9152-fc34974bb26c', '400', 'g'),
('c3e000b5-32ee-11f0-9152-fc34974bb26c', 'c3dfb511-32ee-11f0-9152-fc34974bb26c', '448ad913-32ee-11f0-9152-fc34974bb26c', '', ''),
('c3e0141f-32ee-11f0-9152-fc34974bb26c', 'c3dfb511-32ee-11f0-9152-fc34974bb26c', 'c3e00b2f-32ee-11f0-9152-fc34974bb26c', '', ''),
('c3e03038-32ee-11f0-9152-fc34974bb26c', 'c3dfb511-32ee-11f0-9152-fc34974bb26c', 'c3e01df7-32ee-11f0-9152-fc34974bb26c', '', ''),
('c3e04135-32ee-11f0-9152-fc34974bb26c', 'c3dfb511-32ee-11f0-9152-fc34974bb26c', '836322eb-3229-11f0-ad72-fc34974bb26c', '', ''),
('c3e05eb1-32ee-11f0-9152-fc34974bb26c', 'c3dfb511-32ee-11f0-9152-fc34974bb26c', 'c3e050df-32ee-11f0-9152-fc34974bb26c', '', ''),
('c3e08108-32ee-11f0-9152-fc34974bb26c', 'c3dfb511-32ee-11f0-9152-fc34974bb26c', 'c3e07141-32ee-11f0-9152-fc34974bb26c', '', ''),
('c3e09e93-32ee-11f0-9152-fc34974bb26c', 'c3dfb511-32ee-11f0-9152-fc34974bb26c', 'c3e08e7c-32ee-11f0-9152-fc34974bb26c', '', ''),
('c3e0bcb5-32ee-11f0-9152-fc34974bb26c', 'c3dfb511-32ee-11f0-9152-fc34974bb26c', 'c3e0ad5f-32ee-11f0-9152-fc34974bb26c', '', ''),
('c3e0ddab-32ee-11f0-9152-fc34974bb26c', 'c3dfb511-32ee-11f0-9152-fc34974bb26c', 'c3e0cf32-32ee-11f0-9152-fc34974bb26c', '', ''),
('c3e0f38d-32ee-11f0-9152-fc34974bb26c', 'c3dfb511-32ee-11f0-9152-fc34974bb26c', 'c3e0e9ca-32ee-11f0-9152-fc34974bb26c', '', ''),
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
('dda6a38e-32ed-11f0-9152-fc34974bb26c', 'dda64acf-32ed-11f0-9152-fc34974bb26c', 'dda68c44-32ed-11f0-9152-fc34974bb26c', '300', 'g'),
('dda6d00d-32ed-11f0-9152-fc34974bb26c', 'dda64acf-32ed-11f0-9152-fc34974bb26c', 'dda6babd-32ed-11f0-9152-fc34974bb26c', '', ''),
('dda6f065-32ed-11f0-9152-fc34974bb26c', 'dda64acf-32ed-11f0-9152-fc34974bb26c', 'dda6e06e-32ed-11f0-9152-fc34974bb26c', '', ''),
('dda71699-32ed-11f0-9152-fc34974bb26c', 'dda64acf-32ed-11f0-9152-fc34974bb26c', 'dda7050e-32ed-11f0-9152-fc34974bb26c', '', ''),
('dda73798-32ed-11f0-9152-fc34974bb26c', 'dda64acf-32ed-11f0-9152-fc34974bb26c', 'dda727b8-32ed-11f0-9152-fc34974bb26c', '', ''),
('dda76256-32ed-11f0-9152-fc34974bb26c', 'dda64acf-32ed-11f0-9152-fc34974bb26c', 'dda74db5-32ed-11f0-9152-fc34974bb26c', '', ''),
('dda836cc-32ed-11f0-9152-fc34974bb26c', 'dda64acf-32ed-11f0-9152-fc34974bb26c', 'dda7d02d-32ed-11f0-9152-fc34974bb26c', '', ''),
('dda86388-32ed-11f0-9152-fc34974bb26c', 'dda64acf-32ed-11f0-9152-fc34974bb26c', 'dda85069-32ed-11f0-9152-fc34974bb26c', '', ''),
('dda881a3-32ed-11f0-9152-fc34974bb26c', 'dda64acf-32ed-11f0-9152-fc34974bb26c', 'dda87340-32ed-11f0-9152-fc34974bb26c', '', ''),
('dda8b2a7-32ed-11f0-9152-fc34974bb26c', 'dda64acf-32ed-11f0-9152-fc34974bb26c', 'dda897a4-32ed-11f0-9152-fc34974bb26c', '', ''),
('dda8d94a-32ed-11f0-9152-fc34974bb26c', 'dda64acf-32ed-11f0-9152-fc34974bb26c', 'dda8c73b-32ed-11f0-9152-fc34974bb26c', '', ''),
('dda8fd0f-32ed-11f0-9152-fc34974bb26c', 'dda64acf-32ed-11f0-9152-fc34974bb26c', 'dda8eb2e-32ed-11f0-9152-fc34974bb26c', '', ''),
('dda923a4-32ed-11f0-9152-fc34974bb26c', 'dda64acf-32ed-11f0-9152-fc34974bb26c', 'dda91605-32ed-11f0-9152-fc34974bb26c', '', ''),
('dda92d46-32ed-11f0-9152-fc34974bb26c', 'dda64acf-32ed-11f0-9152-fc34974bb26c', '8362e917-3229-11f0-ad72-fc34974bb26c', '', ''),
('dda93f07-32ed-11f0-9152-fc34974bb26c', 'dda64acf-32ed-11f0-9152-fc34974bb26c', 'dda9365e-32ed-11f0-9152-fc34974bb26c', '', ''),
('dda94ff3-32ed-11f0-9152-fc34974bb26c', 'dda64acf-32ed-11f0-9152-fc34974bb26c', 'dda9479c-32ed-11f0-9152-fc34974bb26c', '', ''),
('ddfd7c7a-28c7-11f0-ac1b-fc34974bb26c', '34796f6e-27fe-11f0-b0f6-fc34974bb26c', 'ddfcf55b-28c7-11f0-ac1b-fc34974bb26c', '', ''),
('de089d7f-322a-11f0-ad72-fc34974bb26c', 'de07e551-322a-11f0-ad72-fc34974bb26c', 'de0885cb-322a-11f0-ad72-fc34974bb26c', '', ''),
('de08c45e-322a-11f0-ad72-fc34974bb26c', 'de07e551-322a-11f0-ad72-fc34974bb26c', 'de08b3de-322a-11f0-ad72-fc34974bb26c', '150', 'g'),
('de08e3e1-322a-11f0-ad72-fc34974bb26c', 'de07e551-322a-11f0-ad72-fc34974bb26c', 'de08d333-322a-11f0-ad72-fc34974bb26c', '50', 'g'),
('de0906b4-322a-11f0-ad72-fc34974bb26c', 'de07e551-322a-11f0-ad72-fc34974bb26c', 'de08f3eb-322a-11f0-ad72-fc34974bb26c', '', ''),
('de098123-322a-11f0-ad72-fc34974bb26c', 'de07e551-322a-11f0-ad72-fc34974bb26c', 'de0916f7-322a-11f0-ad72-fc34974bb26c', '', ''),
('de09bbc3-322a-11f0-ad72-fc34974bb26c', 'de07e551-322a-11f0-ad72-fc34974bb26c', 'de09a7f7-322a-11f0-ad72-fc34974bb26c', '', ''),
('de09dfcb-322a-11f0-ad72-fc34974bb26c', 'de07e551-322a-11f0-ad72-fc34974bb26c', 'de09cdb0-322a-11f0-ad72-fc34974bb26c', '', ''),
('de09ff2a-322a-11f0-ad72-fc34974bb26c', 'de07e551-322a-11f0-ad72-fc34974bb26c', 'de09efa9-322a-11f0-ad72-fc34974bb26c', '', ''),
('e1817db7-32e9-11f0-9152-fc34974bb26c', 'e18091a7-32e9-11f0-9152-fc34974bb26c', 'e18149de-32e9-11f0-9152-fc34974bb26c', '150', 'g'),
('e181bc61-32e9-11f0-9152-fc34974bb26c', 'e18091a7-32e9-11f0-9152-fc34974bb26c', '2122738d-2996-11f0-aded-fc34974bb26c', '30', 'g'),
('e181d2da-32e9-11f0-9152-fc34974bb26c', 'e18091a7-32e9-11f0-9152-fc34974bb26c', 'e181c964-32e9-11f0-9152-fc34974bb26c', '', ''),
('e181e480-32e9-11f0-9152-fc34974bb26c', 'e18091a7-32e9-11f0-9152-fc34974bb26c', 'e181dbe8-32e9-11f0-9152-fc34974bb26c', '', ''),
('e181fbb4-32e9-11f0-9152-fc34974bb26c', 'e18091a7-32e9-11f0-9152-fc34974bb26c', 'e181ed7e-32e9-11f0-9152-fc34974bb26c', '', ''),
('e1824856-32e9-11f0-9152-fc34974bb26c', 'e18091a7-32e9-11f0-9152-fc34974bb26c', 'e1823f40-32e9-11f0-9152-fc34974bb26c', '', ''),
('e1825165-32e9-11f0-9152-fc34974bb26c', 'e18091a7-32e9-11f0-9152-fc34974bb26c', 'e3b8fba8-3226-11f0-ad72-fc34974bb26c', '', ''),
('e1826287-32e9-11f0-9152-fc34974bb26c', 'e18091a7-32e9-11f0-9152-fc34974bb26c', 'e1825a36-32e9-11f0-9152-fc34974bb26c', '', ''),
('e18273a7-32e9-11f0-9152-fc34974bb26c', 'e18091a7-32e9-11f0-9152-fc34974bb26c', 'e1826b31-32e9-11f0-9152-fc34974bb26c', '', ''),
('e182850c-32e9-11f0-9152-fc34974bb26c', 'e18091a7-32e9-11f0-9152-fc34974bb26c', 'e1827c83-32e9-11f0-9152-fc34974bb26c', '', ''),
('e18298af-32e9-11f0-9152-fc34974bb26c', 'e18091a7-32e9-11f0-9152-fc34974bb26c', 'e1828faa-32e9-11f0-9152-fc34974bb26c', '', ''),
('e3305cf0-3229-11f0-ad72-fc34974bb26c', 'e32fb110-3229-11f0-ad72-fc34974bb26c', 'e32fee46-3229-11f0-ad72-fc34974bb26c', '800', 'g'),
('e33080f4-3229-11f0-ad72-fc34974bb26c', 'e32fb110-3229-11f0-ad72-fc34974bb26c', 'e33071fd-3229-11f0-ad72-fc34974bb26c', '', ''),
('e3309fbf-3229-11f0-ad72-fc34974bb26c', 'e32fb110-3229-11f0-ad72-fc34974bb26c', 'e3309142-3229-11f0-ad72-fc34974bb26c', '', ''),
('e330c705-3229-11f0-ad72-fc34974bb26c', 'e32fb110-3229-11f0-ad72-fc34974bb26c', 'e330b3d9-3229-11f0-ad72-fc34974bb26c', '', ''),
('e330ee0e-3229-11f0-ad72-fc34974bb26c', 'e32fb110-3229-11f0-ad72-fc34974bb26c', 'e330db4a-3229-11f0-ad72-fc34974bb26c', '', ''),
('e33101d8-3229-11f0-ad72-fc34974bb26c', 'e32fb110-3229-11f0-ad72-fc34974bb26c', '0a8dc8aa-2995-11f0-aded-fc34974bb26c', '', ''),
('e331177f-3229-11f0-ad72-fc34974bb26c', 'e32fb110-3229-11f0-ad72-fc34974bb26c', 'b87d86ef-3228-11f0-ad72-fc34974bb26c', '', ''),
('e3316fcd-3229-11f0-ad72-fc34974bb26c', 'e32fb110-3229-11f0-ad72-fc34974bb26c', 'e3315c40-3229-11f0-ad72-fc34974bb26c', '', ''),
('e33196d5-3229-11f0-ad72-fc34974bb26c', 'e32fb110-3229-11f0-ad72-fc34974bb26c', 'e331806c-3229-11f0-ad72-fc34974bb26c', '', ''),
('e331be77-3229-11f0-ad72-fc34974bb26c', 'e32fb110-3229-11f0-ad72-fc34974bb26c', 'e331ac27-3229-11f0-ad72-fc34974bb26c', '', ''),
('e3b824ef-3226-11f0-ad72-fc34974bb26c', 'e3b7d128-3226-11f0-ad72-fc34974bb26c', 'e3b80e09-3226-11f0-ad72-fc34974bb26c', '500', 'g'),
('e3b8550e-3226-11f0-ad72-fc34974bb26c', 'e3b7d128-3226-11f0-ad72-fc34974bb26c', 'e3b840bb-3226-11f0-ad72-fc34974bb26c', '400', 'g'),
('e3b88407-3226-11f0-ad72-fc34974bb26c', 'e3b7d128-3226-11f0-ad72-fc34974bb26c', 'e3b8708b-3226-11f0-ad72-fc34974bb26c', '350', 'g'),
('e3b89827-3226-11f0-ad72-fc34974bb26c', 'e3b7d128-3226-11f0-ad72-fc34974bb26c', '38449278-2997-11f0-aded-fc34974bb26c', '50', 'g'),
('e3b8befd-3226-11f0-ad72-fc34974bb26c', 'e3b7d128-3226-11f0-ad72-fc34974bb26c', 'e3b8ab4d-3226-11f0-ad72-fc34974bb26c', '', ''),
('e3b8e5c1-3226-11f0-ad72-fc34974bb26c', 'e3b7d128-3226-11f0-ad72-fc34974bb26c', 'e3b8d287-3226-11f0-ad72-fc34974bb26c', '', ''),
('e3b90dfd-3226-11f0-ad72-fc34974bb26c', 'e3b7d128-3226-11f0-ad72-fc34974bb26c', 'e3b8fba8-3226-11f0-ad72-fc34974bb26c', '', ''),
('e3b93500-3226-11f0-ad72-fc34974bb26c', 'e3b7d128-3226-11f0-ad72-fc34974bb26c', 'e3b922d0-3226-11f0-ad72-fc34974bb26c', '50', 'g'),
('e3b95c0d-3226-11f0-ad72-fc34974bb26c', 'e3b7d128-3226-11f0-ad72-fc34974bb26c', 'e3b94851-3226-11f0-ad72-fc34974bb26c', '50', 'g'),
('e7c9c4a2-27fb-11f0-b0f6-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', 'e7c9b2ae-27fb-11f0-b0f6-fc34974bb26c', '160', 'g'),
('ea01ab85-32eb-11f0-9152-fc34974bb26c', 'ea016ec0-32eb-11f0-9152-fc34974bb26c', 'ea0198d7-32eb-11f0-9152-fc34974bb26c', '300', 'g'),
('ea01d5b9-32eb-11f0-9152-fc34974bb26c', 'ea016ec0-32eb-11f0-9152-fc34974bb26c', 'ea01c404-32eb-11f0-9152-fc34974bb26c', '', ''),
('ea01f4ff-32eb-11f0-9152-fc34974bb26c', 'ea016ec0-32eb-11f0-9152-fc34974bb26c', 'ea01e5c4-32eb-11f0-9152-fc34974bb26c', '', ''),
('ea0212c9-32eb-11f0-9152-fc34974bb26c', 'ea016ec0-32eb-11f0-9152-fc34974bb26c', 'ea0206f7-32eb-11f0-9152-fc34974bb26c', '', ''),
('ea022c8d-32eb-11f0-9152-fc34974bb26c', 'ea016ec0-32eb-11f0-9152-fc34974bb26c', 'ea02225d-32eb-11f0-9152-fc34974bb26c', '', ''),
('ea02485c-32eb-11f0-9152-fc34974bb26c', 'ea016ec0-32eb-11f0-9152-fc34974bb26c', 'ea0238d0-32eb-11f0-9152-fc34974bb26c', '', ''),
('ea02dd1a-32eb-11f0-9152-fc34974bb26c', 'ea016ec0-32eb-11f0-9152-fc34974bb26c', 'ea02c9cf-32eb-11f0-9152-fc34974bb26c', '', ''),
('ea0307ff-32eb-11f0-9152-fc34974bb26c', 'ea016ec0-32eb-11f0-9152-fc34974bb26c', 'ea02ed99-32eb-11f0-9152-fc34974bb26c', '', ''),
('eba0f4ad-3486-11f0-8af6-fc34974bb26c', 'eba06a26-3486-11f0-8af6-fc34974bb26c', 'eba0e499-3486-11f0-8af6-fc34974bb26c', '', ''),
('eba1160b-3486-11f0-8af6-fc34974bb26c', 'eba06a26-3486-11f0-8af6-fc34974bb26c', 'eba1049b-3486-11f0-8af6-fc34974bb26c', '', '');
INSERT INTO `recipe_ingredients` (`id`, `recipe_id`, `ingredient_id`, `quantity`, `unit`) VALUES
('eba135e9-3486-11f0-8af6-fc34974bb26c', 'eba06a26-3486-11f0-8af6-fc34974bb26c', 'eba1274c-3486-11f0-8af6-fc34974bb26c', '', ''),
('eba152ee-3486-11f0-8af6-fc34974bb26c', 'eba06a26-3486-11f0-8af6-fc34974bb26c', 'eba144d6-3486-11f0-8af6-fc34974bb26c', '', ''),
('f256468b-3485-11f0-8af6-fc34974bb26c', 'd49c1153-3485-11f0-8af6-fc34974bb26c', 'f2560587-3485-11f0-8af6-fc34974bb26c', '', ''),
('f25675fe-3485-11f0-8af6-fc34974bb26c', 'd49c1153-3485-11f0-8af6-fc34974bb26c', 'f256595c-3485-11f0-8af6-fc34974bb26c', '', ''),
('f256a203-3485-11f0-8af6-fc34974bb26c', 'd49c1153-3485-11f0-8af6-fc34974bb26c', 'f2568858-3485-11f0-8af6-fc34974bb26c', '', ''),
('f256ce17-3485-11f0-8af6-fc34974bb26c', 'd49c1153-3485-11f0-8af6-fc34974bb26c', 'f256b491-3485-11f0-8af6-fc34974bb26c', '', ''),
('f256f32f-3485-11f0-8af6-fc34974bb26c', 'd49c1153-3485-11f0-8af6-fc34974bb26c', 'f256e074-3485-11f0-8af6-fc34974bb26c', '', ''),
('f257124a-3485-11f0-8af6-fc34974bb26c', 'd49c1153-3485-11f0-8af6-fc34974bb26c', 'f25701e1-3485-11f0-8af6-fc34974bb26c', '', ''),
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
('01816b71-322c-11f0-ad72-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', '961dbf55-0535-11f0-a1d9-60a82de70049'),
('018171dd-322c-11f0-ad72-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('0277c974-322d-11f0-ad72-fc34974bb26c', '836230a2-3229-11f0-ad72-fc34974bb26c', '961dc36a-0535-11f0-a1d9-60a82de70049'),
('02d412e0-3227-11f0-ad72-fc34974bb26c', 'e3b7d128-3226-11f0-ad72-fc34974bb26c', '961dc36a-0535-11f0-a1d9-60a82de70049'),
('0a8fa3bf-2995-11f0-aded-fc34974bb26c', '63178aec-27f9-11f0-b0f6-fc34974bb26c', '961dc36a-0535-11f0-a1d9-60a82de70049'),
('11b6e71e-322d-11f0-ad72-fc34974bb26c', '98f76e50-27fe-11f0-b0f6-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('1406caa6-32f5-11f0-9152-fc34974bb26c', '14056a95-32f5-11f0-9152-fc34974bb26c', '961dc36a-0535-11f0-a1d9-60a82de70049'),
('1bb6c154-322c-11f0-ad72-fc34974bb26c', 'f45dfde0-27fe-11f0-b0f6-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('1d9bc666-32eb-11f0-9152-fc34974bb26c', '1d9a4bd8-32eb-11f0-9152-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('248e18ee-32ef-11f0-9152-fc34974bb26c', '248b6b65-32ef-11f0-9152-fc34974bb26c', '961dc36a-0535-11f0-a1d9-60a82de70049'),
('2c295a69-32ed-11f0-9152-fc34974bb26c', '2c27b604-32ed-11f0-9152-fc34974bb26c', '961dc36a-0535-11f0-a1d9-60a82de70049'),
('2c76755f-322c-11f0-ad72-fc34974bb26c', 'd7081b0d-27fd-11f0-b0f6-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('31b472c3-3486-11f0-8af6-fc34974bb26c', '31b36070-3486-11f0-8af6-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('385e2cda-32ec-11f0-9152-fc34974bb26c', '385e0ec5-32ec-11f0-9152-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('3d3d523c-2995-11f0-aded-fc34974bb26c', 'de508421-27f9-11f0-b0f6-fc34974bb26c', '961dc36a-0535-11f0-a1d9-60a82de70049'),
('3f34613d-322c-11f0-ad72-fc34974bb26c', 'de07e551-322a-11f0-ad72-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('42958c58-3485-11f0-8af6-fc34974bb26c', '429293a8-3485-11f0-8af6-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('448bd6f7-32ee-11f0-9152-fc34974bb26c', '448a5cf6-32ee-11f0-9152-fc34974bb26c', '961dc36a-0535-11f0-a1d9-60a82de70049'),
('530aafa1-322c-11f0-ad72-fc34974bb26c', '34796f6e-27fe-11f0-b0f6-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('53dfcee4-3228-11f0-ad72-fc34974bb26c', 'a1ff7a6b-3227-11f0-ad72-fc34974bb26c', '961dc36a-0535-11f0-a1d9-60a82de70049'),
('5b32c1af-32ea-11f0-9152-fc34974bb26c', '5b315bfd-32ea-11f0-9152-fc34974bb26c', '961dc36a-0535-11f0-a1d9-60a82de70049'),
('5b9aa6e2-3487-11f0-8af6-fc34974bb26c', '5b994271-3487-11f0-8af6-fc34974bb26c', '961dc36a-0535-11f0-a1d9-60a82de70049'),
('5ebb423b-32f5-11f0-9152-fc34974bb26c', '5eb93375-32f5-11f0-9152-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('794e9b5d-32ed-11f0-9152-fc34974bb26c', '794d570c-32ed-11f0-9152-fc34974bb26c', '961dc36a-0535-11f0-a1d9-60a82de70049'),
('7a4bdafe-32ef-11f0-9152-fc34974bb26c', '7a4a2b22-32ef-11f0-9152-fc34974bb26c', '961dc36a-0535-11f0-a1d9-60a82de70049'),
('87b78f20-322c-11f0-ad72-fc34974bb26c', '56125b0c-27fc-11f0-b0f6-fc34974bb26c', '961dc36a-0535-11f0-a1d9-60a82de70049'),
('93bdc6aa-3485-11f0-8af6-fc34974bb26c', '93bc1fb6-3485-11f0-8af6-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('99d65680-2995-11f0-aded-fc34974bb26c', 'c540df55-27fc-11f0-b0f6-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('9b899749-322c-11f0-ad72-fc34974bb26c', '5a52f386-27ff-11f0-b0f6-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('9e32e102-32eb-11f0-9152-fc34974bb26c', '9e31662c-32eb-11f0-9152-fc34974bb26c', '961dc36a-0535-11f0-a1d9-60a82de70049'),
('a0cd9144-2fde-11f0-957d-fc34974bb26c', '3c5adf20-27fa-11f0-b0f6-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('a0cd9a33-2fde-11f0-957d-fc34974bb26c', '3c5adf20-27fa-11f0-b0f6-fc34974bb26c', '961dbf55-0535-11f0-a1d9-60a82de70049'),
('a72ba4f5-322b-11f0-ad72-fc34974bb26c', 'a72a97c8-322b-11f0-ad72-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('acd2000b-32ea-11f0-9152-fc34974bb26c', 'accffb24-32ea-11f0-9152-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('ad8e001f-322c-11f0-ad72-fc34974bb26c', '629888f3-27fb-11f0-b0f6-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('afd30d67-3486-11f0-8af6-fc34974bb26c', 'afd085d1-3486-11f0-8af6-fc34974bb26c', '961dbf55-0535-11f0-a1d9-60a82de70049'),
('b87da9da-3228-11f0-ad72-fc34974bb26c', 'b87b67af-3228-11f0-ad72-fc34974bb26c', '961dc36a-0535-11f0-a1d9-60a82de70049'),
('c3e0fdf0-32ee-11f0-9152-fc34974bb26c', 'c3dfb511-32ee-11f0-9152-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('c463d950-2995-11f0-aded-fc34974bb26c', 'a0a25ede-27fa-11f0-b0f6-fc34974bb26c', '961dc36a-0535-11f0-a1d9-60a82de70049'),
('c88cc126-322c-11f0-ad72-fc34974bb26c', 'fcb54590-27fa-11f0-b0f6-fc34974bb26c', '961dc36a-0535-11f0-a1d9-60a82de70049'),
('dda9595a-32ed-11f0-9152-fc34974bb26c', 'dda64acf-32ed-11f0-9152-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('e182e189-32e9-11f0-9152-fc34974bb26c', 'e18091a7-32e9-11f0-9152-fc34974bb26c', '961dbf55-0535-11f0-a1d9-60a82de70049'),
('e331cab2-3229-11f0-ad72-fc34974bb26c', 'e32fb110-3229-11f0-ad72-fc34974bb26c', '961dc36a-0535-11f0-a1d9-60a82de70049'),
('ea035ebb-32eb-11f0-9152-fc34974bb26c', 'ea016ec0-32eb-11f0-9152-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('eba15cf2-3486-11f0-8af6-fc34974bb26c', 'eba06a26-3486-11f0-8af6-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
('ef98ab62-322c-11f0-ad72-fc34974bb26c', '7a71e1bc-322a-11f0-ad72-fc34974bb26c', '961dc36a-0535-11f0-a1d9-60a82de70049'),
('f2572792-3485-11f0-8af6-fc34974bb26c', 'd49c1153-3485-11f0-8af6-fc34974bb26c', '961dc304-0535-11f0-a1d9-60a82de70049'),
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
('0180eeb0-322c-11f0-ad72-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('01815b1a-322c-11f0-ad72-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', '030eac1b-0536-11f0-a1d9-60a82de70049'),
('0277c258-322d-11f0-ad72-fc34974bb26c', '836230a2-3229-11f0-ad72-fc34974bb26c', '9dabffaf-21b5-11f0-8cfe-6d7e2f6fa0d7'),
('02d40b88-3227-11f0-ad72-fc34974bb26c', 'e3b7d128-3226-11f0-ad72-fc34974bb26c', '9dabffaf-21b5-11f0-8cfe-6d7e2f6fa0d7'),
('0a8f51d6-2995-11f0-aded-fc34974bb26c', '63178aec-27f9-11f0-b0f6-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('0a8f571b-2995-11f0-aded-fc34974bb26c', '63178aec-27f9-11f0-b0f6-fc34974bb26c', '030eac1b-0536-11f0-a1d9-60a82de70049'),
('11b6de1f-322d-11f0-ad72-fc34974bb26c', '98f76e50-27fe-11f0-b0f6-fc34974bb26c', '030eac1b-0536-11f0-a1d9-60a82de70049'),
('1406c403-32f5-11f0-9152-fc34974bb26c', '14056a95-32f5-11f0-9152-fc34974bb26c', '9dabffaf-21b5-11f0-8cfe-6d7e2f6fa0d7'),
('1bb6465c-322c-11f0-ad72-fc34974bb26c', 'f45dfde0-27fe-11f0-b0f6-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('1d9bbdb3-32eb-11f0-9152-fc34974bb26c', '1d9a4bd8-32eb-11f0-9152-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('248e0ce4-32ef-11f0-9152-fc34974bb26c', '248b6b65-32ef-11f0-9152-fc34974bb26c', '9dabffaf-21b5-11f0-8cfe-6d7e2f6fa0d7'),
('2c2951b3-32ed-11f0-9152-fc34974bb26c', '2c27b604-32ed-11f0-9152-fc34974bb26c', '9dabffaf-21b5-11f0-8cfe-6d7e2f6fa0d7'),
('2c76694f-322c-11f0-ad72-fc34974bb26c', 'd7081b0d-27fd-11f0-b0f6-fc34974bb26c', '9dabffaf-21b5-11f0-8cfe-6d7e2f6fa0d7'),
('31b46b98-3486-11f0-8af6-fc34974bb26c', '31b36070-3486-11f0-8af6-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('385e27b4-32ec-11f0-9152-fc34974bb26c', '385e0ec5-32ec-11f0-9152-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('3d3d483f-2995-11f0-aded-fc34974bb26c', 'de508421-27f9-11f0-b0f6-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('3f3455e6-322c-11f0-ad72-fc34974bb26c', 'de07e551-322a-11f0-ad72-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('42954163-3485-11f0-8af6-fc34974bb26c', '429293a8-3485-11f0-8af6-fc34974bb26c', '030eac1b-0536-11f0-a1d9-60a82de70049'),
('42957462-3485-11f0-8af6-fc34974bb26c', '429293a8-3485-11f0-8af6-fc34974bb26c', '030eac2e-0536-11f0-a1d9-60a82de70049'),
('448bce3e-32ee-11f0-9152-fc34974bb26c', '448a5cf6-32ee-11f0-9152-fc34974bb26c', '030eac1b-0536-11f0-a1d9-60a82de70049'),
('530a3e94-322c-11f0-ad72-fc34974bb26c', '34796f6e-27fe-11f0-b0f6-fc34974bb26c', '030eac1b-0536-11f0-a1d9-60a82de70049'),
('530a4641-322c-11f0-ad72-fc34974bb26c', '34796f6e-27fe-11f0-b0f6-fc34974bb26c', '030eac2e-0536-11f0-a1d9-60a82de70049'),
('53dfc724-3228-11f0-ad72-fc34974bb26c', 'a1ff7a6b-3227-11f0-ad72-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('5b32b468-32ea-11f0-9152-fc34974bb26c', '5b315bfd-32ea-11f0-9152-fc34974bb26c', '9dabffaf-21b5-11f0-8cfe-6d7e2f6fa0d7'),
('5b32ba99-32ea-11f0-9152-fc34974bb26c', '5b315bfd-32ea-11f0-9152-fc34974bb26c', '030eac1b-0536-11f0-a1d9-60a82de70049'),
('5b9aa2fa-3487-11f0-8af6-fc34974bb26c', '5b994271-3487-11f0-8af6-fc34974bb26c', '9dabffaf-21b5-11f0-8cfe-6d7e2f6fa0d7'),
('5ebb3ebe-32f5-11f0-9152-fc34974bb26c', '5eb93375-32f5-11f0-9152-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('794e97c1-32ed-11f0-9152-fc34974bb26c', '794d570c-32ed-11f0-9152-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('7a4bd53a-32ef-11f0-9152-fc34974bb26c', '7a4a2b22-32ef-11f0-9152-fc34974bb26c', '9dabffaf-21b5-11f0-8cfe-6d7e2f6fa0d7'),
('87b788c4-322c-11f0-ad72-fc34974bb26c', '56125b0c-27fc-11f0-b0f6-fc34974bb26c', '9dabffaf-21b5-11f0-8cfe-6d7e2f6fa0d7'),
('93bdbde4-3485-11f0-8af6-fc34974bb26c', '93bc1fb6-3485-11f0-8af6-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('99d64f3b-2995-11f0-aded-fc34974bb26c', 'c540df55-27fc-11f0-b0f6-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('9b898f85-322c-11f0-ad72-fc34974bb26c', '5a52f386-27ff-11f0-b0f6-fc34974bb26c', '030eac1b-0536-11f0-a1d9-60a82de70049'),
('9e32a272-32eb-11f0-9152-fc34974bb26c', '9e31662c-32eb-11f0-9152-fc34974bb26c', '9dabffaf-21b5-11f0-8cfe-6d7e2f6fa0d7'),
('a0cd6768-2fde-11f0-957d-fc34974bb26c', '3c5adf20-27fa-11f0-b0f6-fc34974bb26c', '9dabffaf-21b5-11f0-8cfe-6d7e2f6fa0d7'),
('a0cd70f8-2fde-11f0-957d-fc34974bb26c', '3c5adf20-27fa-11f0-b0f6-fc34974bb26c', '030eac2e-0536-11f0-a1d9-60a82de70049'),
('a72ba187-322b-11f0-ad72-fc34974bb26c', 'a72a97c8-322b-11f0-ad72-fc34974bb26c', '9dabffaf-21b5-11f0-8cfe-6d7e2f6fa0d7'),
('acd1f9de-32ea-11f0-9152-fc34974bb26c', 'accffb24-32ea-11f0-9152-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('ad8def4c-322c-11f0-ad72-fc34974bb26c', '629888f3-27fb-11f0-b0f6-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('afd3076a-3486-11f0-8af6-fc34974bb26c', 'afd085d1-3486-11f0-8af6-fc34974bb26c', '9dabffaf-21b5-11f0-8cfe-6d7e2f6fa0d7'),
('b87da0b5-3228-11f0-ad72-fc34974bb26c', 'b87b67af-3228-11f0-ad72-fc34974bb26c', '9dabffaf-21b5-11f0-8cfe-6d7e2f6fa0d7'),
('c3e0f776-32ee-11f0-9152-fc34974bb26c', 'c3dfb511-32ee-11f0-9152-fc34974bb26c', '030eac1b-0536-11f0-a1d9-60a82de70049'),
('c3e0fadd-32ee-11f0-9152-fc34974bb26c', 'c3dfb511-32ee-11f0-9152-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('c4638912-2995-11f0-aded-fc34974bb26c', 'a0a25ede-27fa-11f0-b0f6-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('c88cba85-322c-11f0-ad72-fc34974bb26c', 'fcb54590-27fa-11f0-b0f6-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('dda95303-32ed-11f0-9152-fc34974bb26c', 'dda64acf-32ed-11f0-9152-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('dda95658-32ed-11f0-9152-fc34974bb26c', 'dda64acf-32ed-11f0-9152-fc34974bb26c', '030eac1b-0536-11f0-a1d9-60a82de70049'),
('e182ba3a-32e9-11f0-9152-fc34974bb26c', 'e18091a7-32e9-11f0-9152-fc34974bb26c', '9dabffaf-21b5-11f0-8cfe-6d7e2f6fa0d7'),
('e331c417-3229-11f0-ad72-fc34974bb26c', 'e32fb110-3229-11f0-ad72-fc34974bb26c', '9dabffaf-21b5-11f0-8cfe-6d7e2f6fa0d7'),
('ea0355af-32eb-11f0-9152-fc34974bb26c', 'ea016ec0-32eb-11f0-9152-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('ea035a48-32eb-11f0-9152-fc34974bb26c', 'ea016ec0-32eb-11f0-9152-fc34974bb26c', '030eac1b-0536-11f0-a1d9-60a82de70049'),
('eba158c1-3486-11f0-8af6-fc34974bb26c', 'eba06a26-3486-11f0-8af6-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
('ef98a486-322c-11f0-ad72-fc34974bb26c', '7a71e1bc-322a-11f0-ad72-fc34974bb26c', '9dabffaf-21b5-11f0-8cfe-6d7e2f6fa0d7'),
('f2571a64-3485-11f0-8af6-fc34974bb26c', 'd49c1153-3485-11f0-8af6-fc34974bb26c', '030eab9f-0536-11f0-a1d9-60a82de70049'),
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
('0181d402-322c-11f0-ad72-fc34974bb26c', 'e7c9817a-27fb-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('02786c6a-322d-11f0-ad72-fc34974bb26c', '836230a2-3229-11f0-ad72-fc34974bb26c', '87115113-0536-11f0-a1d9-60a82de70049'),
('02d420eb-3227-11f0-ad72-fc34974bb26c', 'e3b7d128-3226-11f0-ad72-fc34974bb26c', 'f231139b-3226-11f0-ad72-fc34974bb26c'),
('0a8ffa21-2995-11f0-aded-fc34974bb26c', '63178aec-27f9-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('11b6f8eb-322d-11f0-ad72-fc34974bb26c', '98f76e50-27fe-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('1406d798-32f5-11f0-9152-fc34974bb26c', '14056a95-32f5-11f0-9152-fc34974bb26c', '87115113-0536-11f0-a1d9-60a82de70049'),
('1bb74189-322c-11f0-ad72-fc34974bb26c', 'f45dfde0-27fe-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('1d9c489d-32eb-11f0-9152-fc34974bb26c', '1d9a4bd8-32eb-11f0-9152-fc34974bb26c', '87115113-0536-11f0-a1d9-60a82de70049'),
('248e2fc6-32ef-11f0-9152-fc34974bb26c', '248b6b65-32ef-11f0-9152-fc34974bb26c', '87115113-0536-11f0-a1d9-60a82de70049'),
('2c2a493d-32ed-11f0-9152-fc34974bb26c', '2c27b604-32ed-11f0-9152-fc34974bb26c', '87115113-0536-11f0-a1d9-60a82de70049'),
('2c76e8d6-322c-11f0-ad72-fc34974bb26c', 'd7081b0d-27fd-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('31b482d7-3486-11f0-8af6-fc34974bb26c', '31b36070-3486-11f0-8af6-fc34974bb26c', '87115057-0536-11f0-a1d9-60a82de70049'),
('385e33f1-32ec-11f0-9152-fc34974bb26c', '385e0ec5-32ec-11f0-9152-fc34974bb26c', '87115113-0536-11f0-a1d9-60a82de70049'),
('3d3d6070-2995-11f0-aded-fc34974bb26c', 'de508421-27f9-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('3f350355-322c-11f0-ad72-fc34974bb26c', 'de07e551-322a-11f0-ad72-fc34974bb26c', '87115113-0536-11f0-a1d9-60a82de70049'),
('4295e548-3485-11f0-8af6-fc34974bb26c', '429293a8-3485-11f0-8af6-fc34974bb26c', '87115057-0536-11f0-a1d9-60a82de70049'),
('448be789-32ee-11f0-9152-fc34974bb26c', '448a5cf6-32ee-11f0-9152-fc34974bb26c', '87115113-0536-11f0-a1d9-60a82de70049'),
('530b0ed6-322c-11f0-ad72-fc34974bb26c', '34796f6e-27fe-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('53e03d44-3228-11f0-ad72-fc34974bb26c', 'a1ff7a6b-3227-11f0-ad72-fc34974bb26c', '87114d89-0536-11f0-a1d9-60a82de70049'),
('5b32cde6-32ea-11f0-9152-fc34974bb26c', '5b315bfd-32ea-11f0-9152-fc34974bb26c', '87115113-0536-11f0-a1d9-60a82de70049'),
('5b9aada3-3487-11f0-8af6-fc34974bb26c', '5b994271-3487-11f0-8af6-fc34974bb26c', '87115057-0536-11f0-a1d9-60a82de70049'),
('5ebb65ea-32f5-11f0-9152-fc34974bb26c', '5eb93375-32f5-11f0-9152-fc34974bb26c', '87115113-0536-11f0-a1d9-60a82de70049'),
('794ea238-32ed-11f0-9152-fc34974bb26c', '794d570c-32ed-11f0-9152-fc34974bb26c', '87115113-0536-11f0-a1d9-60a82de70049'),
('7a4c5d93-32ef-11f0-9152-fc34974bb26c', '7a4a2b22-32ef-11f0-9152-fc34974bb26c', '87115113-0536-11f0-a1d9-60a82de70049'),
('87b89e0c-322c-11f0-ad72-fc34974bb26c', '56125b0c-27fc-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('93bdda36-3485-11f0-8af6-fc34974bb26c', '93bc1fb6-3485-11f0-8af6-fc34974bb26c', '87115057-0536-11f0-a1d9-60a82de70049'),
('99d6afc4-2995-11f0-aded-fc34974bb26c', 'c540df55-27fc-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('9b8a5a31-322c-11f0-ad72-fc34974bb26c', '5a52f386-27ff-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('9e333335-32eb-11f0-9152-fc34974bb26c', '9e31662c-32eb-11f0-9152-fc34974bb26c', '87115113-0536-11f0-a1d9-60a82de70049'),
('a0ce3cd9-2fde-11f0-957d-fc34974bb26c', '3c5adf20-27fa-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('a72bab67-322b-11f0-ad72-fc34974bb26c', 'a72a97c8-322b-11f0-ad72-fc34974bb26c', '87115113-0536-11f0-a1d9-60a82de70049'),
('acd20c37-32ea-11f0-9152-fc34974bb26c', 'accffb24-32ea-11f0-9152-fc34974bb26c', '87115113-0536-11f0-a1d9-60a82de70049'),
('ad8e78cb-322c-11f0-ad72-fc34974bb26c', '629888f3-27fb-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('afd31933-3486-11f0-8af6-fc34974bb26c', 'afd085d1-3486-11f0-8af6-fc34974bb26c', '87115057-0536-11f0-a1d9-60a82de70049'),
('b87dc779-3228-11f0-ad72-fc34974bb26c', 'b87b67af-3228-11f0-ad72-fc34974bb26c', '87114d89-0536-11f0-a1d9-60a82de70049'),
('c3e16660-32ee-11f0-9152-fc34974bb26c', 'c3dfb511-32ee-11f0-9152-fc34974bb26c', '87115113-0536-11f0-a1d9-60a82de70049'),
('c463e73c-2995-11f0-aded-fc34974bb26c', 'a0a25ede-27fa-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('c88d9cab-322c-11f0-ad72-fc34974bb26c', 'fcb54590-27fa-11f0-b0f6-fc34974bb26c', '871150e1-0536-11f0-a1d9-60a82de70049'),
('dda95fa9-32ed-11f0-9152-fc34974bb26c', 'dda64acf-32ed-11f0-9152-fc34974bb26c', '87115113-0536-11f0-a1d9-60a82de70049'),
('e1833596-32e9-11f0-9152-fc34974bb26c', 'e18091a7-32e9-11f0-9152-fc34974bb26c', '87115113-0536-11f0-a1d9-60a82de70049'),
('e331daa6-3229-11f0-ad72-fc34974bb26c', 'e32fb110-3229-11f0-ad72-fc34974bb26c', '87115113-0536-11f0-a1d9-60a82de70049'),
('ea0366e9-32eb-11f0-9152-fc34974bb26c', 'ea016ec0-32eb-11f0-9152-fc34974bb26c', '87115113-0536-11f0-a1d9-60a82de70049'),
('eba16353-3486-11f0-8af6-fc34974bb26c', 'eba06a26-3486-11f0-8af6-fc34974bb26c', '87115057-0536-11f0-a1d9-60a82de70049'),
('ef990fe1-322c-11f0-ad72-fc34974bb26c', '7a71e1bc-322a-11f0-ad72-fc34974bb26c', '87115113-0536-11f0-a1d9-60a82de70049'),
('f257a92b-3485-11f0-8af6-fc34974bb26c', 'd49c1153-3485-11f0-8af6-fc34974bb26c', '871150cc-0536-11f0-a1d9-60a82de70049'),
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
('1ad4c569-3222-11f0-ad72-fc34974bb26c', 1, 'nghiệp', 'admin@gmail.com', '$2b$10$Ip8vq7fEHKgP74QBC5/T5O/oYPbSHB9l34L/hVeWGrEiRuHbjNWmy', '2025-05-16 13:50:50', 1, '2001-09-22 00:00:00', NULL, 'resources/default-avatar.png'),
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
('6905df98-3223-11f0-ad72-fc34974bb26c', '6cea5cdc-0880-11f0-9ee4-57838c346148', '5a52f386-27ff-11f0-b0f6-fc34974bb26c', 1, 2),
('6a8cfb04-3223-11f0-ad72-fc34974bb26c', '6cea5cdc-0880-11f0-9ee4-57838c346148', '34796f6e-27fe-11f0-b0f6-fc34974bb26c', 1, 3),
('6d73fed5-3223-11f0-ad72-fc34974bb26c', '6cea5cdc-0880-11f0-9ee4-57838c346148', '56125b0c-27fc-11f0-b0f6-fc34974bb26c', 1, 1),
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
