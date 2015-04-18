-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 18, 2015 at 07:14 AM
-- Server version: 5.5.41-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dbms`
--
CREATE DATABASE IF NOT EXISTS `dbms` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dbms`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `username` varchar(50) NOT NULL,
  `pass` varchar(30) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `pass`) VALUES
('aniket', 'asdf');

-- --------------------------------------------------------

--
-- Table structure for table `athletics_event_details`
--

CREATE TABLE IF NOT EXISTS `athletics_event_details` (
  `match_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `venue` varchar(64) NOT NULL,
  `gold_winner` int(11) NOT NULL,
  `silver_winner` int(11) NOT NULL,
  `bronze_winner` int(11) NOT NULL,
  `type_id` enum('jumping','running','throwing') NOT NULL,
  PRIMARY KEY (`match_id`),
  KEY `silver_winner` (`silver_winner`),
  KEY `bronze_winner` (`bronze_winner`),
  KEY `gold_winner` (`gold_winner`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `athletics_event_details`
--

INSERT INTO `athletics_event_details` (`match_id`, `date`, `venue`, `gold_winner`, `silver_winner`, `bronze_winner`, `type_id`) VALUES
(1001, '2015-12-15', 'XYZ', 1231, 1232, 1233, 'jumping'),
(1002, '2015-12-16', 'XYZ', 1236, 1235, 1234, 'jumping'),
(1004, '2015-12-18', 'XYZ', 1231, 1235, 1237, 'jumping'),
(1005, '2015-12-19', 'xyz', 1232, 1231, 1237, 'jumping'),
(2001, '2015-12-15', 'XYZ', 1238, 1235, 1233, 'running');

-- --------------------------------------------------------

--
-- Table structure for table `athletics_jumping_event`
--

CREATE TABLE IF NOT EXISTS `athletics_jumping_event` (
  `match_id` int(11) NOT NULL,
  `qualifying_score` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `athletics_jumping_event`
--

INSERT INTO `athletics_jumping_event` (`match_id`, `qualifying_score`, `name`) VALUES
(1001, 20, 'Long Jump'),
(1002, 30, 'High Jump'),
(1004, 40, 'Triple Jump'),
(1005, 43, 'pole vault');

-- --------------------------------------------------------

--
-- Table structure for table `athletics_player_stats`
--

CREATE TABLE IF NOT EXISTS `athletics_player_stats` (
  `player_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `medal` varchar(64) NOT NULL,
  `score_1st_attempt` int(11) NOT NULL,
  `score_2nd_attempt` int(11) NOT NULL,
  `score_3rd_attempt` int(11) NOT NULL,
  `final_score` int(11) NOT NULL,
  PRIMARY KEY (`player_id`,`match_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `athletics_player_stats`
--

INSERT INTO `athletics_player_stats` (`player_id`, `match_id`, `medal`, `score_1st_attempt`, `score_2nd_attempt`, `score_3rd_attempt`, `final_score`) VALUES
(1231, 1001, 'Silver', 7, 8, 6, 21),
(1232, 1001, 'Gold', 9, 8, 7, 24);

-- --------------------------------------------------------

--
-- Table structure for table `athletics_running_event`
--

CREATE TABLE IF NOT EXISTS `athletics_running_event` (
  `match_id` int(11) NOT NULL,
  `qualifying_time` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `athletics_running_event`
--

INSERT INTO `athletics_running_event` (`match_id`, `qualifying_time`, `name`) VALUES
(1001, 20, '100 meters sprints'),
(1002, 30, '200 meters sprints'),
(1004, 50, 'relay'),
(1005, 40, 'hurdles');

-- --------------------------------------------------------

--
-- Table structure for table `athletics_throwing_event`
--

CREATE TABLE IF NOT EXISTS `athletics_throwing_event` (
  `match_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `qualifying_distance` int(11) NOT NULL,
  PRIMARY KEY (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `athletics_throwing_event`
--

INSERT INTO `athletics_throwing_event` (`match_id`, `name`, `qualifying_distance`) VALUES
(1001, 'discus throw', 20),
(1002, 'shotput', 30),
(1004, 'javelin throw', 50),
(1005, 'hammer throw', 40);

-- --------------------------------------------------------

--
-- Table structure for table `badminton_match`
--

CREATE TABLE IF NOT EXISTS `badminton_match` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT,
  `venue` varchar(64) NOT NULL,
  `date` date NOT NULL,
  `referee_id` int(11) NOT NULL,
  `winner` int(11) NOT NULL,
  `isfinal` tinyint(1) NOT NULL,
  PRIMARY KEY (`match_id`),
  KEY `referee_id` (`referee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1007 ;

--
-- Dumping data for table `badminton_match`
--

INSERT INTO `badminton_match` (`match_id`, `venue`, `date`, `referee_id`, `winner`, `isfinal`) VALUES
(1001, 'court-1', '2015-12-12', 1, 101, 1),
(1002, 'court-2', '2015-12-13', 1, 102, 0),
(1003, 'court-3', '2015-12-14', 4, 103, 0),
(1004, 'court-2', '2015-12-15', 3, 104, 0),
(1005, 'court-1', '2015-12-16', 2, 105, 0),
(1006, 'court-1', '2014-12-16', 2, 105, 1);

-- --------------------------------------------------------

--
-- Table structure for table `badminton_player_stats`
--

CREATE TABLE IF NOT EXISTS `badminton_player_stats` (
  `player_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `no_smashes` int(11) NOT NULL,
  `no_drops` int(11) NOT NULL,
  `no_sets_won` int(11) NOT NULL,
  PRIMARY KEY (`player_id`,`match_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `badminton_player_stats`
--

INSERT INTO `badminton_player_stats` (`player_id`, `match_id`, `no_smashes`, `no_drops`, `no_sets_won`) VALUES
(1231, 1001, 7, 5, 2),
(1232, 1001, 4, 2, 1),
(1234, 1002, 7, 5, 1),
(1235, 1003, 3, 2, 2),
(1238, 1002, 8, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `badminton_sets`
--

CREATE TABLE IF NOT EXISTS `badminton_sets` (
  `match_id` int(11) NOT NULL,
  `set_winner` int(11) NOT NULL,
  `set_score` int(11) NOT NULL,
  `no_deuces` int(11) NOT NULL,
  `set_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`set_id`),
  KEY `match_id` (`match_id`,`set_winner`),
  KEY `set_winner` (`set_winner`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `badminton_sets`
--

INSERT INTO `badminton_sets` (`match_id`, `set_winner`, `set_score`, `no_deuces`, `set_id`) VALUES
(1001, 102, 13, 5, 1),
(1001, 101, 21, 2, 2),
(1001, 102, 15, 3, 3),
(1001, 102, 21, 4, 11),
(1001, 101, 13, 5, 12),
(1001, 102, 21, 5, 13);

-- --------------------------------------------------------

--
-- Table structure for table `badminton_team_stats`
--

CREATE TABLE IF NOT EXISTS `badminton_team_stats` (
  `team_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `no_smashes` int(11) NOT NULL,
  `no_drops` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`team_id`,`match_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `badminton_team_stats`
--

INSERT INTO `badminton_team_stats` (`team_id`, `match_id`, `no_smashes`, `no_drops`, `score`) VALUES
(101, 1001, 12, 10, 21),
(103, 1001, 11, 9, 19),
(104, 1006, 10, 8, 18),
(105, 1006, 14, 12, 20);

-- --------------------------------------------------------

--
-- Table structure for table `basketball_match`
--

CREATE TABLE IF NOT EXISTS `basketball_match` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `venue` varchar(64) NOT NULL,
  `referee_id` int(11) NOT NULL,
  `winner` int(11) NOT NULL,
  `isfinal` tinyint(1) NOT NULL,
  PRIMARY KEY (`match_id`),
  KEY `referee_id` (`referee_id`),
  KEY `winner` (`winner`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2006 ;

-- --------------------------------------------------------

--
-- Table structure for table `basketball_player_stats`
--

CREATE TABLE IF NOT EXISTS `basketball_player_stats` (
  `player_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `2points_scored` int(11) NOT NULL,
  `3points_scored` int(11) NOT NULL,
  `2points_attempted` int(11) NOT NULL,
  `3points_attempted` int(11) NOT NULL,
  `personal_fouls` int(11) NOT NULL,
  `rebounds` int(11) NOT NULL,
  `assists` int(11) NOT NULL,
  `steals` int(11) NOT NULL,
  `turnovers` int(11) NOT NULL,
  PRIMARY KEY (`player_id`,`match_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `basketball_team_stats`
--

CREATE TABLE IF NOT EXISTS `basketball_team_stats` (
  `team_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `total_points_scored` int(11) NOT NULL,
  `timeouts_taken` int(11) NOT NULL,
  PRIMARY KEY (`team_id`,`match_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cricket_match`
--

CREATE TABLE IF NOT EXISTS `cricket_match` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `winner` int(11) NOT NULL,
  `man_of_the_match` int(11) NOT NULL,
  `toss_won` int(11) NOT NULL,
  `venue` varchar(64) NOT NULL,
  `batting_first` int(11) NOT NULL,
  `isfinal` tinyint(1) NOT NULL,
  PRIMARY KEY (`match_id`),
  KEY `winner` (`winner`),
  KEY `man_of_the_match` (`man_of_the_match`),
  KEY `batting_first` (`batting_first`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1006 ;

--
-- Dumping data for table `cricket_match`
--

INSERT INTO `cricket_match` (`match_id`, `date`, `winner`, `man_of_the_match`, `toss_won`, `venue`, `batting_first`, `isfinal`) VALUES
(1001, '2015-12-11', 101, 1231, 101, 'Ground-1', 102, 0),
(1002, '2015-12-11', 102, 1234, 104, 'Ground-2', 103, 0),
(1003, '2015-12-11', 103, 1232, 102, 'Ground-3', 105, 0),
(1004, '2015-12-11', 104, 1231, 101, 'Ground-1', 107, 0),
(1005, '2015-12-11', 105, 1235, 106, 'Ground-1', 103, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cricket_player_stats`
--

CREATE TABLE IF NOT EXISTS `cricket_player_stats` (
  `player_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `catches` int(11) NOT NULL,
  `stumps` int(11) NOT NULL,
  `runs_scored` int(11) NOT NULL,
  `4s` int(11) NOT NULL,
  `6s` int(11) NOT NULL,
  `dots` int(11) NOT NULL,
  `balls_faced` int(11) NOT NULL,
  `out_` int(11) NOT NULL,
  `runs` int(11) NOT NULL,
  `overs` int(11) NOT NULL,
  `maiden` int(11) NOT NULL,
  `extra_runs` int(11) NOT NULL,
  `wide` int(11) NOT NULL,
  `noballs` int(11) NOT NULL,
  `byes` int(11) NOT NULL,
  `legbyes` int(11) NOT NULL,
  `wickets` int(11) NOT NULL,
  PRIMARY KEY (`player_id`,`match_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cricket_player_stats`
--

INSERT INTO `cricket_player_stats` (`player_id`, `match_id`, `catches`, `stumps`, `runs_scored`, `4s`, `6s`, `dots`, `balls_faced`, `out_`, `runs`, `overs`, `maiden`, `extra_runs`, `wide`, `noballs`, `byes`, `legbyes`, `wickets`) VALUES
(1230, 1001, 2, 0, 0, 3, 4, 10, 21, 32, 40, 1, 0, 0, 0, 0, 0, 0, 0),
(1234, 1001, 2, 1, 0, 3, 4, 10, 21, 32, 40, 2, 5, 0, 3, 2, 1, 0, 0),
(1235, 1002, 1, 0, 0, 3, 4, 10, 21, 32, 40, 0, 0, 0, 0, 0, 0, 0, 0),
(1238, 1001, 1, 0, 0, 3, 2, 10, 21, 32, 27, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cricket_team_stats`
--

CREATE TABLE IF NOT EXISTS `cricket_team_stats` (
  `team_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `runs_scored` int(11) NOT NULL,
  `overs_played` int(11) NOT NULL,
  `4s` int(11) NOT NULL,
  `6s` int(11) NOT NULL,
  `wickets` int(11) NOT NULL,
  `extras` int(11) NOT NULL,
  PRIMARY KEY (`team_id`,`match_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cricket_team_stats`
--

INSERT INTO `cricket_team_stats` (`team_id`, `match_id`, `runs_scored`, `overs_played`, `4s`, `6s`, `wickets`, `extras`) VALUES
(101, 1002, 265, 47, 20, 5, 6, 12),
(102, 1002, 267, 43, 20, 8, 3, 15),
(103, 1001, 245, 46, 12, 3, 8, 12),
(104, 1001, 221, 48, 20, 5, 6, 12),
(105, 1003, 300, 50, 12, 5, 7, 12),
(106, 1004, 304, 49, 14, 10, 3, 17);

-- --------------------------------------------------------

--
-- Table structure for table `football_match`
--

CREATE TABLE IF NOT EXISTS `football_match` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `venue` varchar(64) NOT NULL,
  `referee_id` int(11) NOT NULL,
  `winner` int(11) NOT NULL,
  `isfinal` tinyint(1) NOT NULL,
  PRIMARY KEY (`match_id`),
  UNIQUE KEY `referee_id` (`referee_id`),
  KEY `winner` (`winner`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `football_player_stats`
--

CREATE TABLE IF NOT EXISTS `football_player_stats` (
  `player_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `goals` int(11) NOT NULL,
  `minutes_played` int(11) NOT NULL,
  `total_shots` int(11) NOT NULL,
  `shots_on_target` int(11) NOT NULL,
  `passes_completed` int(11) NOT NULL,
  `offsides` int(11) NOT NULL,
  `yellow_cards` int(11) NOT NULL,
  `red_cards` int(11) NOT NULL,
  `passing_accuracy` int(11) NOT NULL,
  `fouls` int(11) NOT NULL,
  PRIMARY KEY (`player_id`,`match_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='check on passing accuracy (cannot be calculated)';

-- --------------------------------------------------------

--
-- Table structure for table `football_team_stats`
--

CREATE TABLE IF NOT EXISTS `football_team_stats` (
  `team_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `goals` int(11) NOT NULL,
  `possession` int(11) NOT NULL,
  `corners` int(11) NOT NULL,
  `total_shots` int(11) NOT NULL,
  `shots_on_target` int(11) NOT NULL,
  `passes_completed` int(11) NOT NULL,
  `offsides` int(11) NOT NULL,
  `passing_accuracy` int(11) NOT NULL,
  `fouls` int(11) NOT NULL,
  `yellow_cards` int(11) NOT NULL,
  `red_cards` int(11) NOT NULL,
  PRIMARY KEY (`team_id`,`match_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='check on accuracy and possession';

-- --------------------------------------------------------

--
-- Table structure for table `hockey_goals_scored`
--

CREATE TABLE IF NOT EXISTS `hockey_goals_scored` (
  `match_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `scorer` int(11) NOT NULL,
  `assisted` int(11) NOT NULL,
  PRIMARY KEY (`match_id`,`team_id`,`time`),
  KEY `scorer` (`scorer`,`assisted`),
  KEY `scorer_2` (`scorer`),
  KEY `assisted` (`assisted`),
  KEY `team_id` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hockey_match`
--

CREATE TABLE IF NOT EXISTS `hockey_match` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `venue` varchar(64) NOT NULL,
  `winner` int(11) NOT NULL,
  `motm` int(11) NOT NULL,
  `isfinal` tinyint(1) NOT NULL,
  PRIMARY KEY (`match_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1007 ;

--
-- Dumping data for table `hockey_match`
--

INSERT INTO `hockey_match` (`match_id`, `date`, `venue`, `winner`, `motm`, `isfinal`) VALUES
(1001, '2015-12-13', 'field-1', 101, 1231, 0),
(1002, '2015-12-13', 'field-2', 102, 1232, 0),
(1003, '2015-12-14', 'field-1', 103, 1233, 0),
(1004, '2015-12-14', 'field-2', 104, 1234, 0),
(1005, '2015-12-15', 'field-1', 101, 1231, 0),
(1006, '2015-12-15', 'field-2', 103, 1235, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hockey_player_stats`
--

CREATE TABLE IF NOT EXISTS `hockey_player_stats` (
  `match_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `goals` int(11) NOT NULL,
  `assists` int(11) NOT NULL,
  `minutes_played` int(11) NOT NULL,
  `fouls` int(11) NOT NULL,
  `yellow_cards` int(11) NOT NULL,
  `red_cards` int(11) NOT NULL,
  PRIMARY KEY (`match_id`,`player_id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hockey_player_stats`
--

INSERT INTO `hockey_player_stats` (`match_id`, `player_id`, `goals`, `assists`, `minutes_played`, `fouls`, `yellow_cards`, `red_cards`) VALUES
(1001, 1231, 1, 1, 40, 3, 2, 1),
(1002, 1232, 0, 0, 45, 5, 2, 0),
(1003, 1236, 1, 1, 30, 4, 0, 1),
(1004, 1234, 1, 1, 55, 5, 4, 1),
(1005, 1235, 1, 1, 70, 3, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hockey_team_stats`
--

CREATE TABLE IF NOT EXISTS `hockey_team_stats` (
  `match_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `goals` int(11) NOT NULL,
  `yellow_cards` int(11) NOT NULL,
  `red_cards` int(11) NOT NULL,
  `fouls` int(11) NOT NULL,
  `possession` float NOT NULL,
  `free_hits` int(11) NOT NULL,
  `penalty_kicks` int(11) NOT NULL,
  `penalty_corners` int(11) NOT NULL,
  PRIMARY KEY (`match_id`,`team_id`),
  KEY `team_id` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hockey_team_stats`
--

INSERT INTO `hockey_team_stats` (`match_id`, `team_id`, `goals`, `yellow_cards`, `red_cards`, `fouls`, `possession`, `free_hits`, `penalty_kicks`, `penalty_corners`) VALUES
(1001, 101, 6, 4, 2, 12, 10.4, 1, 1, 3),
(1001, 103, 5, 4, 2, 12, 12.4, 3, 3, 1),
(1002, 102, 3, 4, 2, 12, 11.4, 2, 2, 0),
(1002, 104, 2, 4, 2, 12, 15.4, 2, 5, 3),
(1005, 105, 6, 4, 2, 12, 13.4, 2, 2, 4),
(1006, 106, 8, 4, 2, 12, 9.4, 2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `iit`
--

CREATE TABLE IF NOT EXISTS `iit` (
  `name` varchar(64) NOT NULL,
  `city` varchar(64) NOT NULL,
  `state` varchar(64) NOT NULL,
  `pincode` char(6) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iit`
--

INSERT INTO `iit` (`name`, `city`, `state`, `pincode`) VALUES
('IIT BHU', 'Varanasi', 'UP', '142342'),
('IIT Bombay', 'Mumbai', 'Maharashtra', '110001'),
('IIT Delhi', 'Delhi', 'Delhi', '140341'),
('IIT Guwahati', 'Guwahati', 'Assam', '143726'),
('IIT Indore', 'Indore', 'MP', '147784'),
('IIT Kanpur', 'Kanpur', 'UP', '143434'),
('IIT Kharagpur', 'Kharagpur', 'WB', '176354'),
('IIT Madras', 'Madras', 'Tamilnadu', '142345'),
('IIT Mandi', 'Mandi', 'HP', '140232'),
('IIT Patna', 'Patna', 'Bihar', '140123'),
('IIT Roorkee', 'Roorkee', 'Uttarakhand', '145667'),
('IIT Ropar', 'Ropar', 'Punjab', '140001');

-- --------------------------------------------------------

--
-- Table structure for table `iit_participation`
--

CREATE TABLE IF NOT EXISTS `iit_participation` (
  `year` year(4) NOT NULL,
  `name` varchar(64) NOT NULL,
  `contingent_size` int(11) NOT NULL,
  `score_total` int(11) NOT NULL,
  `sports_officer` varchar(64) NOT NULL,
  `sports_secretary` varchar(64) NOT NULL,
  PRIMARY KEY (`year`,`name`),
  KEY `year` (`year`,`name`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iit_participation`
--

INSERT INTO `iit_participation` (`year`, `name`, `contingent_size`, `score_total`, `sports_officer`, `sports_secretary`) VALUES
(2014, 'IIT BHU', 290, 8, 'Vishal Singh', 'Gaurav'),
(2014, 'IIT Bombay', 250, 13, 'Saurabh Kumar', 'Suresh Kumar'),
(2014, 'IIT Guwahati', 180, 10, 'VK Singh', 'Sanjana Singh'),
(2015, 'IIT BHU', 290, 8, 'Vishal Singh', 'Gaurav'),
(2015, 'IIT Bombay', 250, 13, 'Saurabh Kumar', 'Suresh Kumar'),
(2015, 'IIT Guwahati', 180, 10, 'VK Singh', 'Sanjana Singh'),
(2015, 'IIT Kanpur', 183, 11, 'Shubham Roy', 'Mohit'),
(2015, 'IIT Mandi', 170, 4, 'SK Roy', 'Shubham'),
(2015, 'IIT Patna', 90, 6, 'Ashish Singh', 'Aniket'),
(2015, 'IIT Roorkee', 200, 12, 'Prafull Patel', 'Shomita Das'),
(2015, 'IIT Ropar', 100, 7, 'Ajeet Pal Singh', 'Agrim Bansal');

-- --------------------------------------------------------

--
-- Table structure for table `lawntennis_game`
--

CREATE TABLE IF NOT EXISTS `lawntennis_game` (
  `game_id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL,
  `game_winning_score` int(11) NOT NULL,
  `game_losing_score` int(11) NOT NULL,
  `game_no_of_deuces` int(11) NOT NULL,
  `game_no_of_aces` int(11) NOT NULL,
  `game_no_of_faults` int(11) NOT NULL,
  `player_service` int(11) NOT NULL,
  `game_winner` int(11) NOT NULL,
  PRIMARY KEY (`game_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `lawntennis_game`
--

INSERT INTO `lawntennis_game` (`game_id`, `match_id`, `game_winning_score`, `game_losing_score`, `game_no_of_deuces`, `game_no_of_aces`, `game_no_of_faults`, `player_service`, `game_winner`) VALUES
(1, 1001, 40, 15, 0, 0, 4, 1231, 1231),
(2, 1001, 40, 30, 0, 0, 2, 1231, 1231),
(3, 1001, 15, 40, 0, 0, 2, 1231, 1232),
(4, 1001, 40, 40, 1, 1, 8, 1232, 1232),
(5, 1001, 40, 30, 0, 0, 4, 1232, 1231);

-- --------------------------------------------------------

--
-- Table structure for table `lawntennis_match`
--

CREATE TABLE IF NOT EXISTS `lawntennis_match` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT,
  `winner` int(11) NOT NULL,
  `date` date NOT NULL,
  `venue` varchar(64) NOT NULL,
  `isfinal` tinyint(1) NOT NULL,
  PRIMARY KEY (`match_id`),
  KEY `winner` (`winner`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1008 ;

--
-- Dumping data for table `lawntennis_match`
--

INSERT INTO `lawntennis_match` (`match_id`, `winner`, `date`, `venue`, `isfinal`) VALUES
(1001, 101, '2015-12-13', 'court-1', 0),
(1002, 103, '2015-12-14', 'court-2', 0),
(1003, 102, '2015-12-15', 'court-1', 0),
(1004, 101, '2015-12-14', 'court-2', 0),
(1005, 103, '2015-12-15', 'court-1', 0),
(1006, 105, '2015-12-16', 'court-2', 0),
(1007, 104, '2015-12-16', 'court-1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `lawntennis_player_stats`
--

CREATE TABLE IF NOT EXISTS `lawntennis_player_stats` (
  `player_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `player_no_aces` int(11) NOT NULL,
  `player_no_faults` int(11) NOT NULL,
  `player_no_sets_won` int(11) NOT NULL,
  `player_no_games_won` int(11) NOT NULL,
  PRIMARY KEY (`player_id`,`match_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lawntennis_player_stats`
--

INSERT INTO `lawntennis_player_stats` (`player_id`, `match_id`, `player_no_aces`, `player_no_faults`, `player_no_sets_won`, `player_no_games_won`) VALUES
(1231, 1001, 1, 4, 3, 12),
(1231, 1002, 0, 4, 2, 14),
(1231, 1003, 1, 9, 3, 12),
(1232, 1001, 0, 5, 2, 10),
(1233, 1002, 1, 7, 3, 16),
(1234, 1003, 1, 11, 2, 12);

-- --------------------------------------------------------

--
-- Table structure for table `lawntennis_team_stats`
--

CREATE TABLE IF NOT EXISTS `lawntennis_team_stats` (
  `team_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `team_no_aces` int(11) NOT NULL,
  `team_no_faults` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`team_id`,`match_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lawntennis_team_stats`
--

INSERT INTO `lawntennis_team_stats` (`team_id`, `match_id`, `team_no_aces`, `team_no_faults`, `score`) VALUES
(101, 1001, 3, 12, 3),
(102, 1001, 0, 22, 0),
(103, 1002, 6, 21, 3),
(104, 1002, 0, 18, 2),
(105, 1003, 4, 17, 3),
(106, 1003, 1, 16, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lawn_tennis_set`
--

CREATE TABLE IF NOT EXISTS `lawn_tennis_set` (
  `set_winner` int(11) NOT NULL,
  `set_winning_score` int(11) NOT NULL,
  `set_losing_score` int(11) NOT NULL,
  `set_no_of_deuces` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `set_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`set_id`),
  KEY `set_winner` (`set_winner`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `lawn_tennis_set`
--

INSERT INTO `lawn_tennis_set` (`set_winner`, `set_winning_score`, `set_losing_score`, `set_no_of_deuces`, `match_id`, `set_id`) VALUES
(101, 40, 15, 0, 1001, 1),
(102, 40, 30, 0, 1002, 2),
(103, 40, 40, 1, 1003, 3),
(104, 40, 30, 0, 1004, 11),
(105, 40, 15, 0, 1005, 12),
(106, 40, 40, 1, 1006, 13);

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE IF NOT EXISTS `player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` set('male','female') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'male',
  `email_id` varchar(64) NOT NULL,
  `address` varchar(64) NOT NULL,
  `iit` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `iit` (`iit`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1239 ;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`id`, `name`, `date_of_birth`, `gender`, `email_id`, `address`, `iit`) VALUES
(1230, 'Gaurav', '1994-08-19', 'male', 'gauravmi@iitrpr.ac.in', '', 'IIT Bombay'),
(1231, 'Yash', '0000-00-00', 'male', 'abc@gmail.com', 'IIT Ropar NangalRoad', 'IIT Delhi'),
(1232, 'Shubham', '0000-00-00', 'male', 'abcd@gmail.com', 'Chandigarh', 'IIT Indore'),
(1233, 'Kiara', '1994-08-07', 'female', 'abcde@gmail.com', 'Mumbai', 'IIT Madras'),
(1234, 'Saket', '0000-00-00', 'male', 'abc94@gmail.com', 'Delhi', 'IIT Patna'),
(1235, 'AK', '1994-11-02', 'female', 'abcxy@gmail.com', 'Mandi', 'IIT BHU'),
(1236, 'Chandu', '1994-01-06', 'male', 'abcmn@gmail.com', 'Ropar NangalRoad', 'IIT Kanpur'),
(1237, 'Rohan', '1994-05-07', 'male', 'abc05@gmail.com', 'Ropar NangalRoad', 'IIT Ropar'),
(1238, 'Sachi', '1994-08-27', 'male', 'abcd@gmail.com', 'New Delhi', 'IIT Mandi');

-- --------------------------------------------------------

--
-- Table structure for table `player_injury`
--

CREATE TABLE IF NOT EXISTS `player_injury` (
  `id` int(11) NOT NULL,
  `injury` varchar(64) NOT NULL,
  PRIMARY KEY (`id`,`injury`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player_injury`
--

INSERT INTO `player_injury` (`id`, `injury`) VALUES
(1231, 'muscle strain'),
(1232, 'fracture'),
(1233, 'albow dislocate'),
(1234, 'fracture'),
(1235, 'muscle strain'),
(1236, 'Leg injury'),
(1237, 'Knee injury');

-- --------------------------------------------------------

--
-- Table structure for table `player_phone`
--

CREATE TABLE IF NOT EXISTS `player_phone` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  PRIMARY KEY (`id`,`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player_phone`
--

INSERT INTO `player_phone` (`id`, `phone_number`) VALUES
(1230, '9537483647'),
(1231, '2147483647'),
(1232, '2147483647'),
(1232, '9547483647'),
(1232, '9877483647'),
(1233, '2147483647'),
(1234, '9147483647'),
(1235, '2147483647'),
(1236, '2147483647'),
(1237, '2147483647'),
(1238, '9543583647');

-- --------------------------------------------------------

--
-- Table structure for table `player_plays_in_team`
--

CREATE TABLE IF NOT EXISTS `player_plays_in_team` (
  `id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`team_id`),
  KEY `team_id` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player_plays_in_team`
--

INSERT INTO `player_plays_in_team` (`id`, `team_id`) VALUES
(1231, 101),
(1232, 102),
(1233, 103),
(1234, 104),
(1235, 105),
(1236, 106),
(1237, 107);

-- --------------------------------------------------------

--
-- Table structure for table `player_plays_in_tournament`
--

CREATE TABLE IF NOT EXISTS `player_plays_in_tournament` (
  `id` int(11) NOT NULL,
  `year` year(4) NOT NULL,
  PRIMARY KEY (`id`,`year`),
  KEY `year` (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player_plays_in_tournament`
--

INSERT INTO `player_plays_in_tournament` (`id`, `year`) VALUES
(1235, 2011),
(1232, 2012),
(1232, 2013),
(1236, 2013),
(1232, 2014),
(1230, 2015),
(1231, 2015),
(1233, 2015),
(1234, 2015),
(1237, 2015),
(1238, 2015);

-- --------------------------------------------------------

--
-- Table structure for table `referee`
--

CREATE TABLE IF NOT EXISTS `referee` (
  `referee_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`referee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `referee`
--

INSERT INTO `referee` (`referee_id`, `name`) VALUES
(1, 'Aleem Dar'),
(2, 'David Shepherd'),
(3, 'Mehdi Abid Charef'),
(4, 'Hamid Yosifzai'),
(5, 'Enea Jorgji ');

-- --------------------------------------------------------

--
-- Table structure for table `squash_match`
--

CREATE TABLE IF NOT EXISTS `squash_match` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT,
  `venue` varchar(64) NOT NULL,
  `date` date NOT NULL,
  `winner` int(11) NOT NULL,
  `isfinal` tinyint(1) NOT NULL,
  PRIMARY KEY (`match_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1116 ;

--
-- Dumping data for table `squash_match`
--

INSERT INTO `squash_match` (`match_id`, `venue`, `date`, `winner`, `isfinal`) VALUES
(1001, 'court-2', '2015-12-15', 105, 0),
(1111, 'court-1', '2015-12-14', 102, 0),
(1112, 'court-2', '2015-12-14', 104, 0),
(1113, 'court-1', '2015-12-15', 102, 0),
(1114, 'court-2', '2015-12-16', 104, 0),
(1115, 'court-1', '2015-12-17', 105, 0);

-- --------------------------------------------------------

--
-- Table structure for table `squash_player_stats`
--

CREATE TABLE IF NOT EXISTS `squash_player_stats` (
  `player_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `no_sets_won` int(11) NOT NULL,
  `no_games_won` int(11) NOT NULL,
  `no_faults` int(11) NOT NULL,
  PRIMARY KEY (`player_id`,`match_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `squash_player_stats`
--

INSERT INTO `squash_player_stats` (`player_id`, `match_id`, `no_sets_won`, `no_games_won`, `no_faults`) VALUES
(1231, 1111, 1, 3, 5),
(1231, 1114, 1, 0, 2),
(1232, 1001, 1, 2, 4),
(1232, 1115, 1, 0, 5),
(1234, 1113, 1, 1, 3),
(1237, 1112, 1, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `squash_sets`
--

CREATE TABLE IF NOT EXISTS `squash_sets` (
  `match_id` int(11) NOT NULL,
  `set_winner` int(11) NOT NULL,
  `set_score` int(11) NOT NULL,
  `no_deuces` int(11) NOT NULL,
  `set_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`set_id`),
  KEY `match_id` (`match_id`),
  KEY `set_winner` (`set_winner`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `squash_sets`
--

INSERT INTO `squash_sets` (`match_id`, `set_winner`, `set_score`, `no_deuces`, `set_id`) VALUES
(1001, 101, 21, 3, 1),
(1111, 102, 22, 2, 2),
(1112, 101, 21, 0, 3),
(1112, 103, 25, 1, 11),
(1113, 101, 23, 2, 12),
(1113, 104, 20, 2, 13);

-- --------------------------------------------------------

--
-- Table structure for table `squash_team_stats`
--

CREATE TABLE IF NOT EXISTS `squash_team_stats` (
  `team_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `no_faults` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`team_id`,`match_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `squash_team_stats`
--

INSERT INTO `squash_team_stats` (`team_id`, `match_id`, `no_faults`, `score`) VALUES
(101, 1001, 8, 25),
(101, 1112, 2, 28),
(102, 1111, 5, 20),
(103, 1112, 8, 24),
(103, 1113, 3, 29),
(104, 1112, 12, 27);

-- --------------------------------------------------------

--
-- Table structure for table `tabletennis_match`
--

CREATE TABLE IF NOT EXISTS `tabletennis_match` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT,
  `venue` varchar(64) NOT NULL,
  `date` date NOT NULL,
  `referee_id` int(11) NOT NULL,
  `winner` int(11) NOT NULL,
  `isfinal` tinyint(1) NOT NULL,
  PRIMARY KEY (`match_id`),
  KEY `referee_id` (`referee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1008 ;

--
-- Dumping data for table `tabletennis_match`
--

INSERT INTO `tabletennis_match` (`match_id`, `venue`, `date`, `referee_id`, `winner`, `isfinal`) VALUES
(1001, 'Court-1', '2015-12-14', 3, 101, 0),
(1002, 'Court-1', '2015-12-14', 1, 102, 0),
(1003, 'Court-2', '2015-12-15', 3, 103, 0),
(1004, 'Court-1', '2015-12-15', 5, 104, 0),
(1005, 'Court-2', '2015-12-17', 2, 101, 0),
(1006, 'Court-1', '2015-12-16', 1, 103, 0),
(1007, 'Court-2', '2015-12-16', 4, 101, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tabletennis_player_stats`
--

CREATE TABLE IF NOT EXISTS `tabletennis_player_stats` (
  `player_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `no_sets_won` int(11) NOT NULL,
  `no_games_won` int(11) NOT NULL,
  PRIMARY KEY (`player_id`,`match_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabletennis_player_stats`
--

INSERT INTO `tabletennis_player_stats` (`player_id`, `match_id`, `no_sets_won`, `no_games_won`) VALUES
(1231, 1001, 2, 10),
(1231, 1003, 0, 12),
(1232, 1001, 1, 11),
(1232, 1003, 2, 23),
(1233, 1002, 2, 9),
(1238, 1002, 1, 12);

-- --------------------------------------------------------

--
-- Table structure for table `tabletennis_sets`
--

CREATE TABLE IF NOT EXISTS `tabletennis_sets` (
  `match_id` int(11) NOT NULL,
  `set_winner` int(11) NOT NULL,
  `set_score` int(11) NOT NULL,
  `no_deuces` int(11) NOT NULL,
  `set_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`set_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `tabletennis_sets`
--

INSERT INTO `tabletennis_sets` (`match_id`, `set_winner`, `set_score`, `no_deuces`, `set_id`) VALUES
(1001, 101, 11, 2, 1),
(1001, 102, 11, 3, 2),
(1001, 101, 11, 1, 3),
(1002, 103, 11, 2, 11),
(1002, 104, 11, 0, 12),
(1002, 103, 11, 2, 13);

-- --------------------------------------------------------

--
-- Table structure for table `tabletennis_team_stats`
--

CREATE TABLE IF NOT EXISTS `tabletennis_team_stats` (
  `team_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `no_smashes` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`team_id`,`match_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabletennis_team_stats`
--

INSERT INTO `tabletennis_team_stats` (`team_id`, `match_id`, `no_smashes`, `score`) VALUES
(101, 1001, 10, 23),
(101, 1003, 13, 29),
(102, 1001, 7, 25),
(102, 1002, 8, 26),
(103, 1002, 9, 27),
(104, 1003, 11, 34);

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
  PRIMARY KEY (`team_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=110 ;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`team_id`, `team_size`, `sponsor`, `coach`, `jersey`, `name`) VALUES
(101, 12, 'Adidas', 'S.N. Roy', 'Yellow', 'IIT Ropar'),
(102, 16, 'Reebok', 'Sushant Singh', 'blue', 'IIT Mandi'),
(103, 12, 'Puma', 'Ashwini', 'Grey', 'IIT Kanpur'),
(104, 4, 'Adidas', 'Saurav Singh', 'Pink', 'IIT Kharagpur'),
(105, 11, 'UCB', 'Kumar bharat', 'Black', 'IIT Indore'),
(106, 12, 'Nike', 'sahir Khan', 'Red', 'IIT Patna'),
(107, 16, 'Adidas', 'Kaushal', 'Green', 'IIT Delhi');

-- --------------------------------------------------------

--
-- Table structure for table `tournament`
--

CREATE TABLE IF NOT EXISTS `tournament` (
  `year` year(4) NOT NULL,
  `host` varchar(64) NOT NULL,
  `footfall` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `chief_guest` varchar(64) NOT NULL,
  PRIMARY KEY (`year`),
  KEY `year` (`year`),
  KEY `year_2` (`year`),
  KEY `host` (`host`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tournament`
--

INSERT INTO `tournament` (`year`, `host`, `footfall`, `start_date`, `end_date`, `chief_guest`) VALUES
(2008, 'IIT ROORKEE', 2056, '2008-12-06', '2008-12-19', 'Vijay Singh'),
(2009, 'IIT Delhi ', 2100, '2009-12-16', '2009-12-29', 'Paul Walker'),
(2010, 'IIT BHU', 2200, '2009-12-11', '2010-12-19', 'Brad Pit'),
(2011, 'IIT Kharagpur', 2250, '2011-12-09', '2011-12-18', 'Abhinav Bindra'),
(2012, 'IIT Kanpur', 2190, '2012-12-11', '2012-12-19', 'saina Nehwal'),
(2013, 'IIT Guwahati', 2300, '2013-12-16', '2013-12-22', 'MaryKom'),
(2014, 'IIT Bombay', 2400, '2014-12-11', '2014-12-19', 'Sachin'),
(2015, 'IIT Madras', 2500, '2015-12-13', '2015-12-19', 'Saniya Mirza');

-- --------------------------------------------------------

--
-- Table structure for table `volleyball_match`
--

CREATE TABLE IF NOT EXISTS `volleyball_match` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT,
  `match_winner` int(11) NOT NULL,
  `date` date NOT NULL,
  `venue` varchar(64) NOT NULL,
  `toss_winner` int(11) NOT NULL,
  `isfinal` tinyint(1) NOT NULL,
  PRIMARY KEY (`match_id`),
  KEY `match_winner` (`match_winner`),
  KEY `toss_winner` (`toss_winner`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1009 ;

--
-- Dumping data for table `volleyball_match`
--

INSERT INTO `volleyball_match` (`match_id`, `match_winner`, `date`, `venue`, `toss_winner`, `isfinal`) VALUES
(1001, 101, '2015-12-14', 'court-1', 102, 0),
(1002, 103, '2015-12-14', 'court-2', 104, 0),
(1003, 103, '2015-12-15', 'court-1', 102, 0),
(1004, 101, '2015-12-16', 'court-2', 104, 0),
(1005, 101, '2015-12-17', 'court-1', 105, 0),
(1006, 106, '2015-12-15', 'court-2', 105, 0),
(1007, 101, '2015-12-16', 'court-1', 103, 0),
(1008, 104, '2015-12-17', 'court-2', 102, 0);

-- --------------------------------------------------------

--
-- Table structure for table `volleyball_player_stats`
--

CREATE TABLE IF NOT EXISTS `volleyball_player_stats` (
  `player_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `no_points_scored` int(11) NOT NULL,
  `no_of_fouls` int(11) NOT NULL,
  PRIMARY KEY (`player_id`,`match_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `volleyball_player_stats`
--

INSERT INTO `volleyball_player_stats` (`player_id`, `match_id`, `no_points_scored`, `no_of_fouls`) VALUES
(1230, 1001, 12, 4),
(1231, 1001, 10, 5),
(1231, 1002, 10, 2),
(1232, 1002, 10, 5),
(1233, 1001, 13, 8),
(1234, 1001, 11, 3),
(1234, 1002, 13, 0);

-- --------------------------------------------------------

--
-- Table structure for table `volleyball_set`
--

CREATE TABLE IF NOT EXISTS `volleyball_set` (
  `set_winner` int(11) NOT NULL,
  `set_score` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `set_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`set_id`),
  KEY `set_winner` (`set_winner`),
  KEY `match_id` (`match_id`),
  KEY `match_id_2` (`match_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `volleyball_set`
--

INSERT INTO `volleyball_set` (`set_winner`, `set_score`, `match_id`, `set_id`) VALUES
(101, 21, 1001, 1),
(102, 22, 1001, 2),
(101, 21, 1002, 3),
(103, 25, 1002, 11),
(101, 23, 1003, 12),
(104, 20, 1003, 13);

-- --------------------------------------------------------

--
-- Table structure for table `volleyball_team_stats`
--

CREATE TABLE IF NOT EXISTS `volleyball_team_stats` (
  `team_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `no_fouls` int(11) NOT NULL,
  `no_set_won` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`team_id`,`match_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `volleyball_team_stats`
--

INSERT INTO `volleyball_team_stats` (`team_id`, `match_id`, `no_fouls`, `no_set_won`, `score`) VALUES
(101, 1001, 8, 2, 25),
(101, 1002, 8, 2, 28),
(102, 1001, 5, 3, 20),
(103, 1002, 8, 1, 24),
(104, 1002, 12, 3, 27);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `athletics_event_details`
--
ALTER TABLE `athletics_event_details`
  ADD CONSTRAINT `athletics_event_details_ibfk_1` FOREIGN KEY (`gold_winner`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `athletics_event_details_ibfk_2` FOREIGN KEY (`silver_winner`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `athletics_event_details_ibfk_3` FOREIGN KEY (`bronze_winner`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `athletics_jumping_event`
--
ALTER TABLE `athletics_jumping_event`
  ADD CONSTRAINT `athletics_jumping_event_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `athletics_event_details` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `athletics_player_stats`
--
ALTER TABLE `athletics_player_stats`
  ADD CONSTRAINT `athletics_player_stats_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `athletics_player_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `athletics_event_details` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `athletics_running_event`
--
ALTER TABLE `athletics_running_event`
  ADD CONSTRAINT `athletics_running_event_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `athletics_event_details` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `athletics_throwing_event`
--
ALTER TABLE `athletics_throwing_event`
  ADD CONSTRAINT `athletics_throwing_event_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `athletics_event_details` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `badminton_match`
--
ALTER TABLE `badminton_match`
  ADD CONSTRAINT `badminton_match_ibfk_1` FOREIGN KEY (`referee_id`) REFERENCES `referee` (`referee_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `badminton_player_stats`
--
ALTER TABLE `badminton_player_stats`
  ADD CONSTRAINT `badminton_player_stats_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `badminton_player_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `badminton_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `badminton_sets`
--
ALTER TABLE `badminton_sets`
  ADD CONSTRAINT `badminton_sets_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `badminton_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `badminton_sets_ibfk_2` FOREIGN KEY (`set_winner`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `badminton_team_stats`
--
ALTER TABLE `badminton_team_stats`
  ADD CONSTRAINT `badminton_team_stats_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `badminton_team_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `badminton_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `basketball_match`
--
ALTER TABLE `basketball_match`
  ADD CONSTRAINT `basketball_match_ibfk_2` FOREIGN KEY (`winner`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `basketball_match_ibfk_1` FOREIGN KEY (`referee_id`) REFERENCES `referee` (`referee_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `basketball_player_stats`
--
ALTER TABLE `basketball_player_stats`
  ADD CONSTRAINT `basketball_player_stats_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `basketball_player_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `basketball_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `basketball_team_stats`
--
ALTER TABLE `basketball_team_stats`
  ADD CONSTRAINT `basketball_team_stats_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `basketball_team_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `basketball_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cricket_match`
--
ALTER TABLE `cricket_match`
  ADD CONSTRAINT `cricket_match_ibfk_1` FOREIGN KEY (`winner`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cricket_match_ibfk_2` FOREIGN KEY (`man_of_the_match`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cricket_match_ibfk_3` FOREIGN KEY (`batting_first`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cricket_player_stats`
--
ALTER TABLE `cricket_player_stats`
  ADD CONSTRAINT `cricket_player_stats_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cricket_player_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `cricket_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cricket_team_stats`
--
ALTER TABLE `cricket_team_stats`
  ADD CONSTRAINT `cricket_team_stats_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cricket_team_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `cricket_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `football_match`
--
ALTER TABLE `football_match`
  ADD CONSTRAINT `football_match_ibfk_2` FOREIGN KEY (`winner`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `football_match_ibfk_1` FOREIGN KEY (`referee_id`) REFERENCES `referee` (`referee_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `football_player_stats`
--
ALTER TABLE `football_player_stats`
  ADD CONSTRAINT `football_player_stats_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `football_player_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `football_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `football_team_stats`
--
ALTER TABLE `football_team_stats`
  ADD CONSTRAINT `football_team_stats_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `football_team_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `football_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hockey_goals_scored`
--
ALTER TABLE `hockey_goals_scored`
  ADD CONSTRAINT `hockey_goals_scored_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `hockey_team_stats` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hockey_goals_scored_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `hockey_team_stats` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hockey_goals_scored_ibfk_3` FOREIGN KEY (`scorer`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hockey_goals_scored_ibfk_4` FOREIGN KEY (`assisted`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hockey_player_stats`
--
ALTER TABLE `hockey_player_stats`
  ADD CONSTRAINT `hockey_player_stats_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `hockey_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hockey_player_stats_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hockey_team_stats`
--
ALTER TABLE `hockey_team_stats`
  ADD CONSTRAINT `hockey_team_stats_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `hockey_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hockey_team_stats_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `iit_participation`
--
ALTER TABLE `iit_participation`
  ADD CONSTRAINT `iit_participation_ibfk_1` FOREIGN KEY (`year`) REFERENCES `tournament` (`year`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `iit_participation_ibfk_2` FOREIGN KEY (`name`) REFERENCES `iit` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lawntennis_game`
--
ALTER TABLE `lawntennis_game`
  ADD CONSTRAINT `lawntennis_game_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `lawntennis_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lawntennis_match`
--
ALTER TABLE `lawntennis_match`
  ADD CONSTRAINT `lawntennis_match_ibfk_1` FOREIGN KEY (`winner`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lawntennis_player_stats`
--
ALTER TABLE `lawntennis_player_stats`
  ADD CONSTRAINT `lawntennis_player_stats_ibfk_3` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lawntennis_player_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `lawntennis_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lawntennis_team_stats`
--
ALTER TABLE `lawntennis_team_stats`
  ADD CONSTRAINT `lawntennis_team_stats_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lawntennis_team_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `lawntennis_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lawn_tennis_set`
--
ALTER TABLE `lawn_tennis_set`
  ADD CONSTRAINT `lawn_tennis_set_ibfk_1` FOREIGN KEY (`set_winner`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lawn_tennis_set_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `lawntennis_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_ibfk_1` FOREIGN KEY (`iit`) REFERENCES `iit` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `player_injury`
--
ALTER TABLE `player_injury`
  ADD CONSTRAINT `player_injury_ibfk_1` FOREIGN KEY (`id`) REFERENCES `player` (`id`);

--
-- Constraints for table `player_phone`
--
ALTER TABLE `player_phone`
  ADD CONSTRAINT `player_phone_ibfk_1` FOREIGN KEY (`id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `player_plays_in_team`
--
ALTER TABLE `player_plays_in_team`
  ADD CONSTRAINT `player_plays_in_team_ibfk_1` FOREIGN KEY (`id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `player_plays_in_team_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `player_plays_in_tournament`
--
ALTER TABLE `player_plays_in_tournament`
  ADD CONSTRAINT `player_plays_in_tournament_ibfk_1` FOREIGN KEY (`year`) REFERENCES `tournament` (`year`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `player_plays_in_tournament_ibfk_2` FOREIGN KEY (`id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `squash_player_stats`
--
ALTER TABLE `squash_player_stats`
  ADD CONSTRAINT `squash_player_stats_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `squash_player_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `squash_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `squash_sets`
--
ALTER TABLE `squash_sets`
  ADD CONSTRAINT `squash_sets_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `squash_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `squash_sets_ibfk_2` FOREIGN KEY (`set_winner`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `squash_team_stats`
--
ALTER TABLE `squash_team_stats`
  ADD CONSTRAINT `squash_team_stats_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `squash_team_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `squash_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tabletennis_match`
--
ALTER TABLE `tabletennis_match`
  ADD CONSTRAINT `tabletennis_match_ibfk_1` FOREIGN KEY (`referee_id`) REFERENCES `referee` (`referee_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tabletennis_player_stats`
--
ALTER TABLE `tabletennis_player_stats`
  ADD CONSTRAINT `tabletennis_player_stats_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tabletennis_player_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `tabletennis_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tabletennis_sets`
--
ALTER TABLE `tabletennis_sets`
  ADD CONSTRAINT `tabletennis_sets_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `tabletennis_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tabletennis_team_stats`
--
ALTER TABLE `tabletennis_team_stats`
  ADD CONSTRAINT `tabletennis_team_stats_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tabletennis_team_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `tabletennis_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `team_ibfk_1` FOREIGN KEY (`name`) REFERENCES `iit` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tournament`
--
ALTER TABLE `tournament`
  ADD CONSTRAINT `tournament_ibfk_1` FOREIGN KEY (`host`) REFERENCES `iit` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `volleyball_match`
--
ALTER TABLE `volleyball_match`
  ADD CONSTRAINT `volleyball_match_ibfk_1` FOREIGN KEY (`match_winner`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `volleyball_match_ibfk_2` FOREIGN KEY (`toss_winner`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `volleyball_player_stats`
--
ALTER TABLE `volleyball_player_stats`
  ADD CONSTRAINT `volleyball_player_stats_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `volleyball_player_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `volleyball_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `volleyball_set`
--
ALTER TABLE `volleyball_set`
  ADD CONSTRAINT `volleyball_set_ibfk_1` FOREIGN KEY (`set_winner`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `volleyball_set_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `volleyball_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `volleyball_team_stats`
--
ALTER TABLE `volleyball_team_stats`
  ADD CONSTRAINT `volleyball_team_stats_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `volleyball_team_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `volleyball_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
