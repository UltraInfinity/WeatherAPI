-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Feb 22, 2024 at 04:25 PM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `weather_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `weather_history`
--

CREATE TABLE `weather_history` (
  `id` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `temperature` float NOT NULL,
  `weather` varchar(255) NOT NULL,
  `time_searched` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `weather_history`
--

INSERT INTO `weather_history` (`id`, `location`, `temperature`, `weather`, `time_searched`) VALUES
(26, 'London', 6.37, 'moderate rain', '2024-02-22 16:19:15'),
(27, 'London', 6.37, 'moderate rain', '2024-02-22 16:19:17'),
(28, 'London', 6.37, 'moderate rain', '2024-02-22 16:19:19'),
(29, 'New York', 4.95, 'scattered clouds', '2024-02-22 16:19:28'),
(30, 'New York', 4.95, 'scattered clouds', '2024-02-22 16:19:30'),
(31, 'New York', 4.95, 'scattered clouds', '2024-02-22 16:19:31'),
(32, 'Baghdad', 16.95, 'clear sky', '2024-02-22 16:19:38'),
(33, 'Baghdad', 16.95, 'clear sky', '2024-02-22 16:19:39'),
(34, 'Baghdad', 16.95, 'clear sky', '2024-02-22 16:19:41'),
(35, 'Kuala Lumpur', 26.91, 'few clouds', '2024-02-22 16:19:52'),
(36, 'Kuala Lumpur', 26.91, 'few clouds', '2024-02-22 16:19:53'),
(37, 'Kuala Lumpur', 26.91, 'few clouds', '2024-02-22 16:19:54'),
(38, 'Kuala Lumpur', 26.91, 'few clouds', '2024-02-22 16:19:56'),
(39, 'Bali', 27.35, 'overcast clouds', '2024-02-22 16:20:02'),
(40, 'Bali', 27.35, 'overcast clouds', '2024-02-22 16:20:03'),
(41, 'Medellin', 24.15, 'scattered clouds', '2024-02-22 16:20:18'),
(42, 'Medellin', 24.15, 'scattered clouds', '2024-02-22 16:20:20'),
(43, 'Panama City', 29.06, 'haze', '2024-02-22 16:20:31'),
(44, 'Panama City', 29.06, 'haze', '2024-02-22 16:20:35'),
(45, 'Wolverhampton', 4.38, 'overcast clouds', '2024-02-22 16:20:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `weather_history`
--
ALTER TABLE `weather_history`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `weather_history`
--
ALTER TABLE `weather_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
