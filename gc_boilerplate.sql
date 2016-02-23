-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Client :  localhost:3306
-- Généré le :  Mar 23 Février 2016 à 12:20
-- Version du serveur :  5.5.42
-- Version de PHP :  5.4.42

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gc_boilerplate`
--

-- --------------------------------------------------------

--
-- Structure de la table `api`
--

DROP TABLE IF EXISTS `api`;
CREATE TABLE `api` (
  `id` mediumint(3) unsigned NOT NULL,
  `title` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `owner` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `method` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `const`
--

DROP TABLE IF EXISTS `const`;
CREATE TABLE `const` (
  `id` mediumint(3) unsigned NOT NULL,
  `key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `title` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `owner` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `const`
--

INSERT INTO `const` (`id`, `key`, `title`, `created`, `updated`, `status`, `owner`) VALUES
(1, 'FOOTER_TXT', '{"fr":"FOOTER_TXT"}', '2016-02-23 12:07:24', '2016-02-23 12:07:24', 'live', 'human_1'),
(2, 'FOOTER_SOCIAL_TXT', '{"fr":"FOOTER_SOCIAL_TXT"}', '2016-02-23 12:07:24', '2016-02-23 12:07:24', 'live', 'human_1'),
(3, 'HANDS AGENCE DIGITALE', '{"fr":"Hands Agence Digitale"}', '2016-02-23 12:07:24', '2016-02-23 12:07:24', 'live', 'human_1'),
(4, 'HANDS | AGENCE DIGITALE', '{"fr":"Hands | Agence Digitale"}', '2016-02-23 12:12:14', '2016-02-23 12:12:14', 'live', 'human_2');

-- --------------------------------------------------------

--
-- Structure de la table `form`
--

