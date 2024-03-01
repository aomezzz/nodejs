-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2023 at 10:21 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kfc`
--
create Database KFC2 CHARACTER SET utf8 COLLATE utf8_general_ci;
use KFC2 ;
-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `customerID` varchar(10) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `houseNo` varchar(10) NOT NULL,
  `subDistrict` varchar(30) NOT NULL,
  `district` varchar(20) NOT NULL,
  `province` varchar(20) NOT NULL,
  `zipcode` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`customerID`, `firstName`, `surname`, `houseNo`, `subDistrict`, `district`, `province`, `zipcode`) VALUES
('1001', 'สมชาย', 'การดี', '1/53', 'วังตะกู', 'เมือง', 'นครปฐม', '73000'),
('1002', 'ทิวา', 'พลากร', '42/153', 'ทัพหลวง', 'เมือง', 'นครปฐม', '73000'),
('1003', 'วันดี', 'แซ่อึ๊ง', '68', 'สนามจันทร์', 'เมือง', 'นครปฐม', '73000');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_food`
--

CREATE TABLE `tbl_food` (
  `foodID` varchar(10) NOT NULL,
  `foodName` varchar(20) NOT NULL,
  `foodDescription` varchar(300) NOT NULL,
  `foodPrice` int(11) NOT NULL,
  `MenuID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_food`
--

INSERT INTO `tbl_food` (`foodID`, `foodName`, `foodDescription`, `foodPrice`, `MenuID`) VALUES
('1', 'ไก่ทอดสูตรผู้พัน', 'ไก่โครตนุ่ม', 37, '01'),
('2', 'ไก่ฮอทแอนด์สไปซี่', 'แซ่บๆ', 37, '01'),
('3', 'ข้าวผู้พันแซ่บ', 'ไม่อร่อยแต่สั่งทุกครั้ง', 69, '02'),
('4', 'ข้าวผู้พันซี๊ด', 'อร่อยมากๆ', 69, '02');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `menuID` varchar(10) NOT NULL,
  `menuName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`menuID`, `menuName`) VALUES
('01', 'ไก่'),
('02', 'ข้าวและโบว์ล'),
('03', 'เบอร์เกอร์'),
('04', 'ทานเล่น'),
('05', 'เครื่องเคียง');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `orderID` varchar(10) NOT NULL,
  `customerID` varchar(10) NOT NULL,
  `dates` date NOT NULL,
  `times` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_orders`
--

INSERT INTO `tbl_orders` (`orderID`, `customerID`, `dates`, `times`) VALUES
('01', '1001', '2021-09-02', '11:00:15'),
('02', '1002', '2021-09-01', '07:15:00'),
('03', '1001', '2021-09-03', '18:00:15'),
('04', '1003', '2021-09-03', '20:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders_detail`
--

CREATE TABLE `tbl_orders_detail` (
  `OrderID` varchar(10) NOT NULL,
  `foodID` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_orders_detail`
--

INSERT INTO `tbl_orders_detail` (`OrderID`, `foodID`, `quantity`) VALUES
('01', '1', 3),
('01', '2', 3),
('01', '4', 3),
('02', '1', 5),
('02', '4', 1),
('03', '1', 2),
('04', '1', 2),
('04', '2', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `tbl_food`
--
ALTER TABLE `tbl_food`
  ADD PRIMARY KEY (`foodID`),
  ADD KEY `tbl_food_ibfk_1` (`MenuID`);

--
-- Indexes for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`menuID`);

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `tbl_orders_ibfk_1` (`customerID`);

--
-- Indexes for table `tbl_orders_detail`
--
ALTER TABLE `tbl_orders_detail`
  ADD PRIMARY KEY (`OrderID`,`foodID`),
  ADD KEY `tbl_orders_detail_ibfk_2` (`foodID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_food`
--
ALTER TABLE `tbl_food`
  ADD CONSTRAINT `tbl_food_ibfk_1` FOREIGN KEY (`MenuID`) REFERENCES `tbl_menu` (`menuID`);

--
-- Constraints for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD CONSTRAINT `tbl_orders_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `tbl_customer` (`customerID`);

--
-- Constraints for table `tbl_orders_detail`
--
ALTER TABLE `tbl_orders_detail`
  ADD CONSTRAINT `tbl_orders_detail_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `tbl_orders` (`orderID`),
  ADD CONSTRAINT `tbl_orders_detail_ibfk_2` FOREIGN KEY (`foodID`) REFERENCES `tbl_food` (`foodID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
