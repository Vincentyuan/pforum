-- phpMyAdmin SQL Dump
-- version 2.11.0
-- http://www.phpmyadmin.net
--
-- 主机: mysql.kj.dreamhosters.com
-- 生成日期: 2007 年 11 月 05 日 06:06
-- 服务器版本: 5.0.24
-- PHP 版本: 4.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- 数据库: `vanilla`
--

-- --------------------------------------------------------

--
-- 表的结构 `LUM_Category`
--

CREATE TABLE IF NOT EXISTS `LUM_Category` (
  `CategoryID` int(2) NOT NULL auto_increment,
  `Name` varchar(100) NOT NULL default '',
  `Description` text,
  `Priority` int(11) NOT NULL default '0',
  PRIMARY KEY  (`CategoryID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 导出表中的数据 `LUM_Category`
--

INSERT INTO `LUM_Category` (`CategoryID`, `Name`, `Description`, `Priority`) VALUES
(1, 'General', 'General discussions go in here...', 7),
(2, 'FAQs', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `LUM_CategoryBlock`
--

CREATE TABLE IF NOT EXISTS `LUM_CategoryBlock` (
  `CategoryID` int(11) NOT NULL default '0',
  `UserID` int(11) NOT NULL default '0',
  `Blocked` enum('1','0') NOT NULL default '1',
  PRIMARY KEY  (`CategoryID`,`UserID`),
  KEY `cat_block_user` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `LUM_CategoryBlock`
--


-- --------------------------------------------------------

--
-- 表的结构 `LUM_CategoryRoleBlock`
--

CREATE TABLE IF NOT EXISTS `LUM_CategoryRoleBlock` (
  `CategoryID` int(11) NOT NULL default '0',
  `RoleID` int(11) NOT NULL default '0',
  `Blocked` enum('1','0') NOT NULL default '0',
  KEY `cat_roleblock_cat` (`CategoryID`),
  KEY `cat_roleblock_role` (`RoleID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `LUM_CategoryRoleBlock`
--


-- --------------------------------------------------------

--
-- 表的结构 `LUM_Comment`
--

CREATE TABLE IF NOT EXISTS `LUM_Comment` (
  `CommentID` int(8) NOT NULL auto_increment,
  `DiscussionID` int(8) NOT NULL default '0',
  `AuthUserID` int(10) NOT NULL default '0',
  `DateCreated` datetime default NULL,
  `EditUserID` int(10) default NULL,
  `DateEdited` datetime default NULL,
  `WhisperUserID` int(11) default NULL,
  `Body` text,
  `FormatType` varchar(20) default NULL,
  `Deleted` enum('1','0') NOT NULL default '0',
  `DateDeleted` datetime default NULL,
  `DeleteUserID` int(10) NOT NULL default '0',
  `RemoteIp` varchar(100) default '',
  PRIMARY KEY  (`CommentID`,`DiscussionID`),
  KEY `comment_user` (`AuthUserID`),
  KEY `comment_whisper` (`WhisperUserID`),
  KEY `comment_discussion` (`DiscussionID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- 导出表中的数据 `LUM_Comment`
--

INSERT INTO `LUM_Comment` (`CommentID`, `DiscussionID`, `AuthUserID`, `DateCreated`, `EditUserID`, `DateEdited`, `WhisperUserID`, `Body`, `FormatType`, `Deleted`, `DateDeleted`, `DeleteUserID`, `RemoteIp`) VALUES
(1, 1, 1, '2007-10-23 01:34:58', NULL, NULL, 0, 'what?', 'Text', '0', NULL, 0, '127.0.0.1'),
(2, 1, 1, '2007-10-23 20:58:18', NULL, NULL, 0, 'next', 'Text', '0', NULL, 0, '127.0.0.1'),
(3, 7, 1, '2007-10-24 23:07:28', NULL, NULL, 0, '??', 'Text', '1', '2007-10-25 00:49:07', 1, '127.0.0.1'),
(4, 8, 1, '2007-10-24 23:17:22', NULL, NULL, 0, '??', 'Text', '1', '2007-10-25 00:49:36', 1, '127.0.0.1'),
(5, 1, 1, NULL, NULL, NULL, NULL, 'aa', NULL, '0', NULL, 0, ''),
(6, 1, 1, NULL, NULL, NULL, NULL, 'hey', NULL, '0', NULL, 0, ''),
(7, 9, 1, NULL, NULL, NULL, NULL, 'aaa', NULL, '0', NULL, 0, ''),
(8, 3, 1, NULL, NULL, NULL, NULL, 'z', NULL, '0', NULL, 0, ''),
(9, 11, 1, NULL, NULL, NULL, NULL, '', NULL, '0', NULL, 0, ''),
(10, 11, 1, NULL, NULL, NULL, NULL, 'xxx', NULL, '0', NULL, 0, ''),
(11, 11, 1, NULL, NULL, NULL, NULL, 'what is more?\r\n', NULL, '0', NULL, 0, ''),
(12, 13, 1, NULL, NULL, NULL, NULL, 'try', NULL, '0', NULL, 0, ''),
(13, 17, 1, '2007-10-26 06:21:06', NULL, NULL, 0, 'offical comments', 'Text', '0', NULL, 0, '127.0.0.1'),
(14, 1, 2007, '2007-10-26 06:34:46', NULL, NULL, NULL, NULL, NULL, '0', NULL, 0, ''),
(15, 20, 1, '2007-10-26 06:40:48', NULL, NULL, NULL, NULL, NULL, '0', NULL, 0, ''),
(16, 21, 1, '2007-10-26 06:42:24', NULL, NULL, NULL, NULL, NULL, '0', NULL, 0, ''),
(17, 22, 1, '2007-10-26 06:43:54', NULL, NULL, NULL, NULL, NULL, '0', NULL, 0, ''),
(18, 23, 1, '2007-10-26 06:44:42', NULL, NULL, NULL, 'xx', NULL, '0', NULL, 0, ''),
(19, 23, 1, NULL, NULL, NULL, NULL, '??-?–?', NULL, '0', NULL, 0, ''),
(20, 23, 1, NULL, NULL, NULL, NULL, '??°??¨????o???ˉ??￥??…??????è?“?…￥??-?–??o?', NULL, '0', NULL, 0, ''),
(21, 22, 1, NULL, NULL, NULL, NULL, 'las\r\n', NULL, '0', NULL, 0, ''),
(22, 22, 1, NULL, NULL, NULL, NULL, 'next', NULL, '0', NULL, 0, ''),
(23, 22, 1, '2007-10-27 17:25:24', NULL, NULL, 0, 'eeee', 'Text', '0', NULL, 0, '127.0.0.1'),
(24, 22, 2, '2007-10-27 17:53:01', NULL, NULL, 0, 'one', 'Text', '0', NULL, 0, '127.0.0.1'),
(25, 17, 2, '2007-10-27 22:38:28', NULL, NULL, 0, 'go', 'Text', '0', NULL, 0, '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `LUM_Discussion`
--

CREATE TABLE IF NOT EXISTS `LUM_Discussion` (
  `DiscussionID` int(8) NOT NULL auto_increment,
  `AuthUserID` int(10) NOT NULL default '0',
  `WhisperUserID` int(11) NOT NULL default '0',
  `FirstCommentID` int(11) NOT NULL default '0',
  `LastUserID` int(11) NOT NULL default '0',
  `Active` enum('1','0') NOT NULL default '1',
  `Closed` enum('1','0') NOT NULL default '0',
  `Sticky` enum('1','0') NOT NULL default '0',
  `Sink` enum('1','0') NOT NULL default '0',
  `Name` varchar(100) NOT NULL default '',
  `DateCreated` datetime NOT NULL default '0000-00-00 00:00:00',
  `DateLastActive` datetime NOT NULL default '0000-00-00 00:00:00',
  `CountComments` int(4) NOT NULL default '1',
  `CategoryID` int(11) default NULL,
  `WhisperToLastUserID` int(11) default NULL,
  `WhisperFromLastUserID` int(11) default NULL,
  `DateLastWhisper` datetime default NULL,
  `TotalWhisperCount` int(11) NOT NULL default '0',
  PRIMARY KEY  (`DiscussionID`),
  KEY `discussion_user` (`AuthUserID`),
  KEY `discussion_whisperuser` (`WhisperUserID`),
  KEY `discussion_first` (`FirstCommentID`),
  KEY `discussion_last` (`LastUserID`),
  KEY `discussion_category` (`CategoryID`),
  KEY `discussion_dateactive` (`DateLastActive`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- 导出表中的数据 `LUM_Discussion`
--

INSERT INTO `LUM_Discussion` (`DiscussionID`, `AuthUserID`, `WhisperUserID`, `FirstCommentID`, `LastUserID`, `Active`, `Closed`, `Sticky`, `Sink`, `Name`, `DateCreated`, `DateLastActive`, `CountComments`, `CategoryID`, `WhisperToLastUserID`, `WhisperFromLastUserID`, `DateLastWhisper`, `TotalWhisperCount`) VALUES
(1, 1, 0, 1, 1, '1', '0', '0', '0', 'new', '2007-10-23 01:34:58', '2007-10-23 20:58:18', 2, 1, NULL, NULL, NULL, 0),
(2, 0, 0, 0, 0, '1', '0', '0', '0', 'title', '0000-00-00 00:00:00', '2007-10-24 00:34:47', 1, 1, NULL, NULL, NULL, 0),
(16, 0, 0, 0, 0, '1', '0', '0', '0', '?°?èˉ?', '2007-10-25 00:50:31', '2007-10-25 00:50:31', 1, 1, NULL, NULL, NULL, 0),
(10, 0, 0, 0, 0, '1', '0', '0', '0', 'è??', '2007-10-25 00:24:19', '2007-10-25 00:24:19', 1, 1, NULL, NULL, NULL, 0),
(12, 0, 0, 0, 0, '1', '0', '0', '0', '??-?–?????°?èˉ?', '2007-10-25 00:25:08', '2007-10-25 00:25:08', 1, 1, NULL, NULL, NULL, 0),
(17, 1, 0, 13, 2, '1', '0', '0', '0', 'offical topic', '2007-10-26 06:21:06', '2007-10-27 22:38:28', 2, 1, NULL, NULL, NULL, 0),
(18, 0, 0, 0, 0, '1', '0', '0', '0', 'try', '2007-10-26 06:33:40', '2007-10-26 06:33:40', 1, 1, NULL, NULL, NULL, 0),
(20, 0, 0, 0, 0, '1', '0', '0', '0', 'zero', '2007-10-26 06:40:48', '2007-10-26 06:40:48', 1, 1, NULL, NULL, NULL, 0),
(21, 0, 0, 0, 0, '1', '0', '0', '0', 'zeroooo', '2007-10-26 06:42:24', '2007-10-26 06:42:24', 1, 1, NULL, NULL, NULL, 0),
(22, 0, 0, 0, 2, '1', '0', '0', '0', '1', '2007-10-26 06:43:54', '2007-10-27 17:53:01', 3, 1, NULL, NULL, NULL, 0),
(23, 0, 0, 0, 0, '1', '0', '0', '0', 'cc', '2007-10-26 06:44:42', '2007-10-26 06:44:42', 1, 1, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `LUM_DiscussionUserWhisperFrom`
--

CREATE TABLE IF NOT EXISTS `LUM_DiscussionUserWhisperFrom` (
  `DiscussionID` int(11) NOT NULL default '0',
  `WhisperFromUserID` int(11) NOT NULL default '0',
  `LastUserID` int(11) NOT NULL default '0',
  `CountWhispers` int(11) NOT NULL default '0',
  `DateLastActive` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`DiscussionID`,`WhisperFromUserID`),
  KEY `discussion_user_whisper_lastuser` (`LastUserID`),
  KEY `discussion_user_whisper_lastactive` (`DateLastActive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `LUM_DiscussionUserWhisperFrom`
--


-- --------------------------------------------------------

--
-- 表的结构 `LUM_DiscussionUserWhisperTo`
--

CREATE TABLE IF NOT EXISTS `LUM_DiscussionUserWhisperTo` (
  `DiscussionID` int(11) NOT NULL default '0',
  `WhisperToUserID` int(11) NOT NULL default '0',
  `LastUserID` int(11) NOT NULL default '0',
  `CountWhispers` int(11) NOT NULL default '0',
  `DateLastActive` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`DiscussionID`,`WhisperToUserID`),
  KEY `discussion_user_whisperto_lastuser` (`LastUserID`),
  KEY `discussion_user_whisperto_lastactive` (`DateLastActive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `LUM_DiscussionUserWhisperTo`
--


-- --------------------------------------------------------

--
-- 表的结构 `LUM_IpHistory`
--

CREATE TABLE IF NOT EXISTS `LUM_IpHistory` (
  `IpHistoryID` int(11) NOT NULL auto_increment,
  `RemoteIp` varchar(30) NOT NULL default '',
  `UserID` int(11) NOT NULL default '0',
  `DateLogged` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`IpHistoryID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `LUM_IpHistory`
--


-- --------------------------------------------------------

--
-- 表的结构 `LUM_Role`
--

CREATE TABLE IF NOT EXISTS `LUM_Role` (
  `RoleID` int(2) NOT NULL auto_increment,
  `Name` varchar(100) NOT NULL default '',
  `Icon` varchar(155) NOT NULL default '',
  `Description` varchar(200) NOT NULL default '',
  `Active` enum('1','0') NOT NULL default '1',
  `PERMISSION_SIGN_IN` enum('1','0') NOT NULL default '0',
  `PERMISSION_HTML_ALLOWED` enum('0','1') NOT NULL default '0',
  `PERMISSION_RECEIVE_APPLICATION_NOTIFICATION` enum('1','0') NOT NULL default '0',
  `Permissions` text,
  `Priority` int(11) NOT NULL default '0',
  `UnAuthenticated` enum('1','0') NOT NULL default '0',
  PRIMARY KEY  (`RoleID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 导出表中的数据 `LUM_Role`
--

INSERT INTO `LUM_Role` (`RoleID`, `Name`, `Icon`, `Description`, `Active`, `PERMISSION_SIGN_IN`, `PERMISSION_HTML_ALLOWED`, `PERMISSION_RECEIVE_APPLICATION_NOTIFICATION`, `Permissions`, `Priority`, `UnAuthenticated`) VALUES
(1, 'Unauthenticated', '', '', '1', '1', '1', '1', 'a:32:{s:23:"PERMISSION_ADD_COMMENTS";N;s:27:"PERMISSION_START_DISCUSSION";N;s:28:"PERMISSION_STICK_DISCUSSIONS";N;s:27:"PERMISSION_HIDE_DISCUSSIONS";N;s:28:"PERMISSION_CLOSE_DISCUSSIONS";N;s:27:"PERMISSION_EDIT_DISCUSSIONS";N;s:34:"PERMISSION_VIEW_HIDDEN_DISCUSSIONS";N;s:24:"PERMISSION_EDIT_COMMENTS";N;s:24:"PERMISSION_HIDE_COMMENTS";N;s:31:"PERMISSION_VIEW_HIDDEN_COMMENTS";N;s:44:"PERMISSION_ADD_COMMENTS_TO_CLOSED_DISCUSSION";N;s:25:"PERMISSION_ADD_CATEGORIES";N;s:26:"PERMISSION_EDIT_CATEGORIES";N;s:28:"PERMISSION_REMOVE_CATEGORIES";N;s:26:"PERMISSION_SORT_CATEGORIES";N;s:28:"PERMISSION_VIEW_ALL_WHISPERS";N;s:29:"PERMISSION_APPROVE_APPLICANTS";N;s:27:"PERMISSION_CHANGE_USER_ROLE";N;s:21:"PERMISSION_EDIT_USERS";N;s:31:"PERMISSION_IP_ADDRESSES_VISIBLE";N;s:30:"PERMISSION_MANAGE_REGISTRATION";N;s:21:"PERMISSION_SORT_ROLES";N;s:20:"PERMISSION_ADD_ROLES";N;s:21:"PERMISSION_EDIT_ROLES";N;s:23:"PERMISSION_REMOVE_ROLES";N;s:28:"PERMISSION_CHECK_FOR_UPDATES";N;s:38:"PERMISSION_CHANGE_APPLICATION_SETTINGS";N;s:28:"PERMISSION_MANAGE_EXTENSIONS";N;s:26:"PERMISSION_MANAGE_LANGUAGE";N;s:24:"PERMISSION_MANAGE_STYLES";N;s:27:"PERMISSION_ALLOW_DEBUG_INFO";N;s:27:"PERMISSION_DATABASE_CLEANUP";N;}', 0, '1'),
(2, 'Banned', '', '', '1', '0', '0', '0', 'a:32:{s:23:"PERMISSION_ADD_COMMENTS";N;s:27:"PERMISSION_START_DISCUSSION";N;s:28:"PERMISSION_STICK_DISCUSSIONS";N;s:27:"PERMISSION_HIDE_DISCUSSIONS";N;s:28:"PERMISSION_CLOSE_DISCUSSIONS";N;s:27:"PERMISSION_EDIT_DISCUSSIONS";N;s:34:"PERMISSION_VIEW_HIDDEN_DISCUSSIONS";N;s:24:"PERMISSION_EDIT_COMMENTS";N;s:24:"PERMISSION_HIDE_COMMENTS";N;s:31:"PERMISSION_VIEW_HIDDEN_COMMENTS";N;s:44:"PERMISSION_ADD_COMMENTS_TO_CLOSED_DISCUSSION";N;s:25:"PERMISSION_ADD_CATEGORIES";N;s:26:"PERMISSION_EDIT_CATEGORIES";N;s:28:"PERMISSION_REMOVE_CATEGORIES";N;s:26:"PERMISSION_SORT_CATEGORIES";N;s:28:"PERMISSION_VIEW_ALL_WHISPERS";N;s:29:"PERMISSION_APPROVE_APPLICANTS";N;s:27:"PERMISSION_CHANGE_USER_ROLE";N;s:21:"PERMISSION_EDIT_USERS";N;s:31:"PERMISSION_IP_ADDRESSES_VISIBLE";N;s:30:"PERMISSION_MANAGE_REGISTRATION";N;s:21:"PERMISSION_SORT_ROLES";N;s:20:"PERMISSION_ADD_ROLES";N;s:21:"PERMISSION_EDIT_ROLES";N;s:23:"PERMISSION_REMOVE_ROLES";N;s:28:"PERMISSION_CHECK_FOR_UPDATES";N;s:38:"PERMISSION_CHANGE_APPLICATION_SETTINGS";N;s:28:"PERMISSION_MANAGE_EXTENSIONS";N;s:26:"PERMISSION_MANAGE_LANGUAGE";N;s:24:"PERMISSION_MANAGE_STYLES";N;s:27:"PERMISSION_ALLOW_DEBUG_INFO";N;s:27:"PERMISSION_DATABASE_CLEANUP";N;}', 1, '0'),
(3, 'Member', '', '', '1', '1', '1', '0', 'a:33:{s:23:"PERMISSION_ADD_COMMENTS";i:1;s:27:"PERMISSION_START_DISCUSSION";i:1;s:27:"PERMISSION_SINK_DISCUSSIONS";i:1;s:28:"PERMISSION_STICK_DISCUSSIONS";N;s:27:"PERMISSION_HIDE_DISCUSSIONS";N;s:28:"PERMISSION_CLOSE_DISCUSSIONS";N;s:27:"PERMISSION_EDIT_DISCUSSIONS";N;s:34:"PERMISSION_VIEW_HIDDEN_DISCUSSIONS";N;s:24:"PERMISSION_EDIT_COMMENTS";N;s:24:"PERMISSION_HIDE_COMMENTS";N;s:31:"PERMISSION_VIEW_HIDDEN_COMMENTS";N;s:44:"PERMISSION_ADD_COMMENTS_TO_CLOSED_DISCUSSION";N;s:25:"PERMISSION_ADD_CATEGORIES";N;s:26:"PERMISSION_EDIT_CATEGORIES";N;s:28:"PERMISSION_REMOVE_CATEGORIES";N;s:26:"PERMISSION_SORT_CATEGORIES";N;s:28:"PERMISSION_VIEW_ALL_WHISPERS";N;s:29:"PERMISSION_APPROVE_APPLICANTS";N;s:27:"PERMISSION_CHANGE_USER_ROLE";N;s:21:"PERMISSION_EDIT_USERS";N;s:31:"PERMISSION_IP_ADDRESSES_VISIBLE";N;s:30:"PERMISSION_MANAGE_REGISTRATION";N;s:21:"PERMISSION_SORT_ROLES";N;s:20:"PERMISSION_ADD_ROLES";N;s:21:"PERMISSION_EDIT_ROLES";N;s:23:"PERMISSION_REMOVE_ROLES";N;s:28:"PERMISSION_CHECK_FOR_UPDATES";N;s:38:"PERMISSION_CHANGE_APPLICATION_SETTINGS";N;s:28:"PERMISSION_MANAGE_EXTENSIONS";N;s:26:"PERMISSION_MANAGE_LANGUAGE";N;s:24:"PERMISSION_MANAGE_STYLES";N;s:27:"PERMISSION_ALLOW_DEBUG_INFO";N;s:27:"PERMISSION_DATABASE_CLEANUP";N;}', 2, '0'),
(4, 'Administrator', '', '', '1', '1', '1', '1', 'a:34:{s:23:"PERMISSION_ADD_COMMENTS";i:1;s:27:"PERMISSION_START_DISCUSSION";i:1;s:27:"PERMISSION_SINK_DISCUSSIONS";i:1;s:28:"PERMISSION_STICK_DISCUSSIONS";i:1;s:27:"PERMISSION_HIDE_DISCUSSIONS";i:1;s:28:"PERMISSION_CLOSE_DISCUSSIONS";i:1;s:27:"PERMISSION_EDIT_DISCUSSIONS";i:1;s:34:"PERMISSION_VIEW_HIDDEN_DISCUSSIONS";i:1;s:24:"PERMISSION_EDIT_COMMENTS";i:1;s:24:"PERMISSION_HIDE_COMMENTS";i:1;s:31:"PERMISSION_VIEW_HIDDEN_COMMENTS";i:1;s:44:"PERMISSION_ADD_COMMENTS_TO_CLOSED_DISCUSSION";i:1;s:25:"PERMISSION_ADD_CATEGORIES";i:1;s:26:"PERMISSION_EDIT_CATEGORIES";i:1;s:28:"PERMISSION_REMOVE_CATEGORIES";i:1;s:26:"PERMISSION_SORT_CATEGORIES";i:1;s:28:"PERMISSION_VIEW_ALL_WHISPERS";i:1;s:29:"PERMISSION_APPROVE_APPLICANTS";i:1;s:27:"PERMISSION_CHANGE_USER_ROLE";i:1;s:21:"PERMISSION_EDIT_USERS";i:1;s:31:"PERMISSION_IP_ADDRESSES_VISIBLE";i:1;s:30:"PERMISSION_MANAGE_REGISTRATION";i:1;s:21:"PERMISSION_SORT_ROLES";i:1;s:20:"PERMISSION_ADD_ROLES";i:1;s:21:"PERMISSION_EDIT_ROLES";i:1;s:23:"PERMISSION_REMOVE_ROLES";i:1;s:28:"PERMISSION_CHECK_FOR_UPDATES";i:1;s:38:"PERMISSION_CHANGE_APPLICATION_SETTINGS";i:1;s:28:"PERMISSION_MANAGE_EXTENSIONS";i:1;s:26:"PERMISSION_MANAGE_LANGUAGE";i:1;s:24:"PERMISSION_MANAGE_THEMES";i:1;s:24:"PERMISSION_MANAGE_STYLES";i:1;s:27:"PERMISSION_ALLOW_DEBUG_INFO";i:1;s:27:"PERMISSION_DATABASE_CLEANUP";i:1;}', 4, '0');

-- --------------------------------------------------------

--
-- 表的结构 `LUM_Style`
--

CREATE TABLE IF NOT EXISTS `LUM_Style` (
  `StyleID` int(3) NOT NULL auto_increment,
  `AuthUserID` int(11) NOT NULL default '0',
  `Name` varchar(50) NOT NULL default '',
  `Url` varchar(255) NOT NULL default '',
  `PreviewImage` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`StyleID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 导出表中的数据 `LUM_Style`
--

INSERT INTO `LUM_Style` (`StyleID`, `AuthUserID`, `Name`, `Url`, `PreviewImage`) VALUES
(1, 0, 'Vanilla', '/~kernel1983/vanilla/themes/vanilla/styles/default/', '');

-- --------------------------------------------------------

--
-- 表的结构 `LUM_User`
--

CREATE TABLE IF NOT EXISTS `LUM_User` (
  `UserID` int(10) NOT NULL auto_increment,
  `RoleID` int(2) NOT NULL default '0',
  `StyleID` int(3) NOT NULL default '1',
  `CustomStyle` varchar(255) default NULL,
  `FirstName` varchar(50) NOT NULL default '',
  `LastName` varchar(50) NOT NULL default '',
  `Name` varchar(20) NOT NULL default '',
  `Password` varchar(32) default NULL,
  `VerificationKey` varchar(50) NOT NULL default '',
  `EmailVerificationKey` varchar(50) default NULL,
  `Email` varchar(200) NOT NULL default '',
  `UtilizeEmail` enum('1','0') NOT NULL default '0',
  `ShowName` enum('1','0') NOT NULL default '1',
  `Icon` varchar(255) default NULL,
  `Picture` varchar(255) default NULL,
  `Attributes` text,
  `CountVisit` int(8) NOT NULL default '0',
  `CountDiscussions` int(8) NOT NULL default '0',
  `CountComments` int(8) NOT NULL default '0',
  `DateFirstVisit` datetime NOT NULL default '0000-00-00 00:00:00',
  `DateLastActive` datetime NOT NULL default '0000-00-00 00:00:00',
  `RemoteIp` varchar(100) NOT NULL default '',
  `LastDiscussionPost` datetime default NULL,
  `DiscussionSpamCheck` int(11) NOT NULL default '0',
  `LastCommentPost` datetime default NULL,
  `CommentSpamCheck` int(11) NOT NULL default '0',
  `UserBlocksCategories` enum('1','0') NOT NULL default '0',
  `DefaultFormatType` varchar(20) default NULL,
  `Discovery` text,
  `Preferences` text,
  `SendNewApplicantNotifications` enum('1','0') NOT NULL default '0',
  PRIMARY KEY  (`UserID`),
  KEY `user_role` (`RoleID`),
  KEY `user_style` (`StyleID`),
  KEY `user_name` (`Name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 导出表中的数据 `LUM_User`
--

INSERT INTO `LUM_User` (`UserID`, `RoleID`, `StyleID`, `CustomStyle`, `FirstName`, `LastName`, `Name`, `Password`, `VerificationKey`, `EmailVerificationKey`, `Email`, `UtilizeEmail`, `ShowName`, `Icon`, `Picture`, `Attributes`, `CountVisit`, `CountDiscussions`, `CountComments`, `DateFirstVisit`, `DateLastActive`, `RemoteIp`, `LastDiscussionPost`, `DiscussionSpamCheck`, `LastCommentPost`, `CommentSpamCheck`, `UserBlocksCategories`, `DefaultFormatType`, `Discovery`, `Preferences`, `SendNewApplicantNotifications`) VALUES
(1, 4, 1, NULL, 'Administrative', 'User', 'kernel1983', '0de3db13f6f65e7bcc7846d94b712e6f', 'f319e1d50074752a47ee7abeea781862', NULL, 'kernel1983@gmail.com', '0', '1', NULL, NULL, NULL, 3, 4, 2, '2007-10-23 01:29:23', '2007-10-28 22:54:22', '127.0.0.1', '2007-10-26 06:21:06', 1, '2007-10-27 17:25:24', 1, '0', 'Text', NULL, NULL, '0'),
(2, 3, 0, NULL, '', '', 'test1', '5a105e8b9d40e1329780d62ea2265d8a', '763593377d1fc5f780fec30cbaca1cce', NULL, 'test1@hotmail.com', '0', '1', NULL, NULL, '', 1, 0, 2, '2007-10-27 17:51:16', '2007-10-27 22:38:28', '127.0.0.1', NULL, 0, '2007-10-27 22:38:28', 1, '0', 'Text', NULL, NULL, '0');

-- --------------------------------------------------------

--
-- 表的结构 `LUM_UserBookmark`
--

CREATE TABLE IF NOT EXISTS `LUM_UserBookmark` (
  `UserID` int(10) NOT NULL default '0',
  `DiscussionID` int(8) NOT NULL default '0',
  PRIMARY KEY  (`UserID`,`DiscussionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `LUM_UserBookmark`
--


-- --------------------------------------------------------

--
-- 表的结构 `LUM_UserDiscussionWatch`
--

CREATE TABLE IF NOT EXISTS `LUM_UserDiscussionWatch` (
  `UserID` int(10) NOT NULL default '0',
  `DiscussionID` int(8) NOT NULL default '0',
  `CountComments` int(11) NOT NULL default '0',
  `LastViewed` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`UserID`,`DiscussionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `LUM_UserDiscussionWatch`
--

INSERT INTO `LUM_UserDiscussionWatch` (`UserID`, `DiscussionID`, `CountComments`, `LastViewed`) VALUES
(1, 1, 2, '2007-10-27 10:27:56'),
(1, 7, 0, '2007-10-25 00:49:08'),
(1, 8, 0, '2007-10-25 00:49:37'),
(1, 6, 1, '2007-10-24 23:19:55'),
(1, 17, 1, '2007-10-26 06:21:06'),
(1, 23, 1, '2007-10-27 12:13:49'),
(1, 21, 1, '2007-10-27 10:42:37'),
(1, 22, 2, '2007-10-27 17:25:25'),
(2, 21, 1, '2007-10-28 11:01:16'),
(2, 22, 3, '2007-10-27 22:38:12'),
(2, 17, 2, '2007-10-27 22:38:29'),
(2, 19, 1, '2007-10-27 22:43:24'),
(2, 20, 1, '2007-10-28 11:01:44'),
(2, 18, 1, '2007-10-28 11:30:59');

-- --------------------------------------------------------

--
-- 表的结构 `LUM_UserRoleHistory`
--

CREATE TABLE IF NOT EXISTS `LUM_UserRoleHistory` (
  `UserID` int(10) NOT NULL default '0',
  `RoleID` int(2) NOT NULL default '0',
  `Date` datetime NOT NULL default '0000-00-00 00:00:00',
  `AdminUserID` int(10) NOT NULL default '0',
  `Notes` varchar(200) default NULL,
  `RemoteIp` varchar(100) default NULL,
  KEY `UserID` (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `LUM_UserRoleHistory`
--

INSERT INTO `LUM_UserRoleHistory` (`UserID`, `RoleID`, `Date`, `AdminUserID`, `Notes`, `RemoteIp`) VALUES
(1, 4, '2007-10-23 01:29:23', 1, 'Initial administrative account created', '127.0.0.1'),
(2, 0, '2007-10-27 17:51:16', 0, 'Registration pending administrative approval.', '127.0.0.1'),
(2, 3, '2007-10-27 17:52:12', 1, 'You have been granted membership access. Welcome aboard!', '127.0.0.1');
