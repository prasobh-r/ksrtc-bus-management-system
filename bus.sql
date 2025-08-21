-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2023 at 07:11 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus_routes`
--

CREATE TABLE `bus_routes` (
  `route_id` int(11) NOT NULL,
  `route_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus_routes`
--

INSERT INTO `bus_routes` (`route_id`, `route_name`) VALUES
(1, 'Aluva-Munnar'),
(2, 'Munnar-Aluva'),
(3, 'Kottayam-Rajakkad'),
(4, 'Aluva-Thrissur'),
(5, 'Thrissur-Aluva'),
(6, 'Aluva-Palakkad'),
(7, 'Rajakkad-Kottayam'),
(8, 'Palakkad-Aluva'),
(10, 'Thrissur-Angamaly');

-- --------------------------------------------------------

--
-- Table structure for table `bus_services`
--

CREATE TABLE `bus_services` (
  `serv_id` int(11) NOT NULL,
  `type` varchar(15) NOT NULL,
  `route_id` int(11) NOT NULL,
  `s_time` time NOT NULL,
  `e_time` time NOT NULL,
  `status` varchar(30) NOT NULL,
  `delay` int(10) NOT NULL DEFAULT 0,
  `cs_nm` varchar(15) NOT NULL DEFAULT 'Ready To Start'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus_services`
--

INSERT INTO `bus_services` (`serv_id`, `type`, `route_id`, `s_time`, `e_time`, `status`, `delay`, `cs_nm`) VALUES
(1, 'SWIFT', 1, '03:00:00', '06:20:00', 'Active', 5, 'Perumbavoor'),
(2, 'FP', 7, '03:00:00', '07:00:00', 'Active', 0, 'Kottayam');

-- --------------------------------------------------------

--
-- Table structure for table `bus_stops`
--

CREATE TABLE `bus_stops` (
  `stop_id` int(11) NOT NULL,
  `stop_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus_stops`
--

INSERT INTO `bus_stops` (`stop_id`, `stop_name`) VALUES
(1, 'Aluva'),
(2, 'Perumbavoor'),
(3, 'Kothamangalam'),
(4, 'Adimali'),
(5, 'Munnar'),
(6, 'Kottayam'),
(7, 'Ettumanoor'),
(8, 'Muvattupuzha'),
(9, 'Rajakkad'),
(10, 'Chalakkudy'),
(11, 'Angamaly'),
(12, 'Irinjalakkuda'),
(13, 'Thrissur'),
(14, 'Edappal'),
(15, 'Kunnamkulam'),
(16, 'Kuttippuram'),
(17, 'Kozhikode'),
(18, 'Vadakkencherry'),
(19, 'Alathur'),
(20, 'Palakkad');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` varchar(20) NOT NULL,
  `pswd` varchar(15) NOT NULL,
  `role` varchar(15) NOT NULL,
  `stop_id` int(15) DEFAULT NULL,
  `sname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_id`, `pswd`, `role`, `stop_id`, `sname`) VALUES
('admin', 'admin', 'admin', 0, 'Admin'),
('aluva', 'aluva', 'StationMaster', 1, 'Aluva'),
('amgly', '111', 'StationMaster', 11, 'Angamaly'),
('chalakkudy', '', 'StationMaster', 10, 'Chalakkudy'),
('irinjala', 'irnj', 'StationMaster', 12, 'Irinjalakkuda'),
('kothamangalam', 'kothamangalam', 'StationMaster', 3, 'Kothamangalam'),
('kottayam', 'ktm', 'StationMaster', 6, 'Kottayam'),
('palakkad', 'pkd', 'StationMaster', 20, 'Palakkad'),
('Perumbavoor', 'pmbvr', 'StationMaster', 2, 'Perumbavoor'),
('Rajakkad', 'rjk', 'StationMaster', 9, 'rajakkad'),
('thrissur', 'thsr', 'StationMaster', 13, 'Thrissur');

-- --------------------------------------------------------

--
-- Table structure for table `route_stops`
--

CREATE TABLE `route_stops` (
  `route_id` int(11) NOT NULL,
  `stop_id` int(11) NOT NULL,
  `stop_order` int(11) DEFAULT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `route_stops`
--

INSERT INTO `route_stops` (`route_id`, `stop_id`, `stop_order`, `time`) VALUES
(1, 1, 1, 0),
(1, 2, 2, 20),
(1, 3, 3, 30),
(1, 4, 4, 90),
(1, 5, 5, 60),
(2, 1, 5, 20),
(2, 2, 4, 30),
(2, 3, 3, 90),
(2, 4, 2, 60),
(2, 5, 1, 0),
(3, 3, 4, 30),
(3, 4, 5, 90),
(3, 6, 1, 0),
(3, 7, 2, 30),
(3, 8, 3, 90),
(3, 9, 6, 60),
(4, 1, 1, 0),
(4, 10, 3, 30),
(4, 11, 2, 30),
(4, 12, 4, 20),
(4, 13, 5, 30),
(5, 1, 5, 30),
(5, 10, 3, 20),
(5, 11, 4, 30),
(5, 12, 2, 30),
(5, 13, 1, 0),
(6, 1, 1, 0),
(6, 10, 3, 20),
(6, 11, 2, 20),
(6, 12, 4, 30),
(6, 13, 5, 20),
(6, 18, 6, 40),
(6, 19, 7, 60),
(6, 20, 8, 50),
(7, 3, 3, 90),
(7, 4, 2, 30),
(7, 6, 6, 30),
(7, 7, 5, 60),
(7, 8, 4, 30),
(7, 9, 1, 0),
(8, 1, 8, 20),
(8, 10, 6, 30),
(8, 11, 7, 20),
(8, 12, 5, 20),
(8, 13, 4, 40),
(8, 18, 3, 60),
(8, 19, 2, 50),
(8, 20, 1, 0),
(10, 10, 3, 20),
(10, 11, 4, 20),
(10, 12, 2, 30),
(10, 13, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bus_routes`
--
ALTER TABLE `bus_routes`
  ADD PRIMARY KEY (`route_id`);

--
-- Indexes for table `bus_services`
--
ALTER TABLE `bus_services`
  ADD PRIMARY KEY (`serv_id`),
  ADD KEY `fk` (`route_id`);

--
-- Indexes for table `bus_stops`
--
ALTER TABLE `bus_stops`
  ADD PRIMARY KEY (`stop_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `route_stops`
--
ALTER TABLE `route_stops`
  ADD PRIMARY KEY (`route_id`,`stop_id`),
  ADD KEY `stop_id` (`stop_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bus_routes`
--
ALTER TABLE `bus_routes`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `bus_services`
--
ALTER TABLE `bus_services`
  MODIFY `serv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bus_stops`
--
ALTER TABLE `bus_stops`
  MODIFY `stop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bus_services`
--
ALTER TABLE `bus_services`
  ADD CONSTRAINT `fk` FOREIGN KEY (`route_id`) REFERENCES `bus_routes` (`route_id`);

--
-- Constraints for table `route_stops`
--
ALTER TABLE `route_stops`
  ADD CONSTRAINT `route_stops_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `bus_routes` (`route_id`),
  ADD CONSTRAINT `route_stops_ibfk_2` FOREIGN KEY (`stop_id`) REFERENCES `bus_stops` (`stop_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
