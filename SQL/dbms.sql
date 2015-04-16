-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 17, 2015 at 01:24 AM
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `badminton_match_sets`
--

CREATE TABLE IF NOT EXISTS `badminton_match_sets` (
  `match_id` int(11) NOT NULL,
  `set_winner` int(11) NOT NULL,
  `set_score` int(11) NOT NULL,
  `no_deuces` int(11) NOT NULL,
  `set_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`set_id`),
  KEY `match_id` (`match_id`,`set_winner`),
  KEY `set_winner` (`set_winner`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `basketball_match`
--

INSERT INTO `basketball_match` (`match_id`, `date`, `venue`, `referee_id`) VALUES
(1, '2014-12-18', 'Court 1', 1),
(2, '2014-12-19', 'Court 2', 2);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cricket_played_by_player`
--

CREATE TABLE IF NOT EXISTS `cricket_played_by_player` (
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

-- --------------------------------------------------------

--
-- Table structure for table `cricket_played_by_team`
--

CREATE TABLE IF NOT EXISTS `cricket_played_by_team` (
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
  PRIMARY KEY (`match_id`),
  KEY `silver_winner` (`silver_winner`),
  KEY `bronze_winner` (`bronze_winner`),
  KEY `gold_winner` (`gold_winner`)
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
  PRIMARY KEY (`player_id`,`match_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='check on passing accuracy (cannot be calculated)';

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
-- Table structure for table `hockey_match_player`
--

CREATE TABLE IF NOT EXISTS `hockey_match_player` (
  `match_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `goals_scored` int(11) NOT NULL,
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
-- Table structure for table `hockey_match_team_stats`
--

CREATE TABLE IF NOT EXISTS `hockey_match_team_stats` (
  `match_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
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
('IIT Delhi', 'Delhi', 'Delhi', '110022'),
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
  KEY `year` (`year`,`name`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jumping_event`
--

CREATE TABLE IF NOT EXISTS `jumping_event` (
  `type_id` int(11) NOT NULL,
  `qualifying_score` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lawn_tennis_game`
--

CREATE TABLE IF NOT EXISTS `lawn_tennis_game` (
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
-- Table structure for table `lawn_tennis_match`
--

CREATE TABLE IF NOT EXISTS `lawn_tennis_match` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT,
  `winner` int(11) NOT NULL,
  `date` date NOT NULL,
  `venue` varchar(64) NOT NULL,
  PRIMARY KEY (`match_id`),
  KEY `winner` (`winner`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lawn_tennis_played_by_player`
--

CREATE TABLE IF NOT EXISTS `lawn_tennis_played_by_player` (
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
-- Table structure for table `lawn_tennis_played_by_team`
--

CREATE TABLE IF NOT EXISTS `lawn_tennis_played_by_team` (
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
-- Table structure for table `participate_athletics`
--

CREATE TABLE IF NOT EXISTS `participate_athletics` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`id`, `name`, `date_of_birth`, `gender`, `email_id`, `address`) VALUES
(1, 'Gaurav', '1994-08-19', 'Male', 'gauravmi@iitrpr.ac.in', '');

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

-- --------------------------------------------------------

--
-- Table structure for table `player_injury`
--

CREATE TABLE IF NOT EXISTS `player_injury` (
  `id` int(11) NOT NULL,
  `injury` varchar(64) NOT NULL,
  PRIMARY KEY (`id`,`injury`)
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
  PRIMARY KEY (`id`,`team_id`),
  KEY `team_id` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `referee`
--

INSERT INTO `referee` (`referee_id`, `name`) VALUES
(1, 'Aleem Dar'),
(2, 'David Shepherd');

-- --------------------------------------------------------

--
-- Table structure for table `running_event`
--

CREATE TABLE IF NOT EXISTS `running_event` (
  `type_id` int(11) NOT NULL,
  `qualifying_time` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `squash_match_sets`
--

CREATE TABLE IF NOT EXISTS `squash_match_sets` (
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
-- Table structure for table `table_tennis_match`
--

CREATE TABLE IF NOT EXISTS `table_tennis_match` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT,
  `venue` varchar(64) NOT NULL,
  `date` date NOT NULL,
  `referee_id` int(11) NOT NULL,
  `winner` int(11) NOT NULL,
  PRIMARY KEY (`match_id`),
  KEY `referee_id` (`referee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table_tennis_match_sets`
--

CREATE TABLE IF NOT EXISTS `table_tennis_match_sets` (
  `match_id` int(11) NOT NULL,
  `set_winner` int(11) NOT NULL,
  `set_score` int(11) NOT NULL,
  `no_deuces` int(11) NOT NULL,
  `set_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`set_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `table_tennis_player_stats`
--

CREATE TABLE IF NOT EXISTS `table_tennis_player_stats` (
  `player_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `no_sets_won` int(11) NOT NULL,
  `no_games_won` int(11) NOT NULL,
  PRIMARY KEY (`player_id`,`match_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `table_tennsi_team_stats`
--

CREATE TABLE IF NOT EXISTS `table_tennsi_team_stats` (
  `team_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `no_smashes` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`team_id`,`match_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `throwing_event`
--

CREATE TABLE IF NOT EXISTS `throwing_event` (
  `type_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `qualifying_distance` int(11) NOT NULL,
  PRIMARY KEY (`type_id`)
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
  UNIQUE KEY `host` (`host`),
  KEY `year` (`year`),
  KEY `year_2` (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `volleyball_played_by_player`
--

CREATE TABLE IF NOT EXISTS `volleyball_played_by_player` (
  `player_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `no_points_scored` int(11) NOT NULL,
  `no_of_fouls` int(11) NOT NULL,
  PRIMARY KEY (`player_id`,`match_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `volleyball_played_by_team`
--

CREATE TABLE IF NOT EXISTS `volleyball_played_by_team` (
  `team_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `no_fouls` int(11) NOT NULL,
  `no_set_won` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`team_id`,`match_id`),
  KEY `match_id` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `badminton_match`
--
ALTER TABLE `badminton_match`
  ADD CONSTRAINT `badminton_match_ibfk_1` FOREIGN KEY (`referee_id`) REFERENCES `referee` (`referee_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `badminton_match_sets`
--
ALTER TABLE `badminton_match_sets`
  ADD CONSTRAINT `badminton_match_sets_ibfk_2` FOREIGN KEY (`set_winner`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `badminton_match_sets_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `badminton_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `badminton_player_stats`
--
ALTER TABLE `badminton_player_stats`
  ADD CONSTRAINT `badminton_player_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `badminton_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `badminton_player_stats_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `badminton_team_stats`
--
ALTER TABLE `badminton_team_stats`
  ADD CONSTRAINT `badminton_team_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `badminton_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `badminton_team_stats_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `basketball_match`
--
ALTER TABLE `basketball_match`
  ADD CONSTRAINT `basketball_match_ibfk_1` FOREIGN KEY (`referee_id`) REFERENCES `referee` (`referee_id`);

--
-- Constraints for table `basketball_player_stats`
--
ALTER TABLE `basketball_player_stats`
  ADD CONSTRAINT `basketball_player_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `basketball_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `basketball_player_stats_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `basketball_team_stats`
--
ALTER TABLE `basketball_team_stats`
  ADD CONSTRAINT `basketball_team_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `basketball_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `basketball_team_stats_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cricket_match`
--
ALTER TABLE `cricket_match`
  ADD CONSTRAINT `cricket_match_ibfk_3` FOREIGN KEY (`batting_first`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cricket_match_ibfk_1` FOREIGN KEY (`winner`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cricket_match_ibfk_2` FOREIGN KEY (`man_of_the_match`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cricket_played_by_player`
--
ALTER TABLE `cricket_played_by_player`
  ADD CONSTRAINT `cricket_played_by_player_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `cricket_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cricket_played_by_player_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cricket_played_by_team`
--
ALTER TABLE `cricket_played_by_team`
  ADD CONSTRAINT `cricket_played_by_team_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `cricket_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cricket_played_by_team_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event_details`
--
ALTER TABLE `event_details`
  ADD CONSTRAINT `event_details_ibfk_3` FOREIGN KEY (`bronze_winner`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `event_details_ibfk_1` FOREIGN KEY (`gold_winner`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `event_details_ibfk_2` FOREIGN KEY (`silver_winner`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `footballer_stats`
--
ALTER TABLE `footballer_stats`
  ADD CONSTRAINT `footballer_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `football_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `footballer_stats_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `football_match`
--
ALTER TABLE `football_match`
  ADD CONSTRAINT `football_match_ibfk_1` FOREIGN KEY (`referee_id`) REFERENCES `referee` (`referee_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `football_team_stats`
--
ALTER TABLE `football_team_stats`
  ADD CONSTRAINT `football_team_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `football_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `football_team_stats_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hockey_goals_scored`
--
ALTER TABLE `hockey_goals_scored`
  ADD CONSTRAINT `hockey_goals_scored_ibfk_4` FOREIGN KEY (`assisted`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hockey_goals_scored_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `hockey_match_team_stats` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hockey_goals_scored_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `hockey_match_team_stats` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hockey_goals_scored_ibfk_3` FOREIGN KEY (`scorer`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hockey_match_player`
--
ALTER TABLE `hockey_match_player`
  ADD CONSTRAINT `hockey_match_player_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hockey_match_player_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `hockey_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hockey_match_team_stats`
--
ALTER TABLE `hockey_match_team_stats`
  ADD CONSTRAINT `hockey_match_team_stats_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hockey_match_team_stats_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `hockey_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `iit_participation`
--
ALTER TABLE `iit_participation`
  ADD CONSTRAINT `iit_participation_ibfk_2` FOREIGN KEY (`name`) REFERENCES `iit` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `iit_participation_ibfk_1` FOREIGN KEY (`year`) REFERENCES `tournament` (`year`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lawn_tennis_game`
--
ALTER TABLE `lawn_tennis_game`
  ADD CONSTRAINT `lawn_tennis_game_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `lawn_tennis_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lawn_tennis_match`
--
ALTER TABLE `lawn_tennis_match`
  ADD CONSTRAINT `lawn_tennis_match_ibfk_1` FOREIGN KEY (`winner`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lawn_tennis_played_by_player`
--
ALTER TABLE `lawn_tennis_played_by_player`
  ADD CONSTRAINT `lawn_tennis_played_by_player_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `lawn_tennis_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lawn_tennis_played_by_player_ibfk_1` FOREIGN KEY (`playerid`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lawn_tennis_played_by_team`
--
ALTER TABLE `lawn_tennis_played_by_team`
  ADD CONSTRAINT `lawn_tennis_played_by_team_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `lawn_tennis_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lawn_tennis_played_by_team_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lawn_tennis_set`
--
ALTER TABLE `lawn_tennis_set`
  ADD CONSTRAINT `lawn_tennis_set_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `lawn_tennis_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lawn_tennis_set_ibfk_1` FOREIGN KEY (`set_winner`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `participate_athletics`
--
ALTER TABLE `participate_athletics`
  ADD CONSTRAINT `participate_athletics_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `event_details` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participate_athletics_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `player_belongs_to_iit`
--
ALTER TABLE `player_belongs_to_iit`
  ADD CONSTRAINT `player_belongs_to_iit_ibfk_2` FOREIGN KEY (`id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `player_belongs_to_iit_ibfk_1` FOREIGN KEY (`name`) REFERENCES `iit` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `player_plays_in_team_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `player_plays_in_team_ibfk_1` FOREIGN KEY (`id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `player_plays_in_tournament`
--
ALTER TABLE `player_plays_in_tournament`
  ADD CONSTRAINT `player_plays_in_tournament_ibfk_2` FOREIGN KEY (`id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `player_plays_in_tournament_ibfk_1` FOREIGN KEY (`year`) REFERENCES `tournament` (`year`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `squash_match_sets`
--
ALTER TABLE `squash_match_sets`
  ADD CONSTRAINT `squash_match_sets_ibfk_2` FOREIGN KEY (`set_winner`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `squash_match_sets_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `squash_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `squash_player_stats`
--
ALTER TABLE `squash_player_stats`
  ADD CONSTRAINT `squash_player_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `squash_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `squash_player_stats_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `squash_team_stats`
--
ALTER TABLE `squash_team_stats`
  ADD CONSTRAINT `squash_team_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `squash_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `squash_team_stats_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `table_tennis_match`
--
ALTER TABLE `table_tennis_match`
  ADD CONSTRAINT `table_tennis_match_ibfk_1` FOREIGN KEY (`referee_id`) REFERENCES `referee` (`referee_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `table_tennis_match_sets`
--
ALTER TABLE `table_tennis_match_sets`
  ADD CONSTRAINT `table_tennis_match_sets_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `table_tennis_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `table_tennis_player_stats`
--
ALTER TABLE `table_tennis_player_stats`
  ADD CONSTRAINT `table_tennis_player_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `table_tennis_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `table_tennis_player_stats_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `table_tennsi_team_stats`
--
ALTER TABLE `table_tennsi_team_stats`
  ADD CONSTRAINT `table_tennsi_team_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `table_tennis_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `table_tennsi_team_stats_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `volleyball_match_ibfk_2` FOREIGN KEY (`toss_winner`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `volleyball_match_ibfk_1` FOREIGN KEY (`match_winner`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `volleyball_played_by_player`
--
ALTER TABLE `volleyball_played_by_player`
  ADD CONSTRAINT `volleyball_played_by_player_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `volleyball_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `volleyball_played_by_player_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `volleyball_played_by_team`
--
ALTER TABLE `volleyball_played_by_team`
  ADD CONSTRAINT `volleyball_played_by_team_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `volleyball_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `volleyball_played_by_team_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `volleyball_set`
--
ALTER TABLE `volleyball_set`
  ADD CONSTRAINT `volleyball_set_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `volleyball_match` (`match_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `volleyball_set_ibfk_1` FOREIGN KEY (`set_winner`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
