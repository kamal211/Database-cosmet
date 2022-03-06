-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 06, 2022 at 08:53 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customerCode` int(11) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `adress` varchar(254) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `orderID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `orderedQuantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL,
  `customerCode` int(11) NOT NULL,
  `orderDate` datetime DEFAULT NULL,
  `deliveryAddress` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productID` int(11) NOT NULL,
  `productName` varchar(254) DEFAULT NULL,
  `description` varchar(254) DEFAULT NULL,
  `unitPrice` decimal(8,0) DEFAULT NULL,
  `quantityInStock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productID`, `productName`, `description`, `unitPrice`, `quantityInStock`) VALUES
(1, 'Shampoing solide cheveux secs', 'Parfait pour les cheveux secs et fourchus, ce shampoing solide bio nourrit en profondeur la fibre capillaire et apporte de la brillance aux cheveux. ', '90', 500),
(2, '\r\nTisane de framboisier bio', 'Très connue dans les pays anglo-saxons où elle est couramment préconisé, la tisane de feuilles de framboisier est utilisée pour la préparation de l’accouchement au-delà de 6 mois de grossesse.', '75', 100),
(3, 'Baume à lèvres bio SPF30 haute protection', 'Conditionnement : Flacon de 15 ml\r\n\r\nCertification biologique : Ecocert\r\n\r\nOrigine : France\r\n\r\nIngrédients :\r\n\r\n99.9% du total des ingrédients sont d’origine naturelle.\r\n24% du total des ingrédients végétaux sont issus de l’agriculture biologique.', '190', 30),
(4, 'Spray solaire SPF50+ bio Alga Maris', 'Indication : Idéal pour les peaux mixtes\r\n\r\nSans parfum, adapté pour les bébés à partir de 6 mois.\r\n\r\nConditionnement : Flacon de 100 ml\r\n\r\nCertification biologique : Ecocert\r\n\r\nOrigine : France', '217', 50),
(5, 'Prim Aloe – Gelée d’Aloès Bio 98%', 'Ce gel natif possède des qualités exceptionnelles pour le soin de la peau. Notamment grâce à la présence des polysaccarides qui maintiennent l’hydratation de la plante, capable de survivre en milieu aride ou désertique.', '390', 23);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerCode`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`orderID`,`productID`),
  ADD KEY `FK_commande_dans` (`productID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `FK_commander` (`customerCode`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `FK_Contient` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`),
  ADD CONSTRAINT `FK_commande_dans` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_commander` FOREIGN KEY (`customerCode`) REFERENCES `customers` (`customerCode`);
COMMIT;

Delete From OrderDetail;

Delete From Orders;

Delete From Products;

Delete From Customers;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
