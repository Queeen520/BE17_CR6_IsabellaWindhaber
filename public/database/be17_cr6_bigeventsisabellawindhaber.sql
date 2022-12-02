-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 03. Dez 2022 um 00:30
-- Server-Version: 10.4.27-MariaDB
-- PHP-Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `be17_cr6_bigeventsisabellawindhaber`
--
CREATE DATABASE IF NOT EXISTS `be17_cr6_bigeventsisabellawindhaber` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `be17_cr6_bigeventsisabellawindhaber`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20221202100119', '2022-12-03 00:04:57', 1110);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `event_list`
--

CREATE TABLE `event_list` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `start` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `street` varchar(255) NOT NULL,
  `zip` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `event_list`
--

INSERT INTO `event_list` (`id`, `name`, `start`, `description`, `capacity`, `email`, `phone`, `street`, `zip`, `city`, `url`, `type`, `img`) VALUES
(1, 'Sunday Soul Ritual - Ayurveda Yoga', '2022-12-09 10:00:21', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Odit, ducimus accusantium vero facilis debitis quidem obcaecati ad eveniet sit provident id a eum aperiam voluptatum eaque maxime velit, delectus minus iure rerum exercitationem beatae vel adipisci.', 15, 'yoga@mail.com', 66233697812, 'Embelgasse 35', 1050, 'Vienna', 'https://www.eventbrite.at/o/honeyoga-55418199783', 'sport', ''),
(2, 'Street Food Festival', '2023-07-21 09:15:13', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Labore, quod! Quis deserunt eligendi aspernatur assumenda! Aut deserunt optio obcaecati vero nisi tempora omnis possimus voluptatem cumque. Excepturi necessitatibus, in beatae veritatis tempora exer', 400, 'streetfood@mail.com', 66911234458, 'Rathausplatz 1', 1010, 'Vienna', 'http://www.streetfood-festival.eu/', 'food', ''),
(3, 'Donauinsel Fest ', '2023-06-16 07:00:11', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Officia aspernatur aliquam architecto, iusto repellat quae voluptate, placeat a voluptates magni ipsum necessitatibus atque quo quis quasi esse tempore accusamus reprehenderit molestias exercitation', 1000, 'dif@mail.com', 667112499637, 'Donauinsel', 1210, 'Vienna', 'https://donauinselfest.at/?nofade', 'music', ''),
(4, 'Pilates Boutique', '2023-01-02 09:30:11', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Magnam vel, id laboriosam, sunt sit inventore fuga aut porro, est officiis placeat laborum voluptate et dolorem quisquam corporis veritatis culpa. Molestias aliquam ipsam tenetur fuga ab minus dolo', 10, 'pilates@mail.com', 66449216782, 'Kärnterstraße 3', 1010, 'Vienna', 'https://pilatesboutiquevienna.at/', 'sport', ''),
(5, 'Coachella Festival', '2023-04-21 06:30:39', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Magnam vel, id laboriosam, sunt sit inventore fuga aut porro, est officiis placeat laborum voluptate et dolorem quisquam corporis veritatis culpa. Molestias aliquam ipsam tenetur fuga ab minus dolo', 1000, '', 4491173645, '81-800 51st Ave', 92201, 'Indio, CA', 'https://www.coachella.com/driving-directions', 'music', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indizes für die Tabelle `event_list`
--
ALTER TABLE `event_list`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `event_list`
--
ALTER TABLE `event_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
