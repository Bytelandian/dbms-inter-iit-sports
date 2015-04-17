-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 18, 2015 at 01:27 AM
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
(1006, '2015-12-20', 'XYZ', 1234, 1232, 1231, 'jumping');

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

-- --------------------------------------------------------

--
-- Table structure for table `athletics_participates`
--

CREATE TABLE IF NOT EXISTS `athletics_participates` (
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
  PRIMARY KEY (`match_id`),
  KEY `referee_id` (`referee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1006 ;

--
-- Dumping data for table `badminton_match`
--

INSERT INTO `badminton_match` (`match_id`, `venue`, `date`, `referee_id`, `winner`) VALUES
(1001, 'court-1', '2015-12-12', 1, 101),
(1002, 'court-2', '2015-12-13', 1, 102),
(1003, 'court-3', '2015-12-14', 4, 103),
(1004, 'court-2', '2015-12-15', 3, 104),
(1005, 'court-1', '2015-12-16', 2, 105);

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
(1233, 1002, 8, 5, 2),
(1234, 1002, 7, 5, 1),
(1235, 1003, 3, 2, 2);

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
(102, 1002, 14, 12, 20),
(103, 1001, 11, 9, 19),
(104, 1002, 10, 8, 18);

-- --------------------------------------------------------

--
-- Table structure for table `basketball_match`
--

CREATE TABLE IF NOT EXISTS `basketball_match` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `venue` varchar(64) NOT NULL,
  `referee_id` int(11) NOT NULL,
  PRIMARY KEY (`match_id`),
  KEY `referee_id` (`referee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2012 ;

--
-- Dumping data for table `basketball_match`
--

INSERT INTO `basketball_match` (`match_id`, `date`, `venue`, `referee_id`) VALUES
(1, '2014-12-18', 'Court 1', 1),
(2, '2014-12-19', 'Court 2', 2),
(2001, '0000-00-00', 'court-1', 1),
(2002, '0000-00-00', 'court-2', 3),
(2003, '0000-00-00', 'court-1', 2),
(2004, '0000-00-00', 'court-2', 1),
(2005, '0000-00-00', 'court-1', 2);

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

--
-- Dumping data for table `basketball_player_stats`
--

INSERT INTO `basketball_player_stats` (`player_id`, `match_id`, `2points_scored`, `3points_scored`, `2points_attempted`, `3points_attempted`, `personal_fouls`, `rebounds`, `assists`, `steals`, `turnovers`) VALUES
(1231, 2001, 1, 2, 5, 6, 2, 3, 4, 1, 2),
(1232, 2002, 1, 3, 4, 6, 2, 3, 4, 3, 4),
(1233, 2003, 1, 2, 4, 6, 6, 3, 4, 10, 1),
(1234, 2004, 1, 2, 3, 6, 2, 3, 4, 2, 3);

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

--
-- Dumping data for table `basketball_team_stats`
--

INSERT INTO `basketball_team_stats` (`team_id`, `match_id`, `total_points_scored`, `timeouts_taken`) VALUES
(101, 2001, 65, 4),
(102, 2001, 45, 3),
(103, 2002, 54, 6),
(104, 2002, 32, 2);

-- --------------------------------------------------------

--
-- Table structure for table `cricket_match`
--

CREATE TABLE IF NOT EXISTS `cricket_match` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `winner` int(11) NOT NULL,
  `man_of_the_match` int(11) NOT NULL,
  `toss_won` int(11) NOT NULL,
  `venue` varchar(64) NOT NULL,
  `batting_first` int(11) NOT NULL,
  PRIMARY KEY (`match_id`),
  KEY `winner` (`winner`),
  KEY `man_of_the_match` (`man_of_the_match`),
  KEY `batting_first` (`batting_first`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1006 ;

--
-- Dumping data for table `cricket_match`
--

INSERT INTO `cricket_match` (`match_id`, `Date`, `winner`, `man_of_the_match`, `toss_won`, `venue`, `batting_first`) VALUES
(1001, '2015-12-11', 101, 1231, 101, 'Ground-1', 102),
(1002, '2015-12-11', 102, 1234, 104, 'Ground-2', 103),
(1003, '2015-12-11', 103, 1232, 102, 'Ground-3', 105),
(1004, '2015-12-11', 104, 1231, 101, 'Ground-1', 107),
(1005, '2015-12-11', 105, 1235, 106, 'Ground-1', 103);

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
(1231, 1001, 2, 0, 0, 3, 4, 10, 21, 32, 40, 1, 0, 0, 0, 0, 0, 0, 0),
(1232, 1001, 1, 0, 0, 3, 2, 10, 21, 32, 27, 0, 0, 0, 0, 0, 0, 0, 0),
(1234, 1001, 2, 1, 0, 3, 4, 10, 21, 32, 40, 2, 5, 0, 3, 2, 1, 0, 0),
(1235, 1002, 1, 0, 0, 3, 4, 10, 21, 32, 40, 0, 0, 0, 0, 0, 0, 0, 0);

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
  PRIMARY KEY (`match_id`),
  UNIQUE KEY `referee_id` (`referee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  PRIMARY KEY (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  PRIMARY KEY (`name`),
  KEY `year` (`year`,`name`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iit_participation`
--

INSERT INTO `iit_participation` (`year`, `name`, `contingent_size`, `score_total`, `sports_officer`, `sports_secretary`) VALUES
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lawntennis_match`
--

CREATE TABLE IF NOT EXISTS `lawntennis_match` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT,
  `winner` int(11) NOT NULL,
  `date` date NOT NULL,
  `venue` varchar(64) NOT NULL,
  PRIMARY KEY (`match_id`),
  KEY `winner` (`winner`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lawntennis_player_stats`
--

CREATE TABLE IF NOT EXISTS `lawntennis_player_stats` (
  `playerid` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `player_no_aces` int(11) NOT NULL,
  `player_no_faults` int(11) NOT NULL,
  `player_no_sets_won` int(11) NOT NULL,
  `player_no_games_won` int(11) NOT NULL,
  PRIMARY KEY (`playerid`,`match_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE IF NOT EXISTS `player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` set('Male','Female') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'Male',
  `email_id` varchar(64) NOT NULL,
  `address` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1238 ;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`id`, `name`, `date_of_birth`, `gender`, `email_id`, `address`) VALUES
(1, 'Gaurav', '1994-08-19', 'Male', 'gauravmi@iitrpr.ac.in', ''),
(1231, 'Yash', '0000-00-00', 'Male', 'abc@gmail.com', 'IIT Ropar NangalRoad'),
(1232, 'Shubham', '0000-00-00', 'Male', 'abcd@gmail.com', 'Chandigarh'),
(1233, 'Kiara', '1994-08-07', 'Female', 'abcde@gmail.com', 'Mumbai'),
(1234, 'Saket', '0000-00-00', 'Male', 'abc94@gmail.com', 'Delhi'),
(1235, 'AK', '1994-11-02', 'Male', 'abcxy@gmail.com', 'Mandi'),
(1236, 'Chandu', '1994-01-06', 'Male', 'abcmn@gmail.com', 'Ropar NangalRoad'),
(1237, 'Rohan', '1994-05-07', 'Male', 'abc05@gmail.com', 'Ropar NangalRoad');

-- --------------------------------------------------------

--
-- Table structure for table `player_belongs_to_iit`
--

CREATE TABLE IF NOT EXISTS `player_belongs_to_iit` (
  `name` varchar(64) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`name`,`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player_belongs_to_iit`
--

INSERT INTO `player_belongs_to_iit` (`name`, `id`) VALUES
('IIT Ropar', 1231),
('IIT Bombay', 1232),
('IIT Kanpur', 1233),
('IIT Mandi', 1234),
('IIT Roorkee', 1235),
('IIT Madras', 1236),
('IIT Delhi', 1237);

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
(1231, '2147483647'),
(1232, '2147483647'),
(1232, '2177483647'),
(1233, '2147483647'),
(1234, '2147483647'),
(1235, '2147483647'),
(1236, '2147483647'),
(1237, '2147483647');

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
  PRIMARY KEY (`match_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1116 ;

--
-- Dumping data for table `squash_match`
--

INSERT INTO `squash_match` (`match_id`, `venue`, `date`, `winner`) VALUES
(1001, 'court-2', '2015-12-15', 105),
(1111, 'court-1', '2015-12-14', 102),
(1112, 'court-2', '2015-12-14', 104),
(1113, 'court-1', '2015-12-15', 102),
(1114, 'court-2', '2015-12-16', 104),
(1115, 'court-1', '2015-12-17', 105);

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
(1233, 1112, 1, 3, 8),
(1234, 1113, 1, 1, 3);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  PRIMARY KEY (`match_id`),
  KEY `referee_id` (`referee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1008 ;

--
-- Dumping data for table `tabletennis_match`
--

INSERT INTO `tabletennis_match` (`match_id`, `venue`, `date`, `referee_id`, `winner`) VALUES
(1001, 'Court-1', '2015-12-14', 3, 101),
(1002, 'Court-1', '2015-12-14', 1, 102),
(1003, 'Court-2', '2015-12-15', 3, 103),
(1004, 'Court-1', '2015-12-15', 5, 104),
(1005, 'Court-2', '2015-12-17', 2, 101),
(1006, 'Court-1', '2015-12-16', 1, 103),
(1007, 'Court-2', '2015-12-16', 4, 101);

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
(1234, 1002, 1, 12);

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
(101, 12, 'Adidas', 'S.N. Roy', 'Yellow', 'IIT ROPAR'),
(102, 16, 'Reebok', 'Sushant Singh', 'blue', 'IIT Mandi'),
(103, 12, 'Puma', 'Ashwini', 'Grey', 'IIT KANPUR'),
(104, 4, 'Adidas', 'Saurav Singh', 'Pink', 'IIT KHARAGPUR'),
(105, 11, 'UCB', 'Kumar bharat', 'Black', 'IIT INDORE'),
(106, 12, 'Nike', 'sahir Khan', 'Red', 'IIT PATNA'),
(107, 16, 'Adidas', 'Kaushal', 'Green', 'IIT DELHI'),
(108, 11, 'Reebok', 'Gaurav', 'Yellow', 'IIT ROPAR'),
(109, 8, 'Puma', 'aniket', 'Yellow', 'IIT ROPAR');

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
  PRIMARY KEY (`match_id`),
  KEY `match_winner` (`match_winner`),
  KEY `toss_winner` (`toss_winner`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1009 ;

--
-- Dumping data for table `volleyball_match`
--

INSERT INTO `volleyball_match` (`match_id`, `match_winner`, `date`, `venue`, `toss_winner`) VALUES
(1001, 101, '2015-12-14', 'court-1', 102),
(1002, 103, '2015-12-14', 'court-2', 104),
(1003, 103, '2015-12-15', 'court-1', 102),
(1004, 101, '2015-12-16', 'court-2', 104),
(1005, 101, '2015-12-17', 'court-1', 105),
(1006, 106, '2015-12-15', 'court-2', 105),
(1007, 101, '2015-12-16', 'court-1', 103),
(1008, 104, '2015-12-17', 'court-2', 102);

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
(1231, 1001, 10, 5),
(1231, 1002, 10, 2),
(1232, 1001, 12, 4),
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
-- Constraints for table `athletics_participates`
--
ALTER TABLE `athletics_participates`
  ADD CONSTRAINT `athletics_participates_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `athletics_participates_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `athletics_event_details` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `basketball_match_ibfk_1` FOREIGN KEY (`referee_id`) REFERENCES `referee` (`referee_id`);

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
  ADD CONSTRAINT `lawntennis_player_stats_ibfk_1` FOREIGN KEY (`playerid`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
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
-- Constraints for table `player_belongs_to_iit`
--
ALTER TABLE `player_belongs_to_iit`
  ADD CONSTRAINT `player_belongs_to_iit_ibfk_1` FOREIGN KEY (`name`) REFERENCES `iit` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `player_belongs_to_iit_ibfk_2` FOREIGN KEY (`id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
