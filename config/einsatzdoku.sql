-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 01. Dez 2018 um 18:44
-- Server-Version: 10.1.37-MariaDB
-- PHP-Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `einsatzdoku`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cars`
--

CREATE TABLE `cars` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `art` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `funk` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `besatzung_soll` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `besatzung_ist` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `cars`
--

INSERT INTO `cars` (`id`, `name`, `art`, `funk`, `besatzung_soll`, `besatzung_ist`, `created_at`, `updated_at`) VALUES
(1, 'TLF 16/25', '', '1/23/1', '0/1/2', '', '2018-11-25 13:13:44', NULL),
(2, 'LF 16 TS', '', '1/45/1', '0/1/8', '', '2018-11-25 13:14:02', NULL),
(3, 'TLF 8000', '', '1/49/1', '0/1/2', '', '2018-11-25 13:14:29', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `config`
--

CREATE TABLE `config` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `wert` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `config`
--

INSERT INTO `config` (`id`, `name`, `wert`, `created_at`, `updated_at`) VALUES
(1, 'mission', '1', '2018-11-24 08:40:34', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `mission_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `from` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `messages`
--

INSERT INTO `messages` (`id`, `mission_id`, `message`, `from`, `created_at`, `updated_at`) VALUES
(1, '18', 'kkkkkkk', '', '2018-11-26 05:44:26', NULL),
(2, '18', 'kkkk', '8/41/3', '2018-11-26 05:51:45', NULL),
(3, '18', 'kkkkk', '8/41/3', '2018-11-26 05:52:06', NULL),
(4, '18', 'test', '8/41/3', '2018-11-26 06:13:42', NULL),
(5, '18', 'eingetroffen', '8/41/3', '2018-11-26 06:14:56', NULL),
(6, '18', 'testmeldung', '8/41/3', '2018-11-26 07:22:12', NULL),
(7, '18', 'LF 16 eingetroffen', '8/41/3', '2018-11-26 07:22:45', NULL),
(8, '18', 'Testmeldung', 'GF 8/41/3', '2018-11-27 12:16:32', NULL),
(9, '18', 'Das ist eine Testmeldung', 'Melder 8/41/3', '2018-11-28 09:43:36', NULL),
(10, '32', 'uibuzvtzvitzvu6z', '841', '2018-11-30 12:45:17', NULL),
(11, '36', 'Meldung', '8', '2018-12-01 16:53:33', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `missioncars`
--

CREATE TABLE `missioncars` (
  `id` int(20) NOT NULL,
  `carid` int(10) NOT NULL,
  `mission_id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `organisation` text NOT NULL,
  `agt` int(3) NOT NULL,
  `staerke` varchar(10) NOT NULL,
  `arrived` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `standort` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `missioncars`
--

INSERT INTO `missioncars` (`id`, `carid`, `mission_id`, `name`, `organisation`, `agt`, `staerke`, `arrived`, `standort`) VALUES
(1, 1, 36, '1/23/1', 'Feuerwehr', 4, '0/1/8', '2018-12-01 16:03:50', ''),
(3, 2, 36, '1/45/1', 'Feuerwehr', 4, '0/1/8', '2018-12-01 16:03:58', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `missions`
--

CREATE TABLE `missions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adress` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_from` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cars` longtext CHARACTER SET utf8
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `missions`
--

INSERT INTO `missions` (`id`, `name`, `description`, `adress`, `created_at`, `updated_at`, `created_from`, `cars`) VALUES
(1, 'Kaminbrand', 'Londoner Bogen', 'Londoner Bogen', '2018-02-18 22:00:00', NULL, NULL, NULL),
(2, 'VU-LKW', 'A20', 'A20', '2018-11-20 06:00:00', NULL, NULL, NULL),
(32, 'Gebäudebrand', 'auf der Heide', '', '2018-04-02 23:28:00', NULL, NULL, NULL),
(33, 'VU-PKW', 'in der Dell', '', '2018-12-01 14:20:00', NULL, NULL, NULL),
(35, 'Gebäudebrand', '', 'auf der Heide', '2018-11-30 12:57:14', NULL, 'Dennis Nizard', NULL),
(36, 'VU-LKW', '', 'auf der Heide', '2018-01-07 13:45:00', NULL, 'Dennis Nizard', '1/45/1;1/49/1');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `passwort` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `vorname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nachname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rechte` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`id`, `username`, `passwort`, `vorname`, `nachname`, `rechte`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$qCgb4MKzbMKAqUU2LOFBQ.wGoAD6yBElFA7V7EPwK.QGCViJjx4mu', 'Dennis', 'Nizard', '16', '2018-11-21 07:18:10', NULL),
(7, 'mod', '$2y$10$Wtl2IWpz7QFefqOpS72KFezss1DC8BjNdSGmmTaM3pu1SRrL2j8aO', 'daniel', 'muh', '4', '2018-11-24 07:44:31', NULL);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `funk` (`funk`);

--
-- Indizes für die Tabelle `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indizes für die Tabelle `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `missioncars`
--
ALTER TABLE `missioncars`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `missions`
--
ALTER TABLE `missions`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`username`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `config`
--
ALTER TABLE `config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `missioncars`
--
ALTER TABLE `missioncars`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `missions`
--
ALTER TABLE `missions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