DROP TABLE IF EXISTS `form`;
CREATE TABLE `form` (
  `id` mediumint(3) unsigned NOT NULL COMMENT 'The unique identifier',
  `key` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The key',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'A short title',
  `descr` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT 'A short description',
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Template',
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Action / routine',
  `method` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Method',
  `target` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Target',
  `enctype` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Enctype',
  `field` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'The fields',
  `created` datetime NOT NULL COMMENT 'Created Datetime',
  `updated` datetime NOT NULL COMMENT 'Updated Datetime',
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Status'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `form`
--

INSERT INTO `form` (`id`, `key`, `title`, `descr`, `template`, `action`, `method`, `target`, `enctype`, `field`, `created`, `updated`, `status`) VALUES
(1, 'hands_page', 'hands_page', '', 'default', 'post', 'post', '', '', '{"id":{"key":"id","label":"id","type":"number","readonly":true},"key":{"key":"key","label":"key","type":"text"},"title":{"key":"title","label":"title","type":"i18n","field":"fieldText"},"metatitle":{"key":"metatitle","label":"metatitle","type":"i18n","field":"fieldText"},"metadescr":{"key":"metadescr","label":"metadescr","type":"i18n","field":"fieldTextarea"},"url":{"key":"url","label":"url","type":"url"},"type":{"key":"type","label":"type","type":"pagetype"},"section":{"key":"section","label":"section","valuestype":"bunch","values":[{"item":"section","property":""}],"placeholder":"...","type":"multipleselect","required":"0","min":"","max":""},"group":{"key":"group","label":"group","valuestype":"bunch","values":[{"item":"group","property":""}],"placeholder":"...","type":"multipleselect","required":"0","min":"","max":""},"system":{"key":"system","label":"system","type":"bool","required":"0"},"created":{"key":"created","label":"created","type":"date"},"updated":{"key":"updated","label":"updated","type":"date"},"owner":{"key":"owner","label":"owner","type":"text"},"status":{"key":"status","label":"status","type":"text"},"child":{"key":"child","label":"child","valuestype":"bunch","values":[{"item":"page","property":""}],"placeholder":"...","type":"multipleselect","required":"0","min":"","max":""},"parent":{"key":"parent","label":"parent","valuestype":"bunch","values":[{"item":"page","property":""}],"placeholder":"...","type":"select","required":"0","min":"0","max":"1"},"live":{"key":"live","label":"live","type":"text"}}', '2016-02-23 12:12:34', '2016-02-23 12:16:18', 'live'),
(2, 'hands_item', 'hands_item', '', 'default', 'post', 'post', '', '', '{"id":{"key":"id","label":"id","type":"number","readonly":true},"key":{"key":"key","label":"key","type":"text","required":true},"title":{"key":"title","label":"title","type":"text","required":"1","min":"0","max":"255"},"descr":{"key":"descr","label":"descr","type":"textarea","required":"0","min":"0","max":"500"},"system":{"key":"system","label":"system","type":"bool","required":"0"},"attr":{"key":"attr","label":"attr","type":"attr"},"created":{"key":"created","label":"created","type":"date"},"updated":{"key":"updated","label":"updated","type":"date"},"status":{"key":"status","label":"status","type":"text"},"hasurl":{"key":"hasurl","label":"hasurl","type":"bool","required":"0"},"owner":{"key":"owner","label":"owner","type":"text"},"icon":{"key":"icon","label":"icon","type":"text","required":"0","min":"","max":"30"}}', '2016-02-23 12:15:33', '2016-02-23 12:15:33', 'live');

-- --------------------------------------------------------

--
-- Structure de la table `group`
--

DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` mediumint(3) unsigned NOT NULL,
  `key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `owner` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `group`
--

INSERT INTO `group` (`id`, `key`, `title`, `admin`, `created`, `updated`, `status`, `owner`) VALUES
(1, 'admin', 'Admin (back-end)', 1, '2013-10-02 08:35:40', '2014-07-04 12:38:27', 'live', '');

-- --------------------------------------------------------

--
-- Structure de la table `human`
--

DROP TABLE IF EXISTS `human`;
CREATE TABLE `human` (
  `id` mediumint(3) unsigned NOT NULL,
  `key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `descr` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `system` tinyint(1) NOT NULL,
  `profilepic` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `owner` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `pref` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `human`
--

INSERT INTO `human` (`id`, `key`, `firstname`, `lastname`, `descr`, `title`, `password`, `created`, `updated`, `status`, `system`, `profilepic`, `owner`, `pref`) VALUES
(1, 'anonymous', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'live', 1, '', 'human_2', ''),
(2, 'sf@hands.agency', 'Sylvain', 'Frigui', '', 'Sylvain Frigui', '$2y$10$/z.jv2CJcK2/qBTLMm3Luusmyu9Nq..6JgIjH6tMoifI3FrrVVdoC', '2015-03-28 15:27:52', '2016-02-23 12:18:57', 'live', 0, '[{"url":"\\/image\\/people\\/sf.png","title":""}]', 'human_2', '{"greenbutton":{"edit":"live"},"list":{"work":{"order":"title","sort":"asc"}},"media":{"currentroot":"\\/image\\/work\\/Hypnose"}}'),
(3, 'yst@hands.agency', 'Yasser', 'Slimani', '{"fr":"","en":""}', 'Yasser Slimani', '$2y$10$dCrWvYttwYvEj5JxZvk.a.7bUCGI0STay2KpSldbhYODK4erfNbFq', '2015-08-13 16:09:55', '2015-11-05 17:30:17', 'live', 0, '', 'human_2', '{"greenbutton":{"edit":"live"}}'),
(4, 'damarice@hands.agency', 'Damarice', 'de Richoufftz', '{"fr":"","en":""}', 'Damarice de Richoufftz', '$2y$10$rhUpGnv5AqEYJCHospNhqepMLC0AprUSxIJMqDTcKUrPUGR7lVXjq', '2016-01-11 15:31:10', '2016-01-11 15:34:39', 'live', 0, '', 'human_4', '');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` mediumint(3) unsigned NOT NULL,
  `key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descr` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `system` tinyint(1) NOT NULL,
  `attr` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `hasurl` tinyint(1) NOT NULL,
  `owner` mediumint(3) unsigned NOT NULL,
  `icon` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `item`
--

INSERT INTO `item` (`id`, `key`, `title`, `descr`, `system`, `attr`, `created`, `updated`, `status`, `hasurl`, `owner`, `icon`) VALUES
(1, 'item', 'Items', '', 1, '{"id":{"key":"id","type":"id"},"key":{"key":"key","type":"key"},"title":{"key":"title","type":"string","required":"1","min":"0","max":"255"},"descr":{"key":"descr","type":"string","required":"0","min":"0","max":"500"},"system":{"key":"system","type":"bool","required":"0"},"attr":{"key":"attr","type":"array"},"created":{"key":"created","type":"created"},"updated":{"key":"updated","type":"updated"},"status":{"key":"status","type":"status"},"hasurl":{"key":"hasurl","type":"bool","required":"0"},"owner":{"key":"owner","type":"owner"},"icon":{"key":"icon","type":"string","required":"0","min":"","max":"30"}}', '2013-10-31 12:55:21', '2014-06-10 12:35:40', 'live', 0, 2, ''),
(2, 'site', 'Site', 'Manage your website basics, and the apps that will be opened at all time.', 1, '{"id":{"key":"id","type":"id"},"key":{"key":"key","type":"key"},"title":{"key":"title","type":"string","required":"1","min":"0","max":"255"},"descr":{"key":"descr","type":"string","required":"0","min":"0","max":"500"},"created":{"key":"created","type":"created"},"updated":{"key":"updated","type":"updated"},"status":{"key":"status","type":"status"},"defaultversion":{"key":"defaultversion","type":"int","required":"0","min":"","max":""},"owner":{"key":"owner","type":"owner"},"favicon":{"key":"favicon","type":"media","required":"0","min":"0","max":"1"}}', '2013-11-17 14:17:48', '2015-01-02 18:49:03', 'live', 0, 2, ''),
(3, 'page', 'Page', '', 1, '{"id":{"key":"id","type":"id","field":""},"key":{"key":"key","type":"key","field":""},"title":{"key":"title","type":"i18n","field":"fieldText","attr":"attrString"},"metatitle":{"key":"metatitle","type":"i18n","field":"fieldText","attr":"attrString"},"metadescr":{"key":"metadescr","type":"i18n","field":"fieldTextarea","attr":"attrString"},"url":{"key":"url","type":"url","field":""},"type":{"key":"type","type":"array","field":""},"section":{"key":"section","type":"rel","required":"0","field":"","param":[{"item":"section","property":""}],"min":"","max":""},"group":{"key":"group","type":"rel","required":"0","field":"","param":[{"item":"group","property":""}],"min":"","max":""},"system":{"key":"system","type":"bool","required":"0","field":""},"created":{"key":"created","type":"created","field":""},"updated":{"key":"updated","type":"updated","field":""},"owner":{"key":"owner","type":"owner","field":""},"status":{"key":"status","type":"status","field":""},"child":{"key":"child","type":"rel","required":"0","field":"","param":[{"item":"page","property":""}],"min":"","max":""},"parent":{"key":"parent","type":"rel","required":"0","field":"","param":[{"item":"page","property":""}],"min":"0","max":"1"},"live":{"key":"live","type":"live","field":""}}', '2013-10-31 12:59:36', '2016-02-23 12:15:40', 'live', 1, 2, ''),
(4, 'version', 'Versions', '', 1, '{"id":{"key":"id","type":"id","title":"The unique identifier"},"key":{"key":"key","type":"key","title":"The key"},"title":{"key":"title","type":"string","title":"A short title","required":"1","min":"0","max":"255"},"lang":{"key":"lang","type":"string","title":"Language","required":"1","min":"0","max":"32"},"created":{"key":"created","type":"created","title":"Created Datetime"},"updated":{"key":"updated","type":"updated","title":"Updated Datetime"},"status":{"key":"status","type":"status","title":"Status"},"owner":{"key":"owner","type":"owner","title":"Owner"}}', '2013-10-31 12:55:23', '2013-11-18 13:05:29', 'live', 0, 0, ''),
(5, 'human', 'Humains', '', 1, '{"id":{"key":"id","type":"id","field":""},"key":{"key":"key","type":"key","field":""},"firstname":{"key":"firstname","type":"string","required":"0","field":"","min":"0","max":"100"},"lastname":{"key":"lastname","type":"string","required":"0","field":"","min":"0","max":"100"},"descr":{"key":"descr","type":"i18n","field":"fieldSirtrevor","attr":"attrSirtrevor"},"title":{"key":"title","type":"string","required":"1","field":"","min":"0","max":"255"},"password":{"key":"password","type":"password","required":"0","field":""},"created":{"key":"created","type":"created","field":""},"updated":{"key":"updated","type":"updated","field":""},"status":{"key":"status","type":"status","field":""},"system":{"key":"system","type":"bool","required":"0","field":""},"profilepic":{"key":"profilepic","type":"media","field":"","required":"0","min":"","max":""},"group":{"key":"group","type":"rel","required":"0","field":"","param":[{"item":"group"}],"min":"","max":""},"owner":{"key":"owner","type":"owner","field":""},"pref":{"key":"pref","type":"array","field":""}}', '2013-09-25 09:16:34', '2015-06-10 13:06:21', 'live', 0, 2, ''),
(7, 'section', 'Sections', '', 1, '{"id":{"key":"id","type":"id","title":"The unique identifier"},"key":{"key":"key","type":"key","title":"The key"},"title":{"key":"title","type":"string","title":"A short title","min":"0","max":"255","required":"1"},"descr":{"key":"descr","type":"string","title":"A short description","min":"0","max":"500"},"zone":{"key":"zone","type":"string","title":"The zone","min":"0","max":"255"},"app":{"key":"app","type":"array","title":"The template","required":"1"},"created":{"key":"created","type":"created","title":"Created Datetime"},"updated":{"key":"updated","type":"updated","title":"Updated Datetime"},"status":{"key":"status","type":"status","title":"Status"},"owner":{"key":"owner","type":"owner","title":"Owner"}}', '2013-09-25 08:33:09', '2013-11-18 13:05:29', 'live', 0, 0, ''),
(27, 'const', 'Constants', '', 1, '{"id":{"key":"id","type":"id"},"key":{"key":"key","type":"key"},"title":{"key":"title","type":"i18n","field":"fieldTextarea"},"created":{"key":"created","type":"created"},"updated":{"key":"updated","type":"updated"},"status":{"key":"status","type":"status"},"owner":{"key":"owner","type":"owner"}}', '2013-10-31 12:55:22', '2015-01-27 11:08:33', 'live', 0, 2, ''),
(28, 'logbook', 'Logbook', '', 1, '{"id":{"key":"id","type":"id","title":"The unique identifier"},"key":{"key":"key","type":"key","title":"The key"},"subject":{"key":"subject","type":"string","title":"Subject","required":"0","min":"0","max":"5000"},"subjectid":{"key":"subjectid","type":"int","title":"Subject ID","required":"0","min":"","max":""},"item":{"key":"item","type":"string","title":"item","required":"0","min":"0","max":"5000"},"itemid":{"key":"itemid","type":"int","title":"item id","required":"0","min":"","max":""},"created":{"key":"created","type":"created","title":"Created Datetime"},"updated":{"key":"updated","type":"updated","title":"Updated Datetime"},"status":{"key":"status","type":"status","title":"Status"},"owner":{"key":"owner","type":"owner","title":"Owner"}}', '2013-10-31 12:55:17', '2013-10-31 12:55:17', 'live', 0, 0, ''),
(29, 'group', 'Groupes', '', 1, '{"id":{"key":"id","type":"id"},"key":{"key":"key","type":"key"},"title":{"key":"title","type":"string","required":"1","min":"0","max":"5000"},"admin":{"key":"admin","type":"bool","required":"0"},"created":{"key":"created","type":"created"},"updated":{"key":"updated","type":"updated"},"status":{"key":"status","type":"status"},"owner":{"key":"owner","type":"owner"}}', '2013-10-02 08:35:40', '2015-01-13 19:20:31', 'live', 0, 0, ''),
(30, 'form', 'Forms', '', 1, '{"id":{"key":"id","type":"id","title":"The unique identifier"},"key":{"key":"key","type":"key","title":"The key"},"title":{"key":"title","type":"string","title":"Title","min":"","max":"","required":"1"},"descr":{"key":"descr","title":"A short description","type":"string","min":"0","max":"500"},"template":{"key":"template","type":"string","title":"Template","min":"","max":"","required":"1"},"action":{"key":"action","type":"string","title":"Action","min":"","max":"","required":"1"},"method":{"key":"method","type":"list","option":"post,get","title":"Method","required":"1"},"target":{"key":"target","type":"string","title":"Target"},"enctype":{"key":"enctype","type":"list","option":"application/x-www-form-urlencoded,multipart/form-data","title":"Enctype","required":"1"},"field":{"key":"field","type":"array","title":"The Fields"},"created":{"key":"created","type":"created","title":"Created Datetime"},"updated":{"key":"updated","type":"updated","title":"Updated Datetime"},"status":{"key":"status","type":"status","title":"Status"}}', '2013-09-27 08:33:31', '2013-09-27 08:33:31', 'live', 0, 0, ''),
(31, 'api', 'API', '', 1, '{"id":{"key":"id","type":"id"},"title":{"key":"title","type":"string","required":"1","min":"0","max":"1000"},"key":{"key":"key","type":"key"},"owner":{"key":"owner","type":"owner"},"created":{"key":"created","type":"created"},"updated":{"key":"updated","type":"updated"},"status":{"key":"status","type":"status"},"method":{"key":"method","type":"list","required":"1","values":"","placeholder":""}}', '2013-11-14 14:47:24', '2015-01-02 21:50:06', 'live', 0, 2, ''),
(33, 'machine', 'Machines', '', 1, '{"id":{"key":"id","type":"id"},"key":{"key":"key","type":"key"},"owner":{"key":"owner","type":"owner"},"created":{"key":"created","type":"created"},"updated":{"key":"updated","type":"updated"},"status":{"key":"status","type":"status"},"title":{"key":"title","type":"string","required":"1","min":"0","max":"1000"}}', '2013-11-29 13:21:45', '2015-01-13 19:21:00', 'live', 0, 2, ''),
(34, 'workflow', 'Workflow', '', 1, '{"id":{"key":"id","type":"id"},"key":{"key":"key","type":"key"},"item":{"key":"item","type":"string","required":"0","min":"0","max":"500"},"original":{"key":"original","type":"item","required":"1"},"data":{"key":"data","type":"object","required":"0"},"owner":{"key":"owner","type":"owner"},"created":{"key":"created","type":"created"},"updated":{"key":"updated","type":"updated"},"status":{"key":"status","type":"status"}}', '2014-05-24 17:54:44', '2015-01-02 21:49:44', 'live', 0, 2, ''),
(35, 'mail', 'Mail', '', 0, '{"id":{"key":"id","type":"id"},"title":{"key":"title","type":"string","required":"0","field":"fieldText","min":"0","max":"255"},"subject":{"key":"subject","type":"string","required":"0","field":"fieldText","min":"0","max":"255"},"fromemail":{"key":"fromemail","type":"string","required":"0","field":"fieldText","min":"0","max":"255"},"fromname":{"key":"fromname","type":"string","required":"0","field":"fieldText","min":"0","max":"255"},"toemail":{"key":"toemail","type":"string","required":"0","field":"fieldText","min":"0","max":"255"},"toname":{"key":"toname","type":"string","required":"0","field":"fieldText","min":"0","max":"255"},"content":{"key":"content","type":"string","required":"0","field":"fieldText","min":"0","max":"5000"},"key":{"key":"key","type":"key"},"owner":{"key":"owner","type":"owner"},"created":{"key":"created","type":"created"},"updated":{"key":"updated","type":"updated"},"status":{"key":"status","type":"status"},"live":{"key":"live","type":"live"}}', '2015-09-03 10:39:24', '2015-09-03 10:39:24', 'live', 0, 0, '');

-- --------------------------------------------------------

--
-- Structure de la table `logbook`
--

DROP TABLE IF EXISTS `logbook`;
CREATE TABLE `logbook` (
  `id` mediumint(3) unsigned NOT NULL,
  `key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `subjectid` mediumint(3) unsigned NOT NULL,
  `item` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `itemid` mediumint(3) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `owner` mediumint(3) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `logbook`
--

INSERT INTO `logbook` (`id`, `key`, `subject`, `subjectid`, `item`, `itemid`, `created`, `updated`, `status`, `owner`) VALUES
(1, 'insert', 'human', 1, 'const', 1, '2016-02-23 12:07:24', '2016-02-23 12:07:24', 'live', 0),
(2, 'insert', 'human', 1, 'const', 2, '2016-02-23 12:07:24', '2016-02-23 12:07:24', 'live', 0),
(3, 'insert', 'human', 1, 'const', 3, '2016-02-23 12:07:24', '2016-02-23 12:07:24', 'live', 0),
(4, 'insert', 'human', 2, 'const', 4, '2016-02-23 12:12:14', '2016-02-23 12:12:14', 'live', 0),
(5, 'insert', 'human', 2, 'workflow', 1, '2016-02-23 12:12:32', '2016-02-23 12:12:32', 'live', 0),
(6, 'insert', 'human', 2, 'form', 1, '2016-02-23 12:12:34', '2016-02-23 12:12:34', 'live', 0),
(7, 'update', 'human', 2, 'human', 2, '2016-02-23 12:13:19', '2016-02-23 12:13:19', 'live', 0),
(8, 'insert', 'human', 2, 'page', 7, '2016-02-23 12:13:19', '2016-02-23 12:13:19', 'live', 0),
(9, 'update', 'human', 2, 'page', 1, '2016-02-23 12:13:19', '2016-02-23 12:13:19', 'live', 0),
(10, 'update', 'human', 2, 'human', 2, '2016-02-23 12:14:04', '2016-02-23 12:14:04', 'live', 0),
(11, 'update', 'human', 2, 'page', 7, '2016-02-23 12:14:04', '2016-02-23 12:14:04', 'live', 0),
(12, 'update', 'human', 2, 'page', 1, '2016-02-23 12:14:04', '2016-02-23 12:14:04', 'live', 0),
(13, 'insert', 'human', 2, 'workflow', 2, '2016-02-23 12:15:18', '2016-02-23 12:15:18', 'live', 0),
(14, 'insert', 'human', 2, 'form', 2, '2016-02-23 12:15:33', '2016-02-23 12:15:33', 'live', 0),
(15, 'update', 'human', 2, 'human', 2, '2016-02-23 12:15:40', '2016-02-23 12:15:40', 'live', 0),
(16, 'update', 'human', 2, 'item', 3, '2016-02-23 12:15:40', '2016-02-23 12:15:40', 'live', 0),
(17, 'insert', 'human', 2, 'workflow', 3, '2016-02-23 12:16:16', '2016-02-23 12:16:16', 'live', 0),
(18, 'update', 'human', 2, 'form', 1, '2016-02-23 12:16:18', '2016-02-23 12:16:18', 'live', 0),
(19, 'update', 'human', 2, 'human', 2, '2016-02-23 12:16:35', '2016-02-23 12:16:35', 'live', 0),
(20, 'insert', 'human', 2, 'page', 8, '2016-02-23 12:16:35', '2016-02-23 12:16:35', 'live', 0),
(21, 'update', 'human', 2, 'page', 1, '2016-02-23 12:16:35', '2016-02-23 12:16:35', 'live', 0),
(22, 'update', 'human', 2, 'human', 2, '2016-02-23 12:18:57', '2016-02-23 12:18:57', 'live', 0),
(23, 'insert', 'human', 2, 'page', 9, '2016-02-23 12:18:57', '2016-02-23 12:18:57', 'live', 0),
(24, 'update', 'human', 2, 'page', 1, '2016-02-23 12:18:57', '2016-02-23 12:18:57', 'live', 0);

-- --------------------------------------------------------

--
-- Structure de la table `machine`
--

DROP TABLE IF EXISTS `machine`;
CREATE TABLE `machine` (
  `id` mediumint(3) unsigned NOT NULL,
  `key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `owner` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(1000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `mail`
--

DROP TABLE IF EXISTS `mail`;
CREATE TABLE `mail` (
  `id` mediumint(3) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fromemail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fromname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `toemail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `toname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `owner` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `live` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `mail`
--

INSERT INTO `mail` (`id`, `title`, `subject`, `fromemail`, `fromname`, `toemail`, `toname`, `content`, `key`, `owner`, `created`, `updated`, `status`, `live`) VALUES
(1, 'Contact Grand Opening', 'Réponse Pendaison de crémaillère', 'yst@hands.agency', 'No reply Grand-Opening', 'gautier.de.richoufftz@hands.agency', 'Gautier de Richoufftz', '[content]', 'contact', 'human_2', '2015-09-03 10:40:41', '2015-09-03 12:28:30', 'live', 0);

-- --------------------------------------------------------

--
-- Structure de la table `page`
--

DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `id` mediumint(3) unsigned NOT NULL,
  `key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `title` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `metatitle` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `metadescr` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `url` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `type` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `system` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `owner` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `live` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `page`
--

INSERT INTO `page` (`id`, `key`, `title`, `metatitle`, `metadescr`, `url`, `type`, `system`, `created`, `updated`, `owner`, `status`, `live`) VALUES
(1, 'home', '{"fr":"Accueil","en":"Home"}', '{"fr":"Marcy Paris - Accueil","en":"Marcy homepage"}', '{"fr":"Marcy Paris - Bureau de création et de conception - Créez des collections qui vous ressemblent et laissez libre cours à votre imagination.","en":"Description marcy home en"}', '/', '{"key":"content","http_status":"200 OK","content_type":"html","url":"","master":{"app":"content","template":"\\/master\\/master"}}', 0, '2013-03-25 17:08:31', '2016-02-23 12:18:57', '2', 'live', 0),
(2, 'error_404', '{"fr":"Erreur 404","en":"Error 404"}', '', '', '/404', '{"key":"content","http_status":"200 OK","content_type":"html","url":"","master":{"app":"content","template":"\\/master\\/master"}}', 1, '2013-10-16 06:48:43', '2015-12-01 13:42:29', 'human_2', 'live', 0),
(3, 'api.json', '{"fr":"API (json)","en":"API (json)"}', '', '', '/api.json', '{"key":"content","http_status":"200 OK","content_type":"json","url":"","master":{"app":"api","template":"\\/api"}}', 1, '2015-07-31 16:07:43', '2015-11-20 17:50:39', 'human_2', 'live', 0),
(4, 'login.post', '{"fr":"Login post","en":"Login post"}', '', '', '/login.post', '{"key":"content","http_status":"200 OK","content_type":"json","url":"","master":{"app":"form","template":"\\/login.admin"}}', 1, '2015-03-20 19:13:39', '2015-11-20 17:50:31', 'human_2', 'live', 0),
(5, 'login', '{"fr":"Log in","en":"Log in"}', '', '', '/login', '{"key":"content","http_status":"200 OK","content_type":"html","url":"","master":{"app":"content","template":"\\/login\\/login"}}', 1, '2015-07-30 20:14:34', '2015-11-20 17:50:07', 'human_2', 'live', 0),
(6, 'logout', '{"fr":"Log out","en":"Log out"}', '', '', '/logout', '{"key":"content","http_status":"200 OK","content_type":"routine","url":"","master":{"app":"content","template":"\\/master\\/logout"}}', 1, '2014-11-13 13:09:26', '2015-11-20 17:49:51', 'human_2', 'live', 0);

-- --------------------------------------------------------

--
-- Structure de la table `section`
--

DROP TABLE IF EXISTS `section`;
CREATE TABLE `section` (
  `id` mediumint(3) unsigned NOT NULL,
  `key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descr` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `zone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `app` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `owner` mediumint(3) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

DROP TABLE IF EXISTS `site`;
CREATE TABLE `site` (
  `id` mediumint(3) unsigned NOT NULL,
  `key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descr` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `defaultversion` mediumint(3) unsigned NOT NULL,
  `owner` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `favicon` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `site`
--

INSERT INTO `site` (`id`, `key`, `title`, `descr`, `created`, `updated`, `status`, `defaultversion`, `owner`, `favicon`) VALUES
(1, 'hands', 'Hands Agency', '', '2013-05-21 14:52:00', '2015-04-08 16:53:07', 'live', 1, 'human_2', '');

-- --------------------------------------------------------

--
-- Structure de la table `version`
--

DROP TABLE IF EXISTS `version`;
CREATE TABLE `version` (
  `id` mediumint(3) unsigned NOT NULL,
  `key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `owner` mediumint(3) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `version`
--

INSERT INTO `version` (`id`, `key`, `title`, `lang`, `created`, `updated`, `status`, `owner`) VALUES
(1, 'fr', 'Français', 'fr', '2013-04-05 17:02:34', '2015-01-02 18:09:26', 'live', 0),
(2, 'en', 'English', 'en', '2015-03-23 10:27:36', '2015-03-23 10:27:36', 'live', 0);

-- --------------------------------------------------------

--
-- Structure de la table `workflow`
--

DROP TABLE IF EXISTS `workflow`;
CREATE TABLE `workflow` (
  `id` mediumint(3) unsigned NOT NULL,
  `key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `original` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `owner` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `workflow`
--

INSERT INTO `workflow` (`id`, `key`, `item`, `original`, `data`, `owner`, `created`, `updated`, `status`) VALUES
(1, '16e93a8a208aa1f9b657b100e8255dc6', 'page', '', 'O:8:"itemPage":5:{s:8:"\0*\0child";b:0;s:9:"\0*\0zoning";b:0;s:6:"\0*\0env";s:4:"site";s:8:"\0*\0table";s:4:"page";s:7:"\0*\0data";a:17:{s:2:"id";O:6:"attrId":2:{s:7:"\0*\0data";N;s:9:"\0*\0params";a:1:{s:3:"key";s:2:"id";}}s:3:"key";O:7:"attrKey":2:{s:7:"\0*\0data";N;s:9:"\0*\0params";a:1:{s:3:"key";s:3:"key";}}s:5:"title";O:8:"attrI18n":4:{s:8:"\0*\0field";s:9:"fieldText";s:7:"\0*\0data";a:1:{i:0;s:8:"New page";}s:9:"\0*\0params";a:3:{s:3:"key";s:5:"title";s:5:"table";s:4:"page";s:3:"env";s:4:"site";}s:4:"attr";s:10:"attrString";}s:9:"metatitle";O:8:"attrI18n":4:{s:8:"\0*\0field";s:9:"fieldText";s:7:"\0*\0data";a:0:{}s:9:"\0*\0params";a:3:{s:3:"key";s:9:"metatitle";s:5:"table";s:4:"page";s:3:"env";s:4:"site";}s:4:"attr";s:10:"attrString";}s:9:"metadescr";O:8:"attrI18n":4:{s:8:"\0*\0field";s:13:"fieldTextarea";s:7:"\0*\0data";a:0:{}s:9:"\0*\0params";a:3:{s:3:"key";s:9:"metadescr";s:5:"table";s:4:"page";s:3:"env";s:4:"site";}s:4:"attr";s:10:"attrString";}s:3:"url";O:7:"attrUrl":5:{s:7:"\0*\0item";N;s:6:"\0*\0old";b:0;s:11:"\0*\0oldvalue";N;s:7:"\0*\0data";a:0:{}s:9:"\0*\0params";a:9:{s:3:"key";s:3:"url";s:5:"table";s:4:"page";s:3:"env";s:4:"site";s:7:"version";N;s:4:"live";O:8:"attrLive":2:{s:7:"\0*\0data";N;s:9:"\0*\0params";a:1:{s:3:"key";s:4:"live";}}s:7:"itemkey";N;s:8:"nickname";N;s:2:"id";N;s:4:"name";a:0:{}}}s:4:"type";O:9:"attrArray":2:{s:7:"\0*\0data";a:0:{}s:9:"\0*\0params";a:1:{s:3:"key";s:4:"type";}}s:7:"section";O:7:"attrRel":2:{s:7:"\0*\0data";a:0:{}s:9:"\0*\0params";a:8:{s:3:"key";s:7:"section";s:8:"required";b:0;s:5:"param";a:1:{i:0;a:2:{s:4:"item";s:7:"section";s:8:"property";s:0:"";}}s:3:"min";s:0:"";s:3:"max";s:0:"";s:3:"env";s:4:"site";s:5:"table";s:4:"page";s:2:"id";N;}}s:5:"group";O:7:"attrRel":2:{s:7:"\0*\0data";a:0:{}s:9:"\0*\0params";a:8:{s:3:"key";s:5:"group";s:8:"required";b:0;s:5:"param";a:1:{i:0;a:2:{s:4:"item";s:5:"group";s:8:"property";s:0:"";}}s:3:"min";s:0:"";s:3:"max";s:0:"";s:3:"env";s:4:"site";s:5:"table";s:4:"page";s:2:"id";N;}}s:6:"system";O:8:"attrBool":2:{s:7:"\0*\0data";N;s:9:"\0*\0params";a:2:{s:3:"key";s:6:"system";s:8:"required";b:0;}}s:7:"created";O:11:"attrCreated":2:{s:7:"\0*\0data";s:19:"0000-00-00 00:00:00";s:9:"\0*\0params";a:2:{s:4:"type";s:8:"datetime";s:3:"key";s:7:"created";}}s:7:"updated";O:11:"attrUpdated":2:{s:7:"\0*\0data";s:19:"0000-00-00 00:00:00";s:9:"\0*\0params";a:2:{s:4:"type";s:8:"datetime";s:3:"key";s:7:"updated";}}s:5:"owner";O:9:"attrOwner":2:{s:7:"\0*\0data";N;s:9:"\0*\0params";a:2:{s:3:"key";s:5:"owner";s:3:"env";s:4:"site";}}s:6:"status";O:10:"attrStatus":2:{s:7:"\0*\0data";N;s:9:"\0*\0params";a:1:{s:3:"key";s:6:"status";}}s:5:"child";O:7:"attrRel":2:{s:7:"\0*\0data";a:0:{}s:9:"\0*\0params";a:8:{s:3:"key";s:5:"child";s:8:"required";b:0;s:5:"param";a:1:{i:0;a:2:{s:4:"item";s:4:"page";s:8:"property";s:0:"";}}s:3:"min";s:0:"";s:3:"max";s:0:"";s:3:"env";s:4:"site";s:5:"table";s:4:"page";s:2:"id";N;}}s:6:"parent";O:7:"attrRel":2:{s:7:"\0*\0data";a:1:{i:0;s:6:"page_1";}s:9:"\0*\0params";a:8:{s:3:"key";s:6:"parent";s:8:"required";b:0;s:5:"param";a:1:{i:0;a:2:{s:4:"item";s:4:"page";s:8:"property";s:0:"";}}s:3:"min";s:1:"0";s:3:"max";s:1:"1";s:3:"env";s:4:"site";s:5:"table";s:4:"page";s:2:"id";N;}}s:4:"live";r:50;}}', 'human_2', '2016-02-23 12:12:32', '2016-02-23 12:12:32', 'draft'),
(2, 'eb2ab41e6822cf062535e312ecce6033', 'page', '', 'O:8:"itemPage":5:{s:8:"\0*\0child";b:0;s:9:"\0*\0zoning";b:0;s:6:"\0*\0env";s:4:"site";s:8:"\0*\0table";s:4:"page";s:7:"\0*\0data";a:17:{s:2:"id";O:6:"attrId":2:{s:7:"\0*\0data";N;s:9:"\0*\0params";a:1:{s:3:"key";s:2:"id";}}s:3:"key";O:7:"attrKey":2:{s:7:"\0*\0data";N;s:9:"\0*\0params";a:1:{s:3:"key";s:3:"key";}}s:5:"title";O:8:"attrI18n":4:{s:8:"\0*\0field";s:9:"fieldText";s:7:"\0*\0data";a:1:{i:0;s:8:"New page";}s:9:"\0*\0params";a:3:{s:3:"key";s:5:"title";s:5:"table";s:4:"page";s:3:"env";s:4:"site";}s:4:"attr";s:10:"attrString";}s:9:"metatitle";O:8:"attrI18n":4:{s:8:"\0*\0field";s:9:"fieldText";s:7:"\0*\0data";a:0:{}s:9:"\0*\0params";a:3:{s:3:"key";s:9:"metatitle";s:5:"table";s:4:"page";s:3:"env";s:4:"site";}s:4:"attr";s:10:"attrString";}s:9:"metadescr";O:8:"attrI18n":4:{s:8:"\0*\0field";s:13:"fieldTextarea";s:7:"\0*\0data";a:0:{}s:9:"\0*\0params";a:3:{s:3:"key";s:9:"metadescr";s:5:"table";s:4:"page";s:3:"env";s:4:"site";}s:4:"attr";s:10:"attrString";}s:3:"url";O:7:"attrUrl":5:{s:7:"\0*\0item";N;s:6:"\0*\0old";b:0;s:11:"\0*\0oldvalue";N;s:7:"\0*\0data";a:0:{}s:9:"\0*\0params";a:9:{s:3:"key";s:3:"url";s:5:"table";s:4:"page";s:3:"env";s:4:"site";s:7:"version";N;s:4:"live";O:8:"attrLive":2:{s:7:"\0*\0data";N;s:9:"\0*\0params";a:1:{s:3:"key";s:4:"live";}}s:7:"itemkey";N;s:8:"nickname";N;s:2:"id";N;s:4:"name";a:0:{}}}s:4:"type";O:9:"attrArray":2:{s:7:"\0*\0data";a:0:{}s:9:"\0*\0params";a:1:{s:3:"key";s:4:"type";}}s:7:"section";O:7:"attrRel":2:{s:7:"\0*\0data";a:0:{}s:9:"\0*\0params";a:8:{s:3:"key";s:7:"section";s:8:"required";b:0;s:5:"param";a:1:{i:0;a:2:{s:4:"item";s:7:"section";s:8:"property";s:0:"";}}s:3:"min";s:0:"";s:3:"max";s:0:"";s:3:"env";s:4:"site";s:5:"table";s:4:"page";s:2:"id";N;}}s:5:"group";O:7:"attrRel":2:{s:7:"\0*\0data";a:0:{}s:9:"\0*\0params";a:8:{s:3:"key";s:5:"group";s:8:"required";b:0;s:5:"param";a:1:{i:0;a:2:{s:4:"item";s:5:"group";s:8:"property";s:0:"";}}s:3:"min";s:0:"";s:3:"max";s:0:"";s:3:"env";s:4:"site";s:5:"table";s:4:"page";s:2:"id";N;}}s:6:"system";O:8:"attrBool":2:{s:7:"\0*\0data";N;s:9:"\0*\0params";a:2:{s:3:"key";s:6:"system";s:8:"required";b:0;}}s:7:"created";O:11:"attrCreated":2:{s:7:"\0*\0data";s:19:"0000-00-00 00:00:00";s:9:"\0*\0params";a:2:{s:4:"type";s:8:"datetime";s:3:"key";s:7:"created";}}s:7:"updated";O:11:"attrUpdated":2:{s:7:"\0*\0data";s:19:"0000-00-00 00:00:00";s:9:"\0*\0params";a:2:{s:4:"type";s:8:"datetime";s:3:"key";s:7:"updated";}}s:5:"owner";O:9:"attrOwner":2:{s:7:"\0*\0data";N;s:9:"\0*\0params";a:2:{s:3:"key";s:5:"owner";s:3:"env";s:4:"site";}}s:6:"status";O:10:"attrStatus":2:{s:7:"\0*\0data";N;s:9:"\0*\0params";a:1:{s:3:"key";s:6:"status";}}s:5:"child";O:7:"attrRel":2:{s:7:"\0*\0data";a:0:{}s:9:"\0*\0params";a:8:{s:3:"key";s:5:"child";s:8:"required";b:0;s:5:"param";a:1:{i:0;a:2:{s:4:"item";s:4:"page";s:8:"property";s:0:"";}}s:3:"min";s:0:"";s:3:"max";s:0:"";s:3:"env";s:4:"site";s:5:"table";s:4:"page";s:2:"id";N;}}s:6:"parent";O:7:"attrRel":2:{s:7:"\0*\0data";a:1:{i:0;s:6:"page_1";}s:9:"\0*\0params";a:8:{s:3:"key";s:6:"parent";s:8:"required";b:0;s:5:"param";a:1:{i:0;a:2:{s:4:"item";s:4:"page";s:8:"property";s:0:"";}}s:3:"min";s:1:"0";s:3:"max";s:1:"1";s:3:"env";s:4:"site";s:5:"table";s:4:"page";s:2:"id";N;}}s:4:"live";r:50;}}', 'human_2', '2016-02-23 12:15:18', '2016-02-23 12:15:18', 'draft'),
(3, 'd81c3d7f0a237e584cbe5fe1a75a7ed4', 'page', '', 'O:8:"itemPage":5:{s:8:"\0*\0child";b:0;s:9:"\0*\0zoning";b:0;s:6:"\0*\0env";s:4:"site";s:8:"\0*\0table";s:4:"page";s:7:"\0*\0data";a:17:{s:2:"id";O:6:"attrId":2:{s:7:"\0*\0data";N;s:9:"\0*\0params";a:1:{s:3:"key";s:2:"id";}}s:3:"key";O:7:"attrKey":2:{s:7:"\0*\0data";N;s:9:"\0*\0params";a:1:{s:3:"key";s:3:"key";}}s:5:"title";O:8:"attrI18n":4:{s:8:"\0*\0field";s:9:"fieldText";s:7:"\0*\0data";a:1:{i:0;s:8:"New page";}s:9:"\0*\0params";a:3:{s:3:"key";s:5:"title";s:5:"table";s:4:"page";s:3:"env";s:4:"site";}s:4:"attr";s:10:"attrString";}s:9:"metatitle";O:8:"attrI18n":4:{s:8:"\0*\0field";s:9:"fieldText";s:7:"\0*\0data";a:0:{}s:9:"\0*\0params";a:3:{s:3:"key";s:9:"metatitle";s:5:"table";s:4:"page";s:3:"env";s:4:"site";}s:4:"attr";s:10:"attrString";}s:9:"metadescr";O:8:"attrI18n":4:{s:8:"\0*\0field";s:13:"fieldTextarea";s:7:"\0*\0data";a:0:{}s:9:"\0*\0params";a:3:{s:3:"key";s:9:"metadescr";s:5:"table";s:4:"page";s:3:"env";s:4:"site";}s:4:"attr";s:10:"attrString";}s:3:"url";O:7:"attrUrl":5:{s:7:"\0*\0item";N;s:6:"\0*\0old";b:0;s:11:"\0*\0oldvalue";N;s:7:"\0*\0data";a:0:{}s:9:"\0*\0params";a:9:{s:3:"key";s:3:"url";s:5:"table";s:4:"page";s:3:"env";s:4:"site";s:7:"version";N;s:4:"live";O:8:"attrLive":2:{s:7:"\0*\0data";N;s:9:"\0*\0params";a:1:{s:3:"key";s:4:"live";}}s:7:"itemkey";N;s:8:"nickname";N;s:2:"id";N;s:4:"name";a:0:{}}}s:4:"type";O:9:"attrArray":2:{s:7:"\0*\0data";a:0:{}s:9:"\0*\0params";a:1:{s:3:"key";s:4:"type";}}s:7:"section";O:7:"attrRel":2:{s:7:"\0*\0data";a:0:{}s:9:"\0*\0params";a:8:{s:3:"key";s:7:"section";s:8:"required";b:0;s:5:"param";a:1:{i:0;a:2:{s:4:"item";s:7:"section";s:8:"property";s:0:"";}}s:3:"min";s:0:"";s:3:"max";s:0:"";s:3:"env";s:4:"site";s:5:"table";s:4:"page";s:2:"id";N;}}s:5:"group";O:7:"attrRel":2:{s:7:"\0*\0data";a:0:{}s:9:"\0*\0params";a:8:{s:3:"key";s:5:"group";s:8:"required";b:0;s:5:"param";a:1:{i:0;a:2:{s:4:"item";s:5:"group";s:8:"property";s:0:"";}}s:3:"min";s:0:"";s:3:"max";s:0:"";s:3:"env";s:4:"site";s:5:"table";s:4:"page";s:2:"id";N;}}s:6:"system";O:8:"attrBool":2:{s:7:"\0*\0data";N;s:9:"\0*\0params";a:2:{s:3:"key";s:6:"system";s:8:"required";b:0;}}s:7:"created";O:11:"attrCreated":2:{s:7:"\0*\0data";s:19:"0000-00-00 00:00:00";s:9:"\0*\0params";a:2:{s:4:"type";s:8:"datetime";s:3:"key";s:7:"created";}}s:7:"updated";O:11:"attrUpdated":2:{s:7:"\0*\0data";s:19:"0000-00-00 00:00:00";s:9:"\0*\0params";a:2:{s:4:"type";s:8:"datetime";s:3:"key";s:7:"updated";}}s:5:"owner";O:9:"attrOwner":2:{s:7:"\0*\0data";N;s:9:"\0*\0params";a:2:{s:3:"key";s:5:"owner";s:3:"env";s:4:"site";}}s:6:"status";O:10:"attrStatus":2:{s:7:"\0*\0data";N;s:9:"\0*\0params";a:1:{s:3:"key";s:6:"status";}}s:5:"child";O:7:"attrRel":2:{s:7:"\0*\0data";a:0:{}s:9:"\0*\0params";a:8:{s:3:"key";s:5:"child";s:8:"required";b:0;s:5:"param";a:1:{i:0;a:2:{s:4:"item";s:4:"page";s:8:"property";s:0:"";}}s:3:"min";s:0:"";s:3:"max";s:0:"";s:3:"env";s:4:"site";s:5:"table";s:4:"page";s:2:"id";N;}}s:6:"parent";O:7:"attrRel":2:{s:7:"\0*\0data";a:1:{i:0;s:6:"page_1";}s:9:"\0*\0params";a:8:{s:3:"key";s:6:"parent";s:8:"required";b:0;s:5:"param";a:1:{i:0;a:2:{s:4:"item";s:4:"page";s:8:"property";s:0:"";}}s:3:"min";s:1:"0";s:3:"max";s:1:"1";s:3:"env";s:4:"site";s:5:"table";s:4:"page";s:2:"id";N;}}s:4:"live";r:50;}}', 'human_2', '2016-02-23 12:16:16', '2016-02-23 12:16:16', 'draft');

-- --------------------------------------------------------

--
-- Structure de la table `_rel`
--

DROP TABLE IF EXISTS `_rel`;
CREATE TABLE `_rel` (
  `item` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'undefined',
  `itemid` int(10) unsigned NOT NULL,
  `key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `rel` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'undefined',
  `relid` int(10) unsigned NOT NULL,
  `position` int(4) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Relations of page';

--
-- Contenu de la table `_rel`
--

INSERT INTO `_rel` (`item`, `itemid`, `key`, `rel`, `relid`, `position`) VALUES
('human', 3, 'group', 'group', 1, 0),
('human', 4, 'group', 'group', 1, 0),
('human', 2, 'group', 'group', 1, 0);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `api`
--
ALTER TABLE `api`
  ADD PRIMARY KEY (`id`),
  ADD KEY `key` (`key`),
  ADD KEY `owner` (`owner`),
  ADD KEY `status` (`status`);

--
-- Index pour la table `const`
--
ALTER TABLE `const`
  ADD PRIMARY KEY (`id`),
  ADD KEY `key` (`key`),
  ADD KEY `status` (`status`);

--
-- Index pour la table `form`
--
ALTER TABLE `form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `key` (`key`),
  ADD KEY `status` (`status`);

--
-- Index pour la table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `key` (`key`),
  ADD KEY `status` (`status`),
  ADD KEY `version` (`admin`);

--
-- Index pour la table `human`
--
ALTER TABLE `human`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `status` (`status`);

--
-- Index pour la table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `status` (`status`);

--
-- Index pour la table `logbook`
--
ALTER TABLE `logbook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `key` (`key`);

--
-- Index pour la table `machine`
--
ALTER TABLE `machine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `key` (`key`),
  ADD KEY `owner` (`owner`),
  ADD KEY `status` (`status`);

--
-- Index pour la table `mail`
--
ALTER TABLE `mail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `key` (`key`),
  ADD KEY `owner` (`owner`),
  ADD KEY `status` (`status`),
  ADD KEY `live` (`live`);

--
-- Index pour la table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `key` (`key`),
  ADD KEY `status` (`status`);

--
-- Index pour la table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`),
  ADD KEY `key` (`key`),
  ADD KEY `status` (`status`);

--
-- Index pour la table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `status` (`status`);

--
-- Index pour la table `version`
--
ALTER TABLE `version`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `status` (`status`);

--
-- Index pour la table `workflow`
--
ALTER TABLE `workflow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `original` (`original`),
  ADD KEY `key` (`key`),
  ADD KEY `owner` (`owner`),
  ADD KEY `status` (`status`);

--
-- Index pour la table `_rel`
--
ALTER TABLE `_rel`
  ADD KEY `position` (`position`),
  ADD KEY `object` (`item`),
  ADD KEY `rel` (`rel`),
  ADD KEY `relid` (`relid`),
  ADD KEY `objectid` (`itemid`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `api`
--
ALTER TABLE `api`
  MODIFY `id` mediumint(3) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `const`
--
ALTER TABLE `const`
  MODIFY `id` mediumint(3) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `form`
--
ALTER TABLE `form`
  MODIFY `id` mediumint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The unique identifier',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `group`
--
ALTER TABLE `group`
  MODIFY `id` mediumint(3) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `human`
--
ALTER TABLE `human`
  MODIFY `id` mediumint(3) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `item`
--
ALTER TABLE `item`
  MODIFY `id` mediumint(3) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT pour la table `logbook`
--
ALTER TABLE `logbook`
  MODIFY `id` mediumint(3) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT pour la table `machine`
--
ALTER TABLE `machine`
  MODIFY `id` mediumint(3) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `mail`
--
ALTER TABLE `mail`
  MODIFY `id` mediumint(3) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `page`
--
ALTER TABLE `page`
  MODIFY `id` mediumint(3) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `section`
--
ALTER TABLE `section`
  MODIFY `id` mediumint(3) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `site`
--
ALTER TABLE `site`
  MODIFY `id` mediumint(3) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `version`
--
ALTER TABLE `version`
  MODIFY `id` mediumint(3) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `workflow`
--
ALTER TABLE `workflow`
  MODIFY `id` mediumint(3) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
