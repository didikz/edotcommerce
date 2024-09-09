-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: percona:3306
-- Generation Time: Sep 09, 2024 at 03:40 PM
-- Server version: 5.7.35-38
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edotcommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `unique_identifier` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) NOT NULL,
  `cart_id` bigint(20) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `warehouse_id` bigint(20) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT '1',
  `price` bigint(20) NOT NULL,
  `product_snapshot` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`, `version`) VALUES
(1, 'fashion', 'fashion', 1, '2024-09-09 14:47:06', '2024-09-09 14:47:06', 0),
(2, 'electronic', 'electronic', 1, '2024-09-09 14:47:06', '2024-09-09 14:47:06', 0);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `timestamp`, `name`) VALUES
(4, 1725684174022, 'CreateUserTable1725684174022'),
(6, 1725858203166, 'CreateProductsTable1725858203166'),
(8, 1725886809903, 'CreateWarehouseTable1725886809903'),
(9, 1725887251490, 'CreateProductWarehousePivot1725887251490'),
(10, 1725888318745, 'CreateCartTable1725888318745'),
(12, 1725891035138, 'CreateProductReservationTable1725891035138'),
(13, 1725892013908, 'CreateOrdersTable1725892013908'),
(14, 1725892762719, 'CreateOrderItemsTable1725892762719');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `shipment_name` varchar(255) NOT NULL,
  `shipment_phone` varchar(255) NOT NULL,
  `shipment_address` varchar(255) NOT NULL,
  `shipment_province` varchar(255) NOT NULL,
  `shipment_city` varchar(255) NOT NULL,
  `shipment_postal_code` varchar(10) DEFAULT NULL,
  `shipment_provider` varchar(255) NOT NULL,
  `shipment_tracking_number` varchar(255) DEFAULT NULL,
  `shipment_fee` bigint(20) NOT NULL DEFAULT '0',
  `total_product_amount` bigint(20) NOT NULL DEFAULT '0',
  `total_amount` bigint(20) NOT NULL DEFAULT '0',
  `notes` text,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `paid_at` timestamp NULL DEFAULT NULL,
  `processed_at` timestamp NULL DEFAULT NULL,
  `shipped_at` timestamp NULL DEFAULT NULL,
  `received_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `version` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `warehouse_id` bigint(20) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '1',
  `price` bigint(20) NOT NULL DEFAULT '0',
  `total_price` bigint(20) NOT NULL DEFAULT '0',
  `product_snapshot` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` bigint(20) NOT NULL DEFAULT '0',
  `stock` int(11) NOT NULL DEFAULT '0',
  `qty_reserved` int(11) NOT NULL DEFAULT '0',
  `main_image` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `category_id` bigint(20) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `sku`, `slug`, `description`, `price`, `stock`, `qty_reserved`, `main_image`, `status`, `category_id`, `created_at`, `updated_at`, `version`) VALUES
(1, 'lorem ipsum', 'lr-1', 'lorem-ipsum-lr-1', 'lorem ipsum dolor sit amet', 100000, 90, 0, 'https://picsum.photos/200/300', 1, 1, '2024-09-09 14:54:37', '2024-09-09 14:54:37', 1),
(2, 'lorem ipsum 2', 'lr-2', 'lorem-ipsum-2-lr-2', 'lorem ipsum dolor sit amet. lorem ipsum dolor sit amet', 200000, 50, 0, 'https://picsum.photos/200/300', 1, 2, '2024-09-09 14:54:37', '2024-09-09 14:54:37', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `url` varchar(255) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `url`, `caption`, `created_at`, `updated_at`, `version`) VALUES
(1, 1, 'https://picsum.photos/200/300', 'lorem ipsum', '2024-09-09 14:55:45', '2024-09-09 14:57:18', 0),
(2, 1, 'https://picsum.photos/200/300', 'lorem ipsum2', '2024-09-09 14:55:45', '2024-09-09 14:56:45', 1),
(3, 2, 'https://picsum.photos/200/300', 'lorem ipsum2', '2024-09-09 14:55:45', '2024-09-09 14:56:45', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_reservations`
--

CREATE TABLE `product_reservations` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `warehouse_id` bigint(20) DEFAULT NULL,
  `cart_id` bigint(20) NOT NULL,
  `reserved_qty` int(11) NOT NULL DEFAULT '0',
  `expired_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_warehouse`
