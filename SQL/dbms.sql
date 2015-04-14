-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 14, 2015 at 12:09 PM
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
CREATE DATABASE IF NOT EXISTS `dbms` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dbms`;

-- --------------------------------------------------------

--
-- Table structure for table `badminton_match`
--

CREATE TABLE IF NOT EXISTS `badminton_match` (
  `match_id` int(11) NOT NULL,
  `match_score` varchar(64) NOT NULL,
  `venue` varchar(64) NOT NULL,
  `date` date NOT NULL,
  `referee` int(11) NOT NULL,
  `winner` int(11) NOT NULL,
  PRIMARY KEY (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `badminton_match_sets`
--

CREATE TABLE IF NOT EXISTS `badminton_match_sets` (
  `match_id` int(11) NOT NULL,
  `set_winner` int(11) NOT NULL,
  `set_score` int(11) NOT NULL,
  `no_deuces` int(11) NOT NULL,
  `set_id` int(11) NOT NULL,
  PRIMARY KEY (`match_id`,`set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  PRIMARY KEY (`player_id`,`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `badminton_team_stats`
--

CREATE TABLE IF NOT EXISTS `badminton_team_stats` (
  `team_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `no_smashes` int(11) NOT NULL,
  `no_drops` int(11) NOT NULL,
  PRIMARY KEY (`team_id`,`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `basketball_match`
--

CREATE TABLE IF NOT EXISTS `basketball_match` (
  `match_id` varchar(64) NOT NULL,
  `date` date NOT NULL,
  `venue` varchar(64) NOT NULL,
  `referee_id` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `basketball_player_stats`
--

CREATE TABLE IF NOT EXISTS `basketball_player_stats` (
  `player_id` varchar(64) NOT NULL,
  `match_id` varchar(64) NOT NULL,
  `2points_scored` int(11) NOT NULL,
  `3points_scored` int(11) NOT NULL,
  `2points_attempted` int(11) NOT NULL,
  `3points_attempted` int(11) NOT NULL,
  `personal_fouls` int(11) NOT NULL,
  `rebounds` int(11) NOT NULL,
  `assists` int(11) NOT NULL,
  `steals` int(11) NOT NULL,
  `turnovers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `basketball_team_stats`
--

CREATE TABLE IF NOT EXISTS `basketball_team_stats` (
  `team_id` varchar(64) NOT NULL,
  `match_id` varchar(64) NOT NULL,
  `total_points_scored` int(11) NOT NULL,
  `timeouts_taken` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Cricket_Match`
--

CREATE TABLE IF NOT EXISTS `Cricket_Match` (
  `match_id` int(11) NOT NULL,
  `Date` date NOT NULL,
  `winner` int(11) NOT NULL,
  `man_of_the_match` varchar(64) NOT NULL,
  `toss_won` varchar(64) NOT NULL,
  `venue` varchar(64) NOT NULL,
  `batting_first` varchar(64) NOT NULL,
  PRIMARY KEY (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event_details`
--

CREATE TABLE IF NOT EXISTS `event_details` (
  `match_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `venue` varchar(64) NOT NULL,
  `gold_winner` int(11) NOT NULL,
  `silver_winner` int(11) NOT NULL,
  `bronze_winner` int(11) NOT NULL,
  PRIMARY KEY (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `footballer_stats`
--

CREATE TABLE IF NOT EXISTS `footballer_stats` (
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
  PRIMARY KEY (`player_id`,`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='check on passing accuracy (cannot be calculated)';

-- --------------------------------------------------------

--
-- Table structure for table `football_match`
--

CREATE TABLE IF NOT EXISTS `football_match` (
  `match_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `venue` varchar(64) NOT NULL,
  `referee_id` int(11) NOT NULL,
  PRIMARY KEY (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='check on accuracy and possession';

-- --------------------------------------------------------

--
-- Table structure for table `hockey_goals_scored`
--

CREATE TABLE IF NOT EXISTS `hockey_goals_scored` (
  `match_id` varchar(64) NOT NULL,
  `team_id` varchar(64) NOT NULL,
  `time` datetime NOT NULL,
  `scorer` varchar(64) NOT NULL,
  `assisted` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hockey_match`
--

CREATE TABLE IF NOT EXISTS `hockey_match` (
  `match_id` varchar(64) NOT NULL,
  `date` date NOT NULL,
  `venue` varchar(64) NOT NULL,
  `winner` varchar(64) NOT NULL,
  `motm` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hockey_match_player`
--

CREATE TABLE IF NOT EXISTS `hockey_match_player` (
  `match_id` varchar(64) NOT NULL,
  `player_id` varchar(64) NOT NULL,
  `goals_scored` int(11) NOT NULL,
  `assists` int(11) NOT NULL,
  `minutes_played` int(11) NOT NULL,
  `fouls` int(11) NOT NULL,
  `yellow_cards` int(11) NOT NULL,
  `red_cards` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hockey_match_team_stats`
--

CREATE TABLE IF NOT EXISTS `hockey_match_team_stats` (
  `match_id` varchar(64) NOT NULL,
  `team_id` varchar(64) NOT NULL,
  `yellow_cards` int(11) NOT NULL,
  `red_cards` int(11) NOT NULL,
  `fouls` int(11) NOT NULL,
  `possession` float NOT NULL,
  `free_hits` int(11) NOT NULL,
  `penalty_kicks` int(11) NOT NULL,
  `penalty_corners` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iit`
--

CREATE TABLE IF NOT EXISTS `iit` (
  `name` varchar(64) NOT NULL,
  `city` varchar(64) NOT NULL,
  `state` varchar(64) NOT NULL,
  `pincode` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  PRIMARY KEY (`year`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jumping_event`
--

CREATE TABLE IF NOT EXISTS `jumping_event` (
  `type_id` int(11) NOT NULL,
  `qualifying_score` int(11) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `participate_athletics`
--

CREATE TABLE IF NOT EXISTS `participate_athletics` (
  `id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `medal` varchar(64) NOT NULL,
  `score_1st_attempt` int(11) NOT NULL,
  `score_2nd_attempt` int(11) NOT NULL,
  `score_3rd_attempt` int(11) NOT NULL,
  `final_score` int(11) NOT NULL,
  PRIMARY KEY (`id`,`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE IF NOT EXISTS `player` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` set('Male','Female') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'Male',
  `email_id` varchar(64) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_belongsto_iit`
--

CREATE TABLE IF NOT EXISTS `player_belongsto_iit` (
  `name` varchar(64) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`name`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_injury`
--

CREATE TABLE IF NOT EXISTS `player_injury` (
  `id` varchar(64) NOT NULL,
  `injury` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_phone`
--

CREATE TABLE IF NOT EXISTS `player_phone` (
  `id` int(11) NOT NULL,
  `phone_number` int(11) NOT NULL,
  PRIMARY KEY (`id`,`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_plays_in_team`
--

CREATE TABLE IF NOT EXISTS `player_plays_in_team` (
  `id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_plays_in_tournament`
--

CREATE TABLE IF NOT EXISTS `player_plays_in_tournament` (
  `id` varchar(64) NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `table_tennis_match`
--

CREATE TABLE IF NOT EXISTS `table_tennis_match` (
  `match_id` int(11) NOT NULL,
  `match_score` varchar(64) NOT NULL,
  `venue` varchar(64) NOT NULL,
  `date` date NOT NULL,
  `referee_id` int(11) NOT NULL,
  `winner` int(11) NOT NULL,
  PRIMARY KEY (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `table_tennis_match_sets`
--

CREATE TABLE IF NOT EXISTS `table_tennis_match_sets` (
  `match_id` int(11) NOT NULL,
  `set_winner` int(11) NOT NULL,
  `set_score` int(11) NOT NULL,
  `no_deuces` int(11) NOT NULL,
  `set_id` int(11) NOT NULL,
  PRIMARY KEY (`match_id`,`set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `table_tennis_player_stats`
--

CREATE TABLE IF NOT EXISTS `table_tennis_player_stats` (
  `player_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `no_sets_won` int(11) NOT NULL,
  `no_games_won` int(11) NOT NULL,
  PRIMARY KEY (`player_id`,`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `table_tennsi_team_stats`
--

CREATE TABLE IF NOT EXISTS `table_tennsi_team_stats` (
  `team_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `no_smashes` int(11) NOT NULL,
  PRIMARY KEY (`team_id`,`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `team_id` varchar(64) NOT NULL,
  `team_size` int(11) NOT NULL,
  `sponsor` varchar(64) NOT NULL,
  `coach` varchar(64) NOT NULL,
  `jersey` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  PRIMARY KEY (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
