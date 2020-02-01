-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 01, 2020 at 05:45 AM
-- Server version: 5.7.29-0ubuntu0.18.04.1
-- PHP Version: 7.2.19-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `collusion`
--

-- --------------------------------------------------------

--
-- Table structure for table `ActionStrings`
--

CREATE TABLE `ActionStrings` (
  `id` int(11) NOT NULL,
  `st` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `is_custom` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `Aliases`
--

CREATE TABLE `Aliases` (
  `id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `AllFilters`
--

CREATE TABLE `AllFilters` (
  `filter_id` int(11) NOT NULL DEFAULT '0',
  `action` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `filter_data` int(11) DEFAULT '0',
  `fmime_type` varchar(100) DEFAULT NULL,
  `fmime_subtype` varchar(200) DEFAULT NULL,
  `component_id` int(11) NOT NULL,
  `scheme` varchar(128) DEFAULT NULL,
  `host` varchar(128) DEFAULT NULL,
  `port` varchar(128) DEFAULT NULL,
  `path` varchar(128) DEFAULT NULL,
  `is_custom` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `AppAnalysisTime`
--

CREATE TABLE `AppAnalysisTime` (
  `id` int(11) NOT NULL,
  `AppID` int(11) DEFAULT NULL,
  `ModelParse` int(11) DEFAULT NULL,
  `ClassLoad` int(11) DEFAULT NULL,
  `MainGeneration` int(11) DEFAULT NULL,
  `EntryPointMapping` int(11) DEFAULT NULL,
  `IC3TotalTime` int(11) DEFAULT NULL,
  `ExitPointPath` int(11) DEFAULT NULL,
  `EntryPointPath` int(11) DEFAULT NULL,
  `TotalTime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `AppCategories`
--

CREATE TABLE `AppCategories` (
  `id` int(11) NOT NULL,
  `AppID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `path` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Applications`
--

CREATE TABLE `Applications` (
  `id` int(11) NOT NULL,
  `app` varchar(512) COLLATE utf8mb4_bin NOT NULL,
  `shasum` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `broadcastchannels`
--

CREATE TABLE `broadcastchannels` (
  `fromapp` int(11) NOT NULL,
  `toapp` int(11) NOT NULL,
  `intent_id` int(11) NOT NULL DEFAULT '0',
  `exitpoint` int(11) NOT NULL DEFAULT '0',
  `entryclass` int(11) NOT NULL DEFAULT '0',
  `filter_id` int(11) NOT NULL DEFAULT '0',
  `icc_type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE `Categories` (
  `id` int(11) NOT NULL,
  `st` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CategoryStrings`
--

CREATE TABLE `CategoryStrings` (
  `id` int(11) NOT NULL,
  `st` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `is_custom` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `Classes`
--

CREATE TABLE `Classes` (
  `id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `class` varchar(191) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `ComponentExtras`
--

CREATE TABLE `ComponentExtras` (
  `id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  `extra` varchar(512) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `Components`
--

CREATE TABLE `Components` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `kind` char(1) COLLATE utf8mb4_bin NOT NULL,
  `exported` tinyint(1) NOT NULL,
  `permission` int(11) DEFAULT NULL,
  `missing` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `deterministicBroadcastChannel`
--

CREATE TABLE `deterministicBroadcastChannel` (
  `fromapp` int(11) NOT NULL,
  `toapp` int(11) NOT NULL,
  `intent_id` int(11) NOT NULL DEFAULT '0',
  `exitpoint` int(11) NOT NULL DEFAULT '0',
  `entryclass` int(11) NOT NULL DEFAULT '0',
  `filter_id` int(11) NOT NULL DEFAULT '0',
  `icc_type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dsfrom`
--

CREATE TABLE `dsfrom` (
  `fromapp` int(11) NOT NULL,
  `toapp` int(11) NOT NULL,
  `intent_id` int(11) DEFAULT '0',
  `exitpoint` int(11) DEFAULT '0',
  `entryclass` int(11) DEFAULT '0',
  `filter_id` int(11) DEFAULT '0',
  `icc_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `EntryPoints`
--

CREATE TABLE `EntryPoints` (
  `id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `method` varchar(512) DEFAULT NULL,
  `instruction` int(11) DEFAULT NULL,
  `statement` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ExitPointComponents`
--

CREATE TABLE `ExitPointComponents` (
  `id` int(11) NOT NULL,
  `exit_id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `ExitPoints`
--

CREATE TABLE `ExitPoints` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `method` varchar(512) COLLATE utf8mb4_bin NOT NULL,
  `instruction` mediumint(9) NOT NULL,
  `statement` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
  `exit_kind` char(1) COLLATE utf8mb4_bin NOT NULL,
  `missing` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `ICCEntryLeaks`
--

CREATE TABLE `ICCEntryLeaks` (
  `id` int(11) NOT NULL,
  `entry_point_id` int(11) DEFAULT NULL,
  `leak_source` varchar(512) NOT NULL,
  `leak_sink` varchar(512) DEFAULT NULL,
  `leak_path` mediumtext,
  `sink_method` varchar(127) DEFAULT NULL,
  `disabled` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ICCExitLeaks`
--

CREATE TABLE `ICCExitLeaks` (
  `id` int(11) NOT NULL,
  `exit_point_id` int(11) DEFAULT NULL,
  `leak_source` varchar(512) DEFAULT NULL,
  `leak_path` mediumtext,
  `leak_sink` varchar(512) DEFAULT NULL,
  `method` varchar(512) DEFAULT NULL,
  `disabled` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `IFilterActions`
--

CREATE TABLE `IFilterActions` (
  `id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  `action` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `IFilterCategories`
--

CREATE TABLE `IFilterCategories` (
  `id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  `category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `IFilterData`
--

CREATE TABLE `IFilterData` (
  `id` int(11) NOT NULL,
  `filter_id` int(11) DEFAULT NULL,
  `scheme` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `host` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `port` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `path` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `subtype` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_custom` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `IntentActions`
--

CREATE TABLE `IntentActions` (
  `id` int(11) NOT NULL,
  `intent_id` int(11) NOT NULL,
  `action` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `IntentCategories`
--

CREATE TABLE `IntentCategories` (
  `id` int(11) NOT NULL,
  `intent_id` int(11) NOT NULL,
  `category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `IntentClasses`
--

CREATE TABLE `IntentClasses` (
  `id` int(11) NOT NULL,
  `intent_id` int(11) NOT NULL,
  `class` varchar(512) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `IntentData`
--

CREATE TABLE `IntentData` (
  `id` int(11) NOT NULL,
  `intent_id` int(11) NOT NULL,
  `data` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `IntentExtras`
--

CREATE TABLE `IntentExtras` (
  `id` int(11) NOT NULL,
  `intent_id` int(11) NOT NULL,
  `extra` varchar(512) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `IntentFilters`
--

CREATE TABLE `IntentFilters` (
  `id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  `alias` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `IntentionalChannels`
--

CREATE TABLE `IntentionalChannels` (
  `fromapp` int(11) NOT NULL,
  `toapp` int(11) NOT NULL,
  `intent_id` int(11) NOT NULL DEFAULT '0',
  `exitpoint` int(11) NOT NULL DEFAULT '0',
  `entryclass` int(11) NOT NULL DEFAULT '0',
  `filter_id` int(10) DEFAULT NULL,
  `icc_type` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `IntentMimeTypes`
--

CREATE TABLE `IntentMimeTypes` (
  `id` int(11) NOT NULL,
  `intent_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `subtype` varchar(191) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `IntentPackages`
--

CREATE TABLE `IntentPackages` (
  `id` int(11) NOT NULL,
  `intent_id` int(11) NOT NULL,
  `package` varchar(512) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `IntentPermissions`
--

CREATE TABLE `IntentPermissions` (
  `id` int(11) NOT NULL,
  `exit_id` int(11) NOT NULL,
  `i_permission` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `Intents`
--

CREATE TABLE `Intents` (
  `id` int(11) NOT NULL,
  `exit_id` int(11) NOT NULL,
  `implicit` tinyint(1) NOT NULL,
  `alias` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `ParsedURI`
--

CREATE TABLE `ParsedURI` (
  `id` int(11) NOT NULL DEFAULT '0',
  `scheme` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `path` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `host` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `port` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `orig_uri` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `is_custom` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PermissionLeaks`
--

CREATE TABLE `PermissionLeaks` (
  `id` int(11) NOT NULL,
  `ICCLeakID` int(11) NOT NULL,
  `PermissionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Permissions`
--

CREATE TABLE `Permissions` (
  `id` int(11) NOT NULL,
  `level` char(1) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `PermissionStrings`
--

CREATE TABLE `PermissionStrings` (
  `id` int(11) NOT NULL,
  `st` varchar(191) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------


--
-- Table structure for table `PrivilegeEscalations`
--

CREATE TABLE `PrivilegeEscalations` (
  `fromapp` int(11) NOT NULL,
  `toapp` int(11) NOT NULL,
  `data_leak_id` int(11) NOT NULL DEFAULT '0',
  `PermissionID` int(11) NOT NULL,
  `icc_type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ProviderAuthorities`
--

CREATE TABLE `ProviderAuthorities` (
  `id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `authority` varchar(512) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `Providers`
--

CREATE TABLE `Providers` (
  `id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  `grant_uri_permissions` tinyint(1) NOT NULL,
  `read_permission` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
  `write_permission` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `PV`
--

CREATE TABLE `PV` (
  `fromapp` int(11) NOT NULL,
  `toapp` int(11) NOT NULL,
  `data_leak_id` int(11) NOT NULL DEFAULT '0',
  `PermissionID` int(11) NOT NULL,
  `exitpoint` int(11) DEFAULT '0',
  `entryclass` int(11) DEFAULT '0',
  `intent_id` int(11) DEFAULT '0',
  `filter_id` int(11) DEFAULT '0',
  `icc_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id` int(11) NOT NULL DEFAULT '0',
  `exit_point_id` int(11) DEFAULT NULL,
  `leak_source` varchar(512) DEFAULT NULL,
  `leak_path` mediumtext,
  `leak_sink` varchar(512) DEFAULT NULL,
  `method` varchar(512) DEFAULT NULL,
  `disabled` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `SourceSinkCount`
--

CREATE TABLE `SourceSinkCount` (
  `id` int(11) NOT NULL,
  `AppID` int(11) NOT NULL,
  `num_Sources` int(11) NOT NULL,
  `num_sinks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `standard_actions`
--

CREATE TABLE `standard_actions` (
  `id` int(5) DEFAULT NULL,
  `action` varchar(71) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `UriData`
--

CREATE TABLE `UriData` (
  `id` int(11) NOT NULL,
  `scheme` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `ssp` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `uri` longtext COLLATE utf8mb4_bin,
  `path` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `query` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
  `authority` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `Uris`
--

CREATE TABLE `Uris` (
  `id` int(11) NOT NULL,
  `exit_id` int(11) NOT NULL,
  `data` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `UsesPermissions`
--

CREATE TABLE `UsesPermissions` (
  `id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `uses_permission` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ActionStrings`
--
ALTER TABLE `ActionStrings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `st` (`st`),
  ADD KEY `st_idx` (`st`) USING HASH;

--
-- Indexes for table `Aliases`
--
ALTER TABLE `Aliases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `component_id` (`component_id`),
  ADD KEY `target_id` (`target_id`);

--
-- Indexes for table `AllFilters`
--
ALTER TABLE `AllFilters`
  ADD KEY `filter_id` (`filter_id`),
  ADD KEY `action` (`action`),
  ADD KEY `category` (`category`),
  ADD KEY `filter_data` (`filter_data`),
  ADD KEY `component_id` (`component_id`),
  ADD KEY `fmime_type` (`fmime_type`),
  ADD KEY `fmime_subtype` (`fmime_subtype`),
  ADD KEY `scheme` (`scheme`),
  ADD KEY `host` (`host`),
  ADD KEY `port` (`port`),
  ADD KEY `path` (`path`),
  ADD KEY `is_custom` (`is_custom`);

--
-- Indexes for table `AppAnalysisTime`
--
ALTER TABLE `AppAnalysisTime`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_AppAnalysisTime_1_idx` (`AppID`);

--
-- Indexes for table `AppCategories`
--
ALTER TABLE `AppCategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_AppCategories_1_idx` (`AppID`),
  ADD KEY `fk_AppCategories_2_idx` (`CategoryID`);

--
-- Indexes for table `Applications`
--
ALTER TABLE `Applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `version` (`version`),
  ADD KEY `shasum` (`shasum`),
  ADD KEY `app` (`app`);

--
-- Indexes for table `broadcastchannels`
--
ALTER TABLE `broadcastchannels`
  ADD KEY `intent_id` (`intent_id`);

--
-- Indexes for table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `CategoryStrings`
--
ALTER TABLE `CategoryStrings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `st` (`st`),
  ADD KEY `st_idx` (`st`) USING HASH;

--
-- Indexes for table `Classes`
--
ALTER TABLE `Classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_id_idx` (`app_id`) USING HASH,
  ADD KEY `idx-class` (`class`) USING HASH;

--
-- Indexes for table `ComponentExtras`
--
ALTER TABLE `ComponentExtras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `component_id` (`component_id`);

--
-- Indexes for table `Components`
--
ALTER TABLE `Components`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`),
  ADD KEY `permission` (`permission`);

--
-- Indexes for table `EntryPoints`
--
ALTER TABLE `EntryPoints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_EntryPoints_class_idx` (`class_id`);

--
-- Indexes for table `ExitPointComponents`
--
ALTER TABLE `ExitPointComponents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exit_id` (`exit_id`),
  ADD KEY `component_id` (`component_id`);

--
-- Indexes for table `ExitPoints`
--
ALTER TABLE `ExitPoints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `ICCEntryLeaks`
--
ALTER TABLE `ICCEntryLeaks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ICCEntryDataLeaks_entry_idx` (`entry_point_id`);

--
-- Indexes for table `ICCExitLeaks`
--
ALTER TABLE `ICCExitLeaks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ExitLeaks_exitpoint_idx` (`exit_point_id`);

--
-- Indexes for table `IFilterActions`
--
ALTER TABLE `IFilterActions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filter_id` (`filter_id`),
  ADD KEY `action_idx` (`action`) USING HASH;

--
-- Indexes for table `IFilterCategories`
--
ALTER TABLE `IFilterCategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filter_id` (`filter_id`),
  ADD KEY `category_idx` (`category`) USING HASH;

--
-- Indexes for table `IFilterData`
--
ALTER TABLE `IFilterData`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filter_id` (`filter_id`);

--
-- Indexes for table `IntentActions`
--
ALTER TABLE `IntentActions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `intent_id` (`intent_id`),
  ADD KEY `action` (`action`);

--
-- Indexes for table `IntentCategories`
--
ALTER TABLE `IntentCategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `intent_id` (`intent_id`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `IntentClasses`
--
ALTER TABLE `IntentClasses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `intent_id` (`intent_id`),
  ADD KEY `iclass-class-idx` (`class`(191)) USING HASH;

--
-- Indexes for table `IntentData`
--
ALTER TABLE `IntentData`
  ADD PRIMARY KEY (`id`),
  ADD KEY `intent_id` (`intent_id`),
  ADD KEY `IntentData_ibfk_2` (`data`);

--
-- Indexes for table `IntentExtras`
--
ALTER TABLE `IntentExtras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `intent_id` (`intent_id`);

--
-- Indexes for table `IntentFilters`
--
ALTER TABLE `IntentFilters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `c_id_idx` (`component_id`) USING HASH;

--
-- Indexes for table `IntentionalChannels`
--
ALTER TABLE `IntentionalChannels`
  ADD KEY `fromapp` (`fromapp`),
  ADD KEY `icc_type` (`icc_type`),
  ADD KEY `toapp` (`toapp`),
  ADD KEY `exitpoint` (`exitpoint`),
  ADD KEY `entryclass` (`entryclass`),
  ADD KEY `intent_id` (`intent_id`);

--
-- Indexes for table `IntentMimeTypes`
--
ALTER TABLE `IntentMimeTypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `intent_id` (`intent_id`),
  ADD KEY `type_idx` (`type`),
  ADD KEY `subtype_idx` (`subtype`);

--
-- Indexes for table `IntentPackages`
--
ALTER TABLE `IntentPackages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `intent_id` (`intent_id`),
  ADD KEY `idx-package` (`package`(191)) USING HASH;

--
-- Indexes for table `IntentPermissions`
--
ALTER TABLE `IntentPermissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exit_id` (`exit_id`),
  ADD KEY `i_permission` (`i_permission`);

--
-- Indexes for table `Intents`
--
ALTER TABLE `Intents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exit_id` (`exit_id`);

--
-- Indexes for table `ParsedURI`
--
ALTER TABLE `ParsedURI`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-scheme-host` (`host`(10)),
  ADD KEY `idx-path-uri` (`path`(10)),
  ADD KEY `idx-scheme-pUri` (`scheme`(10)) USING BTREE,
  ADD KEY `idx-orig-uri` (`orig_uri`(32));

--
-- Indexes for table `PermissionLeaks`
--
ALTER TABLE `PermissionLeaks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1_leaks_permission` (`PermissionID`),
  ADD KEY `FK2_ICC_permission` (`ICCLeakID`);

--
-- Indexes for table `Permissions`
--
ALTER TABLE `Permissions`
  ADD PRIMARY KEY (`id`,`level`);

--
-- Indexes for table `PermissionStrings`
--
ALTER TABLE `PermissionStrings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `st` (`st`),
  ADD KEY `st_idx` (`st`) USING HASH;


--
-- Indexes for table `PrivilegeEscalations`
--
ALTER TABLE `PrivilegeEscalations`
  ADD KEY `data_leak_id` (`data_leak_id`),
  ADD KEY `PermissionID` (`PermissionID`),
  ADD KEY `toapp` (`toapp`),
  ADD KEY `fromapp` (`fromapp`);

--
-- Indexes for table `ProviderAuthorities`
--
ALTER TABLE `ProviderAuthorities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provider_id` (`provider_id`);

--
-- Indexes for table `Providers`
--
ALTER TABLE `Providers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `component_id` (`component_id`);

--
-- Indexes for table `SourceSinkCount`
--
ALTER TABLE `SourceSinkCount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `UriData`
--
ALTER TABLE `UriData`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Uris`
--
ALTER TABLE `Uris`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exit_id` (`exit_id`),
  ADD KEY `data` (`data`);

--
-- Indexes for table `UsesPermissions`
--
ALTER TABLE `UsesPermissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_id` (`app_id`),
  ADD KEY `uses_permission_idx` (`uses_permission`) USING HASH;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ActionStrings`
--
ALTER TABLE `ActionStrings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Aliases`
--
ALTER TABLE `Aliases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `AppAnalysisTime`
--
ALTER TABLE `AppAnalysisTime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `AppCategories`
--
ALTER TABLE `AppCategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Applications`
--
ALTER TABLE `Applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Categories`
--
ALTER TABLE `Categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CategoryStrings`
--
ALTER TABLE `CategoryStrings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Classes`
--
ALTER TABLE `Classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ComponentExtras`
--
ALTER TABLE `ComponentExtras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Components`
--
ALTER TABLE `Components`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `EntryPoints`
--
ALTER TABLE `EntryPoints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ExitPointComponents`
--
ALTER TABLE `ExitPointComponents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ExitPoints`
--
ALTER TABLE `ExitPoints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ICCEntryLeaks`
--
ALTER TABLE `ICCEntryLeaks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ICCExitLeaks`
--
ALTER TABLE `ICCExitLeaks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `IFilterActions`
--
ALTER TABLE `IFilterActions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `IFilterCategories`
--
ALTER TABLE `IFilterCategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `IFilterData`
--
ALTER TABLE `IFilterData`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `IntentActions`
--
ALTER TABLE `IntentActions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `IntentCategories`
--
ALTER TABLE `IntentCategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `IntentClasses`
--
ALTER TABLE `IntentClasses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `IntentData`
--
ALTER TABLE `IntentData`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `IntentExtras`
--
ALTER TABLE `IntentExtras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `IntentFilters`
--
ALTER TABLE `IntentFilters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `IntentMimeTypes`
--
ALTER TABLE `IntentMimeTypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `IntentPackages`
--
ALTER TABLE `IntentPackages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `IntentPermissions`
--
ALTER TABLE `IntentPermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Intents`
--
ALTER TABLE `Intents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PermissionLeaks`
--
ALTER TABLE `PermissionLeaks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PermissionStrings`
--
ALTER TABLE `PermissionStrings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;



--
-- AUTO_INCREMENT for table `ProviderAuthorities`
--
ALTER TABLE `ProviderAuthorities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Providers`
--
ALTER TABLE `Providers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SourceSinkCount`
--
ALTER TABLE `SourceSinkCount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `UriData`
--
ALTER TABLE `UriData`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Uris`
--
ALTER TABLE `Uris`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `UsesPermissions`
--
ALTER TABLE `UsesPermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Aliases`
--
ALTER TABLE `Aliases`
  ADD CONSTRAINT `Aliases_ibfk_1` FOREIGN KEY (`component_id`) REFERENCES `Components` (`id`),
  ADD CONSTRAINT `Aliases_ibfk_2` FOREIGN KEY (`target_id`) REFERENCES `Components` (`id`);

--
-- Constraints for table `AppAnalysisTime`
--
ALTER TABLE `AppAnalysisTime`
  ADD CONSTRAINT `fk_AppAnalysisTime_1` FOREIGN KEY (`AppID`) REFERENCES `Applications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `AppCategories`
--
ALTER TABLE `AppCategories`
  ADD CONSTRAINT `fk_AppCategories_1` FOREIGN KEY (`AppID`) REFERENCES `Applications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_AppCategories_2` FOREIGN KEY (`CategoryID`) REFERENCES `Categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Classes`
--
ALTER TABLE `Classes`
  ADD CONSTRAINT `Classes_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `Applications` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ComponentExtras`
--
ALTER TABLE `ComponentExtras`
  ADD CONSTRAINT `ComponentExtras_ibfk_1` FOREIGN KEY (`component_id`) REFERENCES `Components` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Components`
--
ALTER TABLE `Components`
  ADD CONSTRAINT `Components_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `Classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Components_ibfk_2` FOREIGN KEY (`permission`) REFERENCES `PermissionStrings` (`id`);

--
-- Constraints for table `EntryPoints`
--
ALTER TABLE `EntryPoints`
  ADD CONSTRAINT `fk_EntryPoints_class` FOREIGN KEY (`class_id`) REFERENCES `Classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ExitPointComponents`
--
ALTER TABLE `ExitPointComponents`
  ADD CONSTRAINT `ExitPointComponents_ibfk_1` FOREIGN KEY (`exit_id`) REFERENCES `ExitPoints` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ExitPointComponents_ibfk_2` FOREIGN KEY (`component_id`) REFERENCES `Components` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ExitPoints`
--
ALTER TABLE `ExitPoints`
  ADD CONSTRAINT `ExitPoints_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `Classes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ICCEntryLeaks`
--
ALTER TABLE `ICCEntryLeaks`
  ADD CONSTRAINT `fk_ICCEntryDataLeaks_entry` FOREIGN KEY (`entry_point_id`) REFERENCES `EntryPoints` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ICCExitLeaks`
--
ALTER TABLE `ICCExitLeaks`
  ADD CONSTRAINT `fk_ExitLeaks_exitpoint` FOREIGN KEY (`exit_point_id`) REFERENCES `ExitPoints` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `IFilterActions`
--
ALTER TABLE `IFilterActions`
  ADD CONSTRAINT `IFilterActions_ibfk_1` FOREIGN KEY (`filter_id`) REFERENCES `IntentFilters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `IFilterActions_ibfk_2` FOREIGN KEY (`action`) REFERENCES `ActionStrings` (`id`);

--
-- Constraints for table `IFilterCategories`
--
ALTER TABLE `IFilterCategories`
  ADD CONSTRAINT `IFilterCategories_ibfk_1` FOREIGN KEY (`filter_id`) REFERENCES `IntentFilters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `IFilterCategories_ibfk_2` FOREIGN KEY (`category`) REFERENCES `CategoryStrings` (`id`);

--
-- Constraints for table `IFilterData`
--
ALTER TABLE `IFilterData`
  ADD CONSTRAINT `IFilterData_ibfk_1` FOREIGN KEY (`filter_id`) REFERENCES `IntentFilters` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `IntentActions`
--
ALTER TABLE `IntentActions`
  ADD CONSTRAINT `IntentActions_ibfk_1` FOREIGN KEY (`intent_id`) REFERENCES `Intents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `IntentActions_ibfk_2` FOREIGN KEY (`action`) REFERENCES `ActionStrings` (`id`);

--
-- Constraints for table `IntentCategories`
--
ALTER TABLE `IntentCategories`
  ADD CONSTRAINT `IntentCategories_ibfk_1` FOREIGN KEY (`intent_id`) REFERENCES `Intents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `IntentCategories_ibfk_2` FOREIGN KEY (`category`) REFERENCES `CategoryStrings` (`id`);

--
-- Constraints for table `IntentClasses`
--
ALTER TABLE `IntentClasses`
  ADD CONSTRAINT `IntentClasses_ibfk_1` FOREIGN KEY (`intent_id`) REFERENCES `Intents` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `IntentData`
--
ALTER TABLE `IntentData`
  ADD CONSTRAINT `IntentData_ibfk_1` FOREIGN KEY (`intent_id`) REFERENCES `Intents` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `IntentExtras`
--
ALTER TABLE `IntentExtras`
  ADD CONSTRAINT `IntentExtras_ibfk_1` FOREIGN KEY (`intent_id`) REFERENCES `Intents` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `IntentFilters`
--
ALTER TABLE `IntentFilters`
  ADD CONSTRAINT `IntentFilters_ibfk_1` FOREIGN KEY (`component_id`) REFERENCES `Components` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `IntentMimeTypes`
--
ALTER TABLE `IntentMimeTypes`
  ADD CONSTRAINT `IMimeTypes_ibfk_1` FOREIGN KEY (`intent_id`) REFERENCES `Intents` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `IntentPackages`
--
ALTER TABLE `IntentPackages`
  ADD CONSTRAINT `IntentPackages_ibfk_1` FOREIGN KEY (`intent_id`) REFERENCES `Intents` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `IntentPermissions`
--
ALTER TABLE `IntentPermissions`
  ADD CONSTRAINT `IntentPermissions_ibfk_1` FOREIGN KEY (`exit_id`) REFERENCES `ExitPoints` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `IntentPermissions_ibfk_2` FOREIGN KEY (`i_permission`) REFERENCES `PermissionStrings` (`id`);

--
-- Constraints for table `Intents`
--
ALTER TABLE `Intents`
  ADD CONSTRAINT `Intents_ibfk_1` FOREIGN KEY (`exit_id`) REFERENCES `ExitPoints` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `PermissionLeaks`
--
ALTER TABLE `PermissionLeaks`
  ADD CONSTRAINT `FK1_leaks_permission` FOREIGN KEY (`PermissionID`) REFERENCES `PermissionStrings` (`id`),
  ADD CONSTRAINT `FK2_ICC_permission` FOREIGN KEY (`ICCLeakID`) REFERENCES `ICCExitLeaks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Permissions`
--
ALTER TABLE `Permissions`
  ADD CONSTRAINT `Permissions_ibfk_1` FOREIGN KEY (`id`) REFERENCES `PermissionStrings` (`id`);

--
-- Constraints for table `PrivilegeEscalations`
--
ALTER TABLE `PrivilegeEscalations`
  ADD CONSTRAINT `FK_PrivilegeEscalations_Applications` FOREIGN KEY (`fromapp`) REFERENCES `Applications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PrivilegeEscalations_Applications_2` FOREIGN KEY (`toapp`) REFERENCES `Applications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PrivilegeEscalations_ICCExitLeaks` FOREIGN KEY (`data_leak_id`) REFERENCES `ICCExitLeaks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PrivilegeEscalations_PermissionStrings` FOREIGN KEY (`PermissionID`) REFERENCES `PermissionStrings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ProviderAuthorities`
--
ALTER TABLE `ProviderAuthorities`
  ADD CONSTRAINT `PAuthorities_ibfk_1` FOREIGN KEY (`provider_id`) REFERENCES `Providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Providers`
--
ALTER TABLE `Providers`
  ADD CONSTRAINT `Providers_ibfk_1` FOREIGN KEY (`component_id`) REFERENCES `Components` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Uris`
--
ALTER TABLE `Uris`
  ADD CONSTRAINT `Uris_ibfk_1` FOREIGN KEY (`exit_id`) REFERENCES `ExitPoints` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Uris_ibfk_2` FOREIGN KEY (`data`) REFERENCES `UriData` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `UsesPermissions`
--
ALTER TABLE `UsesPermissions`
  ADD CONSTRAINT `UsesPermissions_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `Applications` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `UsesPermissions_ibfk_2` FOREIGN KEY (`uses_permission`) REFERENCES `PermissionStrings` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
