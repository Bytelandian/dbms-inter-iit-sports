-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 18, 2015 at 03:45 AM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dbms`
--

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `team_id` int(11) NOT NULL AUTO_INCREMENT,
  `team_size` int(11) NOT NULL,
  `sponsor` varchar(64) NOT NULL,
  `coach` varchar(64) NOT NULL,
  `jersey` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `year` year(4) NOT NULL,
  `sport` varchar(64) NOT NULL,
  PRIMARY KEY (`team_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=110 ;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`team_id`, `team_size`, `sponsor`, `coach`, `jersey`, `name`, `year`, `sport`) VALUES
(101, 12, 'Adidas', 'S.N. Roy', 'Yellow', 'IIT ROPAR', 2089, 'cricket'),
(102, 16, 'Reebok', 'Sushant Singh', 'blue', 'IIT Mandi', 2089, 'cricket'),
(103, 12, 'Puma', 'Ashwini', 'Grey', 'IIT KANPUR', 2089, 'cricket'),
(104, 4, 'Adidas', 'Saurav Singh', 'Pink', 'IIT KHARAGPUR', 2089, 'cricket'),
(105, 11, 'UCB', 'Kumar bharat', 'Black', 'IIT INDORE', 2089, 'cricket'),
(106, 12, 'Nike', 'sahir Khan', 'Red', 'IIT PATNA', 2089, 'cricket'),
(107, 16, 'Adidas', 'Kaushal', 'Green', 'IIT DELHI', 2089, 'cricket'),
(108, 11, 'Reebok', 'Gaurav', 'Yellow', 'IIT ROPAR', 2089, 'cricket'),
(109, 8, 'Puma', 'aniket', 'Yellow', 'IIT ROPAR', 2089, 'cricket');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `team_ibfk_1` FOREIGN KEY (`name`) REFERENCES `iit` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
