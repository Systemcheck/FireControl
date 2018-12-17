-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 14. Dez 2018 um 19:30
-- Server-Version: 10.0.37-MariaDB-0+deb8u1
-- PHP-Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `fwz_`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ed_cars`
--

CREATE TABLE `ed_cars` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `organisation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `funk` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `besatzung_soll` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `agt_soll` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `ed_cars`
--

INSERT INTO `ed_cars` (`id`, `name`, `organisation`, `funk`, `besatzung_soll`, `agt_soll`, `created_at`, `updated_at`) VALUES
(764, 'KdoW', 'Feuerwehr', 'ZW 1/10-1 ', '0/1/4', '', '2018-12-12 15:42:09', NULL),
(765, 'FKW', 'Feuerwehr', 'ZW 1/11-1 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(766, 'MTF', 'Feuerwehr', 'ZW 1/19-1 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(767, 'TLF 16/25', 'Feuerwehr', 'ZW 1/23-1 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(768, 'TLF 24/48', 'Feuerwehr', 'ZW 1/24-1 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(769, 'TGM 23-12', 'Feuerwehr', 'ZW 1/38-1 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(770, 'TSF-W', 'Feuerwehr', 'ZW 1/42-1 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(771, 'HLF20/16', 'Feuerwehr', 'ZW 1/46-1 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(772, 'RW-Kran', 'Feuerwehr', 'ZW 1/52-1 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(773, 'GW-Mess', 'Feuerwehr', 'ZW 1/53-1 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(774, 'GW-G2', 'Feuerwehr', 'ZW 1/54-1 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(775, 'GW-AS', 'Feuerwehr', 'ZW 1/56-1 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(776, 'DeKon-P', 'Feuerwehr', 'ZW 1/57-1 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(777, 'WLF', 'Feuerwehr', 'ZW 1/66-1 ', '0/1/1', '', '2018-12-12 15:42:09', NULL),
(778, 'MZF3', 'Feuerwehr', 'ZW 1/73-1 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(779, 'KEF', 'Feuerwehr', 'ZW 1/75-1 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(780, 'SFI', 'Feuerwehr', 'Kater ZW 1-1 ', '1', '', '2018-12-12 15:42:09', NULL),
(781, 'stellv.SFI', 'Feuerwehr', 'Kater ZW 1-2 ', '1', '', '2018-12-12 15:42:09', NULL),
(782, 'stellv.SFI', 'Feuerwehr', 'Kater ZW 1-3 ', '1', '', '2018-12-12 15:42:09', NULL),
(783, 'ZF-GSZ', 'Feuerwehr', 'Kater ZW 2 ', '1', '', '2018-12-12 15:42:09', NULL),
(784, 'MLF', 'Feuerwehr', 'ZW 2/44-1 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(785, 'LFKat-S', 'Feuerwehr', 'ZW 3/48-1 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(786, 'MTF-L', 'Feuerwehr', 'ZW 3/71-1 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(787, 'LF20/16', 'Feuerwehr', 'ZW 4/49-1 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(788, 'FLF', 'Feuerwehr', 'ZW 5/29-1 ', '0/1/1', '', '2018-12-12 15:42:09', NULL),
(789, 'TLF 16/25', 'Feuerwehr', 'ZW 5/29-2 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(790, 'RHF', 'Feuerwehr', 'Rheinpfalz 64-6 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(791, 'Leiter IuK', 'Feuerwehr', 'Kater ZW 9-1 ', '1', '', '2018-12-12 15:42:09', NULL),
(792, 'Verb.-F. I', 'Feuerwehr', 'ZW 1/93-1 ', '1', '', '2018-12-12 15:42:09', NULL),
(793, 'Verb.-F. II', 'Feuerwehr', 'ZW 1/93-2 ', '1', '', '2018-12-12 15:42:09', NULL),
(794, '', 'Feuerwehr', 'AB-Besprechung FWZ', '', '', '2018-12-12 15:42:09', NULL),
(795, '', 'Feuerwehr', 'AB-MANV FWZ', '', '', '2018-12-12 15:42:09', NULL),
(796, '', 'Feuerwehr', 'AB-Mulde FWZ', '', '', '2018-12-12 15:42:09', NULL),
(797, '', 'Feuerwehr', 'AB-Schlauch FWZ', '', '', '2018-12-12 15:42:09', NULL),
(798, '', 'Feuerwehr', 'AB-Sonderlöschmittel FWZ', '', '', '2018-12-12 15:42:09', NULL),
(799, '', 'Feuerwehr', 'Althornbach Anhänger Schlauch', '', '', '2018-12-12 15:42:09', NULL),
(800, '', 'Feuerwehr', 'Anhänger FWZ Boot', '', '', '2018-12-12 15:42:09', NULL),
(801, '', 'Feuerwehr', 'Bechhofen Anhänger Licht', '', '', '2018-12-12 15:42:09', NULL),
(802, 'MTW', 'THW', 'Heros ZW 21/10 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(803, 'GKW1', 'THW', 'Heros ZW 22/51 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(804, 'GKW2', 'THW', 'Heros ZW 24/53 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(805, 'MLW-Infrastruktur', 'THW', 'Heros ZW 31/31 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(806, 'MLW-Versorgung', 'THW', 'Heros ZW 31/35 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(807, 'MTW', 'THW', 'Heros ZW 86/25 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(808, 'KdoW', 'Feuerwehr', 'HOM 1/10 ', '0/1/4', '', '2018-12-12 15:42:09', NULL),
(809, 'ELW2', 'Feuerwehr', 'HOM 1/12 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(810, 'MTW', 'Feuerwehr', 'HOM 1/18 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(811, 'TLF16/25', 'Feuerwehr', 'HOM 1/23/1 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(812, 'TLF16/25', 'Feuerwehr', 'HOM 1/23/2 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(813, 'TLF24/50', 'Feuerwehr', 'HOM 1/24 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(814, 'TroLF', 'Feuerwehr', 'HOM 1/28 ', '0/1/1', '', '2018-12-12 15:42:09', NULL),
(815, 'DLK23/12', 'Feuerwehr', 'HOM 1/31 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(816, 'RW-Kran', 'Feuerwehr', 'HOM 1/59 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(817, 'GW-G2', 'Feuerwehr', 'HOM 1/62 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(818, 'Mef-G', 'Feuerwehr', 'HOM 1/65 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(819, 'MZF3', 'Feuerwehr', 'HOM 1/90 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(820, 'WLF', 'Feuerwehr', 'HOM 1/91 ', '0/1/1', '', '2018-12-12 15:42:09', NULL),
(821, 'MZF3', 'Feuerwehr', 'HOM 1/92 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(822, 'MTW', 'Feuerwehr', 'HOM 2/18 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(823, 'HLF20/16', 'Feuerwehr', 'HOM 2/29 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(824, 'LF8/6', 'Feuerwehr', 'HOM 2/42 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(825, 'GW-™l', 'Feuerwehr', 'HOM 2/63 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(826, 'MTW', 'Feuerwehr', 'HOM 3/18 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(827, 'TLF16/24Tr', 'Feuerwehr', 'HOM 3/21 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(828, 'LF8/6', 'Feuerwehr', 'HOM 3/42 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(829, 'LF8', 'Feuerwehr', 'HOM 4/41 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(830, 'LF 8/6', 'Feuerwehr', 'HOM 4/42 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(831, 'LF16TS', 'Feuerwehr', 'HOM 4/44 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(832, 'TSF-W', 'Feuerwehr', 'HOM 5/47 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(833, '', 'Feuerwehr', 'HOM Anhänger 1 RTB1', '', '', '2018-12-12 15:42:09', NULL),
(834, '', 'Feuerwehr', 'HOM Anhänger 2 RTB1', '', '', '2018-12-12 15:42:09', NULL),
(835, '', 'Feuerwehr', 'HOM Anhänger Stromerzeuger', '', '', '2018-12-12 15:42:09', NULL),
(836, '', 'Feuerwehr', 'Hornbach Anhänger Schlauch', '', '', '2018-12-12 15:42:09', NULL),
(837, 'ELW2', 'Feuerwehr', 'Kater Südwest 12 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(838, 'KdoW', 'Feuerwehr', 'Kater ZW 1/10-1 ', '0/1/4', '', '2018-12-12 15:42:09', NULL),
(839, 'ELW 2', 'Feuerwehr', 'Kater ZW 12 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(840, 'ELW 1', 'Feuerwehr', 'Kater ZW 51/11-1 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(841, 'FKw', 'Feuerwehr', 'Kater ZW 51/11-2 ', '0/1/4', '', '2018-12-12 15:42:09', NULL),
(842, 'MTF', 'Feuerwehr', 'Kater ZW 51/19-1 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(843, 'MTF', 'Feuerwehr', 'Kater ZW 51/19-2 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(844, 'GW-Betreu.', 'Feuerwehr', 'Kater ZW 51/62-1 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(845, 'RTW-SEG', 'Feuerwehr', 'Kater ZW 51/86-2 ', '01.01.01', '', '2018-12-12 15:42:09', NULL),
(846, 'KTW', 'Feuerwehr', 'Kater ZW 51/87-2 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(847, 'KTW', 'Feuerwehr', 'Kater ZW 51/87-3 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(848, 'Quad', 'Feuerwehr', 'Kater ZW 52/16-1 ', '1', '', '2018-12-12 15:42:09', NULL),
(849, 'PKW', 'Feuerwehr', 'Kater ZW 52/17-1 ', '0/1/3', '', '2018-12-12 15:42:09', NULL),
(850, 'PKW', 'Feuerwehr', 'Kater ZW 52/17-2 ', '0/1/3', '', '2018-12-12 15:42:09', NULL),
(851, 'PKW', 'Feuerwehr', 'Kater ZW 52/17-3 ', '0/1/3', '', '2018-12-12 15:42:09', NULL),
(852, 'MTW', 'Feuerwehr', 'Kater ZW 52/19-1 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(853, 'MTW', 'Feuerwehr', 'Kater ZW 52/19-2 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(854, 'MTW', 'Feuerwehr', 'Kater ZW 52/19-3 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(855, 'MTW', 'Feuerwehr', 'Kater ZW 52/19-4 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(856, 'MTW', 'Feuerwehr', 'Kater ZW 52/19-5 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(857, ' Arzt-Tr. 7', 'Feuerwehr', 'Kater ZW 52/59-1 ', '0/1/4', '', '2018-12-12 15:42:09', NULL),
(858, 'GW-SAN 15', 'Feuerwehr', 'Kater ZW 52/60-1 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(859, 'RTW-SEG', 'Feuerwehr', 'Kater ZW 52/86-1 ', '01.01.01', '', '2018-12-12 15:42:09', NULL),
(860, 'KTW', 'Feuerwehr', 'Kater ZW 52/87-1 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(861, 'KTW', 'Feuerwehr', 'Kater ZW 52/87-2 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(862, 'KTW4', 'Feuerwehr', 'Kater ZW 52/87-3 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(863, 'KTW', 'Feuerwehr', 'Kater ZW 52/87-4 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(864, 'NEF', 'Rettungsdienst', 'LD 51/82-1 ', '01.01.00', '', '2018-12-12 15:42:09', NULL),
(865, ' RTW', 'Rettungsdienst', 'LD 51/83-1 ', '01.01.01', '', '2018-12-12 15:42:09', NULL),
(866, 'RTW', 'Rettungsdienst', 'LD 51/83-2 ', '01.01.01', '', '2018-12-12 15:42:09', NULL),
(867, 'KTW', 'Rettungsdienst', 'LD 51/85-1 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(868, ' KTW', 'Rettungsdienst', 'LD 51/85-2 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(869, 'KTW', 'Rettungsdienst', 'LD 51/85-3 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(870, ' KTW', 'Rettungsdienst', 'LD 51/85-9 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(871, 'RTW', 'Rettungsdienst', 'LD 52/83-1 ', '01.01.01', '', '2018-12-12 15:42:09', NULL),
(872, ' KTW', 'Rettungsdienst', 'LD 52/85-1 ', '0/1/4', '', '2018-12-12 15:42:09', NULL),
(873, 'TLF16/24Tr', 'Feuerwehr', 'ZW-Land 1/23-1 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(874, 'LF16TS', 'Feuerwehr', 'ZW-Land 1/23-1 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(875, 'KdoW', 'Feuerwehr', 'ZW-Land 10 ', '0/1/4', '', '2018-12-12 15:42:09', NULL),
(876, 'MTW', 'Feuerwehr', 'ZW-Land 10/19-1 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(877, 'TLF4000', 'Feuerwehr', 'ZW-Land 10/24-1 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(878, 'KLF', 'Feuerwehr', 'ZW-Land 11/42-1 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(879, 'LF8/6', 'Feuerwehr', 'ZW-Land 12/44-1 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(880, ' KLF', 'Feuerwehr', 'ZW-Land 13/42-1 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(881, 'TSF', 'Feuerwehr', 'ZW-Land 14/41-1 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(882, 'TSF', 'Feuerwehr', 'ZW-Land 15/41-1 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(883, 'KLF', 'Feuerwehr', 'ZW-Land 16/42-1 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(884, 'KLF', 'Feuerwehr', 'ZW-Land 17/42-1 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(885, 'KLF', 'Feuerwehr', 'ZW-Land 2/42-1 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(886, 'TSF', 'Feuerwehr', 'ZW-Land 3/41-1 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(887, 'LF8/6', 'Feuerwehr', 'ZW-Land 3/44-1 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(888, 'ELW1', 'Feuerwehr', 'ZW-Land 4/11-1 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(889, 'MTW', 'Feuerwehr', 'ZW-Land 4/19-1 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(890, 'TSF', 'Feuerwehr', 'ZW-Land 4/41-1 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(891, 'HLF20/16', 'Feuerwehr', 'ZW-Land 4/46-1 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(892, ' MZF 3', 'Feuerwehr', 'ZW-Land 4/73-1 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(893, 'TLF16/25', 'Feuerwehr', 'ZW-Land 5/23-1 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(894, 'RW1', 'Feuerwehr', 'ZW-Land 5/51-1 ', '0/1/1', '', '2018-12-12 15:42:09', NULL),
(895, 'MZF 1', 'Feuerwehr', 'ZW-Land 5/71-1 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(896, 'TSF', 'Feuerwehr', 'ZW-Land 6/41-1 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(897, 'KLF', 'Feuerwehr', 'ZW-Land 7/42-1 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(898, 'TSF', 'Feuerwehr', 'ZW-Land 8/41-1 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(899, 'TLF16/25', 'Feuerwehr', 'ZW-Land 9/23-1 ', '0/1/5', '', '2018-12-12 15:42:09', NULL),
(900, 'DLK23/12', 'Feuerwehr', 'ZW-Land 9/34-1 ', '0/1/2', '', '2018-12-12 15:42:09', NULL),
(901, 'MTW', 'Feuerwehr', 'ZW-Land 9/71-1 ', '0/1/8', '', '2018-12-12 15:42:09', NULL),
(902, '', 'Sonstige', 'Autobahnmeisterei', '', '', '2018-12-12 15:42:09', NULL),
(903, '', 'Sonstige', 'ILS Südpfalz', '', '', '2018-12-12 15:42:09', NULL),
(904, '', 'Sonstige', 'Notfallseelsorger', '', '', '2018-12-12 15:42:09', NULL),
(905, '', 'Polizei', 'PI Zweibrücken', '', '', '2018-12-12 15:42:09', NULL),
(906, '', 'Rettungsdienst', 'Rett.Dienst Südpfalz über ILS Südpfalz', '', '', '2018-12-12 15:42:09', NULL),
(907, '', 'Sonstige', 'Stadtwerke Zweibrücken', '', '', '2018-12-12 15:42:09', NULL),
(908, '', 'Sonstige', 'Straßenmeisterei Waldfischbach', '', '', '2018-12-12 15:42:09', NULL),
(909, '', 'Sonstige', 'Umwelt- u. Servicebetriebe Zweibrcken', '', '', '2018-12-12 15:42:09', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ed_config`
--

CREATE TABLE `ed_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `wert` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `ed_config`
--

INSERT INTO `ed_config` (`id`, `name`, `wert`, `created_at`, `updated_at`) VALUES
(1, 'mission', '1', '2018-11-24 08:40:34', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ed_messages`
--

CREATE TABLE `ed_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `mission_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `from` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `ed_messages`
--

INSERT INTO `ed_messages` (`id`, `mission_id`, `message`, `from`, `created_at`, `updated_at`) VALUES
(1, '1', '1/46/1 erreicht Einsatzstelle', 'System', '2018-12-13 18:30:14', NULL),
(2, '1', 'Polizei vor Ort', '1-46-1', '2018-12-13 18:30:32', NULL),
(3, '1', 'RD verständigt', 'FEZ', '2018-12-13 18:30:47', NULL),
(4, '1', 'RD verständigt', 'FEZ', '2018-12-13 18:30:50', NULL),
(5, '2', 'ZW 1/46-1  erreicht Einsatzstelle', 'System', '2018-12-13 18:41:21', NULL),
(6, '2', 'ZW 1/10-1  erreicht Einsatzstelle', 'System', '2018-12-13 18:41:51', NULL),
(7, '2', 'Erkundung durch GF', '1/46/1', '2018-12-13 18:42:40', NULL),
(8, '2', 'Tür wird mit Bleche geöffnet', '1/10/1', '2018-12-13 18:43:21', NULL),
(9, '2', 'Müller Meyer', 'ap01', '2018-12-13 18:45:03', NULL),
(10, '2', 'ZW 1/10-1  verlässt Einsatzstelle', 'System', '2018-12-13 18:46:09', NULL),
(11, '2', 'ZW 1/46-1  verlässt Einsatzstelle', 'System', '2018-12-13 18:48:28', NULL),
(12, '3', 'ZW-Land 4/46-1  verlässt Einsatzstelle', 'System', '2018-12-13 19:14:02', NULL),
(13, '3', 'ZW 1/46-1  verlässt Einsatzstelle', 'System', '2018-12-13 19:14:06', NULL),
(14, '3', 'ZW 1/46-1  erreicht Einsatzstelle', 'System', '2018-12-13 19:14:14', NULL),
(15, '3', 'ZW 2/44-1  erreicht Einsatzstelle', 'System', '2018-12-13 19:14:22', NULL),
(16, '4', 'Kater ZW 51/11-1  erreicht Einsatzstelle', 'System', '2018-12-13 19:49:35', NULL),
(17, '4', 'Kater ZW 51/11-1  verlässt Einsatzstelle', 'System', '2018-12-13 19:50:16', NULL),
(18, '4', 'ZW 1/46-1  erreicht Einsatzstelle', 'System', '2018-12-13 20:02:18', NULL),
(19, '4', 'ZW-Land 4/46-1  erreicht Einsatzstelle', 'System', '2018-12-13 20:05:51', NULL),
(20, '4', 'ZW5-Land 4/46-1  (HLF20/16 ) erreicht Einsatzstelle', 'System', '2018-12-13 20:06:23', NULL),
(21, '4', 'Kater ZW 12  erreicht Einsatzstelle', 'System', '2018-12-13 20:06:56', NULL),
(22, '4', 'HOM 1/23/1  erreicht Einsatzstelle', 'System', '2018-12-13 20:08:02', NULL),
(23, '4', 'ZW 1/56-1  erreicht Einsatzstelle', 'System', '2018-12-13 20:08:37', NULL),
(24, '4', 'Straßesp.', 'Pi', '2018-12-13 20:12:50', NULL),
(25, '4', 'jgfjzjrf', '1/46/1', '2018-12-13 20:13:28', NULL),
(26, '4', 'oijopniop', '1/46/1', '2018-12-13 20:13:39', NULL),
(27, '4', 'Fenster offen', 'Passant', '2018-12-13 20:15:08', NULL),
(28, '6', 'ZW 1/46-1  erreicht Einsatzstelle', 'System', '2018-12-14 04:54:23', NULL),
(29, '6', 'ZW 1/38-1  erreicht Einsatzstelle', 'System', '2018-12-14 04:54:56', NULL),
(30, '6', 'ZW 5/29-1  erreicht Einsatzstelle', 'System', '2018-12-14 04:55:30', NULL),
(31, '6', 'Brand einer Filteranlage Halle 2', '5/29/1', '2018-12-14 04:56:11', NULL),
(32, '6', '2 AGT Trupps im Einsatz mit C-Rohr', '1-46-1', '2018-12-14 04:57:07', NULL),
(33, '8', 'ZW 1/46-1  erreicht Einsatzstelle', 'System', '2018-12-14 18:21:53', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ed_missioncars`
--

CREATE TABLE `ed_missioncars` (
  `id` int(20) NOT NULL,
  `carid` int(10) NOT NULL,
  `mission_id` int(5) NOT NULL,
  `funk` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `organisation` text NOT NULL,
  `agt` int(3) NOT NULL,
  `staerke` varchar(10) NOT NULL,
  `arrived` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `standort` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `ed_missioncars`
--

INSERT INTO `ed_missioncars` (`id`, `carid`, `mission_id`, `funk`, `name`, `organisation`, `agt`, `staerke`, `arrived`, `standort`) VALUES
(1, 1, 36, '', '1/23/1', 'Feuerwehr', 4, '0/1/8', '2018-12-02 10:22:42', 'Bereitstellungsraum'),
(3, 2, 36, '', '1/45/1', 'Feuerwehr', 4, '0/1/8', '2018-12-02 10:22:49', 'Einsatzstelle'),
(13, 5, 48, '1/2/3', 'RTW', 'Rettungsdienst', 0, '2', '0000-00-00 00:00:00', 'Einsatzstelle'),
(14, 3, 48, '1/49/1', 'TLF 8000', 'Sonstige', 2, '0/1/2', '0000-00-00 00:00:00', 'Einsatzstelle'),
(15, 3, 48, '1/49/1', 'TLF 8000', 'Sonstige', 2, '0/1/2', '0000-00-00 00:00:00', 'Einsatzstelle'),
(16, 2, 48, '1/45/1', 'LF 16 TS', 'Feuerwehr', 4, '0/1/8', '0000-00-00 00:00:00', 'Einsatzstelle'),
(17, 1, 48, '1/23/1', 'TLF 16/25', 'Feuerwehr', 2, '0/1/2', '0000-00-00 00:00:00', 'Einsatzstelle'),
(21, 5, 48, '1/2/3', 'RTW', 'Rettungsdienst', 0, '2', '2018-12-05 19:14:03', 'Einsatzstelle'),
(22, 2, 49, '1/45/1', 'LF 16 TS', 'Feuerwehr', 4, '0/1/8', '2018-12-08 13:45:13', 'Einsatzstelle'),
(28, 6, 52, '1/10/1', 'Kdow', 'Feuerwehr', 2, '1/4', '2018-12-09 13:42:27', 'Einsatzstelle'),
(29, 1, 52, '1/23/1', 'TLF 16/25', 'Feuerwehr', 2, '0/1/2', '2018-12-09 13:42:43', 'Einsatzstelle'),
(30, 6, 54, '1/10/1', 'Kdow', 'Feuerwehr', 2, '1/4', '2018-12-09 14:30:40', 'Einsatzstelle'),
(31, 1, 54, '1/23/1', 'TLF 16/25', 'Feuerwehr', 2, '0/1/2', '2018-12-09 14:32:45', 'Einsatzstelle'),
(32, 1, 54, '1/23/1', 'TLF 16/25', 'Feuerwehr', 2, '1/7', '2018-12-09 14:32:00', 'Einsatzstelle'),
(36, 1, 63, '1/23/1', 'TLF 16/25', 'Feuerwehr', 2, '0/1/2', '2018-12-09 15:27:02', 'Einsatzstelle'),
(37, 6, 63, '1/10/1', 'Kdow', 'Feuerwehr', 0, '1/4', '2018-12-09 15:28:55', 'Einsatzstelle'),
(38, 6, 63, '1/10/1', 'Kdow', '', 0, '1/4', '2018-12-09 15:37:03', 'Einsatzstelle'),
(39, 8, 63, '2/44/1', 'MLF', '', 0, '1/5', '2018-12-09 15:39:35', 'Einsatzstelle'),
(40, 8, 63, '2/44/1', 'MLF', 'Feuerwehr', 0, '1/5', '2018-12-09 15:39:06', 'Einsatzstelle'),
(41, 3, 63, '1/49/1', 'TLF 8000', 'Sonstige', 2, '0/1/2', '2018-12-09 15:40:46', 'Einsatzstelle'),
(42, 3, 63, '1/49/1', 'TLF 8000', 'Sonstige', 2, '0/1/2', '2018-12-09 15:41:30', 'Einsatzstelle'),
(45, 0, 63, '', '', 'Feuerwehr', 4, '0/1/8', '2018-12-09 15:44:15', 'Einsatzstelle'),
(46, 0, 63, '', '', '', 0, '', '2018-12-09 15:44:54', 'Einsatzstelle'),
(47, 0, 63, '', '', 'Feuerwehr', 2, '', '2018-12-09 15:44:22', 'Einsatzstelle'),
(49, 0, 63, '8/41/3', '8/41/3', 'Feuerwehr', 0, '', '2018-12-09 15:55:15', 'Einsatzstelle'),
(51, 0, 63, '16/53/1', '16/53/1', 'Rettungsdienst', 0, '', '2018-12-09 16:31:15', 'Bereitstellungsraum'),
(52, 7, 64, 'ZW 1-46-1', 'HLF 20', 'Feuerwehr', 0, '9', '2018-12-09 17:13:51', 'Einsatzstelle'),
(53, 1, 64, '1/23/1', 'TLF 16/25', 'Feuerwehr', 2, '0/1/2', '2018-12-09 17:13:59', 'Einsatzstelle'),
(55, 6, 64, '1/10/1', 'Kdow', 'Feuerwehr', 0, '1/4', '2018-12-09 17:14:29', 'Einsatzstelle'),
(56, 10, 64, '1/38/1', 'TGM', 'Feuerwehr', 0, '1/2', '2018-12-09 17:16:48', 'Einsatzstelle'),
(57, 0, 64, 'ELvD', 'ELvD', 'Feuerwehr', 0, '', '2018-12-09 17:16:56', 'Einsatzstelle'),
(62, 0, 85, '8/41/3', '8/41/3', 'Feuerwehr', 4, '0/1/8', '2018-12-10 09:48:47', 'Einsatzstelle'),
(63, 0, 85, 'Pol', 'Pol', 'Polizei', 0, '2', '2018-12-10 09:48:03', 'Einsatzstelle'),
(64, 0, 85, 'rtw', 'rtw', 'Rettungsdienst', 0, '', '2018-12-10 09:48:31', 'Einsatzstelle'),
(65, 0, 85, '14/12thw', '14/12thw', 'THW', 0, '', '2018-12-10 09:50:11', 'Einsatzstelle'),
(66, 0, 85, 'Heros 53', 'Heros 53', 'THW', 0, '', '2018-12-10 09:52:59', 'Einsatzstelle'),
(67, 544, 88, 'Kater ZW 1/10-1 ', 'KdoW', 'Feuerwehr', 0, '0/1/4', '2018-12-12 13:36:01', 'Einsatzstelle'),
(68, 509, 89, 'Heros ZW 22/51 ', 'GKW1', 'THW', 0, '0/1/8', '2018-12-12 14:06:09', 'Einsatzstelle'),
(77, 0, 1, '1/46/1', '1/46/1', '', 0, '017', '2018-12-13 18:29:14', 'Einsatzstelle'),
(80, 771, 3, 'ZW 1/46-1 ', 'HLF20/16', 'Feuerwehr', 0, '0/1/8', '2018-12-13 19:14:14', 'Einsatzstelle'),
(81, 784, 3, 'ZW 2/44-1 ', 'MLF', 'Feuerwehr', 0, '0/1/5', '2018-12-13 19:14:22', 'Einsatzstelle'),
(83, 771, 4, 'ZW 1/46-1 ', 'HLF20/16', 'Feuerwehr', 4, '0/1/8', '2018-12-13 20:02:18', 'Einsatzstelle'),
(84, 891, 4, 'ZW-Land 4/46-1 ', 'HLF20/16', 'Feuerwehr', 0, '0/1/8', '2018-12-13 20:02:51', 'Einsatzstelle'),
(85, 0, 4, 'ZW5-Land 4/46-1  (HLF20/16 )', 'ZW5-Land 4/46-1  (HLF20/16 )', 'Feuerwehr', 2, '118', '2018-12-13 20:02:23', 'Einsatzstelle'),
(86, 839, 4, 'Kater ZW 12 ', 'ELW 2', 'Feuerwehr', 0, '111', '2018-12-13 20:02:56', 'Einsatzstelle'),
(87, 811, 4, 'HOM 1/23/1 ', 'TLF16/25', 'Feuerwehr', 0, '0/1/5', '2018-12-13 20:02:02', 'Einsatzstelle'),
(88, 775, 4, 'ZW 1/56-1 ', 'GW-AS', 'Feuerwehr', 0, '0/1/2', '2018-12-13 20:02:37', 'Einsatzstelle'),
(89, 771, 6, 'ZW 1/46-1 ', 'HLF20/16', 'Feuerwehr', 4, '1/1/7', '2018-12-14 04:53:23', 'Einsatzstelle'),
(90, 769, 6, 'ZW 1/38-1 ', 'TGM 23-12', 'Feuerwehr', 0, '0/1/2', '2018-12-14 04:53:56', 'Einsatzstelle'),
(91, 788, 6, 'ZW 5/29-1 ', 'FLF', 'Feuerwehr', 2, '0/2/2', '2018-12-14 04:53:30', 'Einsatzstelle'),
(92, 771, 8, 'ZW 1/46-1 ', 'HLF20/16', 'Feuerwehr', 0, '0/1/8', '2018-12-14 18:21:53', 'Einsatzstelle');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ed_missions`
--

CREATE TABLE `ed_missions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adress` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_from` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cars` longtext CHARACTER SET utf8
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `ed_missions`
--

INSERT INTO `ed_missions` (`id`, `name`, `description`, `adress`, `number`, `created_at`, `updated_at`, `created_from`, `cars`) VALUES
(1, 'H 2.01 Notfalltüröffnung', '', 'Landauerstrasse', '1', '2018-12-13 18:25:00', NULL, 'Arbeitsplatz 3', NULL),
(2, 'H 2.01 Notfalltüröffnung', 'Dringend', 'Teststrasse 4', '', '2018-12-13 19:00:00', NULL, 'Arbeitsplatz 3', NULL),
(3, 'H 2.01 Notfalltüröffnung', 'Dringend', 'Teststrasse 22', '', '2018-12-13 21:22:00', NULL, 'Dennis Nizard', NULL),
(4, '', 'BuH', 'hofenfelsstrasse 201', '', '0000-00-00 00:00:00', NULL, 'Arbeitsplatz 1', NULL),
(6, 'B 3.01 Industriebrand', '', 'Steinhauserstrasse 100', '', '2018-12-14 04:55:00', NULL, 'Arbeitsplatz 3', NULL),
(7, 'H2.06 - Einsturz', '', 'auf der Heide', '20', '2018-12-14 18:20:00', NULL, 'Dennis Nizard', NULL),
(8, 'H2.06 - Einsturz', '', 'in der Dell', '20', '2018-12-14 18:20:34', NULL, 'Dennis Nizard', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ed_streets`
--

CREATE TABLE `ed_streets` (
  `id` int(10) UNSIGNED NOT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `plz` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '66482',
  `ort` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Zweibrücken',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `ed_streets`
--

INSERT INTO `ed_streets` (`id`, `street`, `plz`, `ort`, `created_at`, `updated_at`) VALUES
(0, 'auf der Heide', '66482', 'Zweibrücken', '2018-12-10 12:42:34', NULL),
(1, 'in der Dell', '66482', 'Zweibrücken', '2018-12-10 12:42:34', NULL),
(2, 'Landauerstrasse', '66482', 'Zweibrücken', '2018-12-12 16:32:57', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ed_users`
--

CREATE TABLE `ed_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `passwort` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `vorname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nachname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rechte` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  `logged_in` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `ed_users`
--

INSERT INTO `ed_users` (`id`, `username`, `passwort`, `vorname`, `nachname`, `rechte`, `active`, `logged_in`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$qCgb4MKzbMKAqUU2LOFBQ.wGoAD6yBElFA7V7EPwK.QGCViJjx4mu', 'Dennis', 'Nizard', '16', 1, NULL, '2018-11-21 07:18:10', NULL),
(7, 'mod', '$2y$10$Wtl2IWpz7QFefqOpS72KFezss1DC8BjNdSGmmTaM3pu1SRrL2j8aO', 'Daniel', 'Richter', '16', 0, NULL, '2018-11-24 07:44:31', NULL),
(20, 'AP03', '$2y$10$Y1cJSTXU.t7hl9JZKIT2v.rOr.TYSKkwmkVLXUMFYhrVVevbND8mK', 'Arbeitsplatz', '3', '4', 1, NULL, '2018-12-09 18:07:50', NULL),
(21, 'AP02', '$2y$10$rwxxojvamR.aoOkWGOHGweOGm2Qm4y4JsR/9nilqeNtxOko/UJ1oa', 'Arbeitsplatz', '2', '4', 1, NULL, '2018-12-09 19:10:34', NULL),
(22, 'AP01', '$2y$10$3W1YObBCzS5Yp92OWQbNAuYn6M1V2LQ7BbF6Ofh67XP4Q8nmxEy3S', 'Arbeitsplatz', '1', '4', 1, NULL, '2018-12-09 19:10:56', NULL);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `ed_cars`
--
ALTER TABLE `ed_cars`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `ed_config`
--
ALTER TABLE `ed_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indizes für die Tabelle `ed_messages`
--
ALTER TABLE `ed_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `ed_missioncars`
--
ALTER TABLE `ed_missioncars`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `ed_missions`
--
ALTER TABLE `ed_missions`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `ed_streets`
--
ALTER TABLE `ed_streets`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indizes für die Tabelle `ed_users`
--
ALTER TABLE `ed_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `ed_cars`
--
ALTER TABLE `ed_cars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=910;
--
-- AUTO_INCREMENT für Tabelle `ed_config`
--
ALTER TABLE `ed_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `ed_messages`
--
ALTER TABLE `ed_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT für Tabelle `ed_missioncars`
--
ALTER TABLE `ed_missioncars`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
--
-- AUTO_INCREMENT für Tabelle `ed_missions`
--
ALTER TABLE `ed_missions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT für Tabelle `ed_users`
--
ALTER TABLE `ed_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
