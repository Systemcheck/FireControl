DROP TABLE IF EXISTS `config`;
DROP TABLE IF EXISTS `cars`;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `messages`;
DROP TABLE IF EXISTS `missions`;

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
(1, '', '', '1/23/1', '', '', '2018-11-25 14:13:44', NULL),
(2, '', '', '1/45/1', '', '', '2018-11-25 14:14:02', NULL),
(3, '', '', '1/49/1', '', '', '2018-11-25 14:14:29', NULL);

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
(1, 'mission', '1', '2018-11-24 09:40:34', NULL);

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
(1, '18', 'kkkkkkk', '', '2018-11-26 06:44:26', NULL),
(2, '18', 'kkkk', '8/41/3', '2018-11-26 06:51:45', NULL),
(3, '18', 'kkkkk', '8/41/3', '2018-11-26 06:52:06', NULL),
(4, '18', 'test', '8/41/3', '2018-11-26 07:13:42', NULL),
(5, '18', 'eingetroffen', '8/41/3', '2018-11-26 07:14:56', NULL),
(6, '18', 'testmeldung', '8/41/3', '2018-11-26 08:22:12', NULL),
(7, '18', 'LF 16 eingetroffen', '8/41/3', '2018-11-26 08:22:45', NULL),
(8, '18', 'Testmeldung', 'GF 8/41/3', '2018-11-27 13:16:32', NULL),
(9, '18', 'Das ist eine Testmeldung', 'Melder 8/41/3', '2018-11-28 10:43:36', NULL);

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `missions`
--

INSERT INTO `missions` (`id`, `name`, `description`, `adress`, `created_at`, `updated_at`) VALUES
(1, 'Kaminbrand', 'Londoner Bogen', 'Londoner Bogen', '2018-02-18 23:00:00', NULL),
(2, 'VU-LKW', 'A20', 'A20', '2018-11-20 07:00:00', NULL),
(3, 'Neuer Einsatz', '', '', '2018-11-24 12:22:41', NULL),
(4, 'Neuer Einsatz', '', '', '2018-11-24 12:23:50', NULL),
(5, 'Neuer Einsatz', '', '', '2018-11-24 12:24:38', NULL),
(6, 'Neuer Einsatz', '', '', '2018-11-24 12:24:50', NULL),
(7, 'Neuer Einsatz', '', '', '2018-11-24 12:25:11', NULL),
(8, 'Neuer Einsatz', '', '', '2018-11-24 12:25:52', NULL),
(9, 'Neuer Einsatz', '', '', '2018-11-24 12:46:35', NULL),
(10, 'Neuer Einsatz', '', '', '2018-11-24 12:48:24', NULL),
(11, 'Neuer Einsatz', '', '', '2018-11-24 12:49:27', NULL),
(12, 'Neuer Einsatz', '', '', '2018-11-24 12:49:29', NULL),
(13, 'Neuer Einsatz', '', '', '2018-11-24 12:49:53', NULL),
(14, 'Neuer Einsatz', '', '', '2018-11-24 19:45:12', NULL),
(15, 'Neuer Einsatz', '', '', '2018-11-25 13:49:09', NULL),
(16, 'Neuer Einsatz', '', '', '2018-11-25 13:49:34', NULL),
(17, 'Neuer Einsatz', '', '', '2018-11-25 14:13:15', NULL),
(18, 'Neuer Einsatz', '', '', '2018-11-25 14:16:40', NULL),
(19, 'Neuer Einsatz', '', '', '2018-11-28 10:46:20', NULL),
(20, 'Neuer Einsatz', '', '', '2018-11-28 10:48:08', NULL),
(21, 'Neuer Einsatz', '', '', '2018-11-28 10:48:26', NULL),
(22, 'Neuer Einsatz', '', '', '2018-11-28 10:50:49', NULL),
(23, 'Neuer Einsatz', '', '', '2018-11-28 10:52:42', NULL),
(24, 'Neuer Einsatz', '', '', '2018-11-28 10:57:26', NULL),
(25, 'Neuer Einsatz', '', '', '2018-11-28 10:58:00', NULL),
(26, 'Neuer Einsatz', '', '', '2018-11-28 10:58:02', NULL),
(27, 'Neuer Einsatz', '', '', '2018-11-28 10:59:05', NULL),
(28, 'Neuer Einsatz', '', '', '2018-11-28 10:59:11', NULL),
(29, 'Neuer Einsatz', '', '', '2018-11-28 10:59:14', NULL),
(30, 'Neuer Einsatz', '', '', '2018-11-28 11:02:54', NULL),
(31, 'Neuer Einsatz', '', '', '2018-11-28 11:03:28', NULL),
(32, 'Gebäudebrand', 'auf der Heide', '', '2018-11-29 12:59:41', NULL);

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
(1, 'admin', '$2y$10$qCgb4MKzbMKAqUU2LOFBQ.wGoAD6yBElFA7V7EPwK.QGCViJjx4mu', 'Dennis', 'Nizard', '16', '2018-11-21 08:18:10', NULL),
(7, 'mod', '$2y$10$Wtl2IWpz7QFefqOpS72KFezss1DC8BjNdSGmmTaM3pu1SRrL2j8aO', 'daniel', 'muh', '4', '2018-11-24 08:44:31', NULL);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `missions`
--
ALTER TABLE `missions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