--

CREATE TABLE `product_warehouse` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `warehouse_id` bigint(20) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_warehouse`
--

INSERT INTO `product_warehouse` (`id`, `product_id`, `warehouse_id`, `stock`, `created_at`, `updated_at`, `version`) VALUES
(1, 1, 1, 50, '2024-09-09 15:00:13', '2024-09-09 15:00:13', 1),
(2, 1, 2, 40, '2024-09-09 15:00:13', '2024-09-09 15:00:13', 0),
(3, 2, 1, 20, '2024-09-09 15:00:33', '2024-09-09 15:00:33', 0),
(4, 2, 2, 30, '2024-09-09 15:00:33', '2024-09-09 15:00:33', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `version` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `address`, `city`, `status`, `version`, `email`, `phone`, `password`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'Boulevard', 'Malang', 1, 1, 'johndoe@gmail.com', '08123456789', '$2b$10$0192V1zB3IbKIPHKEGry1u7t7JzGRn7Re6Dx4lpZi5LXcNiSbW.Fy', '2024-09-08 15:20:00.288606', '2024-09-08 17:02:27.768159');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `code`, `address`, `province`, `city`, `is_default`, `created_at`, `updated_at`, `version`) VALUES
(1, 'warehouse jakarta', 'wh-jkt-1', 'Jl soekarno-hatta', 'DKI Jakarta', 'jakara pusat', 1, '2024-09-09 14:58:36', '2024-09-09 14:58:36', 0),
(2, 'warehouse Bandung', 'wh-bdg-1', 'Jl soekarno-hatta', 'Jawa Barat', 'Bandung', 0, '2024-09-09 14:58:36', '2024-09-09 14:58:36', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_f249e5751fc8532763d3b900baa` (`unique_identifier`),
  ADD KEY `IDX_CARTS_USER_ID_STATUS` (`user_id`,`status`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_cart_item_product_id` (`product_id`),
  ADD KEY `foreign_cart_item_warehouse_id` (`warehouse_id`),
  ADD KEY `foreign_cart_item_cart` (`cart_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_420d9f679d41281f282f5bc7d09` (`slug`),
  ADD KEY `IDX_CATEGORIES_NAME` (`name`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_ORDERS_USER_ID` (`user_id`),
  ADD KEY `IDX_ORDERS_STATUS_CREATED_AT` (`status`,`created_at`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_ORDER_ITEMS_ORDER_ID` (`order_id`),
  ADD KEY `IDX_ORDER_ITEMS_PRODUCT_ID` (`product_id`),
  ADD KEY `IDX_ORDER_ITEMS_WAREHOUSE_ID` (`warehouse_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_464f927ae360106b783ed0b4106` (`slug`),
  ADD KEY `IDX_PRODUCTS_NAME` (`name`),
  ADD KEY `IDX_PRODUCTS_SLUG` (`slug`),
  ADD KEY `IDX_CATEGORY_ID` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_PRODUCT_IMAGES_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `product_reservations`
--
ALTER TABLE `product_reservations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_0c117e2d96f40fe373d5c1cb3eb` (`cart_id`),
  ADD KEY `IDX_PRODUCT_RESERVATION_PRODUCT_ID_WAREHOUSE_ID` (`product_id`,`warehouse_id`),
  ADD KEY `foreign_product_reservations_warehosue_id` (`warehouse_id`);

--
-- Indexes for table `product_warehouse`
--
ALTER TABLE `product_warehouse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_PRODUCT_ID_WAREHOUSE_ID` (`product_id`,`warehouse_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_97672ac88f789774dd47f7c8be` (`email`),
  ADD UNIQUE KEY `IDX_a000cca60bcf04454e72769949` (`phone`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_d8b96d60ff9a288f5ed862280d9` (`code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_reservations`
--
ALTER TABLE `product_reservations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_warehouse`
--
ALTER TABLE `product_warehouse`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `foreign_cart_item_cart` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_cart_item_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `foreign_cart_item_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `foreign_orders_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `foreign_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_orders_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_orders_warehouse_id` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `foreign_product_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `foreign_product_images_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_reservations`
--
ALTER TABLE `product_reservations`
  ADD CONSTRAINT `foreign_product_reservations_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_product_reservations_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_product_reservations_warehosue_id` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
